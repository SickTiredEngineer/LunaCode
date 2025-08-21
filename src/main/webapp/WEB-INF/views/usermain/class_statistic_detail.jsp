<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>ClassStatisticDetail</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/class_statistic_detail.css" rel="stylesheet">  
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain_category.css" rel="stylesheet">    
	</head>
	
	<body>
		<div class="page-base container">
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article class="statistic-dashboard">

				<!-- 1. 요약 카드 섹션 -->
				<section class="summary-cards">
					<div class="card">
						<h3>월간 강의 수익</h3>
						<p>100,000원</p>
					</div>
					<div class="card">
						<h3>전체 강의 수익</h3>
						<p>100,000,000원</p>
					</div>
					<div class="card">
						<h3>신규 수강생 수</h3>
						<p>100명</p>
					</div>
					<div class="card">
						<h3>전체 수강생 수</h3>
						<p>1000명</p>
					</div>
					<div class="card">
						<h3>전체 강의 조회 수</h3>
						<p>1000회</p>
					</div>
				</section>

				<!-- 2. 차트 그리드 섹션 -->
				<section class="chart-grid">

					<!-- 월별 신규 수강생 수 -->
					<div class="widget">
						<h3 class="widget-title">월별 신규 수강생 수</h3>
						<div class="widget-content">
							<div class="chart">
								<div class="bar-container"><div class="bar" style="height: 50%;"></div><span>1월</span></div>
								<div class="bar-container"><div class="bar" style="height: 80%;"></div><span>2월</span></div>
								<div class="bar-container"><div class="bar" style="height: 25%;"></div><span>3월</span></div>
								<div class="bar-container"><div class="bar" style="height: 40%;"></div><span>4월</span></div>
								<div class="bar-container"><div class="bar" style="height: 60%;"></div><span>5월</span></div>
								<div class="bar-container"><div class="bar" style="height: 30%;"></div><span>6월</span></div>
								<div class="bar-container"><div class="bar" style="height: 55%;"></div><span>7월</span></div>
								<div class="bar-container"><div class="bar" style="height: 20%;"></div><span>8월</span></div>
								<div class="bar-container"><div class="bar" style="height: 10%;"></div><span>9월</span></div>
								<div class="bar-container"><div class="bar" style="height: 15%;"></div><span>10월</span></div>
								<div class="bar-container"><div class="bar" style="height: 25%;"></div><span>11월</span></div>
								<div class="bar-container"><div class="bar" style="height: 40%;"></div><span>12월</span></div>
							</div>
						</div>
					</div>

					<!-- 강의별 조회수 -->
					<div class="widget">
						<h3 class="widget-title">강의별 조회수</h3>
						<div class="widget-content">
							<div class="chart">
								<div class="bar-container"><div class="bar" style="height: 90%;"></div><span>강의1</span></div>
								<div class="bar-container"><div class="bar" style="height: 30%;"></div><span>강의2</span></div>
								<div class="bar-container"><div class="bar" style="height: 40%;"></div><span>강의3</span></div>
								<div class="bar-container"><div class="bar" style="height: 60%;"></div><span>강의4</span></div>
								<div class="bar-container"><div class="bar" style="height: 10%;"></div><span>강의5</span></div>
								<div class="bar-container"><div class="bar" style="height: 45%;"></div><span>강의6</span></div>
								<div class="bar-container"><div class="bar" style="height: 65%;"></div><span>강의7</span></div>
							</div>
						</div>
					</div>

					<!-- 주간 활동 -->
					<div class="widget">
						<h3 class="widget-title">주간 활동</h3>
						<div class="widget-content">
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
					</div>

					<!-- 강의의 월별 수익 -->
					<div class="widget">
						<h3 class="widget-title">강의의 월별 수익</h3>
						<div class="widget-content">
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
								</svg>
							</div>
						</div>
					</div>

				</section>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
	</body>
</html>
