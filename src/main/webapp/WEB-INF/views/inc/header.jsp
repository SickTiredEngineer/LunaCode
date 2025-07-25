<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
	  <meta charset="UTF-8">
	  <title>LunaCode Header</title>
	
	  <!-- Bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/header_style.css " rel="stylesheet">
	  <!-- Bootstrap Icons -->
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
	
	
	</head>
	
	<body>
	
	  <header class="header d-flex justify-content-between align-items-center">
	    <!-- 좌측: 메뉴 버튼 -->
	    <div class="d-flex align-items-center">
	    	<i class="bi bi-grid-3x3-gap-fill icon-btn"></i>
	    </div>
	
	    <!-- 가운데: 로고 -->
	    <div class="logo-area" >
			<a href="#" class="logo-text"><img alt="..." class="main_bannder" src="${pageContext.request.contextPath}/resources/image/main_logo.png"></a>
	    </div>
	
	    <!-- 우측: 텍스트 메뉴 + 아이콘 메뉴 -->
	    <div class="d-flex align-items-center gap-3">
			<a href="#" class="nav-link">커뮤니티</a>
			<a href="#" class="nav-link">수강후기</a>
			<i><img class="icon-size" alt="..." src="${pageContext.request.contextPath}/resources/icons/icon_cart.png"></i>
			<i><img class="icon-size" alt="..." src="${pageContext.request.contextPath}/resources/icons/icon_alarm.png"></i>
			<i><img class="icon-size" alt="..." src="${pageContext.request.contextPath}/resources/icons/icon_profile.png"></i>
	    </div>
	  </header>
	
	</body>
	
	
</html>
