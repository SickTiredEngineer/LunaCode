package com.itwillbs.luna_code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.ClassEpisodeVo;
import com.itwillbs.luna_code.vo.usermain.MyClassDetailVO.ClassEpisode;

@Mapper
public interface ClassEpisodeMapper {

	int insertClassEpisode(ClassEpisodeVo episode);

	List<ClassEpisodeVo> selectEpisodesBySessionId(int session_idx);
	
	// 에피소드 수정
	int updateEpisode(ClassEpisodeVo episode);

    // 개별 에피소드 삭제
	int deleteEpisode(int episode_idx);
	
	int deleteEpisodesByClassId(int classId);

    // 클래스 단위 에피소드 전체 삭제
	int deleteEpisodesBySessionId(int sessionId);

}
