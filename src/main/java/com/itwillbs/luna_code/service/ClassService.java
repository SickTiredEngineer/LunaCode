package com.itwillbs.luna_code.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.ClassMapper;
import com.itwillbs.luna_code.vo.ClassVo;

@Service
public class ClassService {

	@Autowired
    private ClassMapper classMapper;

    // 강의 등록
    public int registerClass(ClassVo classVo) {
        return classMapper.insertClass(classVo);
    }
	
}
