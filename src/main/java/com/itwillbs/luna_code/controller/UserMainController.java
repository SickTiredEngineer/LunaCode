package com.itwillbs.luna_code.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserMainController {

	@GetMapping("UserMain")
	public String userMain(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
		
		return "usermain/usermain";
	}

	@GetMapping("MyClass")
	public String myClass(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
		
		return "usermain/my_class";
	}
	
	@GetMapping("MyClass2")
	public String myClass2(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
		
		return "usermain/my_class2";
	}
	
	@GetMapping("MyClassDetail")
	public String myClassDetail(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
	
		return "usermain/my_class_detail";
	}
	
	@GetMapping("PlayList")
	public String playList(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
		
		return "usermain/play_list";
	}
	
	@GetMapping("PlayListPlus")
	public String playListPlus(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
		
		return "usermain/play_list_plus";
	}
	
	@GetMapping("Attendance")
	public String attendance(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
		
		return "usermain/attendance";
	}
	
	@GetMapping("ClassStatistic")
	public String classStatistic(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
		
		return "usermain/class_statistic";
	}
	
	@GetMapping("ClassStatisticDetail")
	public String classStatisticDetail(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");
		
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
		
		return "usermain/class_statistic_detail";
	}

//	@GetMapping("SearchArea")
//	public String searchArea() {
//		return "usermain/searcharea";
//	}
}
