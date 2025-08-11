package com.itwillbs.luna_code.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
}
