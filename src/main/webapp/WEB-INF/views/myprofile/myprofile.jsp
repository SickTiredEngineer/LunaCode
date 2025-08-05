<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>MyProfile</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/myprofile.css" rel="stylesheet">  
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain_category.css" rel="stylesheet">    
	</head>
	
	<body>
		<div class="page-base container">
			
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
			
			 <article class="content-layout">
				 
		        
	        </article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
	</body>
	
</html>