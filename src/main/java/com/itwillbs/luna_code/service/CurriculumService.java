package com.itwillbs.luna_code.service;

import com.itwillbs.luna_code.vo.ClassSessionVo;
import com.itwillbs.luna_code.vo.EpisodeVo;
import com.itwillbs.luna_code.vo.SessionVo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.luna_code.mapper.ClassEpisodeMapper;
import com.itwillbs.luna_code.mapper.ClassSessionMapper;
import com.itwillbs.luna_code.vo.ClassEpisodeVo;

@Service
public class CurriculumService {

    private final ClassSessionMapper classSessionMapper;
    private final ClassEpisodeMapper classEpisodeMapper;

    @Autowired
    public CurriculumService(ClassSessionMapper classSessionMapper,
                             ClassEpisodeMapper classEpisodeMapper) {
        this.classSessionMapper = classSessionMapper;
        this.classEpisodeMapper = classEpisodeMapper;
    }

    @Transactional
    public void saveCurriculum(List<ClassSessionVo> sessions, int classId) {
        for (ClassSessionVo session : sessions) {
            // 클래스 번호
            session.setClass_idx(classId);

            // 세션 먼저 DB에 저장
            classSessionMapper.insertClassSession(session);

            // DB에서 생성된 PK 가져오기
            int sessionIdx = session.getSession_idx();

            // 각 세션의 에피소드 저장
            for (ClassEpisodeVo ep : session.getEpisodes()) {
                ep.setSession_idx(sessionIdx);
                classEpisodeMapper.insertClassEpisode(ep);
            }
        }
    }

	public List<ClassSessionVo> getCurriculumByClassId(int classId) {
	    List<ClassSessionVo> sessions = classSessionMapper.selectSessionsByClassId(classId);
	    for (ClassSessionVo session : sessions) {
	        session.setEpisodes(classEpisodeMapper.selectEpisodesBySessionId(session.getSession_idx()));
	    }
	    return sessions;
	}
	
	@Transactional
	public void updateCurriculum(List<ClassSessionVo> sessions) {
	    for (ClassSessionVo session : sessions) {
	        classSessionMapper.updateSession(session);
	        for (ClassEpisodeVo episode : session.getEpisodes()) {
	            classEpisodeMapper.updateEpisode(episode);
	        }
	    }
	}

	@Transactional
    public void deleteSession(int sessionId) {
        // 해당 세션의 에피소드들 먼저 삭제
        classEpisodeMapper.deleteEpisodesBySessionId(sessionId);
        // 세션 삭제
        classSessionMapper.deleteSession(sessionId);
    }

    @Transactional
    public void deleteEpisode(int episodeId) {
        classEpisodeMapper.deleteEpisode(episodeId);
    }
    
}

