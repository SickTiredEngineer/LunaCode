package com.itwillbs.luna_code.controller.community;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.luna_code.service.community.CommunityService;
import com.itwillbs.luna_code.vo.community.PostVO;

/* 커뮤니티 컨트롤러 */

@Controller
public class CommunityController {

	@Autowired
	CommunityService service;
	
	/* 커뮤니티 메인(자유 게시판) 이동 */
	@GetMapping("Community")
	public String community(Model model) {
		
		/* 게시물 리스트 불러온 뒤 model에 추가 */
		List<PostVO> postList = service.postList();
		System.out.println("PostList: " + postList);
		
		/* 게시글 작성일 포멧 -> Detail에서는 시간도 사용할거고 list에서는 yyyymmdd형태로만 보여줄거임 */
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd");
//		
//		for(PostVO post:postList) {
//			post.setCreated_date(simpleDateFormat.format(post.getCreated_date()));
//		}
		
		
		
		model.addAttribute("postList", postList);
		

		return "community/community";
	}
	
	/* 게시글 자세히 보는 사이트로 이동 */
	@GetMapping("PostDetail")
	public String postDetail(int post_idx, Model model) {
		
		PostVO post = service.getPostDetail(post_idx);
		
		model.addAttribute("post", post);
		
		return "community/post_detail";
	}
	
	/* 계시글 작성/수정 페이지로 이동 */
	@GetMapping("PostWrite")
	public String postWrite() {
		return "community/post_write";
	}
	
}
