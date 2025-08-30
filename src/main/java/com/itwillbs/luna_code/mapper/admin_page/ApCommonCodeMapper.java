package com.itwillbs.luna_code.mapper.admin_page;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.admin_page.CommonCodeVO;

@Mapper
public interface ApCommonCodeMapper {
	
	/* 공통 코드 전체 개수 가져오는 쿼리 */
	int countAllCommonCode(@Param("q") String q);
	
	/* 공통 코드 리스트 가져오는 쿼리 */
	List<CommonCodeVO> selectCommonCodeList(@Param("start_row") int start_row, @Param("list_limit") int list_limit, @Param("q") String q);
	
	/* 공통 코드 상세 내용 가져오는 쿼리 */
	CommonCodeVO selectCommonCodeDetail(int common_idx);
	
	int insertNewCode(CommonCodeVO vo);
	
	int modifyCommonCode(CommonCodeVO vo);
	

}
