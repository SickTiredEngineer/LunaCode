<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>고객 지원 센터</title>
		<meta charset="UTF-8">
		
		<!-- 필요 css 임포트 -->
		<link href="${pageContext.request.contextPath}/resources/css/common/css_variables.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/common/component.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/common/base.css" rel="stylesheet">	
		<link href="${pageContext.request.contextPath}/resources/css/page/support_center/personal_support.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

		
			<article>
				
				<div>
					<h2 class="main-text">1:1 문의</h2>
				</div>
				
				
				
				
				
				
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-column align-items-center common-category">
						<a href="#" class="common-category-element">1:1 문의</a>
						<a href="#" class="common-category-element">FAQ</a>
						<a href="#" class="common-category-element">공지사항</a>
					</div>
					
					<div class="d-flex list-layout">

						<div>
						
							
						
						
						
						</div>
						

					</div>
				
				</div>	
			
			

								

								
									
				
			</article>
			
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
</html>
