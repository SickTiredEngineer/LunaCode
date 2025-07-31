package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ModifyProfileController{

	
	@GetMapping("ModifyProfile")
	public String modifyProfile() {
		
		return "modifyprofiles/modify_profile";
	}
	
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
	
}