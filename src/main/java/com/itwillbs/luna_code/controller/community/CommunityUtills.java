package com.itwillbs.luna_code.controller.community;
import org.springframework.security.core.Authentication;

import com.itwillbs.luna_code.security.CustomUserDetails;

public class CommunityUtills {
	
	public static boolean checkOwner(int targetIdx, int userIdx) {
		return targetIdx == userIdx; 
	}
	
	
	public static CustomUserDetails getUserInfo(Authentication auth) {
		return (CustomUserDetails)auth.getPrincipal();
	}

}
