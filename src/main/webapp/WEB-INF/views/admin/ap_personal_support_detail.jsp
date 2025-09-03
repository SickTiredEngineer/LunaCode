<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<html>

	<head>
		<title>1:1 문의 관리</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_personal_support_detail.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/admin_common.css" rel="stylesheet">

	</head>
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-text-margin">
					<h2 class="main-text">1:1 문의 관리</h2>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<div class="d-flex flex-column justify-content-start">
							<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
						</div>	
						
						
						<div class="d-flex flex-column">
						
							<div class="d-flex flex-column detail-main-layout qna_layout">

								<div class="d-flex flex-row child-layout">
									<p class="info-text">문의 카테고리</p>
									<p >${queryVo.query_category}</p>
								</div>
								
								<div class="horizontal-line"></div>
							
								<div class="d-flex flex-row child-layout">
									<p class="info-text">문의 제목</p>
									<p>${queryVo.query_subject}</p>
								</div>
								
								<div class="horizontal-line"></div>
								
								<div class="d-flex flex-row child-layout">
									<p class="info-text">문의자 ID</p>
									<p>${queryVo.user_id}</p>
									
									<div class="d-flex flex-row" style="margin-left: 200px">
										<p class="info-text">문의 날짜</p>
										<p class="">
											<fmt:formatDate value="${queryVo.query_date}" pattern="yyyy.MM.dd"/>
										</p>
									</div>
									
								</div>
								
								<div class="horizontal-line"></div>
							
								<div class="d-flex flex-column child-layout">
									<p class="info-text-content">문의 내용</p>
									<p class="" >${queryVo.query_content}</p>
								</div>
									
								<br>
		
							</div>
								
							<br>
								
							<form action="QueryAnswerForm" id="answerForm" method="post" class="d-flex flex-column detail-main-layout">
							
								<input type="hidden" name="query_idx" value="${queryVo.query_idx}">
										
								<div class="d-flex flex-row child-layout-content">
									<p class="info-text">답변 제목</p>
									
									<c:choose>
										<c:when test="${queryVo.answer_status}">
											<p>${answerVo.answer_subject}</p>
										</c:when>
										
										<c:otherwise>
											<input type="text" placeholder="제목" name="answer_subject" class="common-input-form form-size"></input>	
										</c:otherwise>
									</c:choose>
	
								</div>
								
								<div class="horizontal-line"></div>
								
								<c:if test="${cueryVo.answer_status }">
									<div class="d-flex flex-row child-layout">
										<p class="info-text">답변자 ID</p>
										<p>${answerVo.admin_id}</p>
										
										<div class="d-flex flex-row" style="margin-left: 200px">
											<p class="info-text">답변 날짜</p>
											<p class="">
												<fmt:formatDate value="${answerVo.answer_date}" pattern="yyyy.MM.dd"/>
											</p>
										</div>
									</div>
								
									<div class="horizontal-line"></div>
								</c:if>

									
								<div class="d-flex flex-row child-layout-content">
									<p class="info-text-content">답변</p>
									
									<c:choose>
										<c:when test="${queryVo.answer_status}">
											<p>${answerVo.answer_content}</p>
										</c:when>
										
										<c:otherwise>
											<textarea name="answer_content" placeholder="답변" rows="10" cols="50" class="common-input-form"></textarea>	
										</c:otherwise>
									</c:choose>
								
								</div>

								<div class="d-flex flex-row button-container">
									<button type="button" onclick="history.back()" class="negative-button">돌아가기</button>
									<c:if test="${not queryVo.answer_status }">
										<button type="submit" onclick="return confirm('답변을 등록 하시겠습니까?');" class="positive-button">작성</button>
									</c:if>
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
	
		<script type="text/javascript">
			/* 빈칸 검사 */
			$("#answerForm").on("submit", function(e){
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
