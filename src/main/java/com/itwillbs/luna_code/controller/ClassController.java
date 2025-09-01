package com.itwillbs.luna_code.controller;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.ClassService;
import com.itwillbs.luna_code.service.CourseRegistrationService;
import com.itwillbs.luna_code.service.CurriculumService;
import com.itwillbs.luna_code.service.OnlineClassService;
import com.itwillbs.luna_code.service.UserService;
import com.itwillbs.luna_code.vo.ClassEpisodeVo;
import com.itwillbs.luna_code.vo.ClassSessionVo;
import com.itwillbs.luna_code.vo.ClassVo;
import com.itwillbs.luna_code.vo.EpisodeVo;
import com.itwillbs.luna_code.vo.SessionVo;

@Controller
public class ClassController {

	@Autowired
    private ClassService classService;
	
	@Autowired
	private OnlineClassService onlineclassservice;
	
    @Autowired
    private UserService userService;
    
    @Autowired
    private CourseRegistrationService courseRegistrationService;
    
    @Autowired
    private CurriculumService curriculumService;
    
    @Autowired
    private ServletContext servletContext;
    
    @GetMapping("/OnlineClass")
    public String onlineClass(@RequestParam int classId,
                              @RequestParam(required = false, defaultValue = "0") int episodeId,
                              @AuthenticationPrincipal CustomUserDetails userDetails,
                              Model model) {

        // 로그인한 사용자 정보
        Integer idx = (userDetails != null) ? userDetails.getIdx() : null;
        int userIdx = (idx != null) ? idx : 0; 

        // 클래스 URL 가져오기
        String url = onlineclassservice.getUrlByClassId(classId);
        model.addAttribute("url", url);

        // 클래스 세션 & 에피소드 조회
        List<SessionVo> sessions = classService.getSessionsByClassId(classId);
        List<EpisodeVo> allEpisodes = new ArrayList<>();
        for (SessionVo session : sessions) {
            allEpisodes.addAll(classService.getEpisodesBySessionId(session.getSession_idx()));
        }
        model.addAttribute("episodeList", allEpisodes);

        
        EpisodeVo selectedEpisode;
        if (!allEpisodes.isEmpty()) {
            if (episodeId >= 0 && episodeId < allEpisodes.size()) {
                selectedEpisode = allEpisodes.get(episodeId);
            } else {
                selectedEpisode = allEpisodes.get(0);
            }
            model.addAttribute("firstVideoPath", selectedEpisode.getEpisode_video_path());
            model.addAttribute("firstEpisodeName", selectedEpisode.getEpisode_name());
        } else {
            model.addAttribute("firstVideoPath", "");
            model.addAttribute("firstEpisodeName", "영상이 없습니다.");
        }

        return "class/online_class";
    }


	@GetMapping("ClassRegist")
	public String classregist() {
		return "class/class_regist";
	}
	
	@PostMapping("/ClassRegist")
	public String classregist(
	        ClassVo classVo,
	        Principal principal,
	        @RequestParam(value = "videoFile", required = false) MultipartFile videoFile,
	        @RequestParam(value = "thumbnailFile", required = false) MultipartFile thumbnailFile) throws Exception {
	    
	    String username = principal.getName();
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
	    Integer instructorIdx = userDetails.getIdx();
	    
	    classVo.setInstructor_idx(instructorIdx);
	    classVo.setCreate_date(new java.sql.Date(System.currentTimeMillis()));
	    
	    // 썸네일 파일 저장 처리
	    if (thumbnailFile != null && !thumbnailFile.isEmpty()) {
	        String uploadDir = servletContext.getRealPath("/resources/class_thumbnails"); 
	        String originFilename = thumbnailFile.getOriginalFilename();
	        String ext = originFilename.substring(originFilename.lastIndexOf('.'));
	        String savedFilename = UUID.randomUUID().toString() + ext;
	        Path uploadPath = Paths.get(uploadDir);
	        if (!Files.exists(uploadPath)) {
	            Files.createDirectories(uploadPath);
	        }
	        Path filePath = uploadPath.resolve(savedFilename);
	        thumbnailFile.transferTo(filePath.toFile());
	        
	        classVo.setClass_thumbnail(savedFilename);
	    }
	    
	    // 영상 파일 저장 처리
	    if (videoFile != null && !videoFile.isEmpty()) {
	        String uploadDir = "/Video/Videos";
	        String originFilename = videoFile.getOriginalFilename();
	        String ext = originFilename.substring(originFilename.lastIndexOf('.'));
	        String savedFilename = UUID.randomUUID().toString() + ext;
	        Path uploadPath = Paths.get(uploadDir);
	        if (!Files.exists(uploadPath)) {
	            Files.createDirectories(uploadPath);
	        }
	        Path filePath = uploadPath.resolve(savedFilename);
	        videoFile.transferTo(filePath.toFile());
	    }
	    
	    classService.registerClass(classVo);
	    return "redirect:/CourseRegistration";
	}

	
	//에피소드 수정
	@GetMapping("/CurEdit/{episodeId}")
	public String curEdit(@PathVariable int episodeId, Model model) {
	    ClassEpisodeVo episode = curriculumService.getEpisodeById(episodeId);
	    model.addAttribute("episode", episode);
	    return "class/cur_edit";
	}
	
	@PostMapping("/CurEdit/{episodeId}")
	public String updateEpisode(@PathVariable int episodeId,
	                            @ModelAttribute ClassEpisodeVo episodeVo,
	                            RedirectAttributes redirectAttributes) {
	    episodeVo.setEpisode_idx(episodeId);

	    try {
	        curriculumService.updateEpisodeDetail(episodeVo); 
	        redirectAttributes.addFlashAttribute("msg", "수정이 완료되었습니다.");
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("msg", "수정 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }

	    return "redirect:/Curriculum/" + episodeId; 
	}


	@GetMapping("QuizCommentary")
	public String quizCommentary() {
		return "class/quiz_commentary";
	}
	
	@GetMapping("QuizManagementBackup")
	public String quizManagementBackup() {
		return "class/quiz_management_backup";
	}
	
	//강의 목록
	@GetMapping("CourseRegistration")
	public String courseRegistration(Model model) {
		List<ClassVo> classList = courseRegistrationService.getClassList();
	    model.addAttribute("classList", classList);
		
		return "class/course_registration";
	}
	
	// 강의 목록 삭제
    @GetMapping("/deleteClass")
    public String deleteClass(@RequestParam("classId") int classId) {
        classService.deleteClass(classId);
        return "redirect:/CourseRegistration"; 
    }
	
	@GetMapping("ClassStudentManagement")
	public String classStudentManagement() {
		return "class/class_student_management";
	}
	
	@GetMapping("ClassDetail")
	
	public String classdetail(int class_idx, Model model) {
		
		
		ClassVo lecture = classService.selectClassByIdx(class_idx);
		System.out.println("Check Class Detail: " + lecture);
		
		model.addAttribute("lecture", lecture);
		
		return "class_shop/class_detail";
	}
	
	@PostMapping("/apply")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> applyCourse(@RequestBody Map<String, Object> params, Principal principal) {
		Map<String, Object> res = new HashMap<>();
	        try {
	            String userId = principal.getName();
	            int courseId = (Integer) params.get("courseId");

	            classService.applyCourse(userId, courseId);

	            res.put("success", true);
	        } catch (Exception e) {
	            res.put("success", false);
	            res.put("message", e.getMessage());
	        }
	        return ResponseEntity.ok(res);
	    }
	
	@PostMapping("/cart_add")
	@ResponseBody
	public String addToCart(@RequestParam int userIdx, @RequestParam int classIdx) {
	    int result = classService.addToCart(userIdx, classIdx);
	    return (result > 0) ? "장바구니에 담겼습니다!" : "이미 담겨있거나 실패했습니다.";
	}

	
}
