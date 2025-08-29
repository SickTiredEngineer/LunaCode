package com.itwillbs.luna_code.vo.cart;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PaymentHistoryVO {
	
	private int payment_idx;
    private int user_idx;
    private String merchant_uid;
    private int item_idx;
    private int amount;
    private Timestamp pay_date;
    private String pay_method;
    private String is_refunded;
    private Timestamp refunded_date;
    
    private String class_thumbnail;
    private String class_title;
    private int total_lessons;
    private String class_type;
    private String user_id;
    
    private int total_amount;
    private String representative_item_name;
    private int total_item_count;
    
    private int instructor_idx;
    private String instructor_id;
    private String refunded_reason;
    private boolean refunded_status;
}
