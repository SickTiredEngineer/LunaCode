package com.itwillbs.luna_code.controller.community;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.community.PostLikeService;

@Controller
public class PostLikeController {
	
	@Autowired
	PostLikeService service;
	
	@ResponseBody
	@PostMapping("ImportPostLike")
	public Map<String, Object> importPostLike(int post_idx, Authentication auth) {
		CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
		return service.selectLikeCount(post_idx, user.getIdx());
	}
	
	
	
	
	public int insertNewLike(int post_idx, Authentication auth) {
		CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
		return service.insertNewLike(post_idx,user.getIdx());
	}
	
	
	
	
	
	
	
	
	

}
