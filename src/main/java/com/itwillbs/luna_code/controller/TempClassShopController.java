package com.itwillbs.luna_code.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.luna_code.handler.PagingHandler;
import com.itwillbs.luna_code.service.ClassService;
import com.itwillbs.luna_code.service.admin_page.ApClassService;
import com.itwillbs.luna_code.vo.ClassVo;
import com.itwillbs.luna_code.vo.PageVO;


/* ���� ���� �ӽ� ��Ʈ�ѷ� -> ���� ���� ���� */

@Controller
public class TempClassShopController {
	

	
	@Autowired
	private ApClassService service;
	
	
	@GetMapping("ClassDisplayStand")
	public String classDisplay(Model model
			,@RequestParam(defaultValue = "1") int pageNum
			,@RequestParam(name = "q", required = false) String q
			,@RequestParam(name = "category", required = false) String category
			) {
		
		String keyword = (q != null && !q.trim().isEmpty())? q.trim():null;
		String cat = (category != null && !category.trim().isEmpty())? category.trim():null;
		PageVO pageVo = PagingHandler.pageHandler(pageNum, ()->service.countAllClassByTitle(keyword, cat));
        List<ClassVo> classes = service.selectClassListByTitle(pageVo.getStartRow(), PagingHandler.LIST_LIMIT - 1, keyword, cat);
        
        model.addAttribute("pageVo", pageVo);
        model.addAttribute("classes", classes);
        model.addAttribute("q", keyword);
        model.addAttribute("category", cat);
        
		return "class_shop/class_display_stand";
	}
	
	
	

}
