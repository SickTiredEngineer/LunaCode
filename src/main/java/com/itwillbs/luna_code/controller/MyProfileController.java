package com.itwillbs.luna_code.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.my_profile.MyProfileService;
import com.itwillbs.luna_code.service.usermain.AttendanceService;
import com.itwillbs.luna_code.service.usermain.MyClassService;
import com.itwillbs.luna_code.vo.UserVO;
import com.itwillbs.luna_code.vo.usermain.MyCourseVO;

@Controller
public class MyProfileController {

	@Autowired
	private MyProfileService myProfileService;
	
	@Autowired
	private	AttendanceService attendanceService;
	
	@Autowired
	private MyClassService myClassService;

	@GetMapping("MyProfile")
	public String myProfile(Model model, Authentication auth) {
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		
	    String userId = userDetails.getUserId();
	    int userIdx = userDetails.getIdx();
		
		Map<String, Object> myProfileData = myProfileService.getMyProfileData(userId);
		model.addAttribute("user", myProfileData.get("userProfile"));
		
		UserVO attendanceInfo = attendanceService.getAttendancePageData(userId);
		model.addAttribute("attendanceInfo", attendanceInfo);
		
		Map<String, Object> communityActivity = myProfileService.getCommunityActivity(userIdx);
        
        model.addAttribute("recentPosts", communityActivity.get("recentPosts"));
        model.addAttribute("recentComments", communityActivity.get("recentComments"));
        
        List<MyCourseVO> inProgressCourses = myClassService.getInProgressCourses(userIdx);
        List<MyCourseVO> completedCourses = myClassService.getCompletedCourses(userIdx);
        
        List<MyCourseVO> allEnrolledCourses = new ArrayList<>();
        allEnrolledCourses.addAll(inProgressCourses);
        allEnrolledCourses.addAll(completedCourses);
        
        model.addAttribute("enrolledCourses", allEnrolledCourses);

		
		return "myprofile/my_profile";
	}

}