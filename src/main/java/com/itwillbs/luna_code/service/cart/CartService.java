package com.itwillbs.luna_code.service.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.cart.CartMapper;
import com.itwillbs.luna_code.vo.cart.CartVO;

@Service
public class CartService {
	
	@Autowired
	private CartMapper cartMapper;
	
	// 장바구니 목록 조회
	public List<CartVO> getCartList(int user_idx) {
	    return cartMapper.selectCartList(user_idx);
	}

	// 장바구니 항목 삭제
	public boolean removeCartItems(int user_idx, List<Integer> cartIdxList) {
	    // 삭제할 항목이 없으면 false 반환
	    if (cartIdxList == null || cartIdxList.isEmpty()) {
	        return false;
	    }
	    
	    // 삭제된 행의 수가 0보다 크면 true 반환
	    return cartMapper.deleteCartItems(user_idx, cartIdxList) > 0;
	}
	
	public List<CartVO> getSelectedCartList(List<Integer> cartIdxList) {
	    return cartMapper.selectCartItemsByCartIdx(cartIdxList);
	}
	
}
