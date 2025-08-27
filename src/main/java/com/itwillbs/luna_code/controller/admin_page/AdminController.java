package com.itwillbs.luna_code.controller.admin_page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	

	
	@GetMapping("ApReqInstList")
	public String apReqInstList() {
		return "admin/ap_req_inst_list";
	}
	
	@GetMapping("ApReqInstDetail")
	public String apReqInstDetail() {
		return "admin/ap_req_inst_detail";
	}
	
	@GetMapping("ApReqClassList")
	public String apReqClassList() {
		return "admin/ap_req_class_list";
	}
	
	@GetMapping("ApReqClassDetail")
	public String apReqClassDetail() {
		return "admin/ap_req_class_detail";
	}
	
	
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
