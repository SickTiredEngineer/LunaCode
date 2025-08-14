<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
	<head>
		<title>MyClass - 학습 완료</title>
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
					<a href="UserMain" class="common-category-element">홈</a>
					<a href="MyClass" class="common-category-element active">내 강의</a>
					<a href="PlayList" class="common-category-element">재생목록</a>
					<a href="Attendance" class="common-category-element">출석</a>
				</aside>
				
				<section class="myclass-container">
					<div class="myclass-header">
						<h2 class="myclass-title">내 강의</h2>
					</div>
					
					<%-- 학습 중 / 학습 완료 탭 메뉴 --%>
					<nav class="content-tabs">
						<a href="MyClass" class="tab-item">학습 중</a>
						<a href="MyClass2" class="tab-item active">학습 완료</a>
					</nav>
					
					<%-- 강의 목록 (JavaScript가 동적으로 채울 영역) --%>
					<ul class="course-list">
						<!-- 이 곳의 내용은 my_class2.js가 동적으로 생성합니다. -->
					</ul>
				</section>
			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>

        <%-- 공통 데이터 스크립트를 먼저 로드 --%>
        <script src="${pageContext.request.contextPath}/resources/js/usermain/course_data.js"></script>
        <%-- 그 다음, 이 페이지의 동작을 담당하는 스크립트를 로드 --%>
        <script src="${pageContext.request.contextPath}/resources/js/usermain/my_class2.js"></script>
	</body>
</html>