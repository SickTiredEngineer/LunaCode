<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
	<head>
		<title>MyClass - 학습 중</title>
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
				<jsp:include page="/WEB-INF/views/usermain/usermain_category.jsp"/>
				
				<section class="myclass-container">
					<div class="myclass-header">
						<h2 class="myclass-title">내 강의</h2>
					</div>
					
					<%-- 학습 중 / 학습 완료 탭 메뉴 --%>
					<nav class="content-tabs">
						<a href="MyClass" class="tab-item active">학습 중</a>
						<a href="MyClass2" class="tab-item">학습 완료</a>
					</nav>
					
					<%-- 강의 목록 (JavaScript가 동적으로 채울 영역) --%>
					<ul class="course-list">
					</ul>
				</section>
			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
		
        <script src="${pageContext.request.contextPath}/resources/js/usermain/my_class.js"></script>
	</body>
</html>