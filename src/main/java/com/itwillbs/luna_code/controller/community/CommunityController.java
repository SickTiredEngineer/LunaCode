package com.itwillbs.luna_code.controller.community;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.community.CommentService;
import com.itwillbs.luna_code.service.community.CommunityService;
import com.itwillbs.luna_code.vo.community.CommentVO;
import com.itwillbs.luna_code.vo.community.PostVO;
import com.mysql.cj.Session;

/* 커뮤니티 컨트롤러 */

@Controller
public class CommunityController {

	@Autowired
	CommunityService service;
	
	@Autowired
	CommentService commentService;
	
	/* 커뮤니티 메인(자유 게시판) 이동 */
	@GetMapping("Community")
	public String community(Model model) {
		
		/* 게시물 리스트 불러온 뒤 model에 추가 */
		List<PostVO> postList = service.postList();
		System.out.println("PostList: " + postList);
		
		model.addAttribute("postList", postList);

		return "community/community";
	}
	
	/* 게시글 자세히 보는 사이트로 이동 */
	@GetMapping("PostDetail")
	public String postDetail(int post_idx, Model model) {
		
		PostVO post = service.getPostDetail(post_idx);
		List<CommentVO> comments = commentService.importAllComment(post_idx);
		
		for(CommentVO cv:comments) {
			System.out.println(cv.getNickname());
		}
		
		
		model.addAttribute("post", post);
		model.addAttribute("comments", comments);

		return "community/post_detail";
	}
	
	/* 계시글 작성/수정 페이지로 이동 */
	@GetMapping("PostWrite")
	public String postWrite() {
		return "community/post_write";
	}
	
	/* 게시글 업로드 */
	@PostMapping("PostWrite")
	public String postWriting(PostVO postVo, Model model, HttpSession session, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		
		System.out.println("PostWriteResult: " + postVo);
		System.out.println("Check User Idx From Post Write: " + user.getIdx());
//		postVo.setBoard_code("BD01");
		postVo.setAuthor_idx(user.getIdx());

		int result = service.insertNewPost(postVo);

		return "redirect:Community";
	}
	
	
}
