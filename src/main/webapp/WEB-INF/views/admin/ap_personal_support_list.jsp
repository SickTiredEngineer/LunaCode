<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

	<head>
		<title>1:1 문의 목록</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_personal_support_list.css" rel="stylesheet">
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
						<h2 class="main-text">1:1 문의 관리</h2>
						
						<c:set var="qParam" value=""/>
						<c:if test="${not empty q}">
							<c:set var="qParam" value="&amp;q=${fn:escapeXml(q)}"/>
						</c:if>			
											
						<form action="ApPersonalSupportList" class="d-flex flex-row justify-content-center search-form-layout search-form-size">
							<input type="text" name="q" class="search-form-input" maxlength="10" placeholder="회원 ID로 검색" value="${q}">
							<input type="image" type="submit" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
						</form>
					</div>

				</div>
				
				<div class="d-flex flex-row">
					
					<div class="d-flex flex-column justify-content-start">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
					</div>
					
					
						
					<div class="d-flex flex-column list-main-layout">
					
						<div class="d-flex flex-row align-items-center list-info-layout">
							<h3 class="text-no info-text">문의 번호</h3>
							
							<h3 class="text-subject info-text">문의 제목</h3>
							<h3 class="text-id info-text">회원 ID</h3>
							<h3 class="text-date info-text">문의 날짜</h3>
							<h3 class="text-state info-text">답변 상태</h3>
						</div>
							
							
						<div class="d-flex flex-column list-layout">
	
							<!-- ============================== -->
							<c:forEach items="${queryList}" var="query" varStatus="status">
							
								<div class="d-flex flex-row align-items-center list-item-root">
									<a href="ApPersonalSupportDetail?query_idx=${query.query_idx}" class="d-flex flex-row align-items-center list-item-layout">
										<h3 class="text-no">${status.index + 1}</h3>
										<h3 class="text-subject">${query.query_subject}</h3>
										<h3 class="text-id">${query.user_id}</h3>
										<h3 class="text-date">
											<fmt:formatDate value="${query.query_date}" pattern="yyyy.MM.dd"/>
										</h3>
										<h3 class="text-state">
											<c:choose>
												<c:when test="${query.answer_status}">답변</c:when>
												<c:otherwise>미답변</c:otherwise>
											</c:choose>
										</h3>
									</a>
								</div>

							</c:forEach>
							
							
						</div>
						
						<div class="d-flex flex-row justify-content-center page-selector-layout">
							
							<button type="button" class="page-arrow" onclick="location.href='Community?pageNum=${pageVo.pageNum-1}${qParam}'" <c:if test="${pageVo.pageNum eq 1}">disabled</c:if>>&lt;</button> 
							
							<c:forEach var="i" begin="${pageVo.startPage }" end="${pageVo.endPage }">
								<c:choose>
									<c:when test="${i eq pageVo.pageNum }">
										<button type="button" class="page-selector" onclick="location.href='Community?pageNum=${i}${qParam}'" disabled="disabled"><strong>${i}</strong></button>
									</c:when>
									<c:otherwise>
										<button type="button" class="page-selector" onclick="location.href='Community?pageNum=${i}${qParam}'">${i}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button type="button" class="page-arrow" onclick="location.href='Community?pageNum=${pageVo.pageNum+1}${qParam}'" 
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