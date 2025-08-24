package com.itwillbs.luna_code.controller.community;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
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
	
	
	 /* 비 로그인 사용자도 좋아요 갯수는 볼 수 있어야 해서, 현재 인증 상태에 맞게 설정하는데, userIdx 가 null로 넘어가면 좋아요 안했다고 취급하고 UI 세팅 */
	 /* 만약에 인증 정보가 있으면 실제 유저 idx get 진행 후 쿼리문에 삽입하여 좋아요 유무 확인 진행함 */
	@ResponseBody
	@PostMapping("ImportPostLike")
	public Map<String, Object> importPostLike(int post_idx, Authentication auth) {
		
	    Integer user_idx = null; 
	    
	    /* 이렇게 쓰라고 함, 그냥 확인하면 널포인트 뜰거임 */
	    if (auth != null                              
	        && auth.isAuthenticated()                
	        && !(auth instanceof AnonymousAuthenticationToken)) { 

	        CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
	        user_idx = user.getIdx(); // 로그인 했을 때만 값 주입
	    }
	    System.out.println("Check UserIdx: " + user_idx);
	    
	    return service.selectLikeCount(post_idx, user_idx);
	}

	/* 좋아요 클릭하면 쿼리에 삽이하고 표시, 혹은 이미 되어 있다면 좋아요 취소 */
	@ResponseBody
	@PostMapping("ToggleLike")
	public int toggleLike(int post_idx, boolean is_like, Authentication auth) {
		CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
		int userIdx = user.getIdx();
		/* 좋아요 상태가 아니면 insert, 좋아요 상태이면 삭제 */
		return !(is_like)? service.insertNewLike(userIdx, post_idx): service.deleteLike(userIdx, post_idx);
	}
	


}
