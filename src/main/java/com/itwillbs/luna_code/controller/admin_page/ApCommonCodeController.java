package com.itwillbs.luna_code.controller.admin_page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.luna_code.handler.PagingHandler;
import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.admin_page.ApCodeGroupService;
import com.itwillbs.luna_code.service.admin_page.ApCommonCodeService;
import com.itwillbs.luna_code.vo.PageVO;
import com.itwillbs.luna_code.vo.admin_page.CommonCodeVO;

@Controller
public class ApCommonCodeController {

	@Autowired
	ApCommonCodeService service;
	
	@Autowired
	ApCodeGroupService groupService;
	
	@GetMapping("ApCommonCodeList")
	public String apCommonCodeList(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		
		PageVO pageVo = PagingHandler.pageHandler(pageNum, service::countAllCommonCode);
		List<CommonCodeVO> codeList = service.selectCommonCodeList(pageVo.getStartRow(), PagingHandler.LIST_LIMIT);
		
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("codeList", codeList);
		
		return "admin/ap_common_code_list";
	}
	
	
	@GetMapping("ApCommonCodeDetail")
	public String apCommonCodeDetail(Model model, int common_idx) {
		
		CommonCodeVO codeVo = service.selectCommonCodeDetail(common_idx);
		model.addAttribute("codeVo", codeVo);
		
		return "admin/ap_common_code_detail";
	}
	
	
	@GetMapping("ApCommonCodeWriter")
	public String apCommonCodeWriter(Model model) {
		
		List<String> groupList = groupService.selectGroupCodes();
		model.addAttribute("groupList", groupList);
		
		return "admin/ap_common_code_writer";
	}
	
	
	@PostMapping("CommonCodeWriteForm")
	public String commonCodeWrite(CommonCodeVO vo, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		vo.setCreater_idx(user.getIdx());
		
		boolean using_status;
		using_status = vo.getUsing().equals("true")? true : false;
		vo.setUsing_status(using_status);
		
		int result = service.insertNewCode(vo);
		
		return "redirect:ApCommonCodeDetail?common_idx="+vo.getCommon_idx();
	}
	
	
	@GetMapping("ModifyCommonCode")
	public String modifyCommonCode(Model model, int common_idx) {
		
		CommonCodeVO vo = service.selectCommonCodeDetail(common_idx);
		
		boolean isModify = true;
		model.addAttribute("isModify" ,isModify);
		
		List<String> groupList = groupService.selectGroupCodes();
		model.addAttribute("groupList", groupList);
		
		String using;
		using = vo.isUsing_status()? "true" : "false";
		vo.setUsing(using);
		
		
		model.addAttribute("vo", vo);

		return "admin/ap_common_code_writer";
	}
	
	
	@PostMapping("ModifyCommonCodeForm")
	public String modifyCommonCodeForm(CommonCodeVO vo, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		vo.setUpdater_idx(user.getIdx());
		
		boolean using_status = vo.getUsing().equals("true")? true : false;
		vo.setUsing_status(using_status);
		
		int result = service.modifyCommonCode(vo);
		
		return "redirect:ApCommonCodeDetail?common_idx="+vo.getCommon_idx();
	}
	
	
	
	
}
