package com.itwillbs.luna_code.controller.admin_page;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.luna_code.handler.PagingHandler;
import com.itwillbs.luna_code.security.CustomUserDetails;
import com.itwillbs.luna_code.service.admin_page.ApCodeGroupService;
import com.itwillbs.luna_code.vo.PageVO;
import com.itwillbs.luna_code.vo.admin_page.CodeGroupVO;

/* 관리자 페이지 공통 코드 그룹 관리 */
@Controller
public class ApCodeGroupController {
	
	@Autowired
	ApCodeGroupService service;
	
	/* 코드 그룹 목록 보기 **/
	@GetMapping("ApGroupCodeList")
	public String apGroupCodeList(Model model
			,@RequestParam(defaultValue = "1") int pageNum
			,@RequestParam(name = "q", required = false)String q) {
		
		String keyword = (q != null && !q.trim().isEmpty())? q.trim():null;
		
		PageVO pageVo = PagingHandler.pageHandler(pageNum, ()->service.countAllCodeGroup(keyword));
		List<CodeGroupVO> groupList = service.selectCodeGroupList(pageVo.getStartRow(), PagingHandler.LIST_LIMIT, keyword);
		
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("groupList", groupList);
		
		return "admin/ap_group_code_list";
	}
	
	/* 코드 그룹 상세 보기 */
	@GetMapping("ApGroupCodeDetail")
	public String apGroupCodeDetail(Model model, int group_idx) {
		
		CodeGroupVO groupVo = service.selectCodeGroupDetail(group_idx);
		model.addAttribute("groupVo", groupVo);
		
		return "admin/ap_group_code_detail";
	}
	
	/* 코드 그룹 작성 페이지로 이동 */
	@GetMapping("ApGroupCodeWriter")
	public String apGroupCodeWriter() {
		return "admin/ap_group_code_writer";
	}
	
	/* 새로운 그룹 코드 삽입 로직 */
	@PostMapping("NewCodeGroupForm")
	public String newCodeGroupForm(CodeGroupVO vo, Authentication auth) {
		
		/* 등록한 admin 정보를 위해 현재 인증 객체에서 id들고와서 vo에 세팅하고 쿼리 실행 */
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		vo.setCreater_idx(user.getIdx());
		
		/* 사용여부 -> 이거는 boolean으로 지정못해서 여기서 핸들링 해줘야함 */
		boolean using_status = vo.getUsing().equals("true")? true : false;
		vo.setUsing_status(using_status);
		
		int result = service.insertNewCodeGroup(vo);
		
		return "redirect:ApGroupCodeDetail?group_idx="+vo.getGroup_idx();
	}
	
	/* 그룹 코드 수정 페이지로 이동 */
	@GetMapping("ModifyGroupCode")
	public String modifyGroupCode(Model model, int group_idx) {
		
		boolean isModify = true;
		model.addAttribute("isModify", isModify);
		
		CodeGroupVO vo = service.selectCodeGroupDetail(group_idx);
		String using = vo.isUsing_status()? "true" : "false";
				
		model.addAttribute("vo", vo);

		return "admin/ap_group_code_writer";
	}


	@PostMapping("ModifyCodeGroupForm")
	public String modifyCodeGroupForm(CodeGroupVO vo, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		vo.setUpdater_idx(user.getIdx());
		
		boolean using_status = vo.getUsing().equals("true")? true : false;
		vo.setUsing_status(using_status);
		
		int result = service.updateGroupCode(vo);
		
		return  "redirect:ApGroupCodeDetail?group_idx="+vo.getGroup_idx();
	}
	

}
