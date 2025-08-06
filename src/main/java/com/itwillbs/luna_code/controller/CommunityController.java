package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {

	/* 커뮤니티 메인(자유 게시판) 이동 */
	@GetMapping("Community")
	public String community() {
		return "community/community";
	}
	
	/* 게시글 자세히 보는 사이트로 이동 */
	@GetMapping("PostDetail")
	public String postDetail() {
		return "community/post_detail";
	}
	
	/* 계시글 작성/수정 페이지로 이동 */
	@GetMapping("PostWrite")
	public String postWrite() {
		return "community/post_write";
	}
	
}
