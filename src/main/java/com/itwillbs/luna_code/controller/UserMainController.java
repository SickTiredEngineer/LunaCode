package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserMainController {

	@GetMapping("UserMain")
	public String userMain() {
		
		return "usermain/usermain";
	}
	
	@GetMapping("SearchArea")
	public String searchArea() {
		return "usermain/searcharea";
	}
}
