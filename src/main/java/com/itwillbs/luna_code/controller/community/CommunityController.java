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
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.luna_code.handler.PagingHandler;
import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.community.CommentService;
import com.itwillbs.luna_code.service.community.CommunityService;
import com.itwillbs.luna_code.vo.PageVO;
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
	public String community(Model model
			,@RequestParam(defaultValue = "1") int pageNum
			,@RequestParam(name="q", required = false) String q) {
		
		String keyword = (q != null && !q.trim().isEmpty())? q.trim():null;
		
		PageVO pageVo = PagingHandler.pageHandler(pageNum, ()->service.countAllPost(keyword));
		System.out.println("Check Page VO: " + pageVo);
		
		/* 게시물 리스트 불러온 뒤 model에 추가 */
		List<PostVO> postList = service.postList(pageVo.getStartRow(), PagingHandler.LIST_LIMIT, keyword);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("postList", postList);
		model.addAttribute("q", keyword);

		return "community/community";
	}
	
	/* 게시글 자세히 보는 사이트로 이동 */
	@GetMapping("PostDetail")
	public String postDetail(int post_idx, Model model) {
		
		PostVO post = service.getPostDetail(post_idx);
		List<CommentVO> comments = commentService.importAllComment(post_idx);

		model.addAttribute("post", post);
		model.addAttribute("comments", comments);

		return "community/post_detail";
	}
	
	/* 게시글 작성/수정 페이지로 이동 */
	@GetMapping("PostWrite")
	public String postWrite() {
		return "community/post_write";
	}

	/* 게시글 업로드 */
	@PostMapping("PostWrite")
	public String postWriting(PostVO postVo, Model model, HttpSession session, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		postVo.setAuthor_idx(user.getIdx());
		int result = service.insertNewPost(postVo);

		return "redirect:Community";
	}
	
	/* 게시글 삭제 */
	@PostMapping("DeletePost")
	public String deletePost(int post_idx,  Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		int result = service.deletePost(post_idx, user.getIdx());
		
		return "redirect:Community";
	}
	
	/* 게시글 수정 */
	@GetMapping("ModifyPost")
	public String modifyPost(int post_idx, Model model, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
		PostVO post = service.getPostDetail(post_idx);
		
		/* 다른 사람이 수정을 시도하면 접근 거부 */
		if(post.getAuthor_idx() != user.getIdx()) return "AccessDenied";
		
		model.addAttribute("isModify", true);
		model.addAttribute("post", post);
		return "community/post_write";
	}
	
	/* 게시글 수정 Post */
	@PostMapping("ModifyPostForm")
	public String modifyPostForm(PostVO vo, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
		int userIdx = user.getIdx();
		
		System.out.println("Check Author and user idx" + vo.getAuthor_idx() + ", " + user.getIdx());
		
		if(vo.getAuthor_idx() != user.getIdx()) return "AccessDenied";
		
		int result = service.modifyPost(vo, userIdx);
		
		return "redirect:PostDetail?post_idx="+vo.getPost_idx();
	}

	
	
}
