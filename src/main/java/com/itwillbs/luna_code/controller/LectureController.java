package com.itwillbs.luna_code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LectureController {

	@GetMapping("/lecture_regist")
	public String lecture_regist() {
		
		return "lecture/lecture";
	}
	
	

    // ✅ 추가: 실시간 강의
    @GetMapping("/realtime")
    public String showRealtimeLecture() {
        return "lecture/lecture_realtime";
    }
    @GetMapping("/offline")
    public String showOfflineLecture() {
        return "lecture/lecture_offline";
    }
    
    @GetMapping("/lecture/online")
    public String onlineLecturePage() {
        return "lecture/lecture"; // JSP 경로
    }

    @GetMapping("/lecture/offline")
    public String offlineLecturePage() {
        return "lecture/lecture_offline";
    }

    @GetMapping("/lecture/realtime")
    public String realtimeLecturePage() {
        return "lecture/lecture_realtime";
    }
}
