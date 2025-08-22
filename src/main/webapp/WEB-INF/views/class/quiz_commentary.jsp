<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>QuizCommentary</title>
	<jsp:include page="/WEB-INF/views/inc/common_head.jsp" />
	<link href="${pageContext.request.contextPath}/resources/css/page/class/quiz_commentary.css" rel="stylesheet" />
</head>
<body>
	<div class="page-base container">

		<!-- 헤더 -->
		<header>
			<jsp:include page="/WEB-INF/views/inc/header.jsp" />
		</header>
		
		<%-- 메인 콘텐츠 --%>
		<article class="course-content">
			<div class="course-card">
				<h3 class="section-main-title">섹션 2</h3>

				<%-- 아코디언 섹션 1 --%>
				<div class="accordion-section">
					<div class="section-header">
						<div class="section-title-area">
							<span class="toggle-arrow"></span>
							<div>
								<h4 class="section-title">1. 이론</h4>
								<span class="lecture-type">
									<i class="icon-video"></i> 강의 영상
								</span>
							</div>
						</div>
						<div class="section-progress">
							진행률 : 0%
						</div>
					</div>
					<div class="section-content">
						<div class="content-wrapper">
							<%-- 퀴즈 항목 --%>
							<div class="content-item quiz-item">
								<div class="item-title-area">
									<span class="quiz-icon">Q</span>
									<p class="item-title">트랜잭션이 올바르게 처리되고 있는지 데이터를 감시하고 제어하는 미들 웨어는?</p>
								</div>
								<div class="item-action-area">
									<span class="item-progress">진행률 : 0%</span>
									<a href="#" class="positive-button">해설 보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<%-- 아코디언 섹션 2 --%>
				<div class="accordion-section">
					<div class="section-header">
						<div class="section-title-area">
							<span class="toggle-arrow"></span>
							<div>
								<h4 class="section-title">2. 실습</h4>
								<span class="lecture-type">
									<i class="icon-video"></i> 강의 영상
								</span>
							</div>
						</div>
						<div class="section-progress">
							진행률 : 0%
						</div>
					</div>
					<div class="section-content">
						<div class="content-wrapper">
							<%-- 퀴즈 항목 --%>
							<div class="content-item quiz-item">
								<div class="item-title-area">
									<span class="quiz-icon">Q</span>
									<p class="item-title">트랜잭션이 올바르게 처리되고 있는지 데이터를 감시하고 제어하는 미들 웨어는?</p>
								</div>
								<div class="item-action-area">
									<span class="item-progress">진행률 : 0%</span>
									<a href="#" class="positive-button">해설 보기</a>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
		</article>

		<!-- 푸터 -->
		<footer>
			<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
		</footer>
		
		<script src="${pageContext.request.contextPath}/resources/js/class/quiz_commentary.js"></script>
		
	</div>
</body>
</html>
