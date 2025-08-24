<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 - LunaCode</title>
	<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>	
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/layout/member_login.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/common/css_variables.css" rel="stylesheet">


    <!-- 폰트(선택) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <style>
      /* 페이지 전용 간단 정렬 (필요시 member_login.css 사용) */
      body { min-height: 100vh; display:flex; align-items:center; justify-content:center; background:#f8f9fa; }
      .login-card { width:100%; max-width:420px; }
      .modal-logo { display:block; margin:16px auto 0; height:56px; }
      .easy-login-text { text-align:center; color:#888; font-size:0.9rem; margin-top:8px; }
      .modal-link-group { text-align:center; margin-top:12px; }
      .footer-link { color:#0d6efd; text-decoration:none; }
      .footer-divider { margin:0 8px; color:#bbb; }
      .social-login-group img { height:36px; }
    </style>
</head>



<body>

  <div class="card shadow-sm login-card">
    <img src="${pageContext.request.contextPath}/resources/image/luna_login.png" alt="로고" class="modal-logo" />
    <div class="card-body">

      <h5 class="card-title text-center mb-3">로그인</h5>

      <!-- 에러메시지: ?error=true 또는 컨트롤러에서 model에 error 넣은 경우 -->
      <c:if test="${param.error eq 'true' || not empty error}">
        <div class="alert alert-danger" role="alert">
          아이디 또는 비밀번호가 올바르지 않습니다.
        </div>
      </c:if>

      <form action="${pageContext.request.contextPath}/MemberLoginForm" method="post">
        <!-- CSRF 토큰 (Security에서 <csrf/> 사용 중이면 꼭 포함) -->
        <c:if test="${not empty _csrf}">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </c:if>

        <div class="mb-3">
          <label for="inputId" class="form-label">아이디</label>
          <input type="text" class="form-control" id="inputId" name="user_id" placeholder="아이디 입력" required />
        </div>

        <div class="mb-3">
          <label for="inputPassword" class="form-label">비밀번호</label>
          <input type="password" class="form-control" id="inputPassword" name="password" placeholder="비밀번호 입력" required />
        </div>
        
<%--         <c:if test="${error eq true}"></c:if> --%>
<!--         <div class="mb-3"> -->
<!--         	<span style="color:#ff0000">아이디 혹은 비밀번호가 잘못 되었습니다.</span> -->
<!--         </div> -->

        <div class="mb-3 form-check">
          <input type="checkbox" class="form-check-input" id="rememberMe" name="remember" />
          <label class="form-check-label" for="rememberMe">로그인 상태 유지</label>
        </div>

        <button type="submit" class="btn btn-primary w-100">로그인</button>

        <div class="modal-link-group">
          <a href="${pageContext.request.contextPath}/MemberChoice" class="footer-link">회원가입</a>
          <span class="footer-divider">|</span>
          <a href="${pageContext.request.contextPath}/FindAccount" class="footer-link">아이디/비밀번호 찾기</a>
        </div>

        <div class="d-flex justify-content-center gap-2 mt-3 social-login-group">
          <a href="#"><img src="${pageContext.request.contextPath}/resources/image/naver.png" alt="네이버 연동" /></a>
          <a href="#"><img src="${pageContext.request.contextPath}/resources/image/kakao.png" alt="카카오 연동" /></a>
        </div>
        <div class="easy-login-text">간편 로그인</div>
      </form>
    </div>
  </div>

  <!-- JS (모달 제거했으니 필수는 아님) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
