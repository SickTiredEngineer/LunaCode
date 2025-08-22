package com.itwillbs.luna_code.service.usermain;
	
	import java.time.LocalDate;
	import java.time.LocalDateTime;
	import java.time.format.DateTimeFormatter;
	import java.util.HashMap;
	import java.util.List;
	import java.util.Map;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Service;
	import org.springframework.transaction.annotation.Transactional;
	
	import com.itwillbs.luna_code.mapper.usermain.AttendanceMapper;
	import com.itwillbs.luna_code.vo.UserVO;
	
	@Service
	public class AttendanceService {
	
		@Autowired
		private AttendanceMapper attendanceMapper;
	
		// 출석 현황 페이지 조회를 위한 메소드
		public UserVO getUserAttendance(String userId) {
			return attendanceMapper.selectUserAttendance(userId);
		}
		
		 public UserVO getAttendancePageData(String userId) {
		        // 1. 기본 출석 정보 조회 (현재 연속/누적 출석일)
		        UserVO userData = attendanceMapper.selectUserAttendance(userId);
		        if (userData == null) {
		            // 만약 사용자가 없거나 출석 기록이 전혀 없다면 빈 객체를 만들어 기본값을 채워줍니다.
		            userData = new UserVO();
		            userData.setAttendance_count(0);
		            userData.setAttendance_consecutive(0);
		        }
	
		        // 2. 최대 연속 출석일 조회
		        int maxStreak = attendanceMapper.selectMaxConsecutiveDays(userId);
		        userData.setMax_attendance_consecutive(maxStreak);
	
		        // 3. 최근 30일 출석일 수를 기반으로 결석일 계산
		        int attendedDaysInLast30 = attendanceMapper.selectAttendanceCountInLast30Days(userId);
		        userData.setRecent_absences(30 - attendedDaysInLast30);
	
		        // 4. 요일별 통계 데이터 가공 (DB -> Map)
		        List<Map<String, Object>> dailyList = attendanceMapper.selectDailyStats(userId);
		        Map<String, Integer> dailyStats = new HashMap<>();
		        // JSP에서 사용하기 편하도록 요일 이름(MON, TUE...)을 키로 사용합니다.
		        String[] days = {"SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"};
		        for (String day : days) {
		            dailyStats.put(day, 0); // 모든 요일을 0으로 초기화
		        }
		        
		        for (Map<String, Object> item : dailyList) {
		            // DAYOFWEEK() 결과값: 일요일=1, 월요일=2, ...
		            int dayOfWeek = ((Number) item.get("day_of_week")).intValue();
		            int count = ((Number) item.get("count")).intValue();
		            dailyStats.put(days[dayOfWeek - 1], count);
		        }
		        userData.setDaily_attendance_stats(dailyStats);
	
		        // 5. 월별 통계 데이터 가공 (DB -> Map, 올해 기준)
		        List<Map<String, Object>> monthlyList = attendanceMapper.selectMonthlyStats(userId);
		        Map<String, Integer> monthlyStats = new HashMap<>();
		        for (int i = 1; i <= 12; i++) {
		            monthlyStats.put(String.valueOf(i), 0); // 1월부터 12월까지 0으로 초기화
		        }
		        
		        for (Map<String, Object> item : monthlyList) {
		            int month = ((Number) item.get("month")).intValue();
		            int count = ((Number) item.get("count")).intValue();
		            monthlyStats.put(String.valueOf(month), count);
		        }
		        userData.setMonthly_attendance_stats(monthlyStats);
		        
		        // 6. 연속 월간 출석일 수 조회
		        userData.setConsecutive_monthly_attendance(attendanceMapper.selectConsecutiveMonthlyAttendance(userId));
		        
		        return userData;
		    }
		
		// 로그인 시 호출될 자동 출석 체크 메소드
		@Transactional(rollbackFor = Exception.class)
		public void performAttendanceCheck(String userId) {
	
			UserVO user = attendanceMapper.selectUserAttendance(userId);
			LocalDate today = LocalDate.now();
			
			// --- 1. 오늘 이미 출석했는지 확인 ---
			if (user.getAttendance_last() != null) {
				// 밀리초가 있든 없든 안전하게 파싱할 수 있는 포맷터를 사용
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss[.S]");
				LocalDateTime lastAttendanceDateTime = LocalDateTime.parse(user.getAttendance_last(), formatter);
	
				// 마지막 출석일의 '날짜'가 오늘과 같다면, 이미 출석한 것이므로 즉시 종료
				if (lastAttendanceDateTime.toLocalDate().isEqual(today)) {
					return;
				}
			}
	
			// --- 2. 출석 정보 업데이트 로직 (첫 출석과 연속 출석을 한번에 처리) ---
	
			// DB의 default 값이 1이므로, 첫 로그인 시 attendance_count는 이미 1입니다.
			// 따라서 첫 로그인이 아닌 경우에만 count를 증가시킵니다.
			if (user.getAttendance_last() != null) {
				user.setAttendance_count(user.getAttendance_count() + 1);
			}
	
			// 연속 출석일 계산
			if (user.getAttendance_last() != null) {
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss[.S]");
				LocalDateTime lastAttendanceDateTime = LocalDateTime.parse(user.getAttendance_last(), formatter);
	
				if (lastAttendanceDateTime.toLocalDate().isEqual(today.minusDays(1))) {
					// 연속 출석인 경우
					user.setAttendance_consecutive(user.getAttendance_consecutive() + 1);
				} else {
					// 연속이 끊긴 경우 (오늘이 첫 출석이 아니면서)
					user.setAttendance_consecutive(1);
				}
			} else {
				// 이 로직은 DB default 값 때문에 사실상 실행되지 않지만,
				// 만약을 대비해 둡니다. (가입 후 첫 로그인 시)
				user.setAttendance_consecutive(1);
			}
			
			user.setUser_id(userId);
	
			int updateCount = attendanceMapper.updateUserAttendance(user);
	
			if (updateCount == 0) {
				throw new RuntimeException("출석 정보 업데이트에 실패했습니다.");
			}
			
			// --- 4. attendance_history 테이블에 오늘 출석 기록 추가 (중복 방지 포함) ---
			
			// 먼저 오늘 날짜의 기록이 이미 있는지 확인
			int historyCount = attendanceMapper.selectTodayAttendanceHistory(userId);
			
			// 기록이 없을 때만 INSERT 수행
			if (historyCount == 0) {
				int insertCount = attendanceMapper.insertAttendanceHistory(userId);
				
				if(insertCount == 0) {
					throw new RuntimeException("출석 히스토리 기록에 실패했습니다.");
				}
			}
		}
	}