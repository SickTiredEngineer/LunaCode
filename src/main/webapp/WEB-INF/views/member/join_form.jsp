<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>사용자 정보 입력</title>
		<meta charset="UTF-8">
		
		<link href="${pageContext.request.contextPath}/resources/css/common/css_variables.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/common/component.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/base.css" rel="stylesheet">		
		<link href="${pageContext.request.contextPath }/resources/css/page/member/join_form.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

		
			<article>
				
				
					
				<form action="JoinForm" method="post" class="d-flex flex-column align-items-center justify-content-center">
				
					
					<h2 class="main-msg">회원 정보 입력</h2>
					<!-- =================================================== -->
					<div class="d-flex flex-row input-form-layout">
						<p class="info-text">아이디</p>
						<input type="text" class="input-form-size common-input-form" placeholder="집가고싶당">
						<button class="positive-button">확인</button>
					</div>
					
					<div class="d-flex flex-column justify-content-center span-layout">
						<span class="info-span">●Test Span (1)</span>
					</div>
					
					<div class="horizontal-line"></div>
					<!-- =================================================== -->
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">비밀번호</p>
						<input type="text" class="input-form-size common-input-form" placeholder="">
					</div>
					
					<div class="d-flex flex-column justify-content-center span-layout">
						<span class="info-span">●Test Span (2)</span>
					</div>
					
					<div class="horizontal-line"></div>
					<!-- =================================================== -->	
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">비밀번호 확인</p>
						<input type="text" class="input-form-size common-input-form" placeholder="">
					</div>
					
					<div class="d-flex flex-column justify-content-center span-layout">
						<span class="info-span">●Test Span (3)</span>
					</div>
					
					<div class="horizontal-line"></div>

					<!-- =================================================== -->

					
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">이름</p>
						<input type="text" class="input-form-size common-input-form" placeholder="">
					</div>

					
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">전화번호</p>
						<input type="text" class="input-form-size common-input-form" placeholder="">
					</div>
					

					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">별명</p>
						<input type="text" class="input-form-size common-input-form" placeholder="">
						<button class="positive-button">확인</button>
					</div>
					
					
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">생년월일</p>
						<input type="text" class="input-form-size common-input-form" placeholder="">
						<i class="bi bi-calendar icon"></i>
					</div>

					
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">이메일</p>
						<input type="text" class="common-input-form input-form-email-size" placeholder="">
						<p class="email-mark">@</p>
						<input type="text" class="common-input-form input-form-email-size" placeholder="">
					</div>
					
					<br>
					<div class="horizontal-line"></div>
					
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">강사자격 첨부</p>
						<input type="text" class="input-form-size common-input-form" placeholder="">
						<button class="positive-button">파일 첨부</button>
					</div>

					<div class="d-flex flex-row justify-content-end input-form-layout-last">
						<button class="negative-button">취소</button>
						<button class="positive-button">가입</button>
						
						
						
						
					</div>

				</form>						

				

			
			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
	
</html>
