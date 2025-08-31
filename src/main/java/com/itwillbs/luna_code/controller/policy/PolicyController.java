package com.itwillbs.luna_code.controller.policy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PolicyController {
	
	@GetMapping("RefundPolicy")
	public String refundPolicy() {
		return "policy/refund_policy";
	}
	
	@GetMapping("PersonalInfoPolicy")
	public String personalInfoPolicy() {
		return "policy/personal_info_policy";
	}
	
	@GetMapping("UserPolicy")
	public String userPolicy() {
		return "policy/user_policy";
	}
	
	@GetMapping("PageIntroduce")
	public String pageIntroduce() {
		return "policy/page_introduce";
	}
}
