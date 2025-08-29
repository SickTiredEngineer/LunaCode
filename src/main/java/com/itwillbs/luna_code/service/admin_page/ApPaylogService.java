package com.itwillbs.luna_code.service.admin_page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.admin_page.ApPayLogMapper;
import com.itwillbs.luna_code.vo.cart.PaymentHistoryVO;

@Service
public class ApPaylogService {

	@Autowired
	ApPayLogMapper mapper;
	
	public int countAllPayLog() {
		return mapper.countAllPayLog();
	}
	
	public List<PaymentHistoryVO> selectPaylogList(int start_row, int list_limit){
		return mapper.selectPaylogList(start_row, list_limit);
	}
	
	public PaymentHistoryVO selectPaylogDetail(int payment_idx) {
		return mapper.selectPaylogDetail(payment_idx);
	}
	
	public int modifyPaylog(PaymentHistoryVO vo) {
		return mapper.modifyPaylog(vo);	
	}
	
}
