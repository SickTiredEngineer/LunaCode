package com.itwillbs.luna_code.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.luna_code.service.UserService;
import com.itwillbs.luna_code.vo.UserVO;

@Controller
public class ModifyProfileController {

	@Autowired
	private UserService userService;
	
	// 프로필 수정 페이지로 이동 (GET)
	@GetMapping("ModifyProfile")
	public String modifyProfile(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");

		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}

		UserVO user = userService.getUserProfile(userId);
		model.addAttribute("user", user);

		return "modifyprofiles/modify_profile";
	}
	
	// 프로필 정보 업데이트 처리 (POST, AJAX 요청)
	@PostMapping("ModifyProfile")
	@ResponseBody
	public Map<String, Object> modifyProfile(
			UserVO userVO,
			@RequestParam(value = "profileImage", required = false) MultipartFile profileImage,
			HttpServletRequest request,
			HttpSession session) {
		
		Map<String, Object> response = new HashMap<>();
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			response.put("success", false);
			response.put("message", "세션이 만료되었거나 로그인이 필요합니다.");
			return response;
		}
		userVO.setUser_id(userId);
		
		try {
			userService.updateUserProfile(userVO, profileImage, request);
			response.put("success", true);
			response.put("message", "프로필이 성공적으로 변경되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "프로필 수정 중 오류가 발생했습니다.");
		}
		
		return response;
	}

	// 프로필 수정 전용 닉네임 중복 확인 메소드
	@GetMapping("CheckNicknameForProfile")
	@ResponseBody
	public Map<String, Object> checkNicknameForProfile(@RequestParam String value) {
		Map<String, Object> response = new HashMap<>();
		
		boolean isDuplicate = userService.isNicknameDuplicate(value);
		
		if (isDuplicate) {
			response.put("dupResult", true);
			response.put("text", "이미 사용 중인 닉네임입니다.");
			response.put("color", "red");
		} else {
			response.put("dupResult", false);
			response.put("text", "사용 가능한 닉네임입니다.");
			response.put("color", "green");
		}
		
		return response;
	}
	
	// 비밀번호 수정 페이지로 이동 (GET)
	@GetMapping("ModifyPasswd")
	public String modifyPasswd(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
			
		return "modifyprofiles/modify_passwd";
	}
	
	// 현재 비밀번호 일치 확인 (AJAX - POST)
    @PostMapping("CheckCurrentPassword")
    @ResponseBody
    public Map<String, Object> checkCurrentPassword(@RequestParam String current_pass, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        String userId = (String) session.getAttribute("sId");

        if (userId == null) {
            response.put("isValid", false);
            return response;
        }

        boolean isPasswordCorrect = userService.isPasswordCorrect(userId, current_pass);
        response.put("isValid", isPasswordCorrect);
        
        return response;
    }

    // 새 비밀번호로 변경 (AJAX - POST)
	@PostMapping("UpdatePassword")
	@ResponseBody
	public Map<String, Object> updatePassword(@RequestParam String current_pass, @RequestParam String new_pass, HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		String userId = (String) session.getAttribute("sId");

		if (userId == null) {
			response.put("success", false);
			response.put("message", "세션이 만료되었습니다. 다시 로그인해주세요.");
			return response;
		}

		try {
			boolean isSuccess = userService.updateNewPassword(userId, current_pass, new_pass);
			
			if (isSuccess) {
				response.put("success", true);
				response.put("message", "비밀번호가 성공적으로 변경되었습니다.");
				session.invalidate();
			} else {
				response.put("success", false);
				response.put("message", "현재 비밀번호가 일치하지 않습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "비밀번호 변경 중 오류가 발생했습니다.");
		}
		
		return response;
	}
	
	// 계정 탈퇴 페이지로 이동 (GET)
	@GetMapping("ModifyDelete")
	public String modifyDelete(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
		
		return "modifyprofiles/modify_delete";
	}

	// 계정 탈퇴 처리 (AJAX - POST)
	@PostMapping("DeleteAccount")
	@ResponseBody
	public Map<String, Object> deleteAccount(
			@RequestParam String password,
			HttpSession session) {
		
		Map<String, Object> response = new HashMap<>();
		String userId = (String) session.getAttribute("sId");

		if (userId == null) {
			response.put("success", false);
			response.put("message", "세션이 만료되었습니다. 다시 로그인해주세요.");
			return response;
		}

		try {
			// 서비스 계층에 계정 탈퇴 요청
			boolean isSuccess = userService.deleteUserAccount(userId, password);
			
			if (isSuccess) {
				response.put("success", true);
				response.put("message", "회원 탈퇴가 완료되었습니다.");
				session.invalidate(); // 탈퇴 성공 시, 즉시 세션 무효화
			} else {
				response.put("success", false);
				response.put("message", "비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "계정 탈퇴 처리 중 오류가 발생했습니다.");
		}
		
		return response;
	}
	
	// 결제 내역 페이지로 이동 (GET)
	@GetMapping("MyPayment")
	public String myPayment(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
		
		return "modifyprofiles/my_payment";
	}
	
	// --- 테스트용 임시 세션 설정 URL ---
	@GetMapping("/test/setLoginSession")
	public String setLoginSession(HttpSession session) {
		session.setAttribute("sId", "test01"); // DB에 'test01' 사용자가 있어야 함
		return "redirect:/ModifyProfile";
	}
}
