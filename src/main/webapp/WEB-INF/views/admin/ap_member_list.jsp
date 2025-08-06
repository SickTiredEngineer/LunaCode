<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>관리자 페이지</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_member_list.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article>
				
				<div class="d-flex flex-row justify-content-between top-layout">
						<h2 class="main-text">회원 관리</h2>
					<div class="d-flex justify-content-start">
						
					</div>
					
					<div class="d-flex flex-row">
						<div class="d-flex flex-row justify-content-center search-form-layout search-form-size">
							<input type="text" class="search-form-input" maxlength="10">
							<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_search.png" class="search-icon">
						</div>
					</div>
					
					<a href="PostWrite" class="positive-button write-button-size">게시글 작성</a>
					
				</div>
				
				
				<div class="d-flex flex-row">
			
					<div class="d-flex flex-column align-items-center common-category category-size">
						<a href="ApMemberList" class="common-category-element">회원 관리</a>
						<a href="Community" class="common-category-element">강사 신청</a>
						<a href="Community" class="common-category-element">강의 관리</a>
						<a href="Community" class="common-category-element">결제 관리</a>
						<a href="Community" class="common-category-element">1:1 문의 관리</a>
						<a href="Community" class="common-category-element">공통 코드 관리</a>
						<a href="Community" class="common-category-element">통계</a>
					</div>
						
					<div class="d-flex flex-column list-main-layout">
					
						<div class="d-flex flex-row align-items-center list-info-layout">
								<h3 class="text-no info-text">회원번호</h3>
								<h3 class="text-id info-text">ID</h3>
								<h3 class="text-name info-text">이름</h3>
								<h3 class="text-date info-text">생년월일</h3>
								<h3 class="text-date info-text">계정 상태</h3>
							</div>
							
							
						<div class="d-flex flex-column list-layout">
	
							<!-- ============================== -->
							<!-- Example Start -->
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="MemberDetail" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">1</h3>
									<h3 class="text-id">koo123</h3>
									<h3 class="text-name">구돼지</h3>
									<h3 class="text-date">1999-01-01</h3>
									<h3 class="text-status">active</h3>
								</a>
								
								<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
							</div>
							
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="MemberDetail" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">2</h3>
									<h3 class="text-id">kim123</h3>
									<h3 class="text-name">김말이</h3>
									<h3 class="text-date">2000-01-01</h3>
									<h3 class="text-status">active</h3>
								</a>
								
								<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
							</div>
							
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="MemberDetail" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">3</h3>
									<h3 class="text-id">hong123</h3>
									<h3 class="text-name">홍길동</h3>
									<h3 class="text-date">2000-01-01</h3>
									<h3 class="text-status">deactive</h3>
								</a>
								
								<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
							</div>
							
							<div class="d-flex flex-row align-items-center list-item-root">
								<a href="MemberDetail" class="d-flex flex-row align-items-center list-item-layout">
									<h3 class="text-no">4</h3>
									<h3 class="text-id">choibug</h3>
									<h3 class="text-name">최벌레</h3>
									<h3 class="text-date">2000-01-01</h3>
									<h3 class="text-status">deactive</h3>
								</a>
								
								<a><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
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