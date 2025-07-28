<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>루나코드 회원가입</title>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath }/resources/css/layout/carousel_main_banner.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/base.css" rel="stylesheet">		
		
		<!-- 회원강입 전용 css -->
		<link href="${pageContext.request.contextPath }/resources/css/layout/member_join.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

		
			<article>
				
				<div class="d-flex flex-row align-items-center justify-content-center member-base-layout">
					
					<!-- 일반 회원 가입 버튼 -->
					<a href="#" class="text-decoration-none">
						<div class="d-flex flex-column align-items-center member-choice-bt">
							<img class="member-icon-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_normal_member.png">
							<p class="member-font">일반 회원</p>	
						</div>
					</a>
					
					<!-- 강사 회원 가입 버튼 -->
					<a href="#" class="text-decoration-none">
						<div class="d-flex flex-column align-items-center member-choice-bt">
							<img class="member-icon-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_instructor_member.png">
							<p class="member-font">강사 회원</p>	
						</div>
					</a>

<!-- 					<div class="vertical-line"></div> -->
				
				</div>		
			
			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
	
</html>
