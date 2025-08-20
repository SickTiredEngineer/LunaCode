<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>아이디/비밀번호 찾기</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/member/find_account.css" rel="stylesheet">	
		<script src="${pageContext.request.contextPath}/resources/js/member/find_account.js"></script>
	</head>
	
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

		
			<article>
			
				<div class="d-flex flex-column align-items-center justify-content-center main-layout">
				
						<div class="d-flex flex-column">
							
							<div class="d-flex flex-row">
								<button id="id_bt" type="button" class="negative-button category-button" >아이디 찾기</button>
								<button id="password_bt" type="button" class="negative-button category-button">비밀번호 찾기</button>
							</div>
							
							<br>
							
							<div class="horizontal-line"></div>
							
							<br>
						
						<form action="${pageContext.request.contextPath}/ResultAccount" method="post" id="findIdForm">
							<div id="find_id_layout" class="d-flex flex-column find-layout">
							
								<div class="d-flex flex-row">
									<p class="info-text">이름</p>
									<input type="text" name= "name" class="common-input-form find-input">
								</div>
								
								<br>
								
								<div class="d-flex flex-row">
									<p class="info-text">이메일</p>
									<input type="text" name="email" class="common-input-form find-input">
								</div>
								
								<br>
								
								<button type="submit" class="positive-button find-button">아이디 찾기</button>
							
							</div>
						</form>
						
						<form action="${pageContext.request.contextPath}/PassFindAccount" method="post" id="findPassForm">	
							<div id="find_password_layout" class="d-flex flex-column find-layout">
							
								<div class="d-flex flex-row">
									<p class="info-text">아이디</p>
									<input type="text" name="id" class="common-input-form find-input">
								</div>
								
								<br>
								
								<div class="d-flex flex-row">
									<p class="info-text">이메일</p>
									<input type="text" name="email" class="common-input-form find-input">
								</div>
								
								<br>
								
								<button type="submit" class="positive-button find-button">비밀번호 찾기</button>
							
							</div>
						</form>	
						</div>

				</div>

			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
	
</html>
