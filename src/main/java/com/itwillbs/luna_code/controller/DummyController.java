package com.itwillbs.luna_code.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.luna_code.service.community.CommunityService;
import com.itwillbs.luna_code.service.member_join.MemberJoinService;
import com.itwillbs.luna_code.service.support_center.FaqService;
import com.itwillbs.luna_code.service.support_center.NoticeService;


/* 더미 데이터 생성 컨트롤러 */
@Controller
public class DummyController {
	
	@Autowired
	MemberJoinService memberService;
	
	@Autowired
	CommunityService communityService;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	FaqService faqService;
	
	/* 일반 더미회원 생성 */
//	@GetMapping("DummyMember")
//	public String dummyMembers() {
//		memberService.createDummyNormalMembers();
//		return "redirect:GoHome";
//	}
	
	
	/* 게시글 더미 데이터 생성 */
//	@GetMapping("DummyPost")
//	public String dummyPost() {
//		communityService.dummyPost();
//		return "redirect:GoHome";
//	}
	
	
//	@GetMapping("DummyNotice")
//	public String dummyNotice() {
//		noticeService.dummyNotice();
//		return "redirect:GoHome";
//	}s
	
//	@GetMapping("DummyFaq")
//	public String dummyFaq() {
//		faqService.dummyFaq();
//		return "redirect:GoHome";
//	}
	
	@GetMapping("DummyInst")
	public String dummyInst() {
		memberService.createDummyInst();
		return "redirect:GoHome";
	}


}
