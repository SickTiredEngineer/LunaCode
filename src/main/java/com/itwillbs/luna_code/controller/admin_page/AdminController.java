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
	
	@GetMapping("ApPersonalSupportList")
	public String apPersonalSupportList() {
		return "admin/ap_personal_support_list";
	}
	
	
	@GetMapping("ApPersonalSupportDetail")
	public String apPersonalSupportDetail() {
		return "admin/ap_personal_support_detail";
	}
	
	@GetMapping("ApGroupCodeList")
	public String apGroupCodeList() {
		return "admin/ap_group_code_list";
	}
	
	@GetMapping("ApGroupCodeWriter")
	public String apGroupCodeWriter() {
		return "admin/ap_group_code_writer";
	}
	
	
	@GetMapping("ApCommonCodeList")
	public String apCommonCodeList() {
		return "admin/ap_common_code_list";
	}
	
	@GetMapping("ApCommonCodeWriter")
	public String apCommonCodeWriter() {
		return "admin/ap_common_code_writer";
	}
	
	
	@GetMapping("ApStatistic")
	public String apStatistic() {
		return "admin/ap_statistic";
	}

	
}
