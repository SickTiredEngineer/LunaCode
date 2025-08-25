package com.itwillbs.luna_code.controller.support_center;

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
import com.itwillbs.luna_code.service.support_center.NoticeService;
import com.itwillbs.luna_code.vo.PageVO;
import com.itwillbs.luna_code.vo.support_center.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	/* 공지사항 목록 들고와서 페이징 후 출력 */
	@GetMapping("NoticeList")
	public String noticeList(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		
		PageVO pageVo = PagingHandler.pageHandler(pageNum, service::countAllNotice);
		List<NoticeVO> noticeList = service.selectNotice(pageVo.getStartRow(), PagingHandler.LIST_LIMIT);
		
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("noticeList", noticeList);
		
		return "support_center/notice_list";
	}
	
	/* 공지사항 내용 들고와서 출력 */
	@GetMapping("NoticeDetail")
	public String noticeDetail(int notice_idx, Model model) {
		
		int viewResult = service.increaseViewCount(notice_idx);
		NoticeVO noticeVo = service.selectNoticeDetail(notice_idx);
		model.addAttribute("noticeVo", noticeVo);
		
		return "support_center/notice_detail";
	}
	
	/* 공지사항 작성 페이지로 이동 */
	@GetMapping("NoticeWrite")
	public String noticeWrite() {
		return "support_center/notice_write";
	}
	
	/* 작성한 공지사항 업로드 */
	@PostMapping("NoticeWriteForm")
	public String noticeWriteForm(NoticeVO noticeVo, Authentication auth) {
		
		CustomUserDetails user = (CustomUserDetails)auth.getPrincipal();
		
		int result = 0;
		noticeVo.setAdmin_idx(user.getIdx());
		if(user.isAdmin())result = service.insertNewNotice(noticeVo);

		return "redirect:NoticeList";
	}
	
	/* 공지사항 수정을 위해 add Attribute 후 이동 */
	@GetMapping("ModifyNotice")
	public String modifyNotice(int notice_idx, Model model) {
		
		NoticeVO noticeVo = service.selectNoticeDetail(notice_idx);
		model.addAttribute("isModify", true);
		model.addAttribute("noticeVo", noticeVo);
		
		return "support_center/notice_write";
	}
	
	/* 공지사항 수정 폼 */
	@PostMapping("ModifyNoticeForm")
	public String modifyNoticeForm(NoticeVO noticeVo) {
		int result = service.modifyNotice(noticeVo);
		return "redirect:NoticeDetail?notice_idx=" + noticeVo.getNotice_idx();
	}
	
	/* 공지사항 삭제 */
	@PostMapping("DeleteNotice")
	public String deleteNotice(int notice_idx) {
		int result = service.deleteNotice(notice_idx);
		return "redirect:NoticeList";
	}
	
	

}
