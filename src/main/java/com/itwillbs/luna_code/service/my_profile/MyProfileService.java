package com.itwillbs.luna_code.service.my_profile;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.my_profile.MyProfileMapper;
import com.itwillbs.luna_code.service.usermain.AttendanceService;
import com.itwillbs.luna_code.vo.UserVO;

@Service
public class MyProfileService {

	@Autowired
	private MyProfileMapper myProfileMapper;
	
	@Autowired
	private AttendanceService attendanceService;
	
	public Map<String, Object> getMyProfileData(String userId) {
		Map<String, Object> myProfileData = new HashMap<>();

		UserVO userProfile = myProfileMapper.selectUserProfile(userId);
		
		UserVO attendanceData = attendanceService.getAttendancePageData(userId);
		
		if(userProfile != null && attendanceData != null) {
			userProfile.setDaily_attendance_stats(attendanceData.getDaily_attendance_stats());
		}
		
		myProfileData.put("userProfile", userProfile);
		
		return myProfileData;
	}
}
