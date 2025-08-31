package com.itwillbs.luna_code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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
	int selectClassById(int classId);
	int applyCourse(String userId, int courseId);
	// 장바구니 담기
	int addToCart(int userIdx, int classIdx);
	int checkCartDuplicate(int userIdx, int classIdx);


}
