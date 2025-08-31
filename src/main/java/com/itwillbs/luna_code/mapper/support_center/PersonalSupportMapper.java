package com.itwillbs.luna_code.mapper.support_center;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.support_center.CustomerQueryVO;

@Mapper
public interface PersonalSupportMapper {
	
	List<CustomerQueryVO> selectCustomerQuery(@Param("idx") int idx, @Param("start_row") int start_row, @Param("list_limit") int list_limit, @Param("q") String q);
	
	int countAllCustomerQuery(@Param("idx") int idx, @Param("q") String q);
	
	CustomerQueryVO selectCustomQueryDetail(@Param("query_idx") int query_idx, @Param("idx") int idx);
	
	int insertnewCustomerQuery(CustomerQueryVO vo);
	
	int deleteCustomerQuery(@Param("query_idx") int query_idx, @Param("idx") int idx);
	
	int modifyCustomerQuery(CustomerQueryVO vo);

}
