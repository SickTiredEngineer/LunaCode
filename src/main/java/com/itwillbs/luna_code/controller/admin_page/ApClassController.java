package com.itwillbs.luna_code.controller.admin_page;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.luna_code.handler.PagingHandler;
import com.itwillbs.luna_code.service.admin_page.ApClassService;
import com.itwillbs.luna_code.vo.ClassVo;
import com.itwillbs.luna_code.vo.PageVO;

/* 강의 허용 관련 */
@Controller
public class ApClassController {

	@Autowired
	ApClassService service;
	
	@GetMapping("ApReqClassList")
	public String apReqClassList(Model model ,@RequestParam(defaultValue = "1") int pageNum) {
		
		PageVO pageVo = PagingHandler.pageHandler(pageNum, service::countAllClass);
		List<ClassVo> classList = service.selectClassList(pageVo.getStartRow(), PagingHandler.LIST_LIMIT);
		
		model.addAttribute("classList", classList);
		model.addAttribute("pageVo", pageVo);

		return "admin/ap_req_class_list";
	}
	
	@GetMapping("ApReqClassDetail")
	public String apReqClassDetail(Model model, int class_idx) {
		
		ClassVo cls = service.selectClassDetail(class_idx);
		model.addAttribute("cls", cls);
		
		return "admin/ap_req_class_detail";
	}
	
	@PostMapping("ApModifyClassStatus")
	public String ApModifyClassStatus(@RequestParam Map<String, String> modifyMap) {
		
		int result = service.modifyClassAccept(modifyMap);		
		
		return "redirect:ApReqClassDetail?class_idx="+modifyMap.get("class_idx");
	}
	
	
	
}
