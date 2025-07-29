<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>login</title>
		<meta charset="UTF-8">
		<link href="bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/layout/member_login.css" rel="stylesheet">
	</head>
	
	
	<body>
	
					<!-- 로그인 모달 (Bootstrap 5 모달 형태) -->
					<div class="modal fade custom-login-modal" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  						<div class="modal-dialog modal-dialog-centered">
    						<div class="modal-content">
    						
						      <img src="${pageContext.request.contextPath}/resources/image/luna_login.png" alt="로고" class="modal-logo" />
    						
					
					      <div class="modal-header">
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
					      </div>
					
					      <div class="modal-body">
					        <form action="${pageContext.request.contextPath}/MemberLoginForm" method="post">
					
					          <div class="mb-3">
					            <label for="inputId" class="form-label">아이디</label>
					            <input type="text" class="form-control" id="inputId" name="id" placeholder="아이디 입력" required />
					          	<div class="invalid-feedback"> 아이디를 입력하세요 </div>
					          </div>
					
					          <div class="mb-3">
					            <label for="inputPassword" class="form-label">비밀번호</label>
					            <input type="password" class="form-control" id="inputPassword" name="pass" placeholder="비밀번호 입력" required />
					          	<div class="invalid-feedback"> 비밀번호를 입력하세요 </div>
					          </div>
					
					          <div class="mb-3 form-check">
					            <input type="checkbox" class="form-check-input" id="rememberMe" name="remember" />
					            <label class="form-check-label" for="rememberMe">로그인 상태 유지</label>
					          </div>
					
					          <button type="submit" class="btn btn-primary w-100">로그인</button>
					
					          <c:if test="${not empty error}">
					            <p class="text-danger mt-2">${error}</p>
					          </c:if>
					          
					          <div class="modal-footer flex-column bg-transparent border-0 pt-3">
							 <div class="modal-link-group">
							    <a href="..." class="footer-link">회원가입</a>
							    <span class="footer-divider">|</span>
							    <a href="..." class="footer-link">아이디 찾기</a>
							    <span class="footer-divider">|</span>
								<a href="..." class="footer-link">비밀번호 찾기</a>
							 </div>

							  <div class="social-login-group d-flex justify-content-center gap-2">
							    <!-- 네이버 로그인 -->
							    <a href="" class="social-icon">
							      <img src="${pageContext.request.contextPath}/resources/image/naver.png" alt="네이버 연동" />
							    </a>
							    <!-- 카카오 로그인 -->
							    <a href="" class="social-icon">
							      <img src="${pageContext.request.contextPath}/resources/image/kakao.png" alt="카카오 연동" />
							    </a>
							  </div>
							</div>
							  <div class="easy-login-text">
							    간편 로그인
							  </div>
												          
					
					        </form>
					      </div>
					
					    </div>
					  </div>
					</div>
					
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
			
	
	</body>
	
	
</html>
