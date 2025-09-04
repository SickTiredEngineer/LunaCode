package com.itwillbs.luna_code.mapper.community;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.community.CommentVO;

@Mapper
public interface CommentMapper {
	
	/* 새로운 댓글 작성 */
	int insertNewComment(CommentVO commentVo);
	
	Timestamp selectCreateDate(@Param("comment_idx") int comment_idx);
	
	
	/* 해당 게시글의 모든 댓글 들고오기 */
	List<CommentVO> importAllComment(int post_idx);
	
	
	/* 댓글 삭제 */
	int deleteComment(@Param("comment_idx") int comment_idx, @Param("idx") int user_idx);
	
	
	/* 댓글 업데이트 */
	int updateComment(@Param("content") String content, @Param("comment_idx") int commnet_idx, @Param("idx") int user_idx);
	

}
