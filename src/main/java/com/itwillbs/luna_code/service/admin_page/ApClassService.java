package com.itwillbs.luna_code.service.admin_page;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.admin_page.ApClassMapper;
import com.itwillbs.luna_code.vo.ClassVo;

@Service
public class ApClassService {
	
	@Autowired
	ApClassMapper mapper;
	
	public int countAllClass() {
		return mapper.countAllClass();
	}
	
	public List<ClassVo> selectClassList(int start_row, int list_limit){
		return mapper.selectClassList(start_row, list_limit);
	}
	
	public ClassVo selectClassDetail(int class_idx) {
		return mapper.selectClassDetail(class_idx);
	}
	
	public int modifyClassAccept(Map<String, String> modifyMap) {
		return mapper.modifyClassAccept(modifyMap);
	}
	
}
