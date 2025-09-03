<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

	<head>
		<title>공통 코드 관리</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_group_code_list.css" rel="stylesheet">
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
						<h2 class="main-text">공통 코드 관리</h2>
						
						<div class="d-flex flex-row justify-content-center">
							
								<c:set var="qParam" value=""/>
								<c:if test="${not empty q}">
									<c:set var="qParam" value="&amp;q=${fn:escapeXml(q)}"/>
								</c:if>
											
						<form action=ApCommonCodeList class="d-flex flex-row justify-content-center search-form-layout search-form-size">
							<input type="text" name="q" class="search-form-input" maxlength="10" placeholder="공통 코드 검색" value="${q}">
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
							<h3 class="text-name info-text">코드</h3>
							<h3 class="text-name info-text">코드값</h3>
							<h3 class="text-name info-text">그룹</h3>
							<h3 class="text-date info-text">등록일</h3>
							<h3 class="text-state info-text">사용 여부</h3>
							<h3 class="text-name info-text">등록자 ID</h3>
						</div>
							
							
						<div class="d-flex flex-column list-layout">
	
							<!-- ============================== -->
							
							<c:forEach items="${codeList}" var="code" varStatus="status">
								<div class="d-flex flex-row align-items-center list-item-root">
									<a href="ApCommonCodeDetail?common_idx=${code.common_idx}" class="d-flex flex-row align-items-center list-item-layout">
										<h3 class="text-no">${status.index + 1}</h3>
										<h3 class="text-name">${code.code}</h3>
										<h3 class="text-name">${code.code_label}</h3>
										<h3 class="text-name">${code.group_code}</h3>
<!-- 										<h3 class="text-name">그룹01</h3> -->
										<h3 class="text-date">
											<fmt:formatDate value="${code.create_date}" pattern="yyyy.MM.dd"/>
										</h3>
										
										<h3 class="text-state">
											<c:choose>
												<c:when test="${code.using_status}">사용</c:when>
												<c:otherwise>미사용</c:otherwise>	
											</c:choose>
										</h3>
										<h3 class="text-name">${code.creater_id}</h3>
									</a>
									
									<a href="ModifyCommonCode?common_idx=${code.common_idx}" onclick="return confirm('수정 하시겠습니까?');"><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
									
								</div>
								
							</c:forEach>
							
						</div>
						
						<div class="d-flex flex-row justify-content-center page-selector-layout">
						
							<button type="button" class="page-arrow" onclick="location.href='ApCommonCodeList?pageNum=${pageVo.pageNum-1}${qParam}'" <c:if test="${pageVo.pageNum eq 1}">disabled</c:if>>&lt;</button> 
							
							<c:forEach var="i" begin="${pageVo.startPage }" end="${pageVo.endPage }">
								<c:choose>
									<c:when test="${i eq pageVo.pageNum }">
										<button type="button" class="page-selector" onclick="location.href='ApCommonCodeList?pageNum=${i}${qParam}'" disabled="disabled"><strong>${i}</strong></button>
									</c:when>
									<c:otherwise>
										<button type="button" class="page-selector" onclick="location.href='ApCommonCodeList?pageNum=${i}${qParam}'">${i}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button type="button" class="page-arrow" onclick="location.href='ApCommonCodeList?pageNum=${pageVo.pageNum+1}${qParam}'" 
							<c:if test="${pageVo.pageNum eq pageVo.maxPage }">disabled</c:if>>&gt;</button>
					
						</div>
						
						<br>
						
						<div class="d-flex justify-content-end">
							<a href="ApCommonCodeWriter" class="positive-button add-group-bt">코드 추가</a>
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