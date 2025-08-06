package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	
	@GetMapping("ApMemberList")
	public String adminDashBoard() {
		return "admin/ap_member_list";
	}
	
	@GetMapping("MemberDetail")
	public String memberDetail() {
		return "admin/ap_member_detail";
	}
	
	
}
