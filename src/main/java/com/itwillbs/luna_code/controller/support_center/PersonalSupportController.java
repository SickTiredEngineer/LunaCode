package com.itwillbs.luna_code.controller.support_center;

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
import com.itwillbs.luna_code.service.admin_page.ApSupportService;
import com.itwillbs.luna_code.service.support_center.PersonalSupportService;
import com.itwillbs.luna_code.vo.PageVO;
import com.itwillbs.luna_code.vo.admin_page.QueryAnswerVO;
import com.itwillbs.luna_code.vo.support_center.CustomerQueryVO;

/* 1:1 문의 관련 컨트롤러 */ 
@Controller
public class PersonalSupportController {

	@Autowired
	PersonalSupportService service;
	
	@Autowired
	ApSupportService apService;
	
	@GetMapping("PersonalSupport")
	public String personalList(Model model
			,@RequestParam(defaultValue = "1") int pageNum
			,@RequestParam(name = "q", required = false) String q
			,Authentication auth) {
	
		String keyword = (q != null && !q.trim().isEmpty())? q.trim():null;
		CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
		int userIdx = user.getIdx();
		
		PageVO pageVo = PagingHandler.pageHandler(pageNum, () -> service.countAllCustomerQuery(userIdx, keyword));
		List<CustomerQueryVO> cqList = service.selectCustomerQuery(userIdx, pageVo.getStartRow(), PagingHandler.LIST_LIMIT, keyword);
		
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("cqList", cqList);

		return "support_center/personal_support_list";
	}

	@GetMapping("SupportDetail")
	public String supoortDetail(int query_idx, Authentication auth, Model model) {
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		int uesrIdx = user.getIdx();
		CustomerQueryVO cqvo = service.selectCustomQueryDetail(query_idx, uesrIdx);		
		model.addAttribute("cqvo", cqvo);
		
		/* 답변이 있으면 답변 찾아서 jsp에 전달 */
		if(cqvo.isAnswer_status()) {
			QueryAnswerVO answerVo = apService.selectQueryAnswer(query_idx);
			model.addAttribute("answerVo", answerVo);
		}
		
		return "support_center/support_detail";
	}
	
	@GetMapping("SupportWrite")
	public String supportWrite() {
		return "support_center/support_write";
	}
	
	
	@PostMapping("SupportWriteForm")
	public String supportWriteForm(CustomerQueryVO vo, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		vo.setUser_idx(user.getIdx());
		int result = service.insertnewCustomerQuery(vo);
		
		return "redirect:PersonalSupport";
	}
	
	@PostMapping("DeleteSupport")
	public String deleteSupport(int query_idx, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		int result = service.deleteCustomerQuery(query_idx, user.getIdx());
		
		return "redirect:PersonalSupport";
	}
	
	@GetMapping("ModifySupport")
	public String modifySupport(int query_idx ,Model model, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		boolean isModify = true;
		model.addAttribute("isModify", isModify);
	
		CustomerQueryVO cqvo = service.selectCustomQueryDetail(query_idx, user.getIdx());
		model.addAttribute("cqvo", cqvo);
		
		return "support_center/support_write";
	}
	
	@PostMapping("ModifySupportForm")
	public String modifySupportForm(CustomerQueryVO vo, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
		vo.setUser_idx(user.getIdx());
		
		int result = service.modifyCustomerQuery(vo);
		
		
		return "redirect:SupportDetail?query_idx=" + vo.getQuery_idx();
	}
	
	
}
