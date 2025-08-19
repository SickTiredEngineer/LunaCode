<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>게시글 세부내용</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/community/post_detail.css" rel="stylesheet">

	</head>
	
	<body>
		
		<div class="page-base container">
			
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
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_edit.png">
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_delete.png">	
										</div>	
									</div>
									
									<div class="d-flex flex-row content-layout">
										<p class="subject-text">${post.title}</p>
										
									</div>
									
									<div class="horizontal-line"></div>
								
									<div class="d-flex flex-row content-layout">
										<pre class="post-content">${post.content}</pre>
									</div>
									
									<div class="horizontal-line"></div>
									
									<div class="d-flex flex-row content-layout">
										<p class="info-text">첨부 파일1: UUID + 날짜 + 파일이름</p>
										<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a>
									</div>
									
									<div class="d-flex flex-row content-layout">
										<p class="info-text">첨부 파일2: UUID + 날짜 + 파일이름</p>
										<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a>
									</div>
									
									<div class="d-flex flex-row content-layout">
										<p class="info-text">첨부 파일3: UUID + 날짜 + 파일이름</p>
										<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a>
									</div>
									
									<div class="horizontal-line"></div>
								
									<div class="content-layout">
										<div class="d-flex justify-content-center">
											<img class="great-button" alt="..." src="${pageContext.request.contextPath}/resources/icons/icon_great.png">
										</div>
										
										<p class="greate-text">100</p>
									</div>
								
							</div>

							<!-- Comment Section -->
							<div class="d-flex flex-column comment-root-layout">
							
								<!-- Comment Input Section -->
								<div class="d-flex flex-column">
									<p class="info-text">댓글 작성</p>			
									<!-- TODO: JS로 댓글 최대글짜수 제한걸기 -->
									<textarea rows="3" cols="5" class="common-input-form comment-input-layout"></textarea>
									
									<div class="d-flex button-container">
										<a href="PostDetail" class="positive-button">댓글 작성</a>
									</div>
								</div>
								
								
								<div class="horizontal-line"></div>
								
								<div class="d-flex flex-row">
									
									<div class="d-flex flex-column writer-layout">
										<p class="comment-writer-text">닉네임(1)</p>
										
										<div class="d-flex flex-row">
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_edit.png">
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_delete.png">	
										</div>	

									</div>

									<textarea rows="3" cols="5" class="common-input-form comment-layout" readonly="readonly">댓글내용댓글내용댓글내용
댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용							
									</textarea>
									
								</div>
								
								<div class="horizontal-line comment-line-margin"></div>
								
								
								<div class="d-flex flex-row">
									
									<div class="d-flex flex-column writer-layout">
										<p class="comment-writer-text">닉네임(2)</p>
										
										<div class="d-flex flex-row">
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_edit.png">
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_delete.png">	
										</div>	

									</div>

									<textarea rows="3" cols="5" class="common-input-form comment-layout" readonly="readonly">댓글내용댓글내용댓글내용
댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용							
									</textarea>
									
								</div>
								
								
								<div class="horizontal-line comment-line-margin"></div>
								
								
								<div class="d-flex flex-row">
									
									<div class="d-flex flex-column writer-layout">
										<p class="comment-writer-text">닉네임(3)</p>
										
										<div class="d-flex flex-row">
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_edit.png">
											<img class="icon-button-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_delete.png">	
										</div>	

									</div>

									<textarea rows="3" cols="5" class="common-input-form comment-layout" readonly="readonly">댓글내용댓글내용댓글내용
댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용							
									</textarea>
									
								</div>
								
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
