<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>게시글 세부내용</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/community/post_detail.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/js/community/post_detail.js"></script>
	</head>
	
	<body>

		
		
		
		<div id="main_layout" class="page-base container" 
			data-post-idx="${post.post_idx}"
		>
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row align-items-center justify-content-start top-layout">
					<h2 class="main-text">게시글 세부</h2>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">

						<jsp:include page="/WEB-INF/views/community/community_sidebar.jsp"/>
						
						<div class="d-flex flex-column">
						
							<div class="d-flex flex-column main_layout">
									
									<div class="d-flex flex-row justify-content-between tmi-layout">
										<p class="tmi-text">작성자: ${post.author}</p>
										<p class="tmi-text">조회수: ${post.view_count}</p>
										
										<div class="d-flex flex-row">
											
											<c:if test="${post.author_idx eq me.idx}">
												<a href="ModifyPost?post_idx=${post.post_idx}" onclick="return confirm('수정 하시겠습니까?');"><img class="edit-icon" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_edit.png"></a>
											</c:if>
											
											<c:if test="${isAdmin or post.author_idx eq me.idx}">
												<form action="DeletePost" method="post" class="align-form">
													<input type="hidden" name="post_idx" value="${post.post_idx}">
													<input type="image" onclick="return confirm('정말 해당 글을 삭제 하시겠습니까?');" src="${pageContext.request.contextPath }/resources/icons/icon_delete.png" class="edit-icon">
												</form>
											</c:if>
												
										</div>	
									</div>
									
									<div class="d-flex flex-row content-layout">
										<p class="subject-text">${post.title}</p>
										
									</div>
									
									<div class="horizontal-line"></div>
								
									<div class="d-flex flex-row content-layout">
										<pre class="post-content">${post.content}</pre>
									</div>
									
									<br>
									
<!-- 									<div class="d-flex flex-row content-layout"> -->
<!-- 										<p class="info-text">첨부 파일1: UUID + 날짜 + 파일이름</p> -->
<!-- 										<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a> -->
<!-- 									</div> -->
									
<!-- 									<div class="d-flex flex-row content-layout"> -->
<!-- 										<p class="info-text">첨부 파일2: UUID + 날짜 + 파일이름</p> -->
<!-- 										<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a> -->
<!-- 									</div> -->
									
<!-- 									<div class="d-flex flex-row content-layout"> -->
<!-- 										<p class="info-text">첨부 파일3: UUID + 날짜 + 파일이름</p> -->
<!-- 										<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a> -->
<!-- 									</div> -->
								
								
									<div class="content-layout">
										<div class="d-flex justify-content-center">
										
										<sec:authorize access="isAuthenticated()">
									    	<img id="greate_bt" class="great-button" alt="..." src="${pageContext.request.contextPath}/resources/icons/icon_great.png">
									    </sec:authorize>
									    
										<sec:authorize access="isAnonymous()">
									    	<img id="" class="great-button" alt="..." src="${pageContext.request.contextPath}/resources/icons/icon_great.png">
									    </sec:authorize>
										
										</div>
										
										<p id="like_text" class="greate-text">0</p>
									</div>
								
							</div>

							<!-- Comment Section -->
							<div class="d-flex flex-column comment-root-layout">
							
								<!-- Comment Input Section -->
								<div class="d-flex flex-column">
									<p class="info-text">댓글 작성</p>			
									<!-- TODO: JS로 댓글 최대글짜수 제한걸기 -->
									<textarea id="input_comment" rows="3" cols="5" class="common-input-form comment-input-layout"></textarea>
									
									<div class="d-flex button-container">
										<button id="write_comment_bt" type="button" class="positive-button">댓글 작성</button>
									</div>
								</div>
								
								
								<div class="horizontal-line"></div>
								
								<c:forEach items="${comments}" var="comment">
									<div class="d-flex flex-row">
									
										<div class="d-flex flex-column writer-layout">
											<p class="comment-writer-text">${comment.nickname}</p>
											
											<div class="d-flex flex-row">
												<img class="icon-button-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_edit.png">
												<img class="icon-button-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_delete.png">	
											</div>	
	
										</div>
	
										<textarea rows="3" cols="5" class="common-input-form comment-layout" readonly="readonly">${comment.content}</textarea>
									</div>

								</c:forEach>
								
								

								<div class="horizontal-line comment-line-margin"></div>
								
							</div>
							
							
						<!-- Page Selector Section -->
							<div class="d-flex flex-row justify-content-center page-selector-layout">
						
								<a class="page-selector">&lt;</a>
								
								<a class="page-selector">1</a>
								<a class="page-selector">2</a>
								<a class="page-selector">3</a>
								<a class="page-selector">4</a>
								<a class="page-selector">5</a>
								
								<a class="page-selector">&gt;</a>
				
							</div>
							
							
							<div class="d-flex button-container">
								<a href="Community" class="positive-button">돌아가기</a>
							</div>
		
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
