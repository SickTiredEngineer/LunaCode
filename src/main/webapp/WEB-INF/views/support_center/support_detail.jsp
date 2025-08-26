<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 


<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>문의 자세히 보기</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/support_center/support_detail.css" rel="stylesheet">

	</head>
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-text-margin">
					<h2 class="main-text">문의 상세내용</h2>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
					
						<jsp:include page="/WEB-INF/views/support_center/support_center_sidebar.jsp"/>
						
						<div class="d-flex flex-column">
						
							<div class="d-flex flex-column detail-main-layout qna_layout">
							
							
								
								<div class="d-flex flex-row child-layout">
									<p class="info-text">문의 카테고리</p>
									<p>${cqvo.query_category}</p>
									
									<c:if test="${not cq.answer_status}">
										<div class="d-flex flex-row">
											<a href="ModifySupport?query_idx=${cqvo.query_idx}"><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
											
											<form action="DeleteSupport" method="post" class="align-form">
												<input type="hidden" name="query_idx" value="${cqvo.query_idx}">
												<input type="image" onclick="return confirm('정말 해당 문의사항을 삭제 하시겠습니까?');" src="${pageContext.request.contextPath }/resources/icons/icon_delete.png" class="edit-icon">
											</form>
	
										</div>									
									</c:if>
								</div>
								
								<div class="horizontal-line"></div>
							
									<div class="d-flex flex-row child-layout">
											<p class="info-text">문의 제목</p>
											<p>${cqvo.query_subject}</p>
									</div>
									
									<div class="horizontal-line"></div>
									
									<div class="d-flex flex-row child-layout">
											<p class="info-text">문의 날짜</p>
											<p>
												<fmt:formatDate value="${cqvo.query_date}" pattern="yyyy.MM.dd"/>
											</p>

									</div>
									
									<div class="horizontal-line"></div>
								
									<div class="d-flex flex-row child-layout-content">
											<p class="info-text-content">문의 내용</p>
<%-- 											<textarea rows="10" cols="50" class="common-input-form" readonly="readonly">${cqvo.query_content}</textarea> --%>
											<p>${cqvo.query_content}</p>
											
									</div>
									
								
								</div>
								
								<br>
								
								<c:if test="${cqvo.answer_status}">
								
								
									<div class="d-flex flex-column detail-main-layout">
									
										<div class="d-flex flex-row child-layout-content">
												<p class="info-text-content">답변 제목</p>
												<p>${answerVo.answer_subject}</p>
										</div>
										
										<div class="horizontal-line"></div>
										
										<div class="d-flex flex-row child-layout-content">
												<p class="info-text-content">답변 날짜</p>
												<p>
													<fmt:formatDate value="${answerVo.answer_date}" pattern="yyyy.MM.dd"/>
												</p>
										</div>
										
										<div class="horizontal-line"></div>
										
										<div class="d-flex flex-column child-layout-content">
												<p class="info-text-content">답변 내용</p>
												<p>${answerVo.answer_content}</p>
										</div>
											
									</div>
								</c:if>

								<div class="d-flex flex-row button-container">
									<button type="button" onclick="history.back()" class="negative-button">돌아가기</button>
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
