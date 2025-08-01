package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SupportCenterController {

	
	@GetMapping("PersonalSupport")
	public String personalList() {
		return "support_center/personal_support_list";
	}
	
	@GetMapping("FAQList")
	public String faqList() {
		return "support_center/faq_list";
	}
	
	@GetMapping("NoticeList")
	public String noticeList() {
		return "support_center/notice_list";
	}
	
	
	@GetMapping("SupportDetail")
	public String supoortDetail() {
		return "support_center/support_detail";
	}
	
	@GetMapping("NoticeDetail")
	public String noticeDetail() {
		return "support_center/notice_detail";
	}
	
	@GetMapping("SupportWrite")
	public String supportWrite() {
		return "support_center/support_write";
	}
	
	
	
	
	
}
