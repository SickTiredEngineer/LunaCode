package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


/* 강의 상점 임시 컨트롤러 -> 추후 통합 예정 */

@Controller
public class TempClassShopController {
	
	
	
	@GetMapping("ClassDisplayStand")
	public String classDisplay() {
		
		return "class_shop/class_display_stand";
	}
	
	
	

}
