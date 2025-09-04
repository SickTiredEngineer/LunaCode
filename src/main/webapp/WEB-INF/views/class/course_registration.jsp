<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>CourseRegistration</title>
	<jsp:include page="/WEB-INF/views/inc/common_head.jsp" />
	<link href="${pageContext.request.contextPath}/resources/css/page/class/course_registration.css" rel="stylesheet" />
	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />
</head>
<body>
	<div class="page-base container">

		<!-- 헤더 -->
		<header>
			<jsp:include page="/WEB-INF/views/inc/header.jsp" />
		</header>
		
		<article>
			<%-- 페이지 제목 --%>
			<div class="title-layout">
				<h2 class="page-main-title">강의 목록</h2>
			</div>

			<div class="main-wrapper">
			
				<%-- 좌측 공통 카테고리 (content-layout 밖으로 이동) --%>
				<aside class="common-category">
					<a href="ClassRegist" class="common-category-element">강의 등록</a>
<!-- 					<a href="Curriculum" class="common-category-element">커리큘럼</a> -->
<!-- 					<a href="ClassStudentManagement" class="common-category-element">학생 관리</a> -->
				</aside>
				
				<%-- 메인 콘텐츠 레이아웃 --%>
				<div class="content-layout">
				
					<%-- 상단 컨트롤 영역 ("전체보기", "강의 등록") --%>
					<div class="top-controls">
						<a href="#" class="view-all-link">
							<span class="dot"></span> 전체보기
						</a>
						<div class="register-action">
							<a href="ClassRegist" class="positive-button long-button">강의 등록</a>
						</div>
					</div>
				
						<%-- 강의 리스트 --%>
						<div class="list-section">	
							<ul class="lecture-list">
							    <c:forEach var="lecture" items="${classList}">
							        <li class="lecture-item">
							            <span class="lecture-title">${lecture.class_title}</span>
							            <div class="item-actions">
							                <a href="deleteClass?classId=${lecture.class_idx}" class="negative-button" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
							                <a href="${pageContext.request.contextPath}/Curriculum/${lecture.class_idx}" class="positive-button">수정</a>
							            </div>
							        </li>
							    </c:forEach>
							</ul>
						</div>
		
					    <div class="d-flex flex-row justify-content-center page-selector-layout">
									
							<button type="button" class="page-arrow" onclick="location.href='ClassDisplayStand?pageNum=${pageVo.pageNum-1}'" <c:if test="${pageVo.pageNum eq 1}">disabled</c:if>>&lt;</button> 
							
							<c:forEach var="i" begin="${pageVo.startPage }" end="${pageVo.endPage }">
								<c:choose>
									<c:when test="${i eq pageVo.pageNum }">
										<button type="button" class="page-selector" onclick="location.href='ClassDisplayStand?pageNum=${i}'" disabled="disabled"><strong>${i}</strong></button>
									</c:when>
									<c:otherwise>
										<button type="button" class="page-selector" onclick="location.href='ClassDisplayStand?pageNum=${i}'">${i}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button type="button" class="page-arrow" onclick="location.href='ClassDisplayStand?pageNum=${pageVo.pageNum+1}'" 
							<c:if test="${pageVo.pageNum eq pageVo.maxPage }">disabled</c:if>>&gt;</button>
					
						</div>
				
				</div>
				
			</div>
		</article>

		<!-- 푸터 -->
		<footer>
			<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
		</footer>
		
	</div>
</body>
</html>
