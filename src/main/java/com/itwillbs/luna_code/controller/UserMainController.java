package com.itwillbs.luna_code.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors; // Collectors import 추가

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.usermain.AttendanceService;
import com.itwillbs.luna_code.service.usermain.ClassStatisticService;
import com.itwillbs.luna_code.service.usermain.MyClassService;
import com.itwillbs.luna_code.service.usermain.PlayListService;
import com.itwillbs.luna_code.vo.UserVO;
import com.itwillbs.luna_code.vo.usermain.MyClassDetailVO;
import com.itwillbs.luna_code.vo.usermain.MyCourseVO;
import com.itwillbs.luna_code.vo.usermain.NewStudentVO;
import com.itwillbs.luna_code.vo.usermain.PlayListVO;

@Controller
public class UserMainController {

	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private PlayListService playListService;
	
	@Autowired
	private MyClassService myClassService;
	
	@Autowired
	private ClassStatisticService classStatisticService;
	
	@GetMapping("UserMain")
	public String userMain(Authentication auth, Model model) {
		
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		String userId = userDetails.getUserId(); 
		int userIdx = userDetails.getIdx();
		
		// 출석 조회
		UserVO attendanceInfo = attendanceService.getAttendancePageData(userId);
		model.addAttribute("attendanceInfo", attendanceInfo);
		
		// 재생목록 조회
		List<PlayListVO> allPlaylists = playListService.getPlayList(userIdx);
		
		List<PlayListVO> recentPlaylists = allPlaylists.stream()
                .limit(2)
                .collect(Collectors.toList());

		model.addAttribute("recentPlaylists", recentPlaylists);
		
		// 내 강의 조회
		List<MyCourseVO> allInProgressCourses = myClassService.getInProgressCourses(userIdx);
		List<MyCourseVO> limitedInProgressCourses = allInProgressCourses.stream()
                .limit(2)
                .collect(Collectors.toList());
		model.addAttribute("inProgressCourses", limitedInProgressCourses);
		
		
		return "usermain/usermain";
	}

	@GetMapping("MyClass")
	public String myClass() {
		return "usermain/my_class";
	}

	@GetMapping("MyClass2")
	public String myClass2() {
		return "usermain/my_class2";
	}

	@GetMapping("MyClassDetail")
	public String myClassDetail(
			@RequestParam("id") int class_idx,
			Authentication auth, 
			Model model) {
		
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		int userIdx = userDetails.getIdx();

		MyClassDetailVO classDetail = myClassService.getClassDetailWithCurriculum(class_idx, userIdx);
		model.addAttribute("classDetail", classDetail);
		
		return "usermain/my_class_detail";
	}

	@GetMapping("InProgress")
	@ResponseBody
	public ResponseEntity<List<MyCourseVO>> getInProgressCoursesApi(Authentication auth) {
	    CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
	    int userIdx = userDetails.getIdx();

	    List<MyCourseVO> courseList = myClassService.getInProgressCourses(userIdx);
	    return ResponseEntity.ok(courseList);
	}

	@GetMapping("Completed")
	@ResponseBody
	public ResponseEntity<List<MyCourseVO>> getCompletedCoursesApi(Authentication auth) {
	    CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
	    int userIdx = userDetails.getIdx();

	    List<MyCourseVO> courseList = myClassService.getCompletedCourses(userIdx);
	    return ResponseEntity.ok(courseList);
	}
	
	@GetMapping("PlayList")
	public String playList(Authentication auth, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		int userIdx = userDetails.getIdx();
		
		List<PlayListVO> playlist = playListService.getPlayList(userIdx);
		model.addAttribute("playlist", playlist);
		
		return "usermain/play_list";
	}

	@GetMapping("PlayListPlus")
	public String playListPlus(@RequestParam("id") int playlistId, Authentication auth, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
	    int userIdx = userDetails.getIdx();
	    
	    PlayListVO playlist = playListService.getPlaylistById(playlistId, userIdx);
	    model.addAttribute("playlist", playlist);
	    
		return "usermain/play_list_plus";
	}

	@GetMapping("Attendance")
	public String attendance(Authentication auth, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		String userId = userDetails.getUserId(); // getUserId()로 변경
		
		UserVO attendanceInfo = attendanceService.getAttendancePageData(userId);
		model.addAttribute("attendanceInfo", attendanceInfo);
		
		return "usermain/attendance";
	}
	
	@PostMapping("PlayListAdd")
	@ResponseBody
	public Map<String, Object> addPlaylist(
	        @RequestParam String playlist_name, 
	        Authentication auth) {
	    
	    Map<String, Object> response = new HashMap<>();
	    CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
	    int userIdx = userDetails.getIdx();

	    PlayListVO newPlaylist = new PlayListVO();
	    newPlaylist.setUser_idx(userIdx);
	    newPlaylist.setPlaylist_name(playlist_name);

	    int result = playListService.addPlaylist(newPlaylist);

	    if (result > 0) {
	        response.put("success", true);
	        response.put("newPlaylist", newPlaylist); 
	    } else {
	        response.put("success", false);
	    }
	    
	    return response;
	}
	
	@PostMapping("PlayListDelete")
	@ResponseBody
	public Map<String, Object> deletePlaylist(@RequestParam int playlist_idx, Authentication auth) {
	    Map<String, Object> response = new HashMap<>();
	    CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
	    int userIdx = userDetails.getIdx();

	    int result = playListService.deletePlayList(playlist_idx, userIdx);

	    response.put("success", result > 0);
	    return response;
	}
	
	@PostMapping("PlayListUpdate")
	@ResponseBody
	public Map<String, Object> updatePlaylist(
	        @RequestParam int playlist_idx, 
	        @RequestParam String new_name, 
	        Authentication auth) {
	    
	    Map<String, Object> response = new HashMap<>();
	    CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
	    int userIdx = userDetails.getIdx();

	    int result = playListService.updatePlayList(playlist_idx, new_name, userIdx);
	    
	    response.put("success", result > 0);
	    return response;
	}
	
	@GetMapping("ClassStatistic")
	public String classStatistic(Authentication auth, Model model) throws Exception {
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
	    int instructorIdx = userDetails.getIdx();
	    
	    // 최근 6개월간의 월별 수익 통계 조회
	    List<Map<String, Object>> revenueData = classStatisticService.getRecentMonthlyRevenue(instructorIdx);
	    ObjectMapper objectMapper = new ObjectMapper();
	    String revenueDataJson = objectMapper.writeValueAsString(revenueData);
	    model.addAttribute("revenueDataJson", revenueDataJson);
		
	    // 신규 수강생 조회
	    List<NewStudentVO> newStudents = classStatisticService.getRecentNewStudents(instructorIdx);
		model.addAttribute("newStudents", newStudents);
	    
		return "usermain/class_statistic";
	}
	

	@GetMapping("ClassStatisticDetail")
	public String classStatisticDetail() {
		return "usermain/class_statistic_detail";
	}

}