package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TempClassShopController {
	
	
	
	@GetMapping("ClassDisplayStand")
	public String classDisplay() {
		
		return "class_shop/class_display_stand";
	}
	
	
	

}
