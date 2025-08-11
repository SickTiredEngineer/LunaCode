<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>공통 코드 그룹 상세</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_group_code_writer.css" rel="stylesheet">
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
						<h2 class="main-text">공통 코드 그룹 상세</h2>
					</div>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
						
						
						<div class="d-flex flex-column">
						
							<div class="d-flex flex-column main_layout">
									
									<div class="d-flex flex-column justify-content-center align-item-center content-layout">
										

										<!-- 정보 폼 -->								
										<div class="d-flex flex-column justify-content-center class-info-root-layout">
											
											<br>
										
											<div class="d-flex flex-row info-item">
												<p class="info-text">그룹 코드 :</p>	
												<input type="text" class="common-input-form form-size">
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">그룹명 :</p>
												<input type="text" class="common-input-form form-size">
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">그룹 설명 :</p>
												<input type="text" class="common-input-form form-desc-size">
											</div>
											
											<div class="horizontal-line"></div>
											
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">사용 여부 :</p>
												
												<select class="member-state-selector">
													<option>활성화</option>
													<option>비활성화</option>
												</select>
												
											</div>


										</div>
										
									</div>
									
									<br>					
								
							</div>

							
							<!-- 
							TODO: JS 추가해야함 -> Focus 없애는코드
							const readonlyAreas = document.querySelectorAll('.readonly-textarea');
							readonlyAreas.forEach(el => {
							  el.addEventListener('focus', e => e.target.blur());
							});
							 -->


							<div class="d-flex button-container">
								<a href="ApGroupCodeList" class="negative-button">돌아가기</a>
								<a href="ApGroupCodeList" class="positive-button">적용</a>
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
