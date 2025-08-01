<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>ModifyPasswd</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_passwd.css" rel="stylesheet">      
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_category.css" rel="stylesheet">
	</head>
	
	<body>
	
		<div class="page-base container">
			
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp" />
				<h2 class="profiletitle">비밀번호 설정</h2>
			</header>
			
			<div class="profile-main">
			
				<aside class="common-category">
					<a href="ModifyProfile" class="common-category-element">프로필 설정</a>
					<a href="ModifyPasswd" class="common-category-element">비밀번호 설정</a>
					<a href="MyPayment" class="common-category-element">결제 내역</a>
					<a href="ModifyDelete" class="common-category-element">계정 탈퇴</a>
				</aside>
				
				<article>
				
					<form>
					
						<div class="row">
							<label>현재 비밀번호</label>
							<input type="password">
						</div>
						
						<div class="row">
							<label>새 비밀번호</label>
							<input type="password">
						</div>
						
						<div class="row">
							<label>새 비밀번호 확인</label>
							<input type="password">
						</div>
						
						<div class="actionbuttons">
							<button type="submit" class="negative-button">취소</button>
							<button type="submit" class="positive-button">완료</button>
						</div>
						
					</form>
					
				</article>
			
			</div>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
			</footer>
			
		</div>
		
	</body>
	
</html>