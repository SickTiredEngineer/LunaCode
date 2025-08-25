package com.itwillbs.luna_code.controller;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.ClassService;
import com.itwillbs.luna_code.vo.ClassVo;

@Controller
public class ClassController {

	@Autowired
    private ClassService classService;

    @GetMapping("/OnlineClass")
    public String onlineClass(@RequestParam("classId") int class_idx, Model model) {
    	    String Url = classService.getUrlByClassId(class_idx);
    	    model.addAttribute("url", Url);

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
	        @RequestParam(value = "videoFile", required = false) MultipartFile videoFile) throws Exception {

	    String username = principal.getName();

	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
	    Integer instructorIdx = userDetails.getIdx();

	    classVo.setInstructor_idx(instructorIdx);
	    classVo.setCreate_date(new java.sql.Date(System.currentTimeMillis()));

	    // 현장 강의 관련 class_time은 우선 null
	    classVo.setClass_time(null);

	    // 영상 파일 저장 처리
	    if (videoFile != null && !videoFile.isEmpty()) {
	        // 저장할 루트 폴더
	        String uploadDir = "/Video/Videos";

	        String originFilename = videoFile.getOriginalFilename();
	        String ext = originFilename.substring(originFilename.lastIndexOf('.'));
	        String savedFilename = UUID.randomUUID().toString() + ext;

	        Path uploadPath = Paths.get(uploadDir);
	        if (!Files.exists(uploadPath)) {
	            Files.createDirectories(uploadPath);
	        }

	        Path filePath = uploadPath.resolve(savedFilename);

	        // 실제 파일 저장
	        videoFile.transferTo(filePath.toFile());

	    }

	    classService.registerClass(classVo);

	    return "redirect:/CourseRegistration";
	}


	@GetMapping("Curriculum")
	public String curriculum() {
		return "class/curriculum";
	}
	
	@GetMapping("QuizCommentary")
	public String quizCommentary() {
		return "class/quiz_commentary";
	}
	
	@GetMapping("CurEdit")
	public String curEdit() {
		return "class/cur_edit";
	}
	
	@GetMapping("QuizManagementBackup")
	public String quizManagementBackup() {
		return "class/quiz_management_backup";
	}
	
	@GetMapping("CourseRegistration")
	public String courseRegistration() {
		return "class/course_registration";
	}
	
	@GetMapping("ClassStudentManagement")
	public String classStudentManagement() {
		return "class/class_student_management";
	}
	
	@GetMapping("ClassDetail")
	public String classdetail() {
		return "class_shop/class_detail";
	}
}
