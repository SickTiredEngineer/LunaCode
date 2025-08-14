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

				<form action="JoinForm" id="join_form" method="post" class="d-flex flex-column align-items-center justify-content-center">

					<h2 class="main-msg">회원 정보 입력</h2>
					<!-- =================================================== -->
					<div class="d-flex flex-row input-form-layout">
						<p class="info-text">아이디</p>
						<input name="user_id" type="text" class="input-form-size common-input-form" placeholder="" id="input_id">
					</div>
					
					<div class="d-flex flex-column justify-content-center span-layout">
						<span class="info-span" id="span_id">●Test Span (1)</span>
					</div>
					
					<div class="horizontal-line"></div>
					<!-- =================================================== -->
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">비밀번호</p>
						<input type="text" class="input-form-size common-input-form" placeholder="" name="password" id="input_pass">
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
						<input type="text" id="input_name" name="user_name" class="input-form-size common-input-form" placeholder="">
					</div>

					
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">전화번호</p>
						<input type="text" id="input_phone" name="phone" class="input-form-size common-input-form" placeholder="">
					</div>
					

					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">별명</p>
						<input type="text" name="nickname" id="input_nickname" class="input-form-size common-input-form" placeholder="">
					</div>
					
					<div class="d-flex flex-column justify-content-center span-layout">
						<span class="info-span" id="span_nickname">●Test Span (1)</span>
					</div>
					
					<div class="horizontal-line"></div>
					
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">생년월일</p>
						<input type="text" id="input_birth" name="birth" class="input-form-size common-input-form" placeholder="">
						<i class="bi bi-calendar icon"></i>
					</div>

					
					<div class="d-flex flex-row  input-form-layout">
						<p class="info-text">이메일</p>
						<input type="text" class="common-input-form input-form-email-size" placeholder="" name="email1" id="input_email_1">
						<p class="email-mark">@</p>
						<input type="text" class="common-input-form input-form-email-size" placeholder="" name="email2" id="input_email_2">
						
						<select class="email-selector" id="email_selector">
							<option value="">직접 입력</option>
							<option value="naver.com">네이버</option>
							<option value="gmail.com">지메일</option>
							<option value="daum.net">다음</option>
						</select>
						
					</div>
					
					<br>
					<div class="horizontal-line"></div>
					
					<!-- 강사 회원일 경우, 증빙 서류 제출 UI 출력 -->
					<c:if test="${param.type eq 'MB02'}">
						<div class="d-flex flex-row  input-form-layout">
							<p class="info-text">강사자격 첨부</p>
							<input type="text" class="input-form-size common-input-form" placeholder="" readonly="readonly">
							<button class="positive-button">파일 첨부</button>
						</div>
					</c:if>
					
					
					<input type="text" name="member_type" hidden="hidden" value="${param.type}">
					
					

					<div class="d-flex flex-row justify-content-end input-form-layout-last">
						<button type="button" class="negative-button">취소</button>
						<button id="submit_button" type="button" class="positive-button">가입</button>
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
