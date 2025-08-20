<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>LunaCode Header</title>
    
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
            <a href="#">IT 자격증</a>
            <a href="#">기초 코딩</a>
            <a href="#">컴퓨터 활용</a>
            <a href="#">게임 개발</a>
            <a href="#">컴퓨터 그래픽</a>
            <a href="#">AI</a>
            <a href="#">컴퓨터 비전</a>
            <a href="#">임베디드</a>
            <a href="#">풀스텍</a>
            <a href="#">안드로이드</a>
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

    <div class="logo-center">
        <a href="GoHome" class="logo-text">
            <img alt="로고" class="main_bannder" src="${pageContext.request.contextPath}/resources/image/LunaCode_header.png">
        </a>
    </div>

    <div class="d-flex align-items-center gap-3">
        <a href="Community" class="nav-link">커뮤니티</a>

        <c:choose>
            <c:when test="${not empty sessionScope.loginUser}">
                <a href="ApMemberList" class="nav-link">관리자</a>
                <div class="profile-menu">
	            <img src="${pageContext.request.contextPath}/resources/icons/icon_profile.png" alt="프로필" id="profileImg" class="nav-link">
		          <div id="userDropdown" class="user-dropdown-box">
		          	<div class="user-info">
    					<img src="${pageContext.request.contextPath}/resources/image/profile_image.png" class="user-img" alt="사진">
      					<span class="user-nickname">${sessionScope.loginUser.nickname}</span>
	            	</div>
	            	<a href="${pageContext.request.contextPath}/MemberInfo" class="user-menu-item">마이페이지</a>
    				<a href="ModifyProfile" class="user-menu-item">계정 설정</a>
	           		<a href="javascript:void(0)" onclick="logout()" class="user-menu-item">로그아웃</a>
	              </div>
	        	</div>
            </c:when>

            <c:otherwise>
                <a href="#" class="nav-link" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a>
                <a href="MemberChoice" class="nav-link">회원가입</a>
            </c:otherwise>
        </c:choose>
    </div>
    
</header>

</body>
</html>
