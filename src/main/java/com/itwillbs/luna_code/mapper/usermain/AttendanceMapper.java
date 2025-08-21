package com.itwillbs.luna_code.mapper.usermain;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.UserVO;

@Mapper
public interface AttendanceMapper {
	
	public UserVO selectUserAttendance(String userId);
	
	public int updateUserAttendance(UserVO user);
	
}
