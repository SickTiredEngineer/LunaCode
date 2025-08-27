package com.itwillbs.luna_code.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.ClassMapper;
import com.itwillbs.luna_code.mapper.CourseRegistrationMapper;
import com.itwillbs.luna_code.vo.ClassVo;

@Service
public class CourseRegistrationService {

	@Autowired
	private CourseRegistrationMapper courseRegistrationMapper;
	
	public List<ClassVo> getClassList() {
	    return courseRegistrationMapper.selectClassList();
	}
	

	
}
