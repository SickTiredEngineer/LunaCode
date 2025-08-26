package com.itwillbs.luna_code.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OnlineClassMapper {

	 String selectUrlByClassId(int classId);
	
}
