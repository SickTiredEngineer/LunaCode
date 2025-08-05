package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	
	@GetMapping("AdminDashboard")
	public String adminDashBoard() {
		return "admin/admin_dashboard";
	}
	
	
}
