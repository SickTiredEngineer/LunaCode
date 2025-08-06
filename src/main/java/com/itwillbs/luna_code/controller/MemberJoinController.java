package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberJoinController {

	/* 회원 유형 선택 페이지로 이동 */
	@GetMapping("MemberChoice")
	public String memberJoinForm() {
		return "member/join_choice";
	}
	
	/* 회원 가입 약관 확인 페이지로 이동 */
	@GetMapping("TermsOfMembership")
	public String showTOM() {
		return "member/terms_of_membership";
	}
	
	/* 회원 정보 입력 폼 페이지로 이동 */
	@GetMapping("JoinForm")
	public String joinForm() {
		return "member/join_form";
	}
	
	/* 입력 정보 데이터 베이스에 저장 후 환영 페이지로 이동 */
	@PostMapping("JoinForm")
	public String checkAndJoin() {
		return "member/welcome_page";
	}
	
}
