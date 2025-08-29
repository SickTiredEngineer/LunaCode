package com.itwillbs.luna_code.controller.admin_page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	

	
	

	
	@GetMapping("ApStatistic")
	public String apStatistic() {
		return "admin/ap_statistic";
	}

	
}
