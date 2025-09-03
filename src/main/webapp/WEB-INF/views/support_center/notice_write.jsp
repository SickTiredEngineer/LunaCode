<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>공지 작성</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/support_center/support_write.css" rel="stylesheet">

	</head>
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<c:set var="isModify" value="${isModify}"/>

			<c:choose>
				<c:when test="${isModify}">
					<c:set var="formAction" value="ModifyNoticeForm"/>
					<c:set var="submitLabel" value="수정 완료"/>
					<c:set var="pageTitle" value="공지 수정"/>
					
					<c:set var="noticeSubject" value="${noticeVo.notice_subject}"/>
					<c:set var="noticeContent" value="${noticeVo.notice_content}"/>
	<%-- 				<c:set var="postTitle" value="${post.title}"/> --%>
				</c:when>
				
				<c:otherwise>
					<c:set var="formAction" value="NoticeWriteForm"/>
					<c:set var="submitLabel" value="등록"/>
					<c:set var="pageTitle" value="공지 작성"/>
				</c:otherwise>
			</c:choose>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-text-margin">
					<h2 class="main-text">${pageTitle}</h2>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
					
						<jsp:include page="/WEB-INF/views/support_center/support_center_sidebar.jsp"/>
						
						<form action="${formAction}" id="noticeForm" method="post" class="d-flex flex-column">
						
							<c:if test="${isModify}">
						    	<input type="hidden" name="notice_idx" value="${noticeVo.notice_idx}">
						    </c:if>
						
							<div class="d-flex flex-column write_main_layout">
								
								<div class="horizontal-line"></div>
							
									<div class="d-flex flex-row write-layout">
											<p class="info-text">공지 제목</p>
											<input type="text" placeholder="제목" name="notice_subject" class="common-input-form form-size" value="${noticeSubject}">
									</div>
									
									<div class="horizontal-line"></div>
								
									<div class="d-flex flex-row write-layout-content">
											<p class="info-text-content">내용</p>
											<textarea rows="10" placeholder="내용" cols="50" name="notice_content" class="common-input-form">${noticeContent}</textarea>
									</div>
									
									<div class="horizontal-line"></div>

								</div>
							
							<div class="d-flex flex-row button-container">
								<button type="button" onclick="history.back()" class="negative-button">돌아가기</button>
								<button type="submit" class="positive-button">${submitLabel}</button>
							</div>

						</form>	
					
					</div>
					
			
				</div>
			
				
			
			</article>
			
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
		
		<script type="text/javascript">
			/* 빈칸 검사 */
			$("#noticeForm").on("submit", function(e){
				e.preventDefault();
				
				let ok = true;
				
				$(this).find("input[type=text], textarea").each(function(){
				
			    	if(!$(this).val().trim()){
						alert($(this).attr("placeholder") + "을(를) 입력해주세요");
						$(this).focus();
						ok = false;
						return false; 
					}
				});
			
				if(ok) {
					this.submit();
				}
			});
		
		</script>
		
	</body>
	
</html>
