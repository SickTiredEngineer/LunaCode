<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>CourseRegistration</title>
	<jsp:include page="/WEB-INF/views/inc/common_head.jsp" />
	<link href="${pageContext.request.contextPath}/resources/css/page/class/course_registration.css" rel="stylesheet" />
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
				<h2 class="page-main-title">강의 목록</h2>
			</div>

			<div class="main-wrapper">
			
				<%-- 좌측 공통 카테고리 (content-layout 밖으로 이동) --%>
				<aside class="common-category">
					<a href="ClassRegist" class="common-category-element">강의 등록</a>
					<a href="Curriculum" class="common-category-element">커리큘럼</a>
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
							<a href="#" class="positive-button long-button">강의 등록</a>
						</div>
					</div>
				
					<%-- 하단 목록 영역 --%>
					<div class="list-section">
						<%-- 강의 리스트 --%>
						<ul class="lecture-list">
							<li class="lecture-item">
								<span class="lecture-title">1. JAVA 기초</span>
								<div class="item-actions">
									<a href="#" class="negative-button">삭제</a>
									<a href="#" class="positive-button">수정</a>
								</div>
							</li>
							<li class="lecture-item">
								<span class="lecture-title">2. 코딩 잘하자?</span>
								<div class="item-actions">
									<a href="#" class="negative-button">삭제</a>
									<a href="#" class="positive-button">수정</a>
								</div>
							</li>
							<li class="lecture-item">
								<span class="lecture-title">3. 어어어어어어ㅓ</span>
								<div class="item-actions">
									<a href="#" class="negative-button">삭제</a>
									<a href="#" class="positive-button">수정</a>
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
