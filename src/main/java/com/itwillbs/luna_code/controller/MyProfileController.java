package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyProfileController {
	
	@GetMapping("MyProfile")
	public String myProfile() {
		return "myprofile/my_profile";
	}
}
