<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>고객 지원 센터 - 공지사항</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/support_center/support_center.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article>
				
				<div class="d-flex flex-row justify-content-between top-layout">
				
					<div class="d-flex justify-content-center">
						<h2 class="main-text">공지사항</h2>
					</div>
					
					<div class="d-flex flex-row">
						<div class="d-flex flex-row justify-content-center search-form-layout search-form-size">
							<input type="text" class="search-form-input" maxlength="10">
							<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
						</div>
					</div>
				
					<button class="positive-button write-button-size">공지사항 작성</button>
					
				</div>
				
				
				<div class="d-flex flex-row">
			
					<jsp:include page="/WEB-INF/views/support_center/support_center_sidebar.jsp"/>
					
					<div class="d-flex flex-column list-main-layout">
					
						<div class="d-flex flex-row align-items-center list-info-layout">
								<h3 class="text-no info-text">No.</h3>
								<h3 class="text-subject info-text">제목</h3>
								<h3 class="text-date info-text">작성일</h3>
								<h3 class="text-view-count info-text">조회수</h3>
							</div>
							
							
						<div class="d-flex flex-column list-layout">
	
							<!-- ============================== -->
							<!-- Example Start -->
							
							
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="NoticeDetail" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">1</h3>
									<h3 class="text-subject">저희 DDOS 공격 당함;.</h3>
									<h3 class="text-date">2025-07-30</h3>
									<h3 class="text-view-count">13000</h3>
								</a>
								
								<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
								<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_delete.png" class="edit-icon"></a>

							</div>
							
							
							
							<div class="horizontal-line"></div>
							
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="NoticeDetail" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">2</h3>
									<h3 class="text-subject">공지 적기 귀찮은데?</h3>
									<h3 class="text-date">2025-07-30</h3>
									<h3 class="text-view-count">5000</h3>
								</a>
								
								<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
								<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_delete.png" class="edit-icon"></a>

							</div>
							
							<div class="horizontal-line"></div>	
							
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="NoticeDetail" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">3</h3>
									<h3 class="text-subject">아 집가고싶다</h3>
									<h3 class="text-date">2025-07-30</h3>
									<h3 class="text-view-count">300</h3>
								</a>
								
								<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
								<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_delete.png" class="edit-icon"></a>

							</div>
							
							<div class="horizontal-line"></div>	
							
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