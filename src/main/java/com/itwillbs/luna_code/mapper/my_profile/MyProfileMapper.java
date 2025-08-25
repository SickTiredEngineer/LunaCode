package com.itwillbs.luna_code.mapper.my_profile;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.UserVO;
import com.itwillbs.luna_code.vo.community.CommentVO;
import com.itwillbs.luna_code.vo.community.PostVO;

@Mapper
public interface MyProfileMapper {
	
	public UserVO selectUserProfile(String userId);
	
	// 사용자가 작성한 최근 게시글 목록을 조회
	public List<PostVO> selectRecentPostsByAuthorIdx(
		@Param("author_idx") int authorIdx, 
		@Param("limit") int limit
	);
	
	// 사용자가 작성한 최근 댓글 목록을 조회
	List<CommentVO> selectRecentCommentsByAuthorIdx(
		@Param("author_idx") int authorIdx, 
		@Param("limit") int limit
	);
}
