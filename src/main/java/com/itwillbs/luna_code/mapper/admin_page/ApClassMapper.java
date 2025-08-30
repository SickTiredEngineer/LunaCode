package com.itwillbs.luna_code.mapper.admin_page;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.ClassVo;

@Mapper
public interface ApClassMapper {

	/* 전체 강의 갯수 들고오는 쿼리 */
	int countAllClass(@Param("q") String q);
	
	/* 강의 리스트를 불러오는 쿼리 */
	List<ClassVo> selectClassList(@Param("start_row") int start_row, @Param("list_limit") int list_limit, @Param("q") String q);

	/* 강의 상세 내용을 불러오는 쿼리 */
	ClassVo selectClassDetail(int class_idx);
	
	/* 강의 승인 정보 갱신 쿼리 */
	int modifyClassAccept(Map<String, String> modifyMap);
	
}
