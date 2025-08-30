package com.itwillbs.luna_code.mapper.admin_page;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.admin_page.CodeGroupVO;

@Mapper
public interface ApCodeGroupMapper {
	
	/* 페이징을 위한 공통 코드 그룹 카운트 쿼리 */
	int countAllCodeGroup(@Param("q")String q);
	
	/* 페이징 연산에 맞게 공통 코드 그룹 리스트 가져오는 쿼리 */
	List<CodeGroupVO> selectCodeGroupList(@Param("start_row") int start_row, @Param("list_limit") int list_limit, @Param("q")String q);
	
	/* 코드그룹 상세정보 들고오는 쿼리 */
	CodeGroupVO selectCodeGroupDetail(int group_idx);
	
	/* 새로은 코드그룹 추가 쿼리 */
	int insertNewCodeGroup(CodeGroupVO vo);
	
	/* 그룹 코드 수정 쿼리 */
	int updateGroupCode(CodeGroupVO vo);
	
	/* 그룹 이름들 들고오는거 */
	List<String> selectGroupCodes();
	

}
