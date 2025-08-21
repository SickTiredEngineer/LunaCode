<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>


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
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article>
				
				<div class="d-flex flex-row justify-content-between top-layout">
				
					<div class="d-flex justify-content-center">
						<h2 class="main-text">커뮤니티</h2>
					</div>
					
					<div class="d-flex flex-row">
						<div class="d-flex flex-row justify-content-center search-form-layout search-form-size">
							<input type="text" class="search-form-input" maxlength="10">
							<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
						</div>
					</div>
					
					<a href="PostWrite" class="positive-button write-button-size">게시글 작성</a>
					
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
									
									<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
									<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_delete.png" class="edit-icon"></a>
	
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
	</body>
	
</html>