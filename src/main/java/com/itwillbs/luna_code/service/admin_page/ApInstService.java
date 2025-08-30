package com.itwillbs.luna_code.service.admin_page;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.admin_page.ApInstMapper;
import com.itwillbs.luna_code.vo.admin_page.InstVO;


@Service
public class ApInstService {
	
	@Autowired
	ApInstMapper mapper;
	
	public int countAllInst(String q) {
		return mapper.countAllInst(q);
	}
	
	public List<InstVO> selectInstList(int start_row, int list_limit, String q) {
		return mapper.selectInstList(start_row, list_limit, q);	
	}
	
	public InstVO selectInstDetail(int idx) {
		return mapper.selectInstDetail(idx);
	}
	
	public int updateInstStatus(Map<String, String> modifyMap) {
		return mapper.updateInstStatus(modifyMap);
	}
	

}
