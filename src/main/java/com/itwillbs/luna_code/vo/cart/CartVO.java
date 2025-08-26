package com.itwillbs.luna_code.vo.cart;

import lombok.Data;

@Data
public class CartVO {

    private int cart_idx;
    private int user_idx;
    private int class_idx;
    
	private String class_thumbnail;
	private String class_title;
	private String class_type;
	private int class_price;
	private int total_lessons;
	
	// 강사 ID
    private String user_id;
    // 할인 금액
    private int discount_price;
    private int final_price;
}
