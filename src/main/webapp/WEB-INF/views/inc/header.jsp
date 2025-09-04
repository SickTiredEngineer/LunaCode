<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>LunaCode Header</title>
    <jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common/header.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/common/css_variables.css" rel="stylesheet">
    
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/layout/header.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>

<header class="header d-flex justify-content-between align-items-center">
    <!-- 로그인 모달 연결 -->
    <jsp:include page="/WEB-INF/views/member/login_modal.jsp"/>
    <script>  window.contextPath = '${pageContext.request.contextPath}';</script>

    
    
    <!-- 네비게이션 아이콘 -->
    <div class="sidebar-container">
        <!-- 네모 4개 버튼 -->
        <button id="navBoxBtn" class="nav-box-btn" type="button" aria-label="메뉴 열기">
            <span class="square-grid">
                <span class="square blue"></span>
                <span class="square blue"></span>
                <span class="square blue"></span>
                <span class="square gray special"></span> <!-- 회색 네모 -->
            </span>
        </button>

        <!-- 내비게이션 메뉴 -->
        <nav id="side-nav" class="side-nav" aria-hidden="true">
            <a href="ClassDisplayStand?category=기초코딩">기초코딩</a>
			<a href="ClassDisplayStand?category=게임개발">게임개발</a>
			<a href="ClassDisplayStand?category=안드로이드">안드로이드</a>
			<a href="ClassDisplayStand?category=임베디드">임베디드</a>
			<a href="ClassDisplayStand?category=컴퓨터 활용">컴퓨터 활용</a>
			<a href="ClassDisplayStand?category=컴퓨터 그래픽">컴퓨터 그래픽</a>
			<a href="ClassDisplayStand?category=컴퓨터 비전">컴퓨터 비전</a>
			<a href="ClassDisplayStand?category=풀스텍">풀스텍</a>
			<a href="ClassDisplayStand?category=AI">AI</a>
			<a href="ClassDisplayStand?category=IT 자격증">자격증</a>
            <!-- 필요 메뉴 추가 -->
        </nav>
    </div>

    <script>
        const menuBtn = document.getElementById('navBoxBtn');
        const navMenu = document.getElementById('side-nav');

        menuBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            navMenu.classList.toggle('open');
            menuBtn.classList.toggle('open');
        });

        document.addEventListener('click', function(e) {
            if (!navMenu.contains(e.target) && !menuBtn.contains(e.target)) {
                navMenu.classList.remove('open');
                menuBtn.classList.remove('open');
            }
        });
    </script>

		<sec:authorize access="isAuthenticated()">
			<c:set var="logoHref" value="/UserMain"/>
		</sec:authorize>
		
		<sec:authorize access="isAnonymous()">
			<c:set var="logoHref" value="/GoHome"/>
		</sec:authorize>
		
		<div class="logo-center">
			<a href="<c:url value='${logoHref}'/>" class="logo-text">
				<img alt="로고" class="main_bannder" src="<c:url value='/resources/image/LunaCode_header.png'/>">
			</a>
		</div>

	
	   <div class="d-flex align-items-center gap-3">
	   	<a href="${pageContext.request.contextPath}/Community" class="nav-link">커뮤니티</a>
	
	  <!-- 비로그인(익명) -->
	  <sec:authorize access="isAnonymous()">
	    <a href="#" class="nav-link" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a>
<%-- 	    <a href="${pageContext.request.contextPath}/MemberLoginTemp" class="nav-link">로그인</a> --%>
	    <a href="${pageContext.request.contextPath}/MemberChoice" class="nav-link">회원가입</a>
	  </sec:authorize>
	
	  <!-- 로그인 사용자 -->
	  <sec:authorize access="isAuthenticated()">
	  
	  	<a href="${pageContext.request.contextPath}/Cart" class="nav-link">장바구니</a>
	  
	    <!-- 권한별 메뉴 -->
	    <sec:authorize access="hasRole('ADMIN')">
	      <a href="${pageContext.request.contextPath}/ApMemberList" class="nav-link">관리자 페이지</a>
	    </sec:authorize>
	
	    <sec:authorize access="hasAnyRole('INSTRUCTOR')">
	      <a href="${pageContext.request.contextPath}/ClassStatistic" class="nav-link">강사 대시보드</a>
	    </sec:authorize>
	
	    <!-- 일반 사용자(관리자/강사 제외) 메뉴가 필요하면: -->
	    <sec:authorize access="isAuthenticated() and !hasRole('ADMIN') and !hasRole('INSTRUCTOR')">
	      <a href="${pageContext.request.contextPath}/MyProfile" class="nav-link">마이페이지</a>
	      
	    </sec:authorize>
	
	    <!-- 프로필/로그아웃 영역 -->
	    <div class="profile-menu">
	      <img src="${pageContext.request.contextPath}/resources/icons/icon_profile.png" alt="프로필" id="profileImg" class="nav-link">
	      <div id="userDropdown" class="user-dropdown-box">
	
	        <!-- 닉네임 -->
	        <sec:authentication property="principal.nickname" var="nickname"/>
	        <sec:authentication property="principal.profileImg" var="profileImg"/>
	        <div class="user-info">
	        
	        	<c:choose>
	        		<c:when test="${not empty me.profileImg}">
	        			<img style="width: 30px; height: 30px; margin-right: 10px;" src="${pageContext.request.contextPath}${me.profileImg}" class="user-img" alt="사진">
	        		</c:when>
	        		
	        		<c:otherwise>
	        			<img style="width: 30px; height: 30px; margin-right: 10px;" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_profile.png">
	        		</c:otherwise>
	        	</c:choose>
	        

	        
	          
	          <span class="user-nickname"><c:out value="${nickname}"/></span>
	        </div>
	
	        <a href="${pageContext.request.contextPath}/MyProfile" class="user-menu-item">마이페이지</a>
	        <a href="${pageContext.request.contextPath}/ModifyProfile" class="user-menu-item">계정 설정</a>
			<a href="${pageContext.request.contextPath}/MemberLogout" class="user-menu-item">로그아웃</a>
	        <!-- 로그아웃 -->
<%-- 	        <form action="${pageContext.request.contextPath}/MemberLogout" method="post" style="margin:0;"> --%>
<!-- 	          <button type="submit" class="user-menu-item" style="background:none;border:0;padding:0;">로그아웃</button> -->
<%-- 	          <sec:csrfInput/> --%>
<!-- 	        </form> -->
	        
	      </div>
	    </div>
	  </sec:authorize>
	</div>

    
</header>

</body>
</html>
		