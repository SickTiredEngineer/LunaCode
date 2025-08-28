package com.itwillbs.luna_code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.ClassSessionVo;
import com.itwillbs.luna_code.vo.SessionVo;
import com.itwillbs.luna_code.vo.usermain.MyClassDetailVO.ClassSession;

@Mapper
public interface ClassSessionMapper {

	int insertClassSession(ClassSessionVo session);

	List<ClassSessionVo> selectSessionsByClassId(int classId);

	void updateSession(ClassSessionVo session);

	void deleteSession(int sessionId);

	void deleteSessionsByClassId(int classId);
		
	

	
}
