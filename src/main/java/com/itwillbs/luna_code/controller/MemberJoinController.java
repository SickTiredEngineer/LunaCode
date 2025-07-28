package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberJoinController {

	
	@GetMapping("MemberJoinForm")
	public String memberJoinForm() {
		
		return "member/join_form";
	}
	
	
}
