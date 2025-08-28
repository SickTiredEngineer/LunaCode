<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
	<head>
		<title>ClassStatistic</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/class_statistic.css" rel="stylesheet">  
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
								<a href="ClassStatisticDetail">&gt;</a>
							</div>
							<div class="widget-content">
								<div class="monthly-area-chart">
									<canvas id="revenueChart"></canvas>
								</div>
							</div>
						</div>

						<!-- 2. 신규 수강생 -->
						<div class="widget new-students">
							<div class="widget-header">
								<h3>신규 수강생</h3>
							</div>
							<div class="widget-content">
								<ul class="item-list">
									<c:forEach var="student" items="${newStudents}">
	                                    <li>
	                                    	<span class="icon">👤</span>
	                                    	<span>${student.user_name}님이 '${student.class_title}' 수강을 시작했습니다.</span>
	                                    </li>
	                                </c:forEach>
	                                <c:if test="${empty newStudents}">
	                                	<p>최근 신규 수강생이 없습니다.</p>
	                                </c:if>
								</ul>
							</div>
						</div>
						
						<!-- 3. 수강생 질문/댓글 -->
						<div class="widget">
							<div class="widget-header">
								<h3>수강생 후기</h3>
							</div>
							<div class="widget-content">
								<ul class="item-list">
									<c:forEach var="review" items="${newReviews}">
						                <li>
						                    <span class="icon">💬</span>
						                    <span>
						                        <strong>${review.user_name}</strong>님이 
						                        '${review.class_title}' 강의에 후기를 남겼습니다: 
						                        <em>"${review.content}"</em>
						                    </span>
						                </li>
						            </c:forEach>
						            <c:if test="${empty newReviews}">
						                <p>최근 수강생 후기가 없습니다.</p>
						            </c:if>
								</ul>
							</div>
						</div>

<!-- 						4. 강의 별 조회수 (Bar Chart) -->
<!-- 						<div class="widget"> -->
<!-- 							<div class="widget-header"> -->
<!-- 								<h3>강의 별 조회수</h3> -->
<!-- 								<a href="ClassStatisticDetail">&gt;</a> -->
<!-- 							</div> -->
<!-- 							<div class="widget-content"> -->
<!-- 								<div class="chart"> -->
<!-- 									<div class="bar-container"><div class="bar" style="height: 90%;"></div><span>강의1</span></div> -->
<!-- 									<div class="bar-container"><div class="bar" style="height: 30%;"></div><span>강의2</span></div> -->
<!-- 									<div class="bar-container"><div class="bar" style="height: 40%;"></div><span>강의3</span></div> -->
<!-- 									<div class="bar-container"><div class="bar" style="height: 60%;"></div><span>강의4</span></div> -->
<!-- 									<div class="bar-container"><div class="bar" style="height: 10%;"></div><span>강의5</span></div> -->
<!-- 									<div class="bar-container"><div class="bar" style="height: 45%;"></div><span>강의6</span></div> -->
<!-- 									<div class="bar-container"><div class="bar" style="height: 65%;"></div><span>강의7</span></div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

					</div>
				</section>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
		
		<script>
        	const revenueData = ${revenueDataJson};
    	</script>
    	
    	<script src="${pageContext.request.contextPath}/resources/js/usermain/class_statistic.js"></script>
		
	</body>
</html>

