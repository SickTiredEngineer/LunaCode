package com.itwillbs.luna_code.service.admin_page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.admin_page.ApSupportMapper;
import com.itwillbs.luna_code.vo.admin_page.QueryAnswerVO;
import com.itwillbs.luna_code.vo.support_center.CustomerQueryVO;

@Service
public class ApSupportService {
	
	@Autowired
	ApSupportMapper mapper;
	
	/* 페이징을 위해 갯수 세는 쿼리 */
	public int countAllQuery(String q) {
		return mapper.countAllQuery(q);
	}
	
	/* 페이징 후 문의 내용 VO를 담아 오는 쿼리 */
	public List<CustomerQueryVO> selectQueryList(int start_row, int list_limit, String q){
		return mapper.selectQueryList(start_row, list_limit, q);	
	}
	
	public CustomerQueryVO selectQueryDetail(int query_idx) {
		return mapper.selectQueryDetail(query_idx);
	}
	
	/* 사용자 질문에 대한 답변 찾아 오는 쿼리 */
	public QueryAnswerVO selectQueryAnswer(int query_idx) {
		return mapper.selectQueryAnswer(query_idx);
	}
	
	
	public int insertNewAnswer(QueryAnswerVO vo) {
		return mapper.insertNewAnswer(vo);
	}
	
	public int updateAnswerStatus(int query_idx) {
		return mapper.updateAnswerStatus(query_idx);
	}

}
