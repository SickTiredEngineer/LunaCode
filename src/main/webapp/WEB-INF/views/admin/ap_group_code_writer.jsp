<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>공통 코드 작성</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_group_code_writer.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/admin_common.css" rel="stylesheet">
		
	</head>
	
	<body>
		
		<c:set var="isModify" value="${isModify}"/>

		<c:choose>
			<c:when test="${isModify}">
				<c:set var="formAction" value="ModifyCodeGroupForm"/>
				<c:set var="submitLabel" value="수정 완료"/>
				<c:set var="pageTitle" value="그룹 코드 수정"/>
				
				<c:set var="groupCode" value="${vo.group_code}"/>
				<c:set var="groupDesc" value="${vo.group_desc}"/>
				<c:set var="groupUsing" value="${vo.using}"/>
			</c:when>
			
			<c:otherwise>
				<c:set var="formAction" value="NewCodeGroupForm"/>
				<c:set var="submitLabel" value="등록"/>
				<c:set var="pageTitle" value="그룹 코드 작성"/>
			</c:otherwise>
		</c:choose>
	
	
	
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-layout">
					<div class="d-flex flex-column justify-content-center">
						<h2 class="main-text">${pageTitle}</h2>
					</div>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
						
						
						<div class="d-flex flex-column">
						
							<div class="d-flex flex-column main_layout">
									
									<div class="d-flex flex-column justify-content-center align-item-center content-layout">
										

										<!-- 정보 폼 -->								
										<form action="${formAction}" id="groupForm" method="post" class="d-flex flex-column justify-content-center class-info-root-layout">
											
											<c:if test="${isModify}">
												<input type="hidden" name="group_idx" value="${vo.group_idx}">
											</c:if>
											
											<br>
										
											<div class="d-flex flex-row info-item">
												<p class="info-text">그룹 코드 :</p>	
												<input type="text" placeholder="그룹 코드" name="group_code" class="common-input-form form-size" value="${groupCode}">
											</div>				
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">그룹 설명 :</p>
												<input name="group_desc" placeholder="그룹 설명" type="text" class="common-input-form form-desc-size" value="${groupDesc}">
											</div>
											
											<div class="horizontal-line"></div>
											
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">사용 여부 :</p>
												
												<select name="using" class="member-state-selector">
													<option value="true" ${category == 'true' ? 'selected' : ''}>활성화</option>
													<option value="false" ${category == 'false' ? 'selected' : ''}>비활성화</option>
												</select>
												
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex button-container">
												<button type="button" onclick="history.back()" class="negative-button">돌아가기</button>
												<button type="submit" class="positive-button">${submitLabel}</button>
											</div>


										</form>
										
									</div>
									
									<br>					
								
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
	
		<script type="text/javascript">
			/* 빈칸 검사 */
			$("#groupForm").on("submit", function(e){
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
