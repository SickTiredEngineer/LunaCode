package com.itwillbs.luna_code.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.ClassMapper;
import com.itwillbs.luna_code.mapper.OnlineClassMapper;
import com.itwillbs.luna_code.vo.ClassVo;

@Service
public class ClassService {

	@Autowired
    private ClassMapper classMapper;
	
	@Autowired
	private OnlineClassMapper onlineClassMapper;

    // 강의 등록
    public int registerClass(ClassVo classVo) {
        return classMapper.insertClass(classVo);
    }
    
    // 온라인 강의 동영상 재생
    public String getUrlByClassId(int classId) {
        String url = onlineClassMapper.selectUrlByClassId(classId);
        if (url == null || url.isEmpty()) {
            return null;
        }
        return url;
    }

	
}
