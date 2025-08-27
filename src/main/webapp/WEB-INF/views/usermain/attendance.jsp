<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
	<head>
		<title>Attendance</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/attendance.css" rel="stylesheet">  
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain_category.css" rel="stylesheet">    
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		
	</head>
	
	<body>
		<div class="page-base container">
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article class="content-layout">
				<%-- 좌측 공통 카테고리 --%>
				<jsp:include page="/WEB-INF/views/usermain/usermain_category.jsp"/>

				<section class="attendance-container">
					<div class="attendance-header">
						<h2 class="attendance-title">출석</h2>
					</div>
					<div class="content-body">
						<!-- 좌측 출석 현황 -->
						<section class="streak-section">
							<div class="streak-card">
								<h3>전체 출석</h3>
								<div class="streak-circle">${attendanceInfo.attendance_count}일</div>
							</div>
							<div class="streak-card">
								<h3>연속 출석</h3>
								<div class="streak-circle">${attendanceInfo.attendance_consecutive}일차</div>
							</div>
							<div class="streak-card">
								<h3>월간 출석</h3>
								<div class="streak-circle">${attendanceInfo.consecutive_monthly_attendance}달 연속</div>
							</div>
						</section>

						<!-- 우측 통계 -->
						<section class="stats-section">
							<!-- 주간 출석률 -->
							<div class="chart-container">
								<h4>주간 출석률</h4>
								<div class="chart">
									<canvas id="dailyAttendanceChart"></canvas>
								</div>
							</div>

							<!-- 결석일 수 -->
							<div class="stat-item">
								<h4>결석일 수</h4>
								<p>${attendanceInfo.recent_absences}
							        <span>/30 
							            (<fmt:formatNumber value="${attendanceInfo.recent_absences / 30 * 100}" pattern="0.0" />%)
							        </span>
							    </p>
							</div>

							<!-- 월별 출석률 -->
							<div class="chart-container">
								<h4 class="myclass-title">월별 출석률</h4>
								<div class="monthly-area-chart">
									<canvas id="monthlyAttendanceChart"></canvas>
								</div>
							</div>

							<!-- 최대 출석일 수 -->
							<div class="stat-item max-attendance">
								<h4>최대 출석일 수</h4>
								<p>${attendanceInfo.max_attendance_consecutive}
									<span>일째</span>
								</p>
							</div>
						</section>
					</div>
				</section>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
		
		<script src="${pageContext.request.contextPath}/resources/js/usermain/attendance.js"></script>
		
		<script>
			const dailyDataFromServer = [
		        ${attendanceInfo.daily_attendance_stats['MON']}, ${attendanceInfo.daily_attendance_stats['TUE']},
		        ${attendanceInfo.daily_attendance_stats['WED']}, ${attendanceInfo.daily_attendance_stats['THU']},
		        ${attendanceInfo.daily_attendance_stats['FRI']}, ${attendanceInfo.daily_attendance_stats['SAT']},
		        ${attendanceInfo.daily_attendance_stats['SUN']}
		    ];
		    
		    const maxDailyCount = Math.max(...dailyDataFromServer);
	
		    let dailyChartMaxY = 5;
		    if (maxDailyCount > 0) {
		        dailyChartMaxY = maxDailyCount / 0.75;
		    }
		    
		    const minHeightValue = dailyChartMaxY * 0.10;
	
		    const dailyDataForChart = dailyDataFromServer.map(count => {
		        return count === 0 ? minHeightValue : count;
		    });
	
		    const monthlyDataFromServer = [
		        ${attendanceInfo.monthly_attendance_stats['1']}, ${attendanceInfo.monthly_attendance_stats['2']},
		        ${attendanceInfo.monthly_attendance_stats['3']}, ${attendanceInfo.monthly_attendance_stats['4']},
		        ${attendanceInfo.monthly_attendance_stats['5']}, ${attendanceInfo.monthly_attendance_stats['6']},
		        ${attendanceInfo.monthly_attendance_stats['7']}, ${attendanceInfo.monthly_attendance_stats['8']},
		        ${attendanceInfo.monthly_attendance_stats['9']}, ${attendanceInfo.monthly_attendance_stats['10']},
		        ${attendanceInfo.monthly_attendance_stats['11']}, ${attendanceInfo.monthly_attendance_stats['12']}
		    ];
	
		    document.addEventListener("DOMContentLoaded", function() {
		        initAttendanceCharts(dailyDataForChart, monthlyDataFromServer, dailyChartMaxY);
		    });
		</script>
		
	</body>
</html>
