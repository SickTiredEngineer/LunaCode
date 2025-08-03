<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>UserMain</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain.css" rel="stylesheet">  
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain_category.css" rel="stylesheet">    
	</head>
	
	<body>
		<div class="page-base container">
			
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
						
					<!-- ✅ 검색 영역 -->
					<div class="search-area">
						<div class="search-box">
							<span class="search-icon">▼</span>
							<input type="text" placeholder="검색어를 입력하세요">
						</div>
						<div class="tag-list">
							<span class="tag">#JAVA</span>
							<span class="tag">#DATABASE</span>
							<span class="tag">#BACK-END</span>
							<span class="tag">#FRONT-END</span>
						</div>
					</div>
					
			</header>
			
			<div class="main-content-layout">	
				<aside class="common-category">
	          	 	<a href="UserMain" class="common-category-element">홈</a>
		            <a href="#" class="common-category-element">내 강의</a>
		            <a href="#" class="common-category-element">재생목록</a>
		            <a href="#" class="common-category-element">커뮤니티 활동</a>
		            <a href="#" class="common-category-element">출석</a>
		        </aside>
				
				<article>

					<!-- ✅ 브라우저 전체 너비 캐러셀 -->
					<div class="carousel-outer">
						<div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-ride="carousel" data-bs-interval="3000">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="${pageContext.request.contextPath}/resources/image/banner1.png" class="carousel-img" alt="배너1">
								</div>
								<div class="carousel-item">
									<img src="${pageContext.request.contextPath}/resources/image/banner2.jpg" class="carousel-img" alt="배너2">
								</div>
								<div class="carousel-item">
									<img src="${pageContext.request.contextPath}/resources/image/luna_logo_3.png" class="carousel-img" alt="배너3">
								</div>
							</div>
		
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
		
					<!-- ✅ 상단 박스 섹션 -->
					<div class="top-section">
						<div class="box ">
							<div class="box-header">내 강의</div>
								<div class="class-info">
									<span class="class-title">자바 스크립트 기초</span>
									<span class="class-count">5/20<br>레슨 완료</span>
								</div>
							
								<div class="progress" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
									<div class="progress-bar" style="width: 25%">25%</div>
								</div>
						</div>
		
						<div class="box">
							<div class="box-header">출석</div>
							<div class="box-item">일간 연속 출석 <span>5일</span></div>
							<div class="box-item">주간 연속 출석 <span>12주</span></div>
							<div class="box-item">월간 연속 출석 <span>6달</span></div>
						</div>
		
						<div class="box">
							<div class="box-header">재생목록</div>
							<div class="plus-icon">+</div>
							<div class="box-item">첫번째 재생목록</div>
							<div class="box-item">두번째 재생목록</div>
						</div>
					</div>
		
				</article>
			</div>	
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
	
		</div>
	</body>
	
</html>