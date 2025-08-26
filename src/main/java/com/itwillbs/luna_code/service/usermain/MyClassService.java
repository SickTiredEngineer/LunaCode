package com.itwillbs.luna_code.service.usermain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.usermain.MyClassMapper;
import com.itwillbs.luna_code.vo.usermain.MyClassDetailVO;
import com.itwillbs.luna_code.vo.usermain.MyCourseVO;

@Service
public class MyClassService {
    // 데이터베이스와 통신하기 위한 Mapper 객체를 스프링이 자동으로 주입합니다.
    @Autowired
    private MyClassMapper myClassMapper;

    public List<MyCourseVO> getInProgressCourses(int userIdx) {
        return myClassMapper.selectInProgressCourses(userIdx);
    }

    public List<MyCourseVO> getCompletedCourses(int userIdx) {
        return myClassMapper.selectCompletedCourses(userIdx);
    }

    public MyClassDetailVO getClassDetailWithCurriculum(int class_idx, int userIdx) {
        MyClassDetailVO detailVO = myClassMapper.selectMyClassDetail(class_idx);

        if(detailVO != null) {
        	List<MyClassDetailVO.ClassSession> sections = myClassMapper.selectSectionsByClassIdx(class_idx);
        	for(MyClassDetailVO.ClassSession section : sections) {
        		 List<MyClassDetailVO.ClassEpisode> episodes = 
        				 myClassMapper.selectLecturesBySectionIdx(section.getSession_idx(), userIdx);
        		 
        		 section.setEpisodes(episodes);
            }
            detailVO.setSections(sections);
        }
        return detailVO;
    }
}
