package com.itwillbs.luna_code.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.CourseRegistrationMapper;
import com.itwillbs.luna_code.vo.ClassVo;

@Service
public class CourseRegistrationService {

	@Autowired
	private CourseRegistrationMapper courseRegistrationMapper;
	
	public int countClassList(int userId) {
		return courseRegistrationMapper.countClassList(userId);
	}
	
	
	public List<ClassVo> getClassList() {
	    return courseRegistrationMapper.selectClassList();
	}

	// 로그인 사용자 아이디 기준 클래스 리스트 조회
    public List<ClassVo> getClassListByUserId(int userId, int start_row, int list_limit) {
        return courseRegistrationMapper.getClassListByUserId(userId, start_row, list_limit);
    }
	
	
}
