package com.itwillbs.luna_code.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.luna_code.handler.PrincipalHandler;
import com.itwillbs.luna_code.security.CustomUserDetails; // ★★★ CustomUserDetails를 import 합니다.
import com.itwillbs.luna_code.service.UserService;
import com.itwillbs.luna_code.vo.UserVO;

@Controller
public class ModifyProfileController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PrincipalHandler principalHandler;

	// 프로필 수정 페이지로 이동 (GET)
	@GetMapping("ModifyProfile")
	public String modifyProfile(Model model, Authentication auth) {
		// Principal을 실제 객체인 CustomUserDetails로 형변환합니다.
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		// getUserId() 메서드로 사용자 ID를 직접 가져옵니다. (DB 조회 불필요)
		String userId = userDetails.getUserId();
		
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
		Authentication auth) {
		
		Map<String, Object> response = new HashMap<>();
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		String userId = userDetails.getUserId(); // ID 직접 가져오기
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

		principalHandler.refreshByUserId(userDetails.getUserId());
		return response;
	}

	// 프로필 수정 전용 닉네임 중복 확인
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
	
	// 프로필 수정 전용 이메일 중복 확인
	@GetMapping("CheckEmailForProfile")
	@ResponseBody
	public Map<String, Object> checkEmailForProfile(@RequestParam String value) {
		Map<String, Object> response = new HashMap<>();
		boolean isDuplicate = userService.isEmailDuplicate(value);

		if (isDuplicate) {
			response.put("dupResult", true);
			response.put("text", "이미 사용 중인 이메일입니다.");
			response.put("color", "red");
		} else {
			response.put("dupResult", false);
			response.put("text", "사용 가능한 이메일입니다.");
			response.put("color", "green");
		}

		return response;
	}
	
	// 비밀번호 수정 페이지로 이동 (GET)
	@GetMapping("ModifyPasswd")
	public String modifyPasswd() {
		return "modifyprofiles/modify_passwd";
	}

	// 현재 비밀번호 일치 확인 (AJAX - POST)
	@PostMapping("CheckCurrentPassword")
	@ResponseBody
	public Map<String, Object> checkCurrentPassword(@RequestParam String current_pass, Authentication auth) {
		Map<String, Object> response = new HashMap<>();
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		String userId = userDetails.getUserId(); // ID 직접 가져오기
		
		boolean isPasswordCorrect = userService.isPasswordCorrect(userId, current_pass);
		response.put("isValid", isPasswordCorrect);

		return response;
	}

	// 새 비밀번호로 변경 (AJAX - POST)
	@PostMapping("UpdatePassword")
	@ResponseBody
	public Map<String, Object> updatePassword(
		@RequestParam String current_pass,
		@RequestParam String new_pass,
		Authentication auth,
		HttpSession session) {
		
		Map<String, Object> response = new HashMap<>();
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		String userId = userDetails.getUserId(); // ID 직접 가져오기

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
	public String modifyDelete() {
		return "modifyprofiles/modify_delete";
	}

	// 계정 탈퇴 처리 (AJAX - POST)
	@PostMapping("DeleteAccount")
	@ResponseBody
	public Map<String, Object> deleteAccount(
		@RequestParam String password,
		Authentication auth,
		HttpSession session) {
		
		Map<String, Object> response = new HashMap<>();
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		String userId = userDetails.getUserId(); // ID 직접 가져오기

		try {
			boolean isSuccess = userService.deleteUserAccount(userId, password);

			if (isSuccess) {
				response.put("success", true);
				response.put("message", "회원 탈퇴가 완료되었습니다.");
				session.invalidate();
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
	public String myPayment() {
		return "modifyprofiles/my_payment";
	}
}