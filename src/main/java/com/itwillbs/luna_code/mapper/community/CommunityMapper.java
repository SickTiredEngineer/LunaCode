package com.itwillbs.luna_code.mapper.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.community.PostVO;

@Mapper
public interface CommunityMapper {
	
	/* 전체 게시물 리스트 가져오는 쿼리 */
	List<PostVO> postList();
	
	/* 게시물 클릭 시, 해당 게시물의 상세 내용을 가져오는 쿼리 */
	PostVO getPostDetail(@Param("post_idx") int post_idx);
	
	int insertNewPost(PostVO postVo);
	
	int increaseViewCount(int post_idx);
	
}
