package com.itwillbs.luna_code.mapper.usermain;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.luna_code.vo.usermain.NewStudentVO;

@Mapper
public interface ClassStatisticMapper {
	
	// 최근 6개월 월별 수익 조회
    public List<Map<String, Object>> selectRecentMonthlyRevenue(int instructor_idx);
    // 신규 수강생 조회
    public List<NewStudentVO> selectRecentNewStudents(int instructor_idx);
}
