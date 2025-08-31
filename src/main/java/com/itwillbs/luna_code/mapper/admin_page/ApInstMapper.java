package com.itwillbs.luna_code.mapper.admin_page;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.admin_page.InstVO;

@Mapper
public interface ApInstMapper {
	
	/* 강사 회원수 찾아오는 쿼리 */
	int countAllInst(@Param("q") String q);
	
	/* 강사 회원 리스트 가져오는 쿼리 */
	List<InstVO> selectInstList(@Param("start_row") int start_row, @Param("list_limit") int list_limit, @Param("q") String q);
	
	/* idx로 강사 찾아오는 쿼리 */
	InstVO selectInstDetail(int idx);
	
	/* 강사 정보 수정 */
	int updateInstStatus(Map<String, String> modifyMap);
	
	
}
