package com.itwillbs.luna_code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.ClassVo;
import com.itwillbs.luna_code.vo.EpisodeVo;
import com.itwillbs.luna_code.vo.SessionVo;

@Mapper
public interface ClassMapper {

	int insertClass(ClassVo classVo);
    List<SessionVo> selectSessionsByClassId(int classId);
    List<EpisodeVo> selectEpisodesBySessionId(int sessionId);	
    int deleteClassEnrollmentByClassId(int classId);
    int deleteClass(int classId);
	List<ClassVo> selectAllClasses();
	ClassVo selectClassByIdx(@Param("class_idx")int class_idx);
	int applyCourse(@Param("user_idx") int user_idx, @Param("class_idx") int class_idx);
	// 장바구니 담기
	int checkCartDuplicate(int userIdx, int classIdx);


}
