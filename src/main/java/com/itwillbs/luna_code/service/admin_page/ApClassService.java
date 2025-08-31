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
	
	public int countAllClass(String q) {
		return mapper.countAllClass(q);
	}
	
	public int countAllClassByTitle(String q, String category) {
		return mapper.countAllClassByTitle(q, category);
	}
	
	public List<ClassVo> selectClassList(int start_row, int list_limit, String q){
		return mapper.selectClassList(start_row, list_limit, q);
	}
	
	public List<ClassVo> selectClassListByTitle(int start_row, int list_limit, String q , String category){
		return mapper.selectClassListByTitle(start_row, list_limit, q, category);
	}
	
	
	
	public ClassVo selectClassDetail(int class_idx) {
		return mapper.selectClassDetail(class_idx);
	}
	
	public int modifyClassAccept(Map<String, String> modifyMap) {
		return mapper.modifyClassAccept(modifyMap);
	}
	
}
