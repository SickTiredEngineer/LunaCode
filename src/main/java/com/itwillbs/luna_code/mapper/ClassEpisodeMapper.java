package com.itwillbs.luna_code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.ClassEpisodeVo;
import com.itwillbs.luna_code.vo.usermain.MyClassDetailVO.ClassEpisode;

@Mapper
public interface ClassEpisodeMapper {

	int insertClassEpisode(ClassEpisodeVo episode);

	List<ClassEpisodeVo> selectEpisodesBySessionId(int session_idx);
	
	 void updateEpisode(ClassEpisodeVo episode);

	void deleteEpisode(int episode_idx);
	
}
