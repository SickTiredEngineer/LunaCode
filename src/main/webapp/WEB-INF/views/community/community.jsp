<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<html>

	<head>
		<title>커뮤니티</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/community/community.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
			
			<!-- 자기 자신 -->
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="me"/>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ADMIN')">
		    	<c:set var="isAdmin" value="true"/>
		    </sec:authorize>
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article>
				
				<div class="d-flex flex-column justify-content-center top-layout">
					
					<div class="d-flex">
						<h2 class="main-text" style="width: 100%;">커뮤니티</h2>
					</div>
										
					<div class="d-flex flex-row justify-content-center search-form-layout search-form-size">
						<input type="text" class="search-form-input" maxlength="10">
						<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
					</div>
						
					
					<div class="d-flex flex-column justify-content-between">

						<div class="d-flex flex-row justify-content-end">
							<sec:authorize access="isAuthenticated()">
								<a href="PostWrite" class="positive-button write-button-size">게시글 작성</a>
							</sec:authorize>
						</div>
					
					</div>
					
				</div>
				
				
				<div class="d-flex flex-row">
					
					<jsp:include page="/WEB-INF/views/community/community_sidebar.jsp"/>

					<div class="d-flex flex-column list-main-layout">
					
						<div class="d-flex flex-row align-items-center list-info-layout">
								<h3 class="text-no info-text">No.</h3>
								<h3 class="text-subject info-text">제목</h3>
								<h3 class="text-writer info-text">작성자</h3>
								<h3 class="text-date info-text">작성일</h3>
								<h3 class="text-view-count info-text">조회수</h3>
						</div>
							
							
							
						<div class="d-flex flex-column list-layout">
	
							<!-- ============================== -->
							<!-- Example Start -->

							<c:forEach var="post" items="${postList}" varStatus="status">
								<div class="d-flex flex-row align-items-center list-item-root">
									<a href="PostDetail?post_idx=${post.post_idx}" class="d-flex flex-row align-items-center list-item-layout">
										<h3 class="text-no">${status.index + 1}</h3>
										<h3 class="text-subject">${post.title}  [${post.cnt_comment}]</h3>
										<h3 class="text-writer">${post.author}</h3>
										<h3 class="text-date">
											<fmt:formatDate value="${post.created_date}" pattern="yyyy.MM.dd"/>
										</h3>
										<h3 class="text-view-count">${post.view_count}</h3>
									</a>
									
									<c:if test="${me.idx == post.author_idx}">
										<a href="ModifyPost?post_idx=${post.post_idx}" onclick="return confirm('수정 하시겠습니까?');"><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
									</c:if>
									
									<c:if test="${isAdmin or (me ne null and me.idx == post.author_idx)}">
										<form action="DeletePost" method="post" class="align-form">
											<input type="hidden" name="post_idx" value="${post.post_idx}">
											<input type="image" onclick="return confirm('정말 해당 글을 삭제 하시겠습니까?');" src="${pageContext.request.contextPath }/resources/icons/icon_delete.png" class="edit-icon">
										</form>
									</c:if>

								</div>
							</c:forEach>

							
						</div>
						
						<div class="d-flex flex-row justify-content-center page-selector-layout">
							
							<a class="page-selector">&lt;</a>
							
							<a class="page-selector">1</a>
							<a class="page-selector">2</a>
							<a class="page-selector">3</a>
							<a class="page-selector">4</a>
							<a class="page-selector">5</a>
							
							<a class="page-selector">&gt;</a>
					
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