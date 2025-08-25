package com.itwillbs.luna_code.controller.community;
import org.springframework.security.core.Authentication;

import com.itwillbs.luna_code.security.CustomUserDetails;

/* 사용 안함, 필요 없어서 남겨만 놓았음 */
public class CommunityUtills {
	
	public static boolean checkOwner(int targetIdx, int userIdx) {
		return targetIdx == userIdx; 
	}
	
	
	public static CustomUserDetails getUserInfo(Authentication auth) {
		return (CustomUserDetails)auth.getPrincipal();
	}

}
