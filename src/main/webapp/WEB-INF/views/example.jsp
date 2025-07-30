<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>Main</title>
		<meta charset="UTF-8">
		
		<!-- 필요 css 임포트 -->
		<link href="${pageContext.request.contextPath}/resources/css/common/css_variables.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/common/component.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/base.css" rel="stylesheet">	
	</head>
	
	
	<body>
	
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

		
			<article>
			
			
			</article>
			
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
</html>
