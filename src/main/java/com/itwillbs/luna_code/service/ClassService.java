package com.itwillbs.luna_code.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.luna_code.mapper.ClassEpisodeMapper;
import com.itwillbs.luna_code.mapper.ClassMapper;
import com.itwillbs.luna_code.mapper.ClassSessionMapper;
import com.itwillbs.luna_code.mapper.OnlineClassMapper;
import com.itwillbs.luna_code.vo.ClassVo;
import com.itwillbs.luna_code.vo.EpisodeVo;
import com.itwillbs.luna_code.vo.SessionVo;

@Service
public class ClassService {

	@Autowired
    private ClassMapper classMapper;
  
	@Autowired
    private ClassEpisodeMapper classEpisodeMapper;

    @Autowired
    private ClassSessionMapper classSessionMapper;

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
    
    @Transactional
    public void deleteClass(int classId) {
        classMapper.deleteClassEnrollmentByClassId(classId);
        classEpisodeMapper.deleteEpisodesByClassId(classId);
        classSessionMapper.deleteSessionsByClassId(classId);
        classMapper.deleteClass(classId);
        
    }

    public List<ClassVo> getAllClasses() {
        return classMapper.selectAllClasses();
    }
    
    public ClassVo selectClassByIdx(int class_idx) {
        return classMapper.selectClassByIdx(class_idx);
    }
    
    public int applyCourse(String userId, int courseId) {
        return classMapper.applyCourse(userId, courseId);
    }
    
    public int addToCart(int userIdx, int classIdx) {
        int count = classMapper.checkCartDuplicate(userIdx, classIdx);
        if (count > 0) {
            // 이미 장바구니에 있음
            return 0;
        }
        return classMapper.addToCart(userIdx, classIdx);
    }

    
    
}
