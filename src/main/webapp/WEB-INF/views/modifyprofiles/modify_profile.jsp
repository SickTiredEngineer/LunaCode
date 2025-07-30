<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>ModifyProfile</title>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath }/resources/css/common/css_variables.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/component.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/base.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_profile.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_sidebar.css" rel="stylesheet">      
	</head>
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
				<h2 class="profiletitle">프로필 설정</h2>
			</header>
			
			<div class="profile-main">
			
				<aside class="sidebar">
					<h3>계정 설정</h3>
					<ul>
						<li><strong>프로필 설정</strong></li>
						<li>비밀번호 설정</li>
						<li>결제 내역</li>
						<li>계정 탈퇴</li>
					</ul>
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
							<button type="submit" class="positive-button">취소</button>
							<button type="submit" class="negative-button">완료</button>
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
