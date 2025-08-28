package com.itwillbs.luna_code.controller.admin_page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	

	
	
	@GetMapping("ApPaylogList")
	public String apPaylogList() {
		return "admin/ap_paylog_list";
	}
	
	@GetMapping("ApPaylogDetail")
	public String apPaylogDetail() {
		return "admin/ap_paylog_detail";
	}
	
	@GetMapping("ApStatistic")
	public String apStatistic() {
		return "admin/ap_statistic";
	}

	
}
