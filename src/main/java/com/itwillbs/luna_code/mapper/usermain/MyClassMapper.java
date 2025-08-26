package com.itwillbs.luna_code.mapper.usermain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.usermain.MyClassDetailVO;
import com.itwillbs.luna_code.vo.usermain.MyCourseVO;

@Mapper
public interface MyClassMapper {

	List<MyCourseVO> selectInProgressCourses(int userIdx);
	List<MyCourseVO> selectCompletedCourses(int userIdx);
	MyClassDetailVO selectMyClassDetail(int class_idx);
	List<MyClassDetailVO.ClassSession> selectSectionsByClassIdx(int class_idx);
    List<MyClassDetailVO.ClassEpisode> selectLecturesBySectionIdx(
		@Param("session_idx") int session_idx,
		@Param("userIdx") int userIdx);
}
