package com.itwillbs.luna_code.service.admin_page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.admin_page.ApCommonCodeMapper;
import com.itwillbs.luna_code.vo.admin_page.CommonCodeVO;

@Service
public class ApCommonCodeService {

	@Autowired
	ApCommonCodeMapper mapper;
	
	/* 공통 코드 전체 개수 가져오는 쿼리 */
	public int countAllCommonCode() {
		return mapper.countAllCommonCode();
	}
	
	/* 공통 코드 리스트 가져오는 쿼리 */
	public List<CommonCodeVO> selectCommonCodeList(int start_row, int list_limit){
		return mapper.selectCommonCodeList(start_row, list_limit);
	}
	
	public CommonCodeVO selectCommonCodeDetail(int common_idx) {
		return mapper.selectCommonCodeDetail(common_idx);
	}
	
	public int insertNewCode(CommonCodeVO vo) {
		return mapper.insertNewCode(vo);
	}
	
	public int modifyCommonCode(CommonCodeVO vo) {
		return mapper.modifyCommonCode(vo);
	}

}
