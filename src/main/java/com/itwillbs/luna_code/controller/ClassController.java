package com.itwillbs.luna_code.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClassController {

	@GetMapping("OnlineClass")
	public String onlineclass() {
		return "class/online_class";
	}
	
	
	
}
