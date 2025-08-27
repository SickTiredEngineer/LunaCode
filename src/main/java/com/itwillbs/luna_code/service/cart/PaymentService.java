package com.itwillbs.luna_code.service.cart;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.luna_code.mapper.cart.CartMapper;
import com.itwillbs.luna_code.mapper.cart.PaymentMapper;
import com.itwillbs.luna_code.vo.cart.CartVO;
import com.itwillbs.luna_code.vo.cart.EnrollmentVO;
import com.itwillbs.luna_code.vo.cart.PaymentHistoryVO;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Transactional
	public void processPayment(PaymentHistoryVO paymentData, List<CartVO> orderList, int user_idx) {
	    List<PaymentHistoryVO> historyList = new ArrayList<>();
	    List<Integer> cartIdxListToRemove = new ArrayList<>();
	    List<EnrollmentVO> enrollList = new ArrayList<>();
	    
	    Timestamp purchaseTimestamp = new Timestamp(System.currentTimeMillis());
	    
	    for (CartVO cartItem : orderList) {
	        PaymentHistoryVO history = new PaymentHistoryVO();
	        history.setUser_idx(user_idx);
	        history.setMerchant_uid(paymentData.getMerchant_uid());
	        history.setPay_method(paymentData.getPay_method());
	        history.setItem_idx(cartItem.getClass_idx());
	        history.setAmount(cartItem.getFinal_price());
	        history.setPay_date(purchaseTimestamp); 
	        historyList.add(history);
	        
	        
	        cartIdxListToRemove.add(cartItem.getCart_idx());
	        
	        EnrollmentVO enroll = new EnrollmentVO();
	        enroll.setUser_idx(user_idx);
	        enroll.setClass_idx(cartItem.getClass_idx());
	        enroll.setEnroll_date(purchaseTimestamp); 
	        enrollList.add(enroll);
	    }
	    
	    paymentMapper.insertPaymentHistory(historyList);
	    paymentMapper.insertEnrollments(enrollList);
	    cartMapper.deleteCartItems(user_idx, cartIdxListToRemove);
	}

	public List<PaymentHistoryVO> getPaymentHistory(String merchant_uid) {
	    return paymentMapper.selectPaymentHistory(merchant_uid);
	}
	
	public List<PaymentHistoryVO> getMyPayments(int user_idx) {
        return paymentMapper.selectMyPayments(user_idx);
    }
}
