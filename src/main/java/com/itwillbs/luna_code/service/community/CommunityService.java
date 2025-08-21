package com.itwillbs.luna_code.service.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.community.CommunityMapper;
import com.itwillbs.luna_code.vo.community.PostVO;

@Service
public class CommunityService {
	
	@Autowired
	CommunityMapper mapper;
	
	/* 전체 게시물 리스트 가져오는 쿼리 */
	public List<PostVO> postList(){
		return mapper.postList();
	}
	
	/* 게시물 클릭 시, 해당 게시물의 상세 내용을 가져오는 쿼리 */
	public PostVO getPostDetail(int post_idx) {
		
		int result = mapper.increaseViewCount(post_idx);
		if(result == 0) throw new IllegalArgumentException("post not found: " + post_idx);
		
		return mapper.getPostDetail(post_idx);
	}
	
	public int insertNewPost(PostVO postVo) {
		return mapper.insertNewPost(postVo);
	}
	
}
