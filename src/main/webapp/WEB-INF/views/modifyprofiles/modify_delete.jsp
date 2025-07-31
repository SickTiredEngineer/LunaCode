<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>ModifyDelete</title>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath }/resources/css/common/css_variables.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/component.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/base.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_delete.css" rel="stylesheet">      
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_sidebar.css" rel="stylesheet">
	</head>
	
	<body>
	
		<div class="page-base container">
			
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp" />
				<h2 class="profiletitle">계정 탈퇴</h2>
			</header>
			
			<div class="profile-main">
			
				<aside class="sidebar">
					<h3>계정 설정</h3>
					<ul>
						<li>프로필 설정</li>
						<li>비밀번호 설정</li>
						<li>결제 내역</li>
						<li><strong>계정 탈퇴</strong></li>
					</ul>
				</aside>
				
				<article>
				
					<form>
					
						<div class="row">
							<label>현재 비밀번호</label>
							<input type="password">
						</div>
						
						<div class="row">
							<label>비밀번호 확인</label>
							<input type="password">
						</div>
						
						<div class="row">
							<label>전화번호 인증</label>
							<input type="tel">
						</div>
						
						<div class="notice-box">
							<p class="notice-title">유의사항</p>
							<label class="notice-content">
								<input type="checkbox">
								계정 탈퇴를 진행하여 모든 정보를 삭제하는 데 동의합니다.
							</label>
						</div>
						
						<div class="actionbuttons">					
							<button type="submit" class="positive-button">회원 탈퇴</button>
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