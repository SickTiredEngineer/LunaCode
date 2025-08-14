<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

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
						<form>
						
							<%-- 각 입력 행 --%>
							<div class="form-row">
								<label class="form-label">현재 비밀번호</label>
								<input type="password" class="common-input-form-main-color form-input-size">
							</div>
					
							<div class="form-row">
								<label class="form-label">새 비밀번호</label>
								<input type="password" class="common-input-form-main-color form-input-size">
							</div>

							<div class="form-row">
								<label class="form-label">새 비밀번호 확인</label>
								<input type="password" class="common-input-form-main-color form-input-size">
							</div>
							
							<%-- 하단 버튼 영역 --%>
							<div class="action-buttons">
<!-- 								<button type="button" class="negative-button">취소</button> -->
								<button type="submit" class="positive-button">변경 완료</button>
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

</html>
