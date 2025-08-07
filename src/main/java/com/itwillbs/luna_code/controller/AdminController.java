package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	
	@GetMapping("ApMemberList")
	public String apMemberList() {
		return "admin/ap_member_list";
	}
	
	@GetMapping("MemberDetail")
	public String memberDetail() {
		return "admin/ap_member_detail";
	}
	
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
	
	
}
