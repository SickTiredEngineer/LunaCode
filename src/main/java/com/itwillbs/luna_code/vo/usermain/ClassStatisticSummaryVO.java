package com.itwillbs.luna_code.vo.usermain;

import lombok.Data;

@Data
public class ClassStatisticSummaryVO {
	
	private long monthlyRevenue;  // 이번 달 수익
    private long totalRevenue;    // 전체 기간 수익
    private int newStudentCount;  // 이번 달 신규 수강생 수
    private int totalStudentCount; // 전체 수강생 수
	
}
