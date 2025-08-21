package com.itwillbs.luna_code.controller;

import java.security.Principal;
import java.util.Map;

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
	public String myProfile(Principal principal, Model model) {
		String userId = principal.getName();

		Map<String, Object> myProfileData = myProfileService.getMyProfileData(userId);
		model.addAttribute("user", myProfileData.get("userProfile"));

		return "myprofile/my_profile";
	}

}