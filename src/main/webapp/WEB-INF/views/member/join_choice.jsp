<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>루나코드 회원가입</title>
		<meta charset="UTF-8">
		
		<link href="${pageContext.request.contextPath}/resources/css/common/css_variables.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/base.css" rel="stylesheet">		
		<link href="${pageContext.request.contextPath }/resources/css/page/member/member_choice.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

		
			<article>
				
				<div class="d-flex flex-row align-items-center justify-content-center member-base-layout">
					
					<!-- 일반 회원 가입 버튼 -->
					<a href="TermsOfMembership" class="text-decoration-none">
						<div class="d-flex flex-column align-items-center member-choice-bt">
							<img class="member-icon-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_normal_member.png">
							<p class="member-font">일반 회원</p>	
						</div>
					</a>
					
					<!-- 강사 회원 가입 버튼 -->
					<a href="TermsOfMembership" class="text-decoration-none">
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
