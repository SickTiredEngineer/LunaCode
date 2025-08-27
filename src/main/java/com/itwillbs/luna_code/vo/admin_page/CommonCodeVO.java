package com.itwillbs.luna_code.vo.admin_page;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommonCodeVO {
	private int common_idx;
	private String group_code;
	private String code;
	private String code_label;
	private String code_desc;
	private boolean using_status;
	private String using;
	private int creater_idx;
	private Timestamp create_date;
	private int updater_idx;
	private Timestamp update_date;
	
	private String creater_id;
	private String updater_id;
	private int group_idx;
}
