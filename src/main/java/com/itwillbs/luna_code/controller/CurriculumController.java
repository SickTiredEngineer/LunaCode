package com.itwillbs.luna_code.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.luna_code.mapper.ClassEpisodeMapper;
import com.itwillbs.luna_code.mapper.ClassSessionMapper;
import com.itwillbs.luna_code.service.CurriculumService;
import com.itwillbs.luna_code.vo.ClassSessionVo;
import com.itwillbs.luna_code.vo.EpisodeVo;
import com.itwillbs.luna_code.vo.SessionVo;

@Controller
@RequestMapping("/Curriculum")
public class CurriculumController {

	@Autowired
    private CurriculumService curriculumService;

	@GetMapping("/{classId}")
	public String showCurriculumPage(@PathVariable int classId, Model model) {
		List<ClassSessionVo> sessions = curriculumService.getCurriculumByClassId(classId);
	    model.addAttribute("classId", classId);
	    model.addAttribute("sessions", sessions);
	    return "class/curriculum";  
	}


	@PostMapping("/{classId}")
	public ResponseEntity<?> saveCurriculum(@PathVariable("classId") int classId,
	                                        @RequestBody List<ClassSessionVo> sessions, Model model) {
    	model.addAttribute("classId", classId);
        for (ClassSessionVo session : sessions) {
            session.setClass_idx(classId);
        }
        curriculumService.saveCurriculum(sessions, classId);
        return ResponseEntity.ok(Map.of("status", "success"));
    }
	
	@PostMapping("/curriculum/save")
	public ResponseEntity<?> saveCurriculum(@RequestBody List<ClassSessionVo> sessions) {
	    curriculumService.updateCurriculum(sessions);
	    return ResponseEntity.ok(Map.of("status", "success"));
	}
	
	@PostMapping("/deleteSession")
	public ResponseEntity<?> deleteSession(@RequestParam int sessionId) {
	    curriculumService.deleteSession(sessionId);
	    return ResponseEntity.ok(Map.of("status", "success"));
	}

	@PostMapping("/deleteEpisode")
	public ResponseEntity<?> deleteEpisode(@RequestParam int episodeId) {
	    curriculumService.deleteEpisode(episodeId);
	    return ResponseEntity.ok(Map.of("status", "success"));
	}



	
	


	
	
}
