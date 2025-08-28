package com.itwillbs.luna_code.vo.usermain;

import java.util.List;
import lombok.Data;

@Data
public class MyClassDetailVO {

    // 강의 기본 정보
    private int class_idx;
    private String class_title;

    // 강의의 전체 커리큘럼
    private List<ClassSession> sections;


    // 내부 클래스
    @Data
    public static class ClassSession {
        private int session_idx;
        private String session_name;
        
        // 이 섹션에 포함된 영상(에피소드) 목록
        private List<ClassEpisode> episodes;
    }

    @Data
    public static class ClassEpisode {
        private int episode_idx;
        private String episode_name;
        
        private boolean watched;
    }
}