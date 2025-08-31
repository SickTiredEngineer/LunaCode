<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<html>

	<head>
		<title>환불 규정</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_personal_support_detail.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/admin_common.css" rel="stylesheet">

	</head>
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-text-margin">
					<h2 class="main-text">환불 규정</h2>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<div class="d-flex flex-column justify-content-start">
							<jsp:include page="/WEB-INF/views/policy/policy_sidebar.jsp" />
						</div>	
						
						
						<div class="d-flex flex-column">
						
							<div class="d-flex flex-column detail-main-layout qna_layout">

								<div class="d-flex flex-row child-layout">
									<p class="info-text">환불 정책</p>
								</div>
								
								<div class="horizontal-line"></div>
								
								<div class="d-flex flex-row child-layout">
									<p class="info-text">갱신일</p>
									<p>2025.08.31</p>
								</div>
								
								<div class="horizontal-line"></div>
							
								<div class="d-flex flex-column child-layout">
									<jsp:include page="/WEB-INF/views/policy/refund.jsp" />
								</div>
	
								<br>
		
							</div>
								
							<br>
								
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
