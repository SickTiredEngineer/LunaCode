package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {

	@GetMapping("Cart")
	public String cart() {
		return "cart/cart";
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
