<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>ModifyProfile</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_profile.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_category.css" rel="stylesheet">      
	</head>
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
				<h2 class="profiletitle">프로필 설정</h2>
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
					
						<div class="row profile">
						
							<label class="photobox">
								<span>사진</span>
								<input type="file" style="display: none">
							</label>
							
							<div class="nickname">
								<input type="text" placeholder="닉네임">
								<button class="positive-button">중복 체크</button>
							</div>
							
						</div>
						
						<div class="row">
							<label>이메일</label>
							<input type="email">
						</div>
						
						<div class="row">
							<label>자기소개</label>
							<textarea></textarea>
						</div>
						
						<div class="row">
							<label>휴대폰 번호</label>
							<input type="tel">
							<button class="positive-button">인증</button>
						</div>
						
						<div class="row">
							<label>깃허브</label>
							<input type="text">
						</div>
						
						<div class="actionbuttons">
							<button class="negative-button">취소</button>
							<button class="positive-button">완료</button>
						</div>
						
					</form>
					
				</article>
				
			</div>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
			
		</div>
		
	</body>
	
</html>
