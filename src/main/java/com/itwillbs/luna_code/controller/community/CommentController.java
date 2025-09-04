package com.itwillbs.luna_code.controller.community;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.luna_code.mapper.community.CommentMapper;
import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.community.CommentService;
import com.itwillbs.luna_code.vo.community.CommentVO;

/* 댓글 관련 컨트롤런데, 댓글은 어차피 다 AJAX 사용해서 ALL ResponseBody */
@RestController
public class CommentController {

	
	@Autowired
	CommentMapper mapper;
	
	@Autowired
	CommentService service;
	
	@PostMapping("WriteComment")
	public CommentVO writeComment(CommentVO commentVo, HttpSession session, Authentication auth) {
		
		CustomUserDetails user =  (CustomUserDetails) auth.getPrincipal();
		
		commentVo.setAuthor_id(user.getUsername());
		commentVo.setAuthor_idx(user.getIdx());
		
//		int insertResult = service.insertNewComment(commentVo);
		Timestamp create_date = service.insertNewComment(commentVo);
		
		commentVo.setNickname(user.getNickname());
		commentVo.setCreate_date(create_date);
		
		System.out.println(commentVo);
		
		return commentVo;
	}
	
	
	@PostMapping("DeleteComment")
	public int deleteComment(int comment_idx, int author_idx, Authentication auth) {
		
		int result = 0;
		CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
		int userIdx = user.getIdx();
		
		if(author_idx == userIdx || user.isAdmin()) result = service.deleteComment(comment_idx, author_idx);		
		
		
		return result;
	}
	
	
	@PostMapping("ModifyComment")
	public int modifyComment(String content, int comment_idx, int author_idx, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
		int userIdx = user.getIdx();
		
		System.out.printf("Modify :%s, %d, %d, %d %n", content, comment_idx, author_idx, userIdx);
		
		int result = 0;
		
		
		if(author_idx == userIdx)result = service.updateComment(content, comment_idx, userIdx);
		
		return result;
	}

}
