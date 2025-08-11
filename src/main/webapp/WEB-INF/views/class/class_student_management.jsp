<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>ClassStudentManagement</title>
	<jsp:include page="/WEB-INF/views/inc/common_head.jsp" />
	<link href="${pageContext.request.contextPath}/resources/css/page/class/class_student_management.css" rel="stylesheet" />
</head>
<body>
	<div class="page-base container">

		<!-- 헤더 -->
		<header>
			<jsp:include page="/WEB-INF/views/inc/header.jsp" />
		</header>
		
		<article>
			<%-- 페이지 제목 --%>
			<div class="title-layout">
				<h2 class="page-main-title">Java 기초</h2>
			</div>

			<div class="main-wrapper">
			
				<%-- 좌측 공통 카테고리 (content-layout 밖으로 이동) --%>
				<aside class="common-category">
					<a href="CourseRegistration" class="common-category-element">강의 등록</a>
					<a href="#" class="common-category-element">커리큘럼</a>
					<a href="ClassStudentManagement" class="common-category-element">학생 관리</a>
				</aside>
				
				<%-- 메인 콘텐츠 레이아웃 --%>
				<div class="content-layout">
				
					<%-- 상단 컨트롤 영역 ("전체보기", "강의 등록") --%>
					<div class="top-controls">
						<a href="#" class="view-all-link">
							<span class="dot"></span> 전체보기
						</a>
						<div class="register-action">
							<a href="#" class="positive-button long-button">코딩</a>
						</div>
					</div>
				
					<%-- 하단 목록 영역 --%>
					<div class="list-section">
						<%-- 강의 리스트 --%>
						<ul class="lecture-list">
							<li class="lecture-item">
								<span class="lecture-title">1. 홍길동</span>
								<div class="item-actions">
									<a href="#" class="positive-button">자세히</a>
								</div>
							</li>
							<li class="lecture-item">
								<span class="lecture-title">2. 이순신</span>
								<div class="item-actions">
									<a href="#" class="positive-button">자세히</a>
								</div>
							</li>
							<li class="lecture-item">
								<span class="lecture-title">3. 세종대왕</span>
								<div class="item-actions">
									<a href="#" class="positive-button">자세히</a>
								</div>
							</li>
						</ul>

						<%-- 오른쪽 카테고리 태그 --%>
						<aside class="category-tags">
							<div class="pointer-wrapper">
								<div class="pointer"></div>
							</div>
							<span class="dot"></span>
							<a href="#" class="positive-button tag active">코딩</a>
							<a href="#" class="negative-button tag">게임</a>
							<a href="#" class="negative-button tag">머신러닝</a>
						</aside>
					</div>
				
				</div>
				
			</div>
		</article>

		<!-- 푸터 -->
		<footer>
			<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
		</footer>
		
	</div>
</body>
</html>
