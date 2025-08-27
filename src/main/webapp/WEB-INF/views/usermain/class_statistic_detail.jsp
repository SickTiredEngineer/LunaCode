<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
						<p><fmt:formatNumber value="${summary.monthlyRevenue}" pattern="#,###" />원</p>
					</div>
					<div class="card">
						<h3>전체 강의 수익</h3>
						<p><fmt:formatNumber value="${summary.totalRevenue}" pattern="#,###" />원</p>
					</div>
					<div class="card">
						<h3>신규 수강생 수</h3>
						<p><fmt:formatNumber value="${summary.newStudentCount}" pattern="#,###" />명</p>
					</div>
					<div class="card">
						<h3>전체 수강생 수</h3>
						<p><fmt:formatNumber value="${summary.totalStudentCount}" pattern="#,###" />명</p>
					</div>
				</section>

				<!-- 2. 차트 그리드 섹션 -->
				<section class="chart-grid">

					<!-- 월별 신규 수강생 수 -->
					<div class="widget">
						<h3 class="widget-title">월별 신규 수강생 수</h3>
						<div class="widget-content">
							<div class="chart">
								<div class="chart">
									<canvas id="studentChart"></canvas>
								</div>
							</div>
						</div>
					</div>

					<!-- 강의의 월별 수익 -->
					<div class="widget">
						<h3 class="widget-title">강의의 월별 수익</h3>
						<div class="widget-content">
							<div class="monthly-area-chart">
								<canvas id="revenueChart"></canvas>
							</div>
						</div>
					</div>

				</section>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		
		<script>
		    const revenueData = ${revenueDataJson};
		    const studentCountData = ${studentCountDataJson};
		</script>
		
		<script src="${pageContext.request.contextPath}/resources/js/usermain/class_statistic_detail.js"></script>
	</body>
</html>
