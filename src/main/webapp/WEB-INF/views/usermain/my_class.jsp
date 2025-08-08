<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
	<head>
		<title>MyClass</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/my_class.css" rel="stylesheet">  
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
					<a href="#" class="common-category-element">커뮤니티 활동</a>
				</aside>
				
				<section class="myclass-container">
					<div class="myclass-header">
						<h2 class="myclass-title">내 강의</h2>
					</div>
					
					<%-- 학습 중 / 학습 완료 탭 메뉴 --%>
					<nav class="content-tabs">
						<a href="MyClass" class="tab-item active">학습 중</a>
						<a href="MyClass2" class="tab-item ">학습 완료</a>
					</nav>
					
					<%-- 강의 목록 --%>
					<ul class="course-list">
						<li class="course-item">
							<a href="MyClassDetail">
								<div class="play-icon">▶</div>
								<div class="course-details">
									<h3 class="course-title">오늘도 배운다! 자바 핵심만 쏙쏙 배우는 명강의 100선</h3>
									<p class="course-progress-text">8 / 10회차 (80%)</p>
									<div class="progress" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
										<div class="progress-bar" style="width: 80%;"></div>
									</div>
								</div>
							</a>
						</li>
						<li class="course-item">
							<div class="play-icon">▶</div>
							<div class="course-details">
								<h3 class="course-title">너도 할 수 있다! 스프링 기초</h3>
								<p class="course-progress-text">3 / 10회차 (30%)</p>
								<div class="progress" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
									<div class="progress-bar" style="width: 30%;"></div>
								</div>
							</div>
						</li>
						<li class="course-item">
							<div class="play-icon">▶</div>
							<div class="course-details">
								<h3 class="course-title">오늘도 배운다! 자바 핵심만 쏙쏙 배우는 명강의 100선</h3>
								<p class="course-progress-text">5 / 10회차 (50%)</p>
								<div class="progress" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
									<div class="progress-bar" style="width: 50%;"></div>
								</div>
							</div>
						</li>
					</ul>
				</section>
			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
	</body>
</html>
