package com.itwillbs.luna_code.mapper.support_center;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.support_center.FaqVO;

/* Faq 쿼리 매퍼 */
@Mapper
public interface FaqMapper {

	List<FaqVO> selectFaq(@Param("start_row") int start_row, @Param("list_limit") int list_limit, @Param("q")String q);

	int countAllFaq(@Param("q")String q);

	FaqVO selectFaqDetail(int faq_idx);

	int deleteFaq(int faq_idx);

	int insertNewFaq(FaqVO faqVo);

	int modifyFaq(FaqVO faqVo);

}
