package com.itwillbs.luna_code.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.luna_code.mapper.ClassEpisodeMapper;
import com.itwillbs.luna_code.mapper.ClassSessionMapper;
import com.itwillbs.luna_code.vo.ClassEpisodeVo;
import com.itwillbs.luna_code.vo.usermain.MyClassDetailVO.ClassEpisode;
import com.itwillbs.luna_code.vo.usermain.MyClassDetailVO.ClassSession;

@Service
public class CurriculumService {

	@Autowired
	private final ClassSessionMapper classSessionMapper;  
	private final ClassEpisodeMapper classEpisodeMapper;

    public CurriculumService(ClassSessionMapper classSessionMapper, ClassEpisodeMapper classEpisodeMapper) {
        this.classSessionMapper = classSessionMapper;
        this.classEpisodeMapper = classEpisodeMapper;
    }

    // 저장 메서드 (트랜잭션 적용 권장)
//    @Transactional
//    public void saveCurriculum(List<ClassSession> sessions) {
//        for (ClassSession session : sessions) {
//            classSessionMapper.insertClassSession(session);  // 세션 저장 후 id 받음
//            int sessionId = session.getSession_idx();
//
//            if (session.getEpisodes() != null && !session.getEpisodes().isEmpty()) {
//                for (ClassEpisodeVo episode : session.getEpisodes()) {
//                    episode.setSession_idx(sessionId);
//                    classEpisodeMapper.insertClassEpisode(episode);
//                }
//            }
//
//        }
//    }
}
