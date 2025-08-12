package com.itwillbs.luna_code.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.luna_code.service.MemberService;
import com.itwillbs.luna_code.vo.MemberVO;

@Controller
public class MemberJoinController {
	
	@Autowired
	MemberService memberService;
	
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
	public String checkAndJoin(MemberVO vo) {
		
		System.out.println(vo);
		return "member/welcome_page";
	}
	
	
	@ResponseBody
	@GetMapping("CheckIdDuplication")
	public  Map<String, String> checkIdDuplication(@RequestParam("id") String id) {
		System.out.println("checkIdDuplication: " + id);
		return memberService.checkIdDuplication(id);
	}
	
	
	@ResponseBody
	@GetMapping("CheckNickNameDuplication")
	public Map<String, String> checkNickNameDuplication(@RequestParam("nickname") String nickname){
		return memberService.checkNickNameDuplication(nickname);
	}
	
	
	
	
	
}
