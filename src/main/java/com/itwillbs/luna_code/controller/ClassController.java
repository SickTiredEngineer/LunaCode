package com.itwillbs.luna_code.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.luna_code.service.ClassService;
import com.itwillbs.luna_code.vo.ClassVo;

@Controller
public class ClassController {

	@GetMapping("OnlineClass")
	public String onlineclass() {
		return "class/online_class";
	}
	
	@GetMapping("ClassRegist")
	public String classregist() {
		return "class/class_regist";
	}
	
	@Autowired
	private ClassService classService;

	@PostMapping("/ClassRegist")
	public String classregist(ClassVo classVo, HttpSession session) {
	    Integer instructorIdx = (Integer) session.getAttribute("instructor_idx"); 
	    if (instructorIdx == null) {
	        return "redirect:/login";
	    }

	    classVo.setInstructor_idx(instructorIdx);
	    classVo.setCreate_date(new java.sql.Date(System.currentTimeMillis()));

	    classService.registerClass(classVo);

	    return "redirect:/GoHome";
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
