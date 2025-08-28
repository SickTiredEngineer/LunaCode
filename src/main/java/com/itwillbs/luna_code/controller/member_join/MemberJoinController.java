package com.itwillbs.luna_code.controller.member_join;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.luna_code.service.member_join.MemberJoinService;
import com.itwillbs.luna_code.vo.member_join.MemberJoinVO;

import custom_utills.DirectoryManager;

/* 회원가입 로직 처리 컨트롤러 */
@Controller
public class MemberJoinController {
	
	String VIRTUAL_PATH = "/resources/attachment_upload";
	
	@Autowired
	MemberJoinService memberService;
	
	/* 회원 유형 선택 페이지로 이동 */
	@GetMapping("MemberChoice")
	public String memberJoinForm() {
		return "member/join_choice";
	}
	
	/* 회원 가입 약관 확인 페이지로 이동 */
	@GetMapping("TermsOfMembership")
	public String showTOM() {
		return "member/terms_of_membership";
	}
	
	/* 회원 정보 입력 폼 페이지로 이동 */
	@GetMapping("JoinForm")
	public String joinForm() {
		return "member/join_form";
	}
	
	/* 입력 정보 데이터 베이스에 저장 후 환영 페이지로 이동 */
	@PostMapping("JoinForm")
	public String checkAndJoin(Model model, MemberJoinVO vo, HttpServletRequest req) {

	    System.out.println("Check MemberVo: " + vo);
	    vo.setEmail(vo.getEmail1() + "@" + vo.getEmail2());
	    
	    /* 강사인지 확인 */
	    boolean isInst = "MB02".equals(vo.getMember_type());
	    /* 강사일 경우 첨부파일 저장을 위한 파일 경로 저장 변수 */
	    String realPath = null;
	    String subDir   = null;

	    MultipartFile[] files = {
	        vo.getCertificate_01(),
	        vo.getCertificate_02(),
	        vo.getCertificate_03()
	    };
	    
	    java.util.List<java.util.function.BiConsumer<MemberJoinVO, String>> pathSetters = java.util.List.of(
	        MemberJoinVO::setCerPath1,
	        MemberJoinVO::setCerPath2,
	        MemberJoinVO::setCerPath3
	    );
	    
	    String[] savedNames = new String[3];

	    /* 강사일 경우 경로 지정 및 vo 세팅 */
	    if (isInst) {
	        realPath = req.getServletContext().getRealPath(VIRTUAL_PATH);
	        subDir   = DirectoryManager.createDirectories(realPath);
	        realPath = realPath + "/" + subDir;

	        for (int i = 0; i < files.length; i++) {
	            MultipartFile f = files[i];
	            if (f != null && !f.isEmpty()) {
	                String origin   = org.springframework.util.StringUtils.getFilename(f.getOriginalFilename());
	                String saveName = java.util.UUID.randomUUID() + "_" + origin;
	                savedNames[i] = saveName;                         
	                pathSetters.get(i).accept(vo, subDir + "/" + saveName);
	            }
	        }
	    }

	    int result = memberService.insertNewMember(vo);
	    if (result <= 0) {
	        model.addAttribute("msg", "회원가입 실패, 이전 페이지로 돌아갑니다.");
	        return "error_page/fail";
	    }

	    /* 실제 파일 저장 실행 */
	    if (isInst) {
	    	
	    	vo.setAccept_status("IS02");
	    	vo.setDeny_reason("증빙 자료 검토가 필요합니다.");
	    	
	    	
	        for (int i = 0; i < files.length; i++) {
	            if (savedNames[i] != null) {
	                try {
	                    files[i].transferTo(new java.io.File(realPath, savedNames[i]));
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    }

	    return "redirect:WelcomePage";
	}

	@GetMapping("WelcomePage")
	public String welcomePage() {
		return "member/welcome_page";
	}
	
	
	@ResponseBody
	@GetMapping("CheckDuplication")
	public Map<String, String> checkDuplication(@RequestParam("value") String value, @RequestParam("type") String type){
		return memberService.checkDuplication(value, type);
	}

}
