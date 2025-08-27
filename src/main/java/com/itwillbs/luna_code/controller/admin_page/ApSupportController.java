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
import com.itwillbs.luna_code.service.admin_page.ApSupportService;
import com.itwillbs.luna_code.vo.PageVO;
import com.itwillbs.luna_code.vo.admin_page.QueryAnswerVO;
import com.itwillbs.luna_code.vo.support_center.CustomerQueryVO;

@Controller
public class ApSupportController {

	@Autowired
	ApSupportService service;
	
	@GetMapping("ApPersonalSupportList")
	public String apPersonalSupportList(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		
		PageVO pageVo = PagingHandler.pageHandler(pageNum, service::countAllQuery);			
		List<CustomerQueryVO> queryList = service.selectQueryList(pageVo.getStartRow(), PagingHandler.LIST_LIMIT);

		model.addAttribute("pageVo", pageVo);
		model.addAttribute("queryList", queryList);

		return "admin/ap_personal_support_list";
	}
	
	@GetMapping("ApPersonalSupportDetail")
	public String apPersonalSupportDetail(Model model, int query_idx) {
		
		CustomerQueryVO queryVo = service.selectQueryDetail(query_idx);
		model.addAttribute("queryVo", queryVo);
		
		/* 답변이 있는 질문이면 답변도 불러와서 같이 보여줘야 하니까 불러옴 */
		if(queryVo.isAnswer_status()) {
			QueryAnswerVO answerVo = service.selectQueryAnswer(query_idx);
			model.addAttribute("answerVo", answerVo);
		}
		
		return "admin/ap_personal_support_detail";
	}
	
	/* 답변 등록 -> vo에 admin idx 넣어서 쿼리 실행 */
	@PostMapping("QueryAnswerForm")
	public String queryAnswerForm(QueryAnswerVO vo, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		vo.setAdmin_idx(user.getIdx());
		int result = service.insertNewAnswer(vo);
		int updateRes = service.updateAnswerStatus(vo.getQuery_idx());

		return "redirect:ApPersonalSupportDetail?query_idx="+vo.getQuery_idx();
	}
	
	
}
