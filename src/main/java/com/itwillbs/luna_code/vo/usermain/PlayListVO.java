package com.itwillbs.luna_code.vo.usermain;

import com.google.protobuf.Timestamp;

import lombok.Data;

@Data
public class PlayListVO {
	
	private int playlist_idx;
	private int user_idx;
	private String playlist_name;
	private Timestamp create_date;
	private Timestamp update_date;
}
