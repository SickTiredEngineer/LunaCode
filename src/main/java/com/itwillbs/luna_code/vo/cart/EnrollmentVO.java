package com.itwillbs.luna_code.vo.cart;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EnrollmentVO {
	
	private int user_idx;
    private int class_idx;
    private boolean is_completed;
    
    private Timestamp enroll_date; 
}
