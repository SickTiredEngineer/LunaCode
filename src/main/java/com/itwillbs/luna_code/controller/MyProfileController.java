package com.itwillbs.luna_code.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.my_profile.MyProfileService;
import com.itwillbs.luna_code.service.usermain.AttendanceService;
import com.itwillbs.luna_code.vo.UserVO;

@Controller
public class MyProfileController {

	@Autowired
	private MyProfileService myProfileService;
	
	@Autowired
	private	AttendanceService attendanceService; 

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
		
		return "myprofile/my_profile";
	}

}