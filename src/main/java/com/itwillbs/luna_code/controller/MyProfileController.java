package com.itwillbs.luna_code.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.luna_code.service.my_profile.MyProfileService;

@Controller
public class MyProfileController {
	
	@Autowired
    private MyProfileService myProfileService;

	@GetMapping("MyProfile")
	public String myProfile(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sId");

		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			return "error_page/fail";
		}
		
        Map<String, Object> myProfileData = myProfileService.getMyProfileData(userId);
        
        model.addAttribute("user", myProfileData.get("userProfile"));

		return "myprofile/my_profile";
	}

}
