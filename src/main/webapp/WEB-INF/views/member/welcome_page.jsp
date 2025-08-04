<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>Welcome Page</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/member/welcome_page.css" rel="stylesheet">	
	</head>
	
	
	<body>
	
		<div>
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

		
			<article>
				<div class="d-flex flex-column align-items-center ">
				
					<img src="${pageContext.request.contextPath }/resources/image/welcome_image.png" class="welcome-image-size" alt="...">	
					

					<form action="GoHome" method="get">
						<button type="submit" class="positive-button">홈으로</button>
					</form>
				
				</div>
			
			
				
			
			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
	
</html>
