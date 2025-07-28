<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>LunaCode Header</title>
	
		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/layout/header.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
	</head>

	<body>
	
		<header class="header d-flex justify-content-between align-items-center">
		    
			<div class="d-flex align-items-center">
				<i class="bi bi-grid-3x3-gap-fill icon-btn"></i>
			</div>
			
			<div class="logo-center">
				<a href="#" class="logo-text">
				<img alt="로고" class="main_bannder" src="${pageContext.request.contextPath}/resources/image/luna_main_logo.png">
				</a>
			</div>
			
			<div class="d-flex align-items-center gap-3">
				<a href="#" class="nav-link">커뮤니티</a>
				<a href="#" class="nav-link">수강후기</a>
				<a href="#"><img class="icon-size" alt="장바구니" src="${pageContext.request.contextPath}/resources/icons/icon_cart.png"></a>
				<a href="#"><img class="icon-size" alt="알림" src="${pageContext.request.contextPath}/resources/icons/icon_alarm.png"></a>
				<a href="#" class="nav-link">로그인</a>
				<a href="#" class="nav-link">회원가입</a>
<%-- 				<a href="#"><img class="icon-size" alt="프로필" src="${pageContext.request.contextPath}/resources/icons/icon_profile.png"></a> --%>
			</div>
		
		</header>
	
	</body>
	
</html>
