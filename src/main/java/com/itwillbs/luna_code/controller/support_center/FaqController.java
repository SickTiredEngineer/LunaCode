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
import com.itwillbs.luna_code.service.support_center.FaqService;
import com.itwillbs.luna_code.vo.PageVO;
import com.itwillbs.luna_code.vo.support_center.FaqVO;

/* Support Center FAQ Controller */
@Controller
public class FaqController {

	@Autowired
	FaqService service;
	
	/* FAQ 리스트 페이징 후 가져와 출력 */
	@GetMapping("FAQList")
	public String faqList(Model model
			,@RequestParam(defaultValue = "1") int pageNum
			,@RequestParam(name = "q", required = false)String q) {
		
		String keyword = (q != null && !q.trim().isEmpty())? q.trim():null;
		
		PageVO pageVo = PagingHandler.pageHandler(pageNum, ()->service.countAllFaq(keyword));
		List<FaqVO> faqList = service.selectFaq(pageVo.getStartRow(), PagingHandler.LIST_LIMIT, keyword);
		
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("faqList", faqList);
		model.addAttribute("q", keyword);
		
		return "support_center/faq_list";
	}
	
	/* FAQ 작성 페이지로 이동 */
	@GetMapping("FaqWrite")
	public String faqWrite() {
		return "support_center/faq_write";
	}
	
	/* FAQ 작성 폼 처리, 관리자 idx vo에 삽입 후 DB 전송 */
	@PostMapping("FaqWriteForm")
	public String faqWriteForm(FaqVO faqVo, Authentication auth) {
	
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		faqVo.setAdmin_idx(user.getIdx());	
		int result = service.insertNewFaq(faqVo);
	
		return "redirect:FAQList";
	}

	@GetMapping("ModifyFaq")
	public String modifyFaq(int faq_idx, Model model) {
		
		boolean isModify = true;
		FaqVO faqVo = service.selectFaqDetail(faq_idx);
		
		model.addAttribute("isModify", isModify);
		model.addAttribute("faqVo", faqVo);
		
		return "support_center/faq_write";
	}
	

	@PostMapping("ModifyFaqForm")
	public String modifyFaqForm(FaqVO faqVo) {
		System.out.println("Check Modify Faq Form Vo: " +  faqVo);
		int result = service.modifyFaq(faqVo);
		return "redirect:FAQList";
	}
	

	/* FAQ 삭제 */
	@PostMapping("DeleteFaq")
	public String deleteFaq(int faq_idx) {
		int result = service.deleteFaq(faq_idx);
		return "redirect:FAQList";
	}
	
	

}
