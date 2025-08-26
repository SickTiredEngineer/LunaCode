package com.itwillbs.luna_code.mapper.admin_page;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.admin_page.QueryAnswerVO;
import com.itwillbs.luna_code.vo.support_center.CustomerQueryVO;

@Mapper
public interface ApSupportMapper {
	
	/* 페이징을 위해 갯수 세는 쿼리 */
	int countAllQuery();
	
	/* 페이징 후 문의 내용 VO를 담아 오는 쿼리 */
	List<CustomerQueryVO> selectQueryList(@Param("start_row") int start_row, @Param("list_limit") int list_limit); 
	
	/* 사용자 문의 내용 자세히 들고오는 쿼리 */
	CustomerQueryVO selectQueryDetail(int query_idx);
	
	/* 사용자 질문에 대한 답변 찾아 오는 쿼리 */
	QueryAnswerVO selectQueryAnswer(int query_idx);
	
	/* 답변 등록 쿼리 */
	int insertNewAnswer(QueryAnswerVO vo);
	
	/* 답변 등록 상태 업데이트 쿼리 */
	int updateAnswerStatus(int query_idx);

}
