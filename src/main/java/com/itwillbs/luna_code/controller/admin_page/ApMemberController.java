package com.itwillbs.luna_code.controller.admin_page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.luna_code.handler.PagingHandler;
import com.itwillbs.luna_code.service.admin_page.ApMemberService;
import com.itwillbs.luna_code.vo.PageVO;
import com.itwillbs.luna_code.vo.member_join.MemberJoinVO;

@Controller
public class ApMemberController {
	
	@Autowired
	ApMemberService service;
	
	@GetMapping("ApMemberList")
	public String apMemberList(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		
		PageVO pageVo = PagingHandler.pageHandler(pageNum, service::countAllMember);
		List<MemberJoinVO> memberList = service.selectMemberList(pageVo.getStartRow(), PagingHandler.LIST_LIMIT); 
		
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("memberList", memberList);
		
		return "admin/ap_member_list";
	}
	
	@GetMapping("ApMemberDetail")
	public String memberDetail(int idx, Model model) {
		
		System.out.println("Check ApMemberDetail idx: " + idx);
		
		MemberJoinVO member = service.selectMemberDetail(idx);
		model.addAttribute("member", member);
		
		return "admin/ap_member_detail";
	}

}
