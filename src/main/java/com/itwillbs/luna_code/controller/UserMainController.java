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
	
	@GetMapping("MyClass")
	public String myClass() {
		return "usermain/my_class";
	}
	
	@GetMapping("MyClass2")
	public String myClass2() {
		return "usermain/my_class2";
	}
	
	@GetMapping("MyClassDetail")
	public String myClassDetail() {
		return "usermain/my_class_detail";
	}
	
	@GetMapping("PlayList")
	public String playList() {
		return "usermain/play_list";
	}
	
	@GetMapping("PlayListPlus")
	public String playListPlus() {
		return "usermain/play_list_plus";
	}
	
	@GetMapping("Attendance")
	public String attendance() {
		return "usermain/attendance";
	}
}
