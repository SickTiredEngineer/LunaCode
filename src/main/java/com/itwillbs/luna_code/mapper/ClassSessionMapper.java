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

    // 세션 수정
	int updateSession(ClassSessionVo session);;

    // 개별 세션 삭제
	int deleteSession(int sessionId);

    // 클래스 단위 세션 전체 삭제
	int deleteSessionsByClassId(int classId);
		
	

	
}
