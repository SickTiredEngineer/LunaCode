<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>계정 탈퇴</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_delete.css" rel="stylesheet">      
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
					<h2 class="page-main-title">계정 탈퇴</h2>
				</div>

				<%-- 메인 콘텐츠 레이아웃 --%>
				<div class="content-layout">
				
					<%-- 좌측 공통 카테고리 --%>
					<aside class="common-category">
						<a href="ModifyProfile" class="common-category-element">프로필 설정</a>
						<a href="ModifyPasswd" class="common-category-element">비밀번호 설정</a>
						<a href="MyPayment" class="common-category-element">결제 내역</a>
						<a href="ModifyDelete" class="common-category-element active">계정 탈퇴</a>
					</aside>
					
					<%-- 메인 폼 영역 --%>
					<section class="form-container">
						<form id="delete_form">
						
							<div class="form-row">
								<label for="currentPassword" class="form-label">현재 비밀번호</label>
								<div class="input-wrapper">
									<input type="password" id="password" name="password" class="common-input-form-main-color">
									<span class="validation-message" id="span_password"></span>
								</div>
							</div>
						
							<div class="form-row">
								<label for="confirmPassword" class="form-label">비밀번호 확인</label>
								<div class="input-wrapper">
									<input type="password" id="password_check" name="password_check" class="common-input-form-main-color">
									<span class="validation-message" id="span_password_check"></span>
								</div>
							</div>
							
							<%-- 유의사항 안내 영역 --%>
							<div class="notice-area">
								<p class="notice-title">유의사항</p>
								<label class="notice-agreement">
									<input type="checkbox" id="agree_checkbox" name="agree">
									계정 탈퇴를 진행하여 모든 정보를 삭제하는 데 동의합니다.
								</label>
							</div>
							
							<%-- 하단 버튼 영역 --%>
							<div class="action-buttons">
								<button type="button" id="submit_button" class="positive-button">회원 탈퇴</button>
							</div>
						</form>
					</section>
				</div>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
			</footer>
		</div>
	</body>
	
	<script src="${pageContext.request.contextPath}/resources/js/modifyprofiles/modify_delete.js"></script>
	
</html>
