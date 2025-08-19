package com.itwillbs.luna_code.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class ClassShapController {

	@GetMapping("ClassShop")
	public String classShop() {
		return "class_shop/class_shop";
	}
}
