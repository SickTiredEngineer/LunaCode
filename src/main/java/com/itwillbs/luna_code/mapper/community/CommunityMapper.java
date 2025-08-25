package com.itwillbs.luna_code.mapper.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.community.PostVO;

@Mapper
public interface CommunityMapper {
	
	/* 전체 게시물 리스트 가져오는 쿼리 */
	List<PostVO> postList(@Param("start_row") int start_row, @Param("list_limit") int list_limit);
	
	int countAllPost();
	
	/* 게시물 클릭 시, 해당 게시물의 상세 내용을 가져오는 쿼리 */
	PostVO getPostDetail(@Param("post_idx") int post_idx);
	
	/* 새 게시물 작성 */
	int insertNewPost(PostVO postVo);
	
	/* 해당 게시글 조회수 증가 */
	int increaseViewCount(int post_idx);
	
	/* 게시물 삭제 */
	int deletePost(@Param("post_idx") int post_idx, @Param("idx") int idx);
	
	/* 게시물 수정 */
	int modifyPost(@Param("vo") PostVO vo, @Param("idx") int idx);
	
	
}
