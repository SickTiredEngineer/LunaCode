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
			return "home";
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
	
	// --- 기타 페이지 이동 메소드 ---
	@GetMapping("ModifyPasswd")
	public String modifyPasswd() {
		return "modifyprofiles/modify_passwd";
	}
	
	@GetMapping("ModifyDelete")
	public String modifyDelete() {
		return "modifyprofiles/modify_delete";
	}
	
	@GetMapping("MyPayment")
	public String myPayment() {
		return "modifyprofiles/my_payment";
	}
	
	// --- 테스트용 임시 세션 설정 URL ---
	@GetMapping("/test/setLoginSession")
	public String setLoginSession(HttpSession session) {
		session.setAttribute("sId", "test01"); // DB에 'test01' 사용자가 있어야 함
		return "redirect:/ModifyProfile";
	}
}
