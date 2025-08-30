package com.itwillbs.luna_code.service.admin_page;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.admin_page.ApCodeGroupMapper;
import com.itwillbs.luna_code.vo.admin_page.CodeGroupVO;

@Service
public class ApCodeGroupService {

	@Autowired
	ApCodeGroupMapper mapper;
	
	/* 페이징을 위한 공통 코드 그룹 카운트 쿼리 */
	public int countAllCodeGroup(String q) {
		return mapper.countAllCodeGroup(q);
	}
	
	/* 페이징 연산에 맞게 공통 코드 그룹 리스트 가져오는 쿼리 */
	public List<CodeGroupVO> selectCodeGroupList(int start_row, int list_limit, String q){
		return mapper.selectCodeGroupList(start_row, list_limit, q);
	}
	
	/* 코드 그룹 상세 정보 불러오기 */
	public CodeGroupVO selectCodeGroupDetail(int group_idx) {
		return mapper.selectCodeGroupDetail(group_idx);
	}
	
	public List<String> selectGroupCodes(){
		return mapper.selectGroupCodes();
	}
	
	/* 새로운 그룹 코드 삽입 쿼리 */
	public int insertNewCodeGroup(CodeGroupVO vo) {
		return mapper.insertNewCodeGroup(vo);
	}
	
	/* 그룹 코드 수정 쿼리 */
	public int updateGroupCode(CodeGroupVO vo) {
		return mapper.updateGroupCode(vo);
	}
	
}
