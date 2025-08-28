<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<html>

	<head>
		<title>강의 관리 상세 정보</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_req_class_detail.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/admin_common.css" rel="stylesheet">

	</head>
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-layout">
					<div class="d-flex flex-column justify-content-center">
						<h2 class="main-text"></h2>
					</div>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
						
						
						<form action="ApModifyClassStatus" method="post" class="d-flex flex-column">
						
							<div class="d-flex flex-column main_layout">
									
									<div class="d-flex flex-column justify-content-center align-item-center content-layout">
										<div class="d-flex flex-column justify-content-center">
											
											<div class="d-flex flex-column">
												<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_class_video.png" class="thumbnail-image">
											</div>

										</div>
										
										<!-- 정보 폼 -->								
										<div class="d-flex flex-column justify-content-center class-info-root-layout">
											
											<input type="hidden" name="class_idx" value="${cls.class_idx}">
											
											
											<br>
											
											<div class="horizontal-line"></div>
										
										
											<div class="d-flex flex-row info-item">
												<p class="info-text">강의명 :</p>	
												<p>${cls.class_title}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">강사ID :</p>
												<p>${cls.instructor_id}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">신청일 :</p>
												<p>${cls.create_date}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">카테고리 :</p>
												<p>${cls.class_category}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">승인 여부 :</p>
												<select name="accept_status" class="member-state-selector">
													<option value="CS01" ${cls.accept_status eq 'CS01'? 'selected': ''}>승인</option>
													<option value="CS02" ${cls.accept_status eq 'CS02'? 'selected': ''}>보류</option>
													<option value="CS03" ${cls.accept_status eq 'CS03'? 'selected': ''}>거부</option>
												</select>
											</div>
											
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">보류 사유 :</p>
												<textarea name="deny_reason" rows="3" cols="5" class="common-input-form comment-input-layout margin-left"> ${cls.deny_reason}</textarea>
											</div>
											
											<br>
											
										</div>
										
									</div>
									
									<br>
								
							</div>

							<div class="d-flex button-container">
								<button type="button" onclick="history.back()" class="negative-button">돌아가기</button>
								<button type="submit" class="positive-button">적용</button>
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
