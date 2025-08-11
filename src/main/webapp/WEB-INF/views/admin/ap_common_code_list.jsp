<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>공통 코드 관리</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_group_code_list.css" rel="stylesheet">
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
						<h2 class="main-text">공통 코드 관리</h2>
						
						<div class="d-flex flex-row justify-content-center">
							
							
								<div class="d-flex flex-row justify-content-center search-form-layout search-form-size">
									<input type="text" class="search-form-input" maxlength="10">
									<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
								</div>
								
						</div>
						
							
					</div>

				</div>
				
				<div class="d-flex flex-row">
					
					<div class="d-flex flex-column justify-content-start">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
					</div>
					
					
						
					<div class="d-flex flex-column list-main-layout">
					
						<div class="d-flex flex-row align-items-center list-info-layout">
							<h3 class="text-no info-text">코드 ID</h3>
							<h3 class="text-name info-text">코드</h3>
							<h3 class="text-name info-text">값</h3>
							<h3 class="text-name info-text">그룹 코드</h3>
							<h3 class="text-date info-text">등록일</h3>
							<h3 class="text-state info-text">사용 여부</h3>
							<h3 class="text-name info-text">등록자 ID</h3>
						</div>
							
							
						<div class="d-flex flex-column list-layout">
	
							<!-- ============================== -->
							<!-- Example Start -->
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="ApCommonCodeWriter" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">1</h3>
									<h3 class="text-name">mt01</h3>
									<h3 class="text-name">관리자</h3>
									<h3 class="text-name">member_type</h3>
									<h3 class="text-date">2025-01-01</h3>
									<h3 class="text-state">사용</h3>
									<h3 class="text-name">admin01</h3>
								</a>
							</div>
							
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="ApCommonCodeWriter" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">2</h3>
									<h3 class="text-name">mt02</h3>
									<h3 class="text-name">강사</h3>
									<h3 class="text-name">member_type</h3>
									<h3 class="text-date">2025-01-01</h3>
									<h3 class="text-state">사용</h3>
									<h3 class="text-name">admin01</h3>
								</a>
							</div>
							
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="ApCommonCodeWriter" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">3</h3>
									<h3 class="text-name">mt03</h3>
									<h3 class="text-name">일반 유저</h3>
									<h3 class="text-name">member_type</h3>
									<h3 class="text-date">2025-01-01</h3>
									<h3 class="text-state">사용</h3>
									<h3 class="text-name">admin01</h3>
								</a>
							</div>
							


						</div>
						
						<div class="d-flex flex-row justify-content-center page-selector-layout">
							
							<a class="page-selector">&lt;</a>
							
							<a class="page-selector">1</a>
							<a class="page-selector">2</a>
							<a class="page-selector">3</a>
							<a class="page-selector">4</a>
							<a class="page-selector">5</a>
							
							<a class="page-selector">&gt;</a>
					
						</div>
						
						<br>
						
						<div class="d-flex justify-content-end">
							<a href="ApCommonCodeWriter" class="positive-button add-group-bt">코드 추가</a>
						</div>
						

					</div>
					
				</div>
				
				
			</article>
			
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
		
		<script defer src="${pageContext.request.contextPath }/resources/js/support_center/faq_list.js"></script>
	</body>
	
</html>