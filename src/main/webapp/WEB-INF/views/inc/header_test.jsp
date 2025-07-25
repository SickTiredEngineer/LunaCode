<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/header_style.css " rel="stylesheet">
	
	</head>
	
	<body>
	
		<div class="container">
			<header
				class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
				<a href="/"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
					<svg class="bi me-2" width="40" height="32" aria-hidden="true">
						<use xlink:href="#bootstrap"></use></svg> 
						<span class="fs-4">
							<img alt="..." src="${pageContext.request.contextPath}/resources/image/main_logo.png" width="100" height="100">
						</span>
				</a>
				
				<nav>
					<ul class="nav nav-pills">
						<li class="nav-item"><a href="#" class="nav-link">커뮤 니티</a></li>
						<li class="nav-item"><a href="#" class="nav-link">수강 후기</a></li>
						<li class="nav-item"><a href="#" class="nav-link"><img class="icon-size" alt="..." src="${pageContext.request.contextPath}/resources/icons/icon_cart.png"></a></li>
						<li class="nav-item"><a href="#" class="nav-link"><img class="icon-size" alt="..." src="${pageContext.request.contextPath}/resources/icons/icon_alarm.png"></a></li>
						<li class="nav-item"><a href="#" class="nav-link"><img class="icon-size" alt="..." src="${pageContext.request.contextPath}/resources/icons/icon_profile.png"></a></li>
					</ul>
				
				</nav>

				

			</header>
			

			
			
		</div>
	

	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
		
	</body>
	
</html>