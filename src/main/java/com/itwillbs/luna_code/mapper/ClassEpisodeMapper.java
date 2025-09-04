package com.itwillbs.luna_code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.ClassEpisodeVo;
import com.itwillbs.luna_code.vo.EpisodeVo;

@Mapper
public interface ClassEpisodeMapper {
	
	int insertClassEpisode(ClassEpisodeVo episode);

	List<ClassEpisodeVo> selectEpisodesBySessionId(int session_idx);
	
	// 에피소드 수정
	int updateEpisode(ClassEpisodeVo episode);

    // 개별 에피소드 삭제
	int deleteEpisode(int episode_idx);
	
	// 클래스 단위 에피소드 전체 삭제
	int deleteEpisodesByClassId(int classId);

	// 특정 세션 단위 에피소드 전체 삭제
	int deleteEpisodesBySessionId(int sessionId);
	
	// 에피소드 상세 수정
	ClassEpisodeVo selectEpisodeById(int episodeId);
	
	// 전체 에피소드 리스트 (vo 사용)
	int updateEpisodeDetail(ClassEpisodeVo episodeVo);
	
	// session_idx별 에피소드 리스트 조회
	List<EpisodeVo> selectEpisodeList();
	
	// 영상 링크 불러오기 (Id 기준 상세조회)
	EpisodeVo getEpisodeById(int episodeId);



}
