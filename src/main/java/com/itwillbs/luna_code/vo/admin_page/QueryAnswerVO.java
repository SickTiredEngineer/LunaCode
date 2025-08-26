package com.itwillbs.luna_code.vo.admin_page;

import java.sql.Timestamp;

import lombok.Data;

/* 1:1 문의 답변 담는 VO */

@Data
public class QueryAnswerVO {
	private int answer_idx;
	private int query_idx;
	private int admin_idx;
	private String answer_subject;
	private String answer_content;
	private Timestamp answer_date;
	
	private String admin_id;
}
