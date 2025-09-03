<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

	<head>
		<title>관리자 페이지</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_member_list.css" rel="stylesheet">
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
					
						<h2 class="main-text">회원 관리</h2>
						
						<div class="d-flex flex-row justify-content-center">
								<!-- 검색 정보 -->
							<c:set var="qParam" value=""/>
							<c:if test="${not empty q}">
								<c:set var="qParam" value="&amp;q=${fn:escapeXml(q)}"/>
							</c:if>			
										
							<form action=ApMemberList class="d-flex flex-row justify-content-center search-form-layout search-form-size">
								<input type="text" name="q" class="search-form-input" maxlength="10" placeholder="회원 ID로 검색" value="${q}">
								<input type="image" type="submit" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
							</form>
						</div>
						
					</div>

				</div>
				
				
				<div class="d-flex flex-row">
					
					<div class="d-flex flex-column justify-content-start">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
					</div>
						
					<div class="d-flex flex-column list-main-layout">
					
						<div class="d-flex flex-row align-items-center list-info-layout">
								<h3 class="text-no info-text">No.</h3>
								<h3 class="text-id info-text">ID</h3>
								<h3 class="text-name info-text">이름</h3>
								<h3 class="text-name info-text">닉네임</h3>
								<h3 class="text-type info-text">회원 타입</h3>
							</div>
							
							
						<div class="d-flex flex-column list-layout">
	
							<!-- ============================== -->
							
							<c:forEach items="${memberList}" var="member" varStatus="status">
							
								<div class="d-flex flex-row align-items-center list-item-root">
									<a href="ApMemberDetail?idx=${member.idx}" class="d-flex flex-row align-items-center list-item-layout">
										<h3 class="text-no">${status.index + 1}</h3>
										<h3 class="text-id">${member.user_id}</h3>
										<h3 class="text-name">${member.user_name}</h3>
										<h3 class="text-name">${member.nickname}</h3>
										<h3 class="text-type">
											<c:choose> 
												<c:when test="${member.member_type eq 'MB01'}">관리자</c:when>
												<c:when test="${member.member_type eq 'MB02'}">강사 회원</c:when>
												<c:when test="${member.member_type eq 'MB03'}">일반 회원</c:when>
												<c:when test="${member.member_type eq 'MB04'}">탈퇴 회원</c:when>
												<c:otherwise>일반회원</c:otherwise>
											</c:choose>
										</h3>
									</a>
								</div>
							
							</c:forEach>

						</div>
						
						<div class="d-flex flex-row justify-content-center page-selector-layout">
						
							<button type="button" class="page-arrow" onclick="location.href='ApMemberList?pageNum=${pageVo.pageNum-1}${qParam}'" <c:if test="${pageVo.pageNum eq 1}">disabled</c:if>>&lt;</button> 
							
							<c:forEach var="i" begin="${pageVo.startPage }" end="${pageVo.endPage }">
								<c:choose>
									<c:when test="${i eq pageVo.pageNum }">
										<button type="button" class="page-selector" onclick="location.href='ApMemberList?pageNum=${i}${qParam}'" disabled="disabled"><strong>${i}</strong></button>
									</c:when>
									<c:otherwise>
										<button type="button" class="page-selector" onclick="location.href='ApMemberList?pageNum=${i}${qParam}'">${i}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button type="button" class="page-arrow" onclick="location.href='ApMemberList?pageNum=${pageVo.pageNum+1}${qParam}'" 
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