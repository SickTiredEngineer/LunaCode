<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>문의 작성</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/community/post_write.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/js/community/post_write.js"></script>

	</head>
	
	<body>

		<c:set var="isModify" value="${isModify}"/>

		<c:choose>
			<c:when test="${isModify}">
				<c:set var="formAction" value="ModifyPostForm"/>
				<c:set var="submitLabel" value="수정 완료"/>
				<c:set var="pageTitle" value="게시글 수정"/>
				
				<c:set var="postTitle" value="${post.title}"/>
				<c:set var="postContent" value="${post.content}"/>
<%-- 				<c:set var="postTitle" value="${post.title}"/> --%>
			</c:when>
			
			<c:otherwise>
				<c:set var="formAction" value="PostWrite"/>
				<c:set var="submitLabel" value="등록"/>
				<c:set var="pageTitle" value="게시글 작성"/>
			</c:otherwise>
		</c:choose>

		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row justify-content-start top-text-margin">
					<h2 class="main-text">${pageTitle}</h2>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">

						<jsp:include page="/WEB-INF/views/community/community_sidebar.jsp"/>
						
						<div class="d-flex flex-column">
						
							<form action="${formAction}" method="post" class="d-flex flex-column write_main_layout">

									<c:if test="${isModify}">
								    	<input type="hidden" name="post_idx" value="${post.post_idx}">
								    	<input type="hidden" name="author_idx" value="${post.author_idx}">
								    </c:if>
							
									<div class="d-flex flex-row write-layout">
											<p class="info-text" >제목</p>
											<input type="text" name="title" class="common-input-form form-size" value="${postTitle}">
									</div>
									
									<div class="horizontal-line"></div>
								
									<div class="d-flex flex-row write-layout-content">
											<p class="info-text-content">내용</p>
											<textarea name="content" rows="10" cols="50" class="common-input-form">${postContent}</textarea>
									</div>
									
									<div class="horizontal-line"></div>
									
<!-- 									<div class="d-flex flex-row  write-layout"> -->
<!-- 											<p class="info-text">첨부 파일</p> -->
<!-- 											<input type="text" class="common-input-form form-size"> -->
<!-- 											<a href="#" class="positive-button button-detail">파일 선택</a> -->
<!-- 									</div> -->
									
<!-- 									<div class="d-flex flex-row"> -->
<!-- 											<a href="#" class="positive-button button-detail add-attachment-bt">첨부 파일 추가</a> -->
<!-- 									</div> -->

<!-- 									<div id="attachement_area"> -->
<!-- 										<div class="d-flex flex-row"> -->
<!-- 											<p class="info-text-attachment">첨부파일 추가(첨부파일 업로드는 10MB 이하의 파일 3개만 가능합니다.)</p>	 -->
<!-- 										</div> -->

<!-- 										<div class="d-flex flex-row input-form-layout file-input-box"> -->
<!-- 											<input type="file" name="certificate_01" id="certificate_01" class="input-form-size common-input-form" style="display:none;"> -->
<!-- 											<input type="text" id="certificate_01_name" class="input-form-size common-input-form" placeholder="선택된 파일 없음" readonly> -->
<!-- 											<label for="certificate_01"> -->
<!-- 												<div class="positive-button attach-bt-margin">파일 선택</div> -->
<!-- 											</label> -->
<!-- 										</div> -->
<!-- 									</div> -->

									
									<div class="d-flex flex-row button-container">
										<button type="button" onclick="history.back()" class="negative-button">돌아가기</button>
										<button type="submit" class="positive-button">${submitLabel}</button>
									</div>

								</form>
							
						
								

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
