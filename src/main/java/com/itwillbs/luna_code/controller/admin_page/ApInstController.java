package com.itwillbs.luna_code.controller.admin_page;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.luna_code.handler.PagingHandler;
import com.itwillbs.luna_code.service.admin_page.ApInstService;
import com.itwillbs.luna_code.vo.PageVO;
import com.itwillbs.luna_code.vo.admin_page.InstVO;
import com.itwillbs.luna_code.vo.member_join.MemberJoinVO;

@Controller
public class ApInstController {

	@Autowired
	ApInstService service;
	
	@GetMapping("ApReqInstList")
	public String apReqInstList(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		
		PageVO pageVo = PagingHandler.pageHandler(pageNum, service::countAllInst);
		List<InstVO> instList = service.selectInstList(pageVo.getStartRow(), PagingHandler.LIST_LIMIT);
		
		model.addAttribute("instList", instList);
		model.addAttribute("pageVo" ,pageVo);		
		
		return "admin/ap_req_inst_list";
	}
	
	@GetMapping("ApReqInstDetail")
	public String apReqInstDetail(Model model, int idx) {
		
		InstVO instVo = service.selectInstDetail(idx);
		model.addAttribute("instVo", instVo);
		
		return "admin/ap_req_inst_detail";
	}
	
	
	@PostMapping("ApModifyInst")
	public String apModifyInst(@RequestParam Map<String, String> modifyMap) {
		
		int result = service.updateInstStatus(modifyMap);
		System.out.println("Check Modify Instructor Map: " + modifyMap);
		
		return "redirect:ApReqInstDetail?idx="+modifyMap.get("idx");
		
	}
	
	
	
	
	
}
