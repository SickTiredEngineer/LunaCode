<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>ClassStatistic</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/class_statistic.css" rel="stylesheet">  
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
					<a href="ClassRegist" class="common-category-element">강의 등록</a>
					<a href="MyClass" class="common-category-element">내 강의</a>
					<a href="PlayList" class="common-category-element">재생목록</a>
					<a href="Attendance" class="common-category-element">출석</a>
					<a href="ClassStatistic" class="common-category-element">강사 대시보드</a>
				</aside>

				<%-- 강사 대시보드 메인 콘텐츠 --%>
				<section class="dashboard-container">
					<div class="dashboard-header">
						<h2 class="dashboard-title">강사 대시보드</h2>
					</div>

					<div class="dashboard-grid">

						<!-- 1. 수익 통계 (Area Chart) -->
						<div class="widget">
							<div class="widget-header">
								<h3>수익 통계</h3>
								<a href="#">&gt;</a>
							</div>
							<div class="widget-content">
								<div class="monthly-area-chart">
									<svg width="100%" height="100%" viewBox="0 0 300 125" preserveAspectRatio="none">
										<defs>
											<linearGradient id="areaGradient" x1="0" y1="0" x2="0" y2="1">
												<stop offset="0%" stop-color="#5E87C9" stop-opacity="0.4"/>
												<stop offset="100%" stop-color="#F0F5FF" stop-opacity="0.1"/>
											</linearGradient>
										</defs>
										<path d="M0,80 L25,50 L50,90 L75,75 L100,60 L125,85 L150,70 L175,40 L200,80 L225,95 L250,65 L275,100 L300,85 L300,125 L0,125 Z" fill="url(#areaGradient)"/>
										<path d="M0,80 L25,50 L50,90 L75,75 L100,60 L125,85 L150,70 L175,40 L200,80 L225,95 L250,65 L275,100 L300,85" fill="none" stroke="#5E87C9" stroke-width="2"/>
									</svg>
								</div>
							</div>
						</div>

						<!-- 2. 신규 수강생 -->
						<div class="widget">
							<div class="widget-header">
								<h3>신규 수강생</h3>
								<a href="#">&gt;</a>
							</div>
							<div class="widget-content">
								<ul class="item-list">
									<li><span class="icon">👤</span><span>홍길동님이 수강을 신청했습니다</span></li>
									<li><span class="icon">👤</span><span>이몽룡님이 수강을 신청했습니다</span></li>
									<li><span class="icon">👤</span><span>성춘향님이 수강을 신청했습니다</span></li>
									<li><span class="icon">👤</span><span>변사또님이 수강을 신청했습니다</span></li>
									<li><span class="icon">👤</span><span>누군가님이 수강을 신청했습니다</span></li>
									<li><span class="icon">👤</span><span>누군가님이 수강을 신청했습니다</span></li>
									<li><span class="icon">👤</span><span>누군가님이 수강을 신청했습니다</span></li>
									<li><span class="icon">👤</span><span>누군가님이 수강을 신청했습니다</span></li>
									<li><span class="icon">👤</span><span>누군가님이 수강을 신청했습니다</span></li>
								</ul>
							</div>
						</div>

						<!-- 3. 수강생 질문/댓글 -->
						<div class="widget">
							<div class="widget-header">
								<h3>수강생 질문/댓글</h3>
								<a href="#">&gt;</a>
							</div>
							<div class="widget-content">
								<ul class="item-list">
									<li><span class="icon">💬</span><span>강사님 질문 있습니다!</span></li>
									<li><span class="icon">💬</span><span>이 강의에 파이썬에 대한 내용도 있나요?</span></li>
									<li><span class="icon">💬</span><span>이 부분은 일부러 수정 안하신건가요?</span></li>
									<li><span class="icon">💬</span><span>질문 있어요</span></li>
									<li><span class="icon">💬</span><span>질문 있어요</span></li>
									<li><span class="icon">💬</span><span>질문 있어요</span></li>
									<li><span class="icon">💬</span><span>질문 있어요</span></li>
								</ul>
							</div>
						</div>

						<!-- 4. 강의 별 조회수 (Bar Chart) -->
						<div class="widget">
							<div class="widget-header">
								<h3>강의 별 조회수</h3>
								<a href="ClassStatisticDetail">&gt;</a>
							</div>
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

					</div>
				</section>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
	</body>
</html>

