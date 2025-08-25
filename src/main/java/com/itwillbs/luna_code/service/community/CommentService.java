package com.itwillbs.luna_code.service.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.community.CommentMapper;
import com.itwillbs.luna_code.vo.community.CommentVO;

@Service
public class CommentService {
	
	@Autowired
	CommentMapper mapper;
	
	public int insertNewComment(CommentVO commentVo) {
		mapper.insertNewComment(commentVo);	
		return commentVo.getComment_idx();
	}
	
	public List<CommentVO> importAllComment(int post_idx){
		return mapper.importAllComment(post_idx);
	}
	
	public int deleteComment(int comment_idx, int user_idx) {
		return mapper.deleteComment(comment_idx, user_idx);
	}
	
	public int updateComment(String content, int comment_idx, int user_idx) {
		return mapper.updateComment(content, comment_idx, user_idx);
	}

}
