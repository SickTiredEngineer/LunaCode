<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>PlayListPlus</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/play_list_plus.css" rel="stylesheet">  
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
				
				<%-- 메인 콘텐츠 영역 --%>
				<section class="playlist-container">
				
					<%-- 상단 헤더 (제목 + 편집 버튼) --%>
					<div class="playlist-header">
						<h2 class="playlist-title">재생목록1</h2>
						<div class="header-buttons">
							<button type="button" class="negative-button" onclick="history.back()">이전</button>
							<button type="button" class="positive-button">편집</button>
						</div>
					</div>
					
					<%-- 폴더 그리드 --%>
					<ul class="playlist-grid">
						<%-- 새로 만들기 폴더 (특별한 스타일) --%>
						<li class="playlist-item add-new">
							<a href="#">
								<div class="add-icon">+</div>
							</a>
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
