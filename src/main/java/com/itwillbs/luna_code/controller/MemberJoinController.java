package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberJoinController {

	
	@GetMapping("MemberChoice")
	public String memberJoinForm() {
		return "member/join_choice";
	}
	
	@GetMapping("TermsOfMembership")
	public String showTOM() {
		return "member/terms_of_membership";
	}
	
	@GetMapping("JoinForm")
	public String joinForm() {
		return "member/join_form";
	}
	
	
	@PostMapping("JoinForm")
	public String checkAndJoin() {
		return "member/welcome_page";
	}
	
	
	
	@GetMapping("AdminDashboard")
	public String adminDashBoard() {
		return "admin/admin_dashboard";
	}
	
	@GetMapping("PersonalSupport")
	public String supportCenter() {
		return "support_center/personal_support_list";
	}
	
	
}
