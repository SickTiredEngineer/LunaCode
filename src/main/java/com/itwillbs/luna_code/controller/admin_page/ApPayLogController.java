package com.itwillbs.luna_code.controller.admin_page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.luna_code.handler.PagingHandler;
import com.itwillbs.luna_code.service.admin_page.ApPaylogService;
import com.itwillbs.luna_code.vo.PageVO;
import com.itwillbs.luna_code.vo.cart.PaymentHistoryVO;

@Controller
public class ApPayLogController {

	@Autowired
	ApPaylogService service;
	
	@GetMapping("ApPaylogList")
	public String apPaylogList(Model model
			,@RequestParam(defaultValue = "1") int pageNum
			,@RequestParam(name = "q", required = false) String q) {
		
		String keyword = (q != null && !q.trim().isEmpty())? q.trim():null;
		PageVO pageVo = PagingHandler.pageHandler(pageNum, ()->service.countAllPayLog(keyword));
		List<PaymentHistoryVO> payList = service.selectPaylogList(pageVo.getStartRow(), PagingHandler.LIST_LIMIT, keyword);
		
		model.addAttribute("payList", payList);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("q", keyword);
		
		return "admin/ap_paylog_list";
	}
	
	@GetMapping("ApPaylogDetail")
	public String apPaylogDetail(Model model ,int payment_idx) {
		
		PaymentHistoryVO payVo = service.selectPaylogDetail(payment_idx);
		model.addAttribute("payVo", payVo);
		
		return "admin/ap_paylog_detail";
	}
	
	
	@PostMapping("RefundPay")
	public String apRefundPay(PaymentHistoryVO vo) {
		
		int result = service.modifyPaylog(vo);

		return "redirect:ApPaylogDetail?payment_idx="+vo.getPayment_idx();
	}
	
	
	
}
