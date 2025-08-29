package com.itwillbs.luna_code.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.luna_code.service.ClassService;
import com.itwillbs.luna_code.vo.ClassVo;


/* ���� ���� �ӽ� ��Ʈ�ѷ� -> ���� ���� ���� */

@Controller
public class TempClassShopController {
	
	@Autowired
    private ClassService classService; 
	
	@GetMapping("ClassDisplayStand")
	public String classDisplay(Model model) {
		        List<ClassVo> classes = classService.getAllClasses();
		        model.addAttribute("classes", classes);
		
		return "class_shop/class_display_stand";
	}
	
	
	

}
