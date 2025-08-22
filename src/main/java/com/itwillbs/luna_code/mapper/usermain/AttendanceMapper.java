package com.itwillbs.luna_code.mapper.usermain;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.UserVO;

@Mapper
public interface AttendanceMapper {
	
	public UserVO selectUserAttendance(@Param("user_id")String userId);
	
	public int updateUserAttendance(UserVO user);
	
	public int selectMaxConsecutiveDays(@Param("user_id")String userId);
	
	public int selectAttendanceCountInLast30Days(@Param("user_id")String userId);
	
	List<Map<String, Object>> selectDailyStats(@Param("user_id")String userId);
	
	List<Map<String, Object>> selectMonthlyStats(@Param("user_id")String userId);

	public int selectConsecutiveMonthlyAttendance(@Param("user_id")String userId);
	
	public int selectTodayAttendanceHistory(@Param("user_id") String userId);
	
	public int insertAttendanceHistory(@Param("user_id") String userId);
}
