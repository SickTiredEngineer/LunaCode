<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<html>

	<head>
		<title>결제 기록</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_paylog_list.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/admin_common.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article>
				
				<div class="d-flex flex-row justify-content-center top-layout">
				
					<div class="d-flex flex-column justify-content-center">
						<h2 class="main-text">결제 관리</h2>
						
						<div class="d-flex flex-row justify-content-center search-form-layout search-form-size">
							<input type="text" class="search-form-input" maxlength="10">
							<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
						</div>
					</div>

				</div>
				
				<div class="d-flex flex-row">
					
					<div class="d-flex flex-column justify-content-start">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
					</div>
					
					
						
					<div class="d-flex flex-column list-main-layout">
					
						<div class="d-flex flex-row align-items-center list-info-layout">
							<h3 class="text-no info-text">결제 번호</h3>
							<h3 class="pay-num info-text">결제번호</h3>
							<h3 class="text-name info-text">결제 강의</h3>
							<h3 class="text-state info-text">결제자 ID</h3>
							<h3 class="text-date info-text">결제일</h3>
							
							<h3 class="text-state info-text">환불 상태</h3>
						</div>
							
							
						<div class="d-flex flex-column list-layout">
	
							<!-- ============================== -->
						<c:forEach items="${payList}" var="paylog" varStatus="status">
						
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="ApPaylogDetail?payment_idx=${paylog.payment_idx}" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">${status.index + 1}</h3>
									<h3 class="pay-num">${paylog.merchant_uid}</h3>
									<h3 class="text-name">${paylog.class_title}</h3>
									<h3 class="text-state">${paylog.user_id}</h3>
									<h3 class="text-date">
										<fmt:formatDate value="${paylog.pay_date}" pattern="yyyy.MM.dd"/>
									</h3>
									
									<h3 class="text-state">
										<c:choose>
											<c:when test="${not paylog.refunded_status}">승인</c:when>
											<c:otherwise>환불</c:otherwise>							
										</c:choose>
									</h3>
								</a>
							</div>

						</c:forEach>
								
						</div>
						
						<div class="d-flex flex-row justify-content-center page-selector-layout">
							
							<button type="button" class="page-selector" onclick="location.href='ApPaylogList?pageNum=${pageVo.pageNum-1}'" <c:if test="${pageVo.pageNum eq 1}">disabled</c:if>>&lt;</button> 
							
							<c:forEach var="i" begin="${pageVo.startPage }" end="${pageVo.endPage }">
								<c:choose>
									<c:when test="${i eq pageVo.pageNum }">
										<button type="button" class="page-selector" onclick="location.href='ApPaylogList?pageNum=${i}'" disabled="disabled"><strong>${i}</strong></button>
									</c:when>
									<c:otherwise>
										<button type="button" class="page-selector" onclick="location.href='ApPaylogList?pageNum=${i}'">${i}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button type="button" class="page-selector" onclick="location.href='ApPaylogList?pageNum=${pageVo.pageNum+1}'" 
							<c:if test="${pageVo.pageNum eq pageVo.maxPage }">disabled</c:if>>&gt;</button>
					
						</div>

					</div>
					
				</div>
				
				
			</article>
			
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
		
		<script defer src="${pageContext.request.contextPath }/resources/js/support_center/faq_list.js"></script>
	</body>
	
</html>