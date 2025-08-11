<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>결제 기록</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_paylog_list.css" rel="stylesheet">
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
						<h2 class="main-text">결제 관리</h2>
						
						<div class="d-flex flex-row justify-content-center search-form-layout search-form-size">
							<input type="text" class="search-form-input" maxlength="10">
							<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
						</div>
					</div>

				</div>
				
				<div class="d-flex flex-row">
					
					<div class="d-flex flex-column justify-content-start">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
					</div>
					
					
						
					<div class="d-flex flex-column list-main-layout">
					
						<div class="d-flex flex-row align-items-center list-info-layout">
							<h3 class="text-no info-text">결제 번호</h3>
							<h3 class="text-id info-text">회원 ID</h3>
							<h3 class="text-name info-text">결제 강의</h3>
							<h3 class="text-id info-text">강사 ID</h3>
							<h3 class="text-date info-text">결제일</h3>
							
							<h3 class="text-state info-text">결제 상태</h3>
						</div>
							
							
						<div class="d-flex flex-column list-layout">
	
							<!-- ============================== -->
							<!-- Example Start -->
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="ApPaylogDetail" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">1</h3>
									<h3 class="text-id">Normal01</h3>
									<h3 class="text-name">자바 프로그래밍 기초 과정</h3>
									<h3 class="text-id">KimTeacher</h3>
									<h3 class="text-date">2025-01-01</h3>
									
									<h3 class="text-state">승인</h3>
								</a>
								
								
							</div>
							
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="ApPaylogDetail" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">2</h3>
									<h3 class="text-id">Normal02</h3>
									<h3 class="text-name">파이썬 프로그래밍 기초 과정</h3>
									<h3 class="text-id">KimTeacher</h3>
									<h3 class="text-date">2025-01-01</h3>
									
									<h3 class="text-state">환불</h3>
								</a>
								
								
							</div>
							
							
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="ApPaylogDetail" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">3</h3>
									<h3 class="text-id">Normal03</h3>
									<h3 class="text-name">컴퓨터 비전</h3>
									<h3 class="text-id">VSTeacher</h3>
									<h3 class="text-date">2025-03-11</h3>
									
									<h3 class="text-state">승인</h3>
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