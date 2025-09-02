<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 강의 상점 JSP 페이지 -->

<html>
<head>
    <title>강의 상점</title>
    <meta charset="UTF-8">
    <jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
    <link href="${pageContext.request.contextPath}/resources/css/page/class_shop/class_display_stand.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/page/community/community.css" rel="stylesheet">
</head>
<body>
    <div class="page-base container">
        <!-- 헤더 -->
        <header>
            <jsp:include page="/WEB-INF/views/inc/header.jsp"/>
        </header>

        <article class="container my-5">
            <div class="d-flex flex-row justify-content-center">
                <h1 class="shop-logo-text">강의 상점</h1>
            </div>
            
            <!-- 검색 정보 -->
			<c:set var="qParam" value=""/>
			<c:if test="${not empty q}">
				<c:set var="qParam" value="&amp;q=${fn:escapeXml(q)}"/>
			</c:if>		
				
			<c:set var="catParam" value=""/>
			<c:if test="${not empty category}">
				<c:set var="qParam" value="&amp;q=${fn:escapeXml(category)}"/>
			</c:if>	
			
			
			
								
			<form action="ClassDisplayStand" class="d-flex flex-row justify-content-center search-form-layout search-form-size" style="align-self: center;">
				<input type="text" name="q" class="search-form-input" maxlength="10" placeholder="강의명으로 검색" value="${q}">
				<input type="image" type="submit" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
			</form>
            
            
            <jsp:include page="/WEB-INF/views/inc/class_category.jsp"/>
            <br>

            <!-- 강의 리스트 -->
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <c:forEach var="classVo" items="${classes}">
                    <div class="col">
                        <div class="card h-100 text-center class-card">
                            <img src="${pageContext.request.contextPath}/resources/class_thumbnails/${classVo.class_thumbnail}" 
                                 class="card-img-top" style="max-height: 250px; height: 250px;"/>
                            <div class="card-body">
                                <h5 class="card-title">${classVo.class_title}</h5>
                                <%-- <p class="card-text">강사: ${classVo.instructorName}</p> --%>
                                <p class="text-muted"><strong>${classVo.class_level}</strong></p>
                                <p class="text-muted"><strong>${classVo.class_price}원</strong></p>
                            </div>
                            <div class="card-footer bg-white border-0">
                                <a href="${pageContext.request.contextPath}/ClassDetail?class_idx=${classVo.class_idx}" 
                                   class="btn btn-outline-secondary w-100" id="applyBtn"> 
                                    수강신청 하러가기
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="d-flex flex-row justify-content-center page-selector-layout">
						
				<button type="button" class="page-selector" onclick="location.href='ClassDisplayStand?pageNum=${pageVo.pageNum-1}${qParam}${catParam}'" <c:if test="${pageVo.pageNum eq 1}">disabled</c:if>>&lt;</button> 
				
				<c:forEach var="i" begin="${pageVo.startPage }" end="${pageVo.endPage }">
					<c:choose>
						<c:when test="${i eq pageVo.pageNum }">
							<button type="button" class="page-selector" onclick="location.href='ClassDisplayStand?pageNum=${i}${qParam}${catParam}'" disabled="disabled"><strong>${i}</strong></button>
						</c:when>
						<c:otherwise>
							<button type="button" class="page-selector" onclick="location.href='ClassDisplayStand?pageNum=${i}${qParam}${catParam}'">${i}</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<button type="button" class="page-selector" onclick="location.href='ClassDisplayStand?pageNum=${pageVo.pageNum+1}${qParam}${catParam}'" 
				<c:if test="${pageVo.pageNum eq pageVo.maxPage }">disabled</c:if>>&gt;</button>
		
			</div>

        </article>

        <!-- 푸터 -->
        <footer>
            <jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
        </footer>
    </div>
</body>
</html>
