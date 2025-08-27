package com.itwillbs.luna_code.vo.admin_page;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CodeGroupVO {
	
	private int group_idx;
	private String group_code;
	private String group_desc;
	private boolean using_status;
	private String using;
	private Timestamp create_date;
	private int creater_idx;
	private Timestamp update_date;
	private int updater_idx;
	
	private String creater_id;
	private String updater_id;

}
