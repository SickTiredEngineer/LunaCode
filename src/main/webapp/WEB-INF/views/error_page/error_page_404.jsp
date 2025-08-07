<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>404 Not Found</title>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath}/resources/css/page/error_page/error_page.css" rel="stylesheet">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		
		
		
	</head>
	
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

		
			<article>
				
				<div class="d-flex flex-column align-items-center">
					<img alt="" src="${pageContext.request.contextPath}/resources/image/404_not_found.png" class="error-image">
					
					<a href="GoHome" class="positive-button">홈으로</a>
				</div>

			</article>
			
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
</html>
