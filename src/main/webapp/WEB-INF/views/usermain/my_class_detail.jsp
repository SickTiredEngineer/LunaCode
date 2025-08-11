<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
	<head>
		<title>MyClassDetail</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/my_class_detail.css" rel="stylesheet">  
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

				<section class="course-detail-container">
					<!-- 페이지 상단 (제목 + 정렬 버튼) -->
					<div class="course-detail-header">
						<h2 class="main-title">오늘도 배운다! 자바 핵심만 쏙쏙 배우는 명강의 100선</h2>
						<button class="positive-button">최신 수강순 ▼</button>
					</div>

					<!-- 강의 섹션 목록 -->
					<ul class="section-list">
					
						<!-- 섹션 1: 'open' 클래스가 있어 기본적으로 열려있는 상태 -->
						<li class="section-item open">
							
							<!-- 섹션 제목/진행률 헤더 -->
							<div class="section-header">
								<span class="section-title">
									<span class="arrow-icon">▼</span>
									백엔드 개발 개요와 개발 환경 설정
								</span>
								<span class="section-progress">진행률 : 25% <b>4개</b></span>
							</div>
					
							<!-- 개별 강의 목록 (아이템이 4개라 스크롤바가 보임) -->
							<ul class="lecture-list">
								<li class="lecture-item">
									<a href="#">
										<span class="lecture-info">
											<span class="play-icon">▶</span>
											<span class="lecture-title">프롤로그</span>
										</span>
										<span class="lecture-duration">
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png">
											7 : 28
										</span>
									</a>
								</li>
								<li class="lecture-item">
									<a href="#">
										<span class="lecture-info">
											<span class="play-icon">▶</span>
											<span class="lecture-title">개요</span>
										</span>
										<span class="lecture-duration">
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png">
											9 : 02
										</span>
									</a>
								</li>
								<li class="lecture-item">
									<a href="#">
										<span class="lecture-info">
											<span class="play-icon">▶</span>
											<span class="lecture-title">환경 설정</span>
										</span>
										<span class="lecture-duration">
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png">
											7 : 00
										</span>
									</a>
								</li>
								<li class="lecture-item">
									<a href="#">
										<span class="lecture-info">
											<span class="play-icon">▶</span>
											<span class="lecture-title">첫 프로젝트 생성하기</span>
										</span>
										<span class="lecture-duration">
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png">
											11 : 45
										</span>
									</a>
								</li>
							</ul>
						</li>
					
						<!-- 섹션 2: 'open' 클래스가 없어 기본적으로 닫혀있는 상태 -->
						<li class="section-item">
							<div class="section-header">
								<span class="section-title">
									<span class="arrow-icon">▼</span>
									Java 문법 기초와 객체지향 이해
								</span>
								<span class="section-progress">진행률 : 0% <b>7개</b></span>
							</div>
							<!-- 이 섹션의 강의 목록은 CSS에 의해 숨겨져 있습니다. -->
							<ul class="lecture-list">
								<!-- 여기에 강의 아이템들이 들어갑니다. -->
							</ul>
						</li>
					
					</ul>
				</section>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
	</body>
	
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const sectionHeaders = document.querySelectorAll('.section-header');
			
			sectionHeaders.forEach(function(header) {
				header.addEventListener('click', function() {
					const sectionItem = header.closest('.section-item');
					sectionItem.classList.toggle('open');
				});
			});
		});
	</script>
	
</html>