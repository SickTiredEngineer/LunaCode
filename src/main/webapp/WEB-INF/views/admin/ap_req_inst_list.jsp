<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

	<head>
		<title>관리자 페이지</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_req_inst_list.css" rel="stylesheet">
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
						<h2 class="main-text">강사 신청 관리</h2>
						
						<!-- 검색 정보 -->
						<c:set var="qParam" value=""/>
						<c:if test="${not empty q}">
							<c:set var="qParam" value="&amp;q=${fn:escapeXml(q)}"/>
						</c:if>			
											
						<form action="ApReqInstList" class="d-flex flex-row justify-content-center search-form-layout search-form-size">
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
							<h3 class="text-no info-text">No</h3>
							<h3 class="text-id info-text">ID</h3>
							<h3 class="text-name info-text">이름</h3>
							<h3 class="text-type info-text">회원 타입</h3>
							<h3 class="text-state info-text">인증 상태</h3>
						</div>
							
						<div class="d-flex flex-column list-layout">
	
							<!-- ============================== -->
							<c:forEach items="${instList}" var="inst" varStatus="status" >
							<div class="d-flex flex-row align-items-center list-item-root">
							
								<a href="ApReqInstDetail?idx=${inst.idx}" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">${status.index }</h3>
									<h3 class="text-id">${inst.user_id }</h3>
									<h3 class="text-name">${inst.user_name }</h3>
									<h3 class="text-type">
										<c:choose>
											<c:when test="${inst.member_type eq 'MB02'}">강사 회원</c:when>
											<c:when test="${inst.member_type eq 'MB03'}">일반 회원</c:when>
											<c:when test="${inst.member_type eq 'MB01'}">관리자</c:when>
											<c:when test="${inst.member_type eq 'MB04'}">x</c:when>
										</c:choose>
									</h3>
									<h3 class="text-state"> 
										<c:choose>
											<c:when test="${inst.accept_status eq 'IS01'}">승인</c:when>
											<c:when test="${inst.accept_status eq 'IS02'}">보류</c:when>
											<c:when test="${inst.accept_status eq 'IS03'}">거부</c:when>
										</c:choose>
									</h3>
								</a>
								
							</div>

							</c:forEach>
							
						</div>
						
						<div class="d-flex flex-row justify-content-center page-selector-layout">
						
							<button type="button" class="page-arrow" onclick="location.href='ApReqInstList?pageNum=${pageVo.pageNum-1}${qParam}'" <c:if test="${pageVo.pageNum eq 1}">disabled</c:if>>&lt;</button> 
							
							<c:forEach var="i" begin="${pageVo.startPage }" end="${pageVo.endPage }">
								<c:choose>
									<c:when test="${i eq pageVo.pageNum }">
										<button type="button" class="page-selector" onclick="location.href='ApReqInstList?pageNum=${i}${qParam}'" disabled="disabled"><strong>${i}</strong></button>
									</c:when>
									<c:otherwise>
										<button type="button" class="page-selector" onclick="location.href='ApReqInstList?pageNum=${i}${qParam}'">${i}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button type="button" class="page-arrow" onclick="location.href='ApReqInstList?pageNum=${pageVo.pageNum+1}${qParam}'" 
							<c:if test="${pageVo.pageNum eq pageVo.maxPage}">disabled</c:if>>&gt;</button>
					
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