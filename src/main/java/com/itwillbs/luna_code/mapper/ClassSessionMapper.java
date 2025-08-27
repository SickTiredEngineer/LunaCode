package com.itwillbs.luna_code.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.usermain.MyClassDetailVO.ClassSession;

@Mapper
public interface ClassSessionMapper {

	int insertClassSession(ClassSession session);

	
}
