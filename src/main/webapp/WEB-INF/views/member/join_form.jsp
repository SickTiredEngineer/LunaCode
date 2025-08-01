<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>사용자 정보 입력</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>		
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
						<input type="text" class="input-form-size common-input-form" placeholder="집가고싶당" id="input_id">
						<button class="positive-button" id="bt_check_id">확인</button>
					</div>
					
					<div class="d-flex flex-column justify-content-center span-layout">
						<span class="info-span" id="span_id">●Test Span (1)</span>
					</div>
					
					<div class="horizontal-line"></div>
					<!-- =================================================== -->
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">비밀번호</p>
						<input type="text" class="input-form-size common-input-form" placeholder="" id="input_pass">
					</div>
					
					<div class="d-flex flex-column justify-content-center span-layout">
						<span class="info-span" id="span_pass">●Test Span (2)</span>
					</div>
					
					<div class="horizontal-line"></div>
					<!-- =================================================== -->	
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">비밀번호 확인</p>
						<input type="text" class="input-form-size common-input-form" placeholder="" id="input_pass_check">
					</div>
					
					<div class="d-flex flex-column justify-content-center span-layout">
						<span class="info-span" id="span_pass_check">●Test Span (3)</span>
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
		
		<script src="${pageContext.request.contextPath }/resources/js/member_join/join_form.js"></script>
	
	</body>
	
	
</html>
