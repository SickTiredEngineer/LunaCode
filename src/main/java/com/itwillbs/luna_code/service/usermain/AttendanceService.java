package com.itwillbs.luna_code.service.usermain;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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

		int updateCount = attendanceMapper.updateUserAttendance(user);

		if (updateCount == 0) {
			throw new RuntimeException("출석 정보 업데이트에 실패했습니다.");
		}
	}
}
