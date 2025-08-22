package com.itwillbs.luna_code.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.luna_code.service.usermain.AttendanceService;
import com.itwillbs.luna_code.vo.UserVO;

@Controller
public class UserMainController {

	@Autowired
	private AttendanceService attendanceService;

	@GetMapping("UserMain")
	public String userMain() {
		return "usermain/usermain";
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
	public String attendance(Principal principal, Model model) {
		String userId = principal.getName();
		
		UserVO attendanceInfo = attendanceService.getAttendancePageData(userId);
		model.addAttribute("attendanceInfo", attendanceInfo);
		
		return "usermain/attendance";
	}

	@GetMapping("ClassStatistic")
	public String classStatistic() {
		return "usermain/class_statistic";
	}

	@GetMapping("ClassStatisticDetail")
	public String classStatisticDetail() {
		return "usermain/class_statistic_detail";
	}

}