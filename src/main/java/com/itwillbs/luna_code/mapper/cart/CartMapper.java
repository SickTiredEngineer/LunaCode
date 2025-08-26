package com.itwillbs.luna_code.mapper.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.luna_code.vo.cart.CartVO;

@Mapper
public interface CartMapper {
	
	public List<CartVO> selectCartList(int user_idx);
	
	public int deleteCartItems(
			@Param("user_idx") int user_idx, 
			@Param("cartIdxList") List<Integer> cartIdxList
		);
	
	public List<CartVO> selectCartItemsByCartIdx(List<Integer> cartIdxList);
	
}
