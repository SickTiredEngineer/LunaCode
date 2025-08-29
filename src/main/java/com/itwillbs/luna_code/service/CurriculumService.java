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

    @Autowired
    private ClassSessionMapper sessionMapper;

    @Autowired
    private ClassEpisodeMapper episodeMapper;

    @Transactional
    public void saveCurriculum(List<ClassSessionVo> sessions, int classId) {
        for (ClassSessionVo session : sessions) {
            session.setClass_idx(classId);

            // 삭제된 세션 처리
            if (session.isDeleted() && session.getSession_idx() != null) {
                // 삭제 처리
                episodeMapper.deleteEpisodesBySessionId(session.getSession_idx());
                sessionMapper.deleteSession(session.getSession_idx());
                continue;
            }

            // 세션 저장/수정
            if (session.getSession_idx() == null) {
                sessionMapper.insertClassSession(session);
            } else {
                sessionMapper.updateSession(session);
            }

            // 세션 안의 에피소드들 처리
            if (session.getEpisodes() != null) {
                for (ClassEpisodeVo episode : session.getEpisodes()) {
                    episode.setSession_idx(session.getSession_idx());

                    // 삭제된 에피소드
                    if (episode.isDeleted() && episode.getEpisode_idx() != null) {
                    	episodeMapper.deleteEpisode(episode.getEpisode_idx());
                    	continue;
                    }

                    // 신규 에피소드
                    if (episode.getEpisode_idx() == null) {
                        episodeMapper.insertClassEpisode(episode);
                    } else {
                        episodeMapper.updateEpisode(episode);
                    }
                }
            }
        }
    }
    
	public List<ClassSessionVo> getCurriculumByClassId(int classId) {
		List<ClassSessionVo> sessions = sessionMapper.selectSessionsByClassId(classId);
		for (ClassSessionVo session : sessions) {
		    session.setEpisodes(episodeMapper.selectEpisodesBySessionId(session.getSession_idx()));
		}

	    return sessions;
	}
	
	@Transactional
	public void updateCurriculum(List<ClassSessionVo> sessions) {
		for (ClassSessionVo session : sessions) {
			sessionMapper.updateSession(session);
		    for (ClassEpisodeVo episode : session.getEpisodes()) {
		    	episodeMapper.updateEpisode(episode);
		    }
		}
	}
	
	@Transactional
    public void deleteSession(int sessionId) {
        // 해당 세션의 에피소드들 먼저 삭제
		episodeMapper.deleteEpisodesBySessionId(sessionId);
        // 세션 삭제
        sessionMapper.deleteSession(sessionId);
    }

    @Transactional
    public void deleteEpisode(int episodeId) {
    	episodeMapper.deleteEpisode(episodeId);
    }
    
}

