package com.itwillbs.luna_code.vo.support_center;

import java.sql.Timestamp;

import lombok.Data;

/* 1:1 문의 정보 담는 VO */
@Data
public class CustomerQueryVO {
	private int query_idx;
	private int user_idx;
	private String query_category;
	private boolean answer_status;
	private String query_subject;
	private String query_content;
	private Timestamp query_date;
	private boolean is_update;
	private Timestamp update_date;	
}
