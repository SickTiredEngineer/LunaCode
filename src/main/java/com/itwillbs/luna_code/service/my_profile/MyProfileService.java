package com.itwillbs.luna_code.service.my_profile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.my_profile.MyProfileMapper;
import com.itwillbs.luna_code.service.usermain.AttendanceService;
import com.itwillbs.luna_code.vo.UserVO;
import com.itwillbs.luna_code.vo.community.CommentVO;
import com.itwillbs.luna_code.vo.community.PostVO;

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
	
    public Map<String, Object> getCommunityActivity(int authorIdx) {
        Map<String, Object> activityData = new HashMap<>();
        
        // 최근 게시글 2개
        List<PostVO> recentPosts = myProfileMapper.selectRecentPostsByAuthorIdx(authorIdx, 2);
        
        // 최근 댓글 2개
        List<CommentVO> recentComments = myProfileMapper.selectRecentCommentsByAuthorIdx(authorIdx, 2);
        
        activityData.put("recentPosts", recentPosts);
        activityData.put("recentComments", recentComments);
        
        return activityData;
    }
}
