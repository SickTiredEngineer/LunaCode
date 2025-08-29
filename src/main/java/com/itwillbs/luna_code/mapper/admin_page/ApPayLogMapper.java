package com.itwillbs.luna_code.mapper.admin_page;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.cart.PaymentHistoryVO;

@Mapper
public interface ApPayLogMapper {

	
	int countAllPayLog();
	
	List<PaymentHistoryVO> selectPaylogList(@Param("start_row") int start_row, 
			@Param("list_limit") int list_limit);
		
	PaymentHistoryVO selectPaylogDetail(int payment_idx);

	int modifyPaylog(PaymentHistoryVO vo);
	
}
