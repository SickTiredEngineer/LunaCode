package com.itwillbs.luna_code.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PageVO {
	
	/* 총 게시물 수 */
	private int listCount;
	
	/* 페이지 당 표시할 페이지 번호 갯수 */
	private int pageListLimit;	
	
	
	private int startRow;
	
	/* 전체 페이지 수 */
	private int maxPage;	
	
	/* 현재 페이지의 시작 페이지 번호 */
	private int startPage;	
	
	/* 현재 페이지의 끝 페이지 번호 */
	private int endPage;	
	
	/* 현재 페이지 번호 */
	private int pageNum;	
}
