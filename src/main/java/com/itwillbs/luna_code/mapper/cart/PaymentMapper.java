package com.itwillbs.luna_code.mapper.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.cart.EnrollmentVO;
import com.itwillbs.luna_code.vo.cart.PaymentHistoryVO;

@Mapper
public interface PaymentMapper {
	
	public void insertPaymentHistory(List<PaymentHistoryVO> historyList);
	
	public List<PaymentHistoryVO> selectPaymentHistory(String merchant_uid);
	
	public void insertEnrollments(List<EnrollmentVO> enrollList); 
	
	public List<PaymentHistoryVO> selectMyPayments(int user_idx);

}
