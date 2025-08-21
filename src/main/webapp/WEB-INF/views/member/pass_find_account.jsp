<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>

	<head>
		<title>Welcome Page</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/member/result_account.css" rel="stylesheet">	
	</head>
	
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

		
			<article>
			
				<div class="d-flex flex-column align-items-center justify-content-center main-layout">
				
						<div class="d-flex flex-column">
							<div class="d-flex flex-row">
								<div class="result-box">
									<c:choose>
									    <c:when test="${not empty userPass}">
										    <div class="result-with-image">
										        <img src="${pageContext.request.contextPath}/resources/image/result_icon.png" class="inquiry" alt="비밀번호 아이콘"/>
										        <p>비밀번호 조회 <strong>${userPass}</strong></p>
										    </div>
										    <div class="center-button-container">
											  <button type="button" class="positive-button find-button" onclick="location.href='${pageContext.request.contextPath}/GoHome'">홈으로</button>
											</div>
										</c:when>

									    <c:otherwise>
									        <img src="${pageContext.request.contextPath}/resources/image/no_results.png" class="inquiry" alt="조회결과가 없습니다" />
									    	<div class="center-button-container">
									   			<button type="button" class="positive-button find-button" onclick="history.back()">이전 페이지</button>
									    	</div>
									    </c:otherwise>
									</c:choose>								
								</div>
							</div>
						</div>
						
				</div>

			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
	
</html>
