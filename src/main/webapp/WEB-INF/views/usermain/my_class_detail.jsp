<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
	<head>
		<title>MyClassDetail</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/my_class_detail.css" rel="stylesheet">  
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain_category.css" rel="stylesheet">    
	</head>

	<body>
		<div class="page-base container">
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article class="content-layout">
				<%-- 좌측 공통 카테고리 --%>
				<jsp:include page="/WEB-INF/views/usermain/usermain_category.jsp"/>

				<section class="course-detail-container">
					<!-- 페이지 상단 (JavaScript가 동적으로 채울 영역) -->
					<div class="course-detail-header">
						<h2 class="main-title"></h2> <%-- JS가 제목을 채워줌 --%>
<!-- 						<button class="positive-button">최신 수강순 ▼</button> -->
					</div>
					
					<div id="course-data-container" data-json='${classDetailJson}'>
					</div>

					<!-- 강의 섹션 목록 (JavaScript가 동적으로 채울 영역) -->
					<ul class="section-list">
						<%-- JS가 이 부분을 채울 것 --%>
					</ul>
				</section>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
		
		<script>
		    const CONTEXT_PATH = "${pageContext.request.contextPath}";
		</script>
		
        <script src="${pageContext.request.contextPath}/resources/js/usermain/my_class_detail.js"></script>
	</body>

</html>