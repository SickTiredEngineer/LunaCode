package com.itwillbs.luna_code.mapper.usermain;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.usermain.ClassStatisticSummaryVO;
import com.itwillbs.luna_code.vo.usermain.NewReviewVO;
import com.itwillbs.luna_code.vo.usermain.NewStudentVO;

@Mapper
public interface ClassStatisticMapper {
	
	// 최근 6개월 월별 수익 조회
    public List<Map<String, Object>> selectRecentMonthlyRevenue(int instructor_idx);
    // 신규 수강생 조회
    public List<NewStudentVO> selectRecentNewStudents(int instructor_idx);
    // 수강생 후기 조회
    public List<NewReviewVO> selectRecentReviews(int instructor_idx);
    // 요약 카드 데이터 조회
    public ClassStatisticSummaryVO selectStatisticsSummary(int instructor_idx);
    // 월별 신규 수강생 수 조회 (올해 12개월)
    public List<Map<String, Object>> selectMonthlyNewStudentCounts(int instructor_idx);
}
