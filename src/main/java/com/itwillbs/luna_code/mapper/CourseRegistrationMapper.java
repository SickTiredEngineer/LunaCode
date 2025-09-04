package com.itwillbs.luna_code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.ClassVo;

@Mapper
public interface CourseRegistrationMapper {

	int countClassList(@Param("userId") int userId);
	
	List<ClassVo> selectClassList();
	List<ClassVo> getClassListByUserId(@Param("userId") int userId, @Param("start_row")int start_row, @Param("list_limit")int list_limit);

}
