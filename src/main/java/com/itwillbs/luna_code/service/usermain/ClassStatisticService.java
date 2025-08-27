package com.itwillbs.luna_code.service.usermain;

import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.luna_code.mapper.usermain.ClassStatisticMapper;
import com.itwillbs.luna_code.vo.usermain.ClassStatisticSummaryVO;
import com.itwillbs.luna_code.vo.usermain.NewStudentVO;

@Service
public class ClassStatisticService {
	
	@Autowired
	private ClassStatisticMapper classStatisticMapper;
	
	// 최근 6개월간의 월별 수익 통계 조회
    public List<Map<String, Object>> getRecentMonthlyRevenue(int instructor_idx) {
        return classStatisticMapper.selectRecentMonthlyRevenue(instructor_idx);
    }
    // 신규 수강생 조회
    public List<NewStudentVO> getRecentNewStudents(int instructor_idx) {
        return classStatisticMapper.selectRecentNewStudents(instructor_idx);
    }
    
    // 요약 카드 데이터 조회
    public ClassStatisticSummaryVO getStatisticsSummary(int instructor_idx) {
        return classStatisticMapper.selectStatisticsSummary(instructor_idx);
    }
    
    // 월별 신규 수강생 수 조회
    public List<Map<String, Object>> getMonthlyNewStudentCounts(int instructor_idx) {
        return classStatisticMapper.selectMonthlyNewStudentCounts(instructor_idx);
    }
    
}
