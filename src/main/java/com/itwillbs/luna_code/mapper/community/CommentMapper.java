package com.itwillbs.luna_code.mapper.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.community.CommentVO;

@Mapper
public interface CommentMapper {
	
	int insertNewComment(CommentVO commentVo);
	
	List<CommentVO> importAllComment(int post_idx);

}
