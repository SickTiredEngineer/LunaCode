package com.itwillbs.luna_code.vo;

import java.util.List;

import lombok.Data;

@Data
public class ClassSessionVo {

    private int session_idx;
    private int class_idx;
    private String session_name;
    private int session_index;
    private List<ClassEpisodeVo> episodes;
}
