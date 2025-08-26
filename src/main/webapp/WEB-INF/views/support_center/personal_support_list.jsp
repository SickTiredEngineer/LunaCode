<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   


<html>

	<head>
		<title>고객 지원 센터 - 1:1 문의</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/support_center/support_center.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article>
				
				<div class="d-flex flex-column justify-content-center top-layout">
				
					<div class="d-flex justify-content-center">
						<h2 class="main-text" style="width: 100%;">1:1 문의</h2>
					</div>
					
					<div class="d-flex flex-row justify-content-center search-form-layout search-form-size">
						<input type="text" class="search-form-input" maxlength="10">
						<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
					</div>
	
					<div class="d-flex flex-row justify-content-end">
						<button class="positive-button write-button-size" onclick="location.href='SupportWrite'">1:1문의 작성</button>
					</div>
				</div>
				
				<div class="d-flex flex-row">
			
					<jsp:include page="/WEB-INF/views/support_center/support_center_sidebar.jsp"/>
					
					<div class="d-flex flex-column list-main-layout">
					
						<div class="d-flex flex-row align-items-center list-info-layout">
								<h3 class="text-no info-text">No.</h3>
								<h3 class="text-subject info-text">문의 제목</h3>
								<h3 class="text-date info-text">작성일</h3>
								<h3 class="text-category info-text">카테고리</h3>
								<h3 class="text-answer-state info-text">답변 여부</h3>
						</div>
							
							
						<div class="list-layout">
						
	
							<c:forEach items="${cqList}" var="cq" varStatus="status">
							
								<div class="d-flex flex-row align-items-center list-item-root">
									<a href="SupportDetail?query_idx=${cq.query_idx}" class="d-flex flex-row align-items-center list-item-layout">
										<h3 class="text-no">${status.index + 1}</h3>
										<h3 class="text-subject">${cq.query_subject}</h3>
										<h3 class="text-date">
											<fmt:formatDate value="${cq.query_date}" pattern="yyyy.MM.dd"/>
										</h3>
										<h3 class="text-category">${cq.query_category}</h3>
										<h3 class="text-answer-state">
											<c:choose>
												<c:when test="${cq.answer_status}">답변</c:when>
												<c:otherwise>미답변</c:otherwise>
											</c:choose>
										</h3>
									</a>
									
									<c:if test="${not cq.answer_status}">
										<a href="ModifySupport?query_idx=${cq.query_idx}"><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
										
										<form action="DeleteSupport" method="post" class="align-form">
											<input type="hidden" name="query_idx" value="${cq.query_idx}">
											<input type="image" onclick="return confirm('정말 해당 문의사항을 삭제 하시겠습니까?');" src="${pageContext.request.contextPath }/resources/icons/icon_delete.png" class="edit-icon">
										</form>
										
									</c:if>
									
								</div>
								
								<div class="horizontal-line"></div>	
								
							</c:forEach>


						</div>
						
						<div class="d-flex flex-row justify-content-center page-selector-layout">
							
							<button type="button" class="page-selector" onclick="location.href='NoticeList?pageNum=${pageVo.pageNum-1}'" <c:if test="${pageVo.pageNum eq 1}">disabled</c:if>>&lt;</button> 
							
							<c:forEach var="i" begin="${pageVo.startPage }" end="${pageVo.endPage }">
								<c:choose>
									<c:when test="${i eq pageVo.pageNum }">
										<button type="button" class="page-selector" onclick="location.href='NoticeList?pageNum=${i}'" disabled="disabled"><strong>${i}</strong></button>
									</c:when>
									<c:otherwise>
										<button type="button" class="page-selector" onclick="location.href='NoticeList?pageNum=${i}'">${i}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button type="button" class="page-selector" onclick="location.href='NoticeList?pageNum=${pageVo.pageNum+1}'" 
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
	
	</body>
	
</html>
