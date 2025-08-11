<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
	<head>
		<title>Attendance</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/attendance.css" rel="stylesheet">  
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain_category.css" rel="stylesheet">    
	</head>

	<body>
		<div class="page-base container">
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article class="content-layout">
				<%-- 좌측 공통 카테고리 --%>
				<aside class="common-category">
					<a href="UserMain" class="common-category-element active">홈</a>
					<a href="MyClass" class="common-category-element">내 강의</a>
					<a href="PlayList" class="common-category-element">재생목록</a>
					<a href="Attendance" class="common-category-element">출석</a>
				</aside>

				<section class="attendance-container">
					<div class="attendance-header">
						<h2 class="attendance-title">출석</h2>
					</div>
					<div class="content-body">
						<!-- 좌측 출석 현황 -->
						<section class="streak-section">
							<div class="streak-card">
								<h3>연속 출석</h3>
								<div class="streak-circle">5일차</div>
							</div>
							<div class="streak-card">
								<h3>주간 출석</h3>
								<div class="streak-circle">12주 연속</div>
							</div>
							<div class="streak-card">
								<h3>월간 출석</h3>
								<div class="streak-circle">6달 연속</div>
							</div>
						</section>

						<!-- 우측 통계 -->
						<section class="stats-section">
							<!-- 일간 출석률 -->
							<div class="chart-container">
								<h4>일간 출석률</h4>
								<div class="chart">
									<div class="bar-container"><div class="bar" style="height: 50%;"></div><span>월</span></div>
									<div class="bar-container"><div class="bar" style="height: 10%;"></div><span>화</span></div>
									<div class="bar-container"><div class="bar" style="height: 50%;"></div><span>수</span></div>
									<div class="bar-container"><div class="bar" style="height: 10%;"></div><span>목</span></div>
									<div class="bar-container"><div class="bar" style="height: 50%;"></div><span>금</span></div>
									<div class="bar-container"><div class="bar" style="height: 10%;"></div><span>토</span></div>
									<div class="bar-container"><div class="bar" style="height: 50%;"></div><span>일</span></div>
								</div>
							</div>

							<!-- 결석일 수 -->
							<div class="stat-item">
								<h4>결석일 수</h4>
								<p>0<span>/30 (0%)</span></p>
							</div>

							<!-- 월별 출석률 -->
							<div class="chart-container">
								<h4 class="myclass-title">월별 출석률</h4>
								<div class="monthly-area-chart">
									<svg width="100%" height="100%" viewBox="0 0 300 125" preserveAspectRatio="none">
										<defs>
											<linearGradient id="areaGradient" x1="0" y1="0" x2="0" y2="1">
												<stop offset="0%" stop-color="#4A90E2" stop-opacity="0.4"/>
												<stop offset="100%" stop-color="#F0F5FF" stop-opacity="0.1"/>
											</linearGradient>
										</defs>
										<path d="M0,80 L25,50 L50,90 L75,75 L100,60 L125,85 L150,70 L175,40 L200,80 L225,95 L250,65 L275,100 L300,85 L300,125 L0,125 Z" fill="url(#areaGradient)"/>
										<path d="M0,80 L25,50 L50,90 L75,75 L100,60 L125,85 L150,70 L175,40 L200,80 L225,95 L250,65 L275,100 L300,85" fill="none" stroke="#4A90E2" stroke-width="2"/>
										<line x1="0" y1="124" x2="300" y2="124" stroke="#E0E7F0" stroke-width="1" />
									</svg>
								</div>
							</div>

							<!-- 최대 출석일 수 -->
							<div class="stat-item max-attendance">
								<h4>최대 출석일 수</h4>
								<p>200<span>일째</span></p>
							</div>
						</section>
					</div>
				</section>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
	</body>
</html>
