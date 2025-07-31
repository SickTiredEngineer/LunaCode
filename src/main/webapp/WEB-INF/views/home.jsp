<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>Main</title>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath}/resources/css/common/css_variables.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/layout/carousel_main_banner.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/base.css" rel="stylesheet">	
		<link href="bootstrap.min.css" rel="stylesheet">	
		<link href="${pageContext.request.contextPath}/resources/css/layout/home.css" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
				<!-- 로그인 모달 연결 -->
				<jsp:include page="/WEB-INF/views/member/login_modal.jsp"/>
			</header>

	<!-- 메인 중심 배너(메세지) 영역 -->
	<div class="main-promo-section">
	  <div class="promo-message">
	    <p class="pre-title">루나코드</p>
	    <h1 class="main-title">
			내일을 바꾸는 당신의 첫 번째 클릭
	    </h1>
	    <p class="main-text">
	      모든 IT, 단 하나의 루트에서 시작된다!
	    </p>
	  </div>
	</div>
	
	<div class="scroll-menu">
	  <a href="#" class="scroll-link">IT 자격증</a>
	  <a href="#" class="scroll-link">기초 코딩</a>
	  <a href="#" class="scroll-link">컴퓨터 활용</a>
	  <a href="#" class="scroll-link">게임 개발</a>
	  <a href="#" class="scroll-link">컴퓨터 그래픽</a>
	  <a href="#" class="scroll-link">AI</a>
	  <a href="#" class="scroll-link">컴퓨터 비전</a>
	  <a href="#" class="scroll-link">임베디드</a>
	  <a href="#" class="scroll-link">풀스택</a>
	</div>
	
	
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
		
		</div>
	
	</body>
	
	
</html>


