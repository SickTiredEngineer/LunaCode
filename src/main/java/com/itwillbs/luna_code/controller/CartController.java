
package com.itwillbs.luna_code.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.UserService;
import com.itwillbs.luna_code.service.cart.CartService;
import com.itwillbs.luna_code.service.cart.PaymentService;
import com.itwillbs.luna_code.vo.UserVO;
import com.itwillbs.luna_code.vo.cart.CartVO;
import com.itwillbs.luna_code.vo.cart.PaymentHistoryVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private UserService userService; 
	
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
    public String deleteCartItems(@RequestParam("cartIdxList") List<Integer> cartIdxList, 
    		Authentication auth) {

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
	
	@PostMapping("CartPay")
	public String cartPay(@RequestParam(value = "selectedItems", required = false) List<Integer> selectedItems,
            Authentication auth,
            Model model,
            RedirectAttributes redirectAttributes) {
		
		// 상품이 없는경우, 다시 장바구니로 리다이렉트
		if (selectedItems == null || selectedItems.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "결제할 상품을 선택해주세요.");
            return "redirect:/Cart"; // 장바구니 페이지 URL로 리다이렉트
        }
		
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		
	    String userId = userDetails.getUserId();
	    UserVO user = userService.getUserProfile(userId); 
		
		List<CartVO> orderList = cartService.getSelectedCartList(selectedItems);
		int totalAmount = orderList.stream().mapToInt(CartVO::getFinal_price).sum();
		
	    model.addAttribute("orderList", orderList);
	    model.addAttribute("totalAmount", totalAmount);
	    
	    model.addAttribute("buyerName", user.getUser_name());
	    model.addAttribute("buyerEmail", user.getEmail());
        
		return "cart/cart_pay";
	}
	
	// 결제 검증 및 주문 데이터 저장을 위한 AJAX 요청 처리
    @ResponseBody
    @PostMapping("PaymentComplete")
    public String paymentComplete(
            Authentication auth,
            @RequestBody PaymentHistoryVO paymentData,
            @RequestParam("cart_idx_list") List<Integer> cartIdxList) {

        try {
            CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
            int user_idx = userDetails.getIdx();
            
            List<CartVO> orderList = cartService.getSelectedCartList(cartIdxList);
            
            paymentService.processPayment(paymentData, orderList, user_idx);

            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }
	
	@GetMapping("CartOrder")
	public String cartOrder(
			@RequestParam(value = "order_id", required = false) String merchant_uid, Model model) {
		
		if (merchant_uid == null || merchant_uid.isEmpty()) {
			return "redirect:/";
		}
		
		List<PaymentHistoryVO> orderHistory = paymentService.getPaymentHistory(merchant_uid);
        model.addAttribute("orderHistory", orderHistory);
		
		return "cart/cart_order";
	}
}
