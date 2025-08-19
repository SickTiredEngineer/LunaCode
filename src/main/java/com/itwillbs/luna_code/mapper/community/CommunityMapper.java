package com.itwillbs.luna_code.mapper.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.community.PostVO;

@Mapper
public interface CommunityMapper {
	
	List<PostVO> postList();
	
}
