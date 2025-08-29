package com.itwillbs.luna_code.vo;

import lombok.Data;

@Data
public class ClassEpisodeVo {

    private Integer episode_idx;
    private int session_idx;
    private String episode_name;
    private int episode_index;
    private String episode_video_path;
    private boolean deleted = false; 
}
