package com.itwillbs.luna_code.vo.support_center;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_idx;
	private int admin_idx;
	private String notice_subject;
	private String notice_content;
	private Timestamp notice_date;
	private boolean is_update;
	private Timestamp update_date;
	private int view_count;
}
