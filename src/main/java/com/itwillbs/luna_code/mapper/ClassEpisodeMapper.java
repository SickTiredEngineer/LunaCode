package com.itwillbs.luna_code.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.usermain.MyClassDetailVO.ClassEpisode;

@Mapper
public interface ClassEpisodeMapper {

	int insertClassEpisode(ClassEpisode episode);
	
}
