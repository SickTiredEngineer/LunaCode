<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>FAQ 작성</title>
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
					<c:set var="formAction" value="ModifyFaqForm"/>
					<c:set var="submitLabel" value="수정 완료"/>
					<c:set var="pageTitle" value="FAQ 수정"/>
					
					<c:set var="noticeSubject" value="${faqVo.faq_subject}"/>
					<c:set var="noticeContent" value="${faqVo.faq_content}"/>
					<c:set var="category" value="${faqVo.category}"/>
				</c:when>
				
				<c:otherwise>
					<c:set var="formAction" value="FaqWriteForm"/>
					<c:set var="submitLabel" value="등록"/>
					<c:set var="pageTitle" value="FAQ 작성"/>
				</c:otherwise>
			</c:choose>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-text-margin">
					<h2 class="main-text">${pageTitle}</h2>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
					
						<jsp:include page="/WEB-INF/views/support_center/support_center_sidebar.jsp"/>
						
						<form action="${formAction}" method="post" class="d-flex flex-column">
						
							<c:if test="${isModify}">
						    	<input type="hidden" name="faq_idx" value="${faqVo.faq_idx}">
						    </c:if>
						
							<div class="d-flex flex-column write_main_layout">
								
								<div class="horizontal-line"></div>
							
								<div class="d-flex flex-row write-layout">
									<p class="info-text">FAQ 제목</p>
									<input type="text" name="faq_subject" class="common-input-form form-size" value="${noticeSubject}">
								</div>
									
								<div class="horizontal-line"></div>
								
								<div class="d-flex flex-row write-layout">
									<p class="info-text">카테고리</p>
									
									<select  name="category" class="category info-text">
										<option value="결제" ${category == '결제' ? 'selected' : ''}>결제</option>
										<option value="환불" ${category == '환불' ? 'selected' : ''}>환불</option>
										<option value="강의" ${category == '강의' ? 'selected' : ''}>강의</option>
										<option value="계정" ${category == '계정' ? 'selected' : ''}>계정</option>
										<option value="에러" ${category == '에러' ? 'selected' : ''}>에러</option>
										<option value="기타" ${category == '기타' ? 'selected' : ''}>기타</option>
									</select>
									
								</div>

								
								<div class="horizontal-line"></div>
								
								<div class="d-flex flex-row write-layout-content">
										<p class="info-text-content">내용</p>
										<textarea rows="10" cols="50" name="faq_content" class="common-input-form">${noticeContent}</textarea>
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
	
	</body>
	
</html>
