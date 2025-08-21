package com.itwillbs.luna_code.controller.community;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.luna_code.mapper.community.CommentMapper;
import com.itwillbs.luna_code.vo.community.CommentVO;


@RestController
public class CommentController {

	
	@Autowired
	CommentMapper mapper;
	
	@PostMapping("WriteComment")
	public String writeComment(CommentVO commentVo, HttpSession session) {
		
		System.out.println("CommentVO: " + commentVo);
		System.out.println("post_idx: " + commentVo.getPost_idx());
		
		commentVo.setAuthor_id((String)session.getAttribute("sId"));
		
		int result = mapper.insertNewComment(commentVo);
		
		String msg = result > 0? "Done": "Fail";
		return msg;
	}
	
	
	
	
}
