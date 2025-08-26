package com.itwillbs.luna_code.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.cart.CartService;
import com.itwillbs.luna_code.vo.cart.CartVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
    @GetMapping("Cart")
    public String cart(Authentication auth, Model model) {

        CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
        int user_idx = userDetails.getIdx();

        // 조회된 실제 사용자 번호(user_idx)로 장바구니 목록 조회
        List<CartVO> cartList = cartService.getCartList(user_idx);
        model.addAttribute("cartList", cartList);

        return "cart/cart";
    }
    
    // 장바구니 항목 삭제 (AJAX 요청 처리)
    @ResponseBody
    @PostMapping("CartDelete")
    public String deleteCartItems(@RequestParam("cartIdxList[]") List<Integer> cartIdxList, Authentication auth) {

        CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
        int user_idx = userDetails.getIdx();
        
        // 삭제 로직 수행
        try {
            boolean isSuccess = cartService.removeCartItems(user_idx, cartIdxList);
            if(isSuccess) {
                return "success";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }

        return "fail";
    }
	
	@GetMapping("CartPay")
	public String cartPay() {
		return "cart/cart_pay";
	}
	
	@GetMapping("CartOrder")
	public String cartOrder() {
		return "cart/cart_order";
	}
}
