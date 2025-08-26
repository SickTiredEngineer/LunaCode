package com.itwillbs.luna_code.service.support_center;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.support_center.PersonalSupportMapper;
import com.itwillbs.luna_code.vo.support_center.CustomerQueryVO;

@Service
public class PersonalSupportService {
	
	@Autowired
	PersonalSupportMapper mapper;
	
	public List<CustomerQueryVO> selectCustomerQuery(int idx, int start_row, int list_limit){
		return mapper.selectCustomerQuery(idx, start_row, list_limit);
	}
	
	public int countAllCustomerQuery(int idx) {
		return mapper.countAllCustomerQuery(idx);
	}
	
	public CustomerQueryVO selectCustomQueryDetail(int query_idx, int idx) {
		return mapper.selectCustomQueryDetail(query_idx, idx);
	}
	
	public int insertnewCustomerQuery(CustomerQueryVO vo) {
		return mapper.insertnewCustomerQuery(vo);
	}
	
	public int deleteCustomerQuery(int query_idx, int idx) {
		return mapper.deleteCustomerQuery(query_idx, idx);
	}
	
	public int modifyCustomerQuery(CustomerQueryVO vo) {
		return mapper.modifyCustomerQuery(vo);
	}
	
	
}
