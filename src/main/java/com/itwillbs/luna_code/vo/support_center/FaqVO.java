package com.itwillbs.luna_code.vo.support_center;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FaqVO {
	private int faq_idx;
	private int admin_idx;
	private String faq_subject;
	private String faq_content;
	private Timestamp faq_date;
	private String category;
}
