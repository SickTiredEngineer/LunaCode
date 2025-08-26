package com.itwillbs.luna_code.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.ClassMapper;
import com.itwillbs.luna_code.mapper.OnlineClassMapper;
import com.itwillbs.luna_code.vo.ClassVo;
import com.itwillbs.luna_code.vo.EpisodeVo;
import com.itwillbs.luna_code.vo.SessionVo;

@Service
public class ClassService {

	@Autowired
    private ClassMapper classMapper;

    // 강의 등록
    public int registerClass(ClassVo classVo) {
        return classMapper.insertClass(classVo);
    }
    
    public List<SessionVo> getSessionsByClassId(int classId) {
        return classMapper.selectSessionsByClassId(classId);
    }

    public List<EpisodeVo> getEpisodesBySessionId(int sessionId) {
        return classMapper.selectEpisodesBySessionId(sessionId);
    }
	
}
