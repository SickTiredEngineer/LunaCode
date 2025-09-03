<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>

	<head>
		<title>고객 지원 센터 - FAQ</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/support_center/support_center.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/page/support_center/faq_list.css" rel="stylesheet">
		
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
						<h2 class="main-text" style="width: 100%;">FAQ</h2>
					</div>
					
					<!-- 검색 정보 -->
					<c:set var="qParam" value=""/>
					<c:if test="${not empty q}">
						<c:set var="qParam" value="&amp;q=${fn:escapeXml(q)}"/>
					</c:if>			
										
					<form action="FAQList" class="d-flex flex-row justify-content-center search-form-layout search-form-size">
						<input type="text" name="q" class="search-form-input" maxlength="10" placeholder="제목 혹은 내용 검색" value="${q}">
						<input type="image" type="submit" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
					</form>
	
					<div class="d-flex flex-row justify-content-end">
						<c:if test="${isAdmin}">
							<button class="positive-button write-button-size" onclick="location.href='FaqWrite'">FAQ 작성</button>
						</c:if>
					</div>
					
				</div>
				
				
				<div class="d-flex flex-row">
			
					<jsp:include page="/WEB-INF/views/support_center/support_center_sidebar.jsp"/>
					
					<div class="d-flex flex-column list-main-layout">
					
						<div class="d-flex flex-row align-items-center list-info-layout">
								<h3 class="text-no info-text">No.</h3>
								<h3 class="text-subject info-text">제목</h3>
								<h3 class="text-date info-text">작성일</h3>
								<h3 class="text-category info-text">카테고리</h3>
						</div>
							
							
						<div class="list-layout">
						
							<c:forEach items="${faqList}" var="faq" varStatus="status">
															<!-- FAQ 항목 하나 -->
								<div class="faq-item">
									<div class="d-flex flex-row align-items-center list-item-layout list-item-root faq-toggle">
										<h3 class="text-no">${status.index + 1}</h3>
										<h3 class="text-subject">${faq.faq_subject}</h3>
										<h3 class="text-date">
											<fmt:formatDate value="${faq.faq_date}" pattern="yyyy.MM.dd"/>
										</h3>
										<h3 class="text-category">${faq.category}</h3>
										
										<c:if test="${isAdmin}">
											<a href="ModifyFaq?faq_idx=${faq.faq_idx}"><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
											
											<form action="DeleteFaq" method="post" class="align-form">
												<input type="hidden" name="faq_idx" value="${faq.faq_idx}">
												<input type="image" onclick="return confirm('정말 해당 FAQ를 삭제 하시겠습니까?');" src="${pageContext.request.contextPath }/resources/icons/icon_delete.png" class="edit-icon">
											</form>
										</c:if>
											
									</div>
									
									<!-- 답변 내용 -->
									<div class="faq-answer">
										<div class="faq-answer-content">
											${faq.faq_content}
										</div>
									</div>
								</div>
								
								<div class="horizontal-line"></div>
								
									
							</c:forEach>

						</div>
						
						<div class="d-flex flex-row justify-content-center page-selector-layout">
							
							<button type="button" class="page-arrow" onclick="location.href='FAQList?pageNum=${pageVo.pageNum-1}${qParam}'" <c:if test="${pageVo.pageNum eq 1}">disabled</c:if>>&lt;</button> 
							
							<c:forEach var="i" begin="${pageVo.startPage }" end="${pageVo.endPage }">
								<c:choose>
									<c:when test="${i eq pageVo.pageNum }">
										<button type="button" class="page-selector" onclick="location.href='FAQList?pageNum=${i}${qParam}'" disabled="disabled"><strong>${i}</strong></button>
									</c:when>
									<c:otherwise>
										<button type="button" class="page-selector" onclick="location.href='FAQList?pageNum=${i}${qParam}'">${i}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button type="button" class="page-arrow" onclick="location.href='FAQList?pageNum=${pageVo.pageNum+1}${qParam}'" 
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
		<script type="text/javascript">
			window.addEventListener('pageshow', function (e) {
			    // bfcache에서 복원된 경우 또는 back/forward 내비게이션이면 새로고침
			    if (e.persisted || (performance.getEntriesByType && performance.getEntriesByType('navigation')[0]?.type === 'back_forward')) {
			      location.reload();
			    }
			 });
		</script>
	</body>
	
</html>