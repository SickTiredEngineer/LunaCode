<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>

	<head>
		<title>비밀번호 변경</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_passwd.css" rel="stylesheet">      
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_category.css" rel="stylesheet">
	</head>
	
	<body>
		<div class="page-base container">
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp" />
			</header>

			<article>
				<%-- 페이지 제목 --%>
				<div class="title-layout">
					<h2 class="page-main-title">비밀번호 설정</h2>
				</div>

				<%-- 메인 콘텐츠 레이아웃 --%>
				<div class="content-layout">
				
					<%-- 좌측 공통 카테고리 --%>
					<aside class="common-category">
						<a href="ModifyProfile" class="common-category-element">프로필 설정</a>
						<a href="ModifyPasswd" class="common-category-element active">비밀번호 설정</a>
						<a href="MyPayment" class="common-category-element">결제 내역</a>
						<a href="ModifyDelete" class="common-category-element">계정 탈퇴</a>
					</aside>
					
					<%-- 메인 폼 영역 --%>
					<section class="form-container">
					
						<form id="passwd_form">
					
						<div class="form-row">
							<label class="form-label" for="current_pass">현재 비밀번호</label>
							<div class="input-wrapper">
								<input type="password" id="current_pass" name="current_pass" class="common-input-form-main-color form-input-size">
								<!-- 유효성 검사 메시지 영역 -->
								<span class="validation-message" id="span_current_pass"></span>
							</div>
						</div>
				
						<div class="form-row">
							<label class="form-label" for="new_pass">새 비밀번호</label>
							<div class="input-wrapper">
								<input type="password" id="new_pass" name="new_pass" class="common-input-form-main-color form-input-size">
								<!-- 유효성 검사 메시지 영역 -->
								<span class="validation-message" id="span_new_pass"></span>
							</div>
						</div>

						<div class="form-row">
							<label class="form-label" for="new_pass_check">새 비밀번호 확인</label>
							<div class="input-wrapper">
								<input type="password" id="new_pass_check" name="new_pass_check" class="common-input-form-main-color form-input-size">
								<!-- 유효성 검사 메시지 영역 -->
								<span class="validation-message" id="span_new_pass_check"></span>
							</div>
						</div>
						
						<div class="action-buttons">
							<button type="button" id="submit_button" class="positive-button">변경 완료</button>
						</div>
					</form>
					</section>
				</div>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
			</footer>
		</div>
		
		<script src="${pageContext.request.contextPath}/resources/js/modifyprofiles/modify_passwd.js"></script>
		
	</body>

</html>
