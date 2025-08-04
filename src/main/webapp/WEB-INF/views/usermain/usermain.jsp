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
	        
	        </header>
			
	        <article>
	        				
				<%-- 검색 영역 --%>
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
	        	<div class="content-layout">
		            <%-- 좌측 공통 카테고리 --%>
		            <aside class="common-category">
		                <a href="UserMain" class="common-category-element active">홈</a>
		                <a href="MyClass" class="common-category-element">내 강의</a>
		                <a href="PlayList" class="common-category-element">재생목록</a>
		                <a href="#" class="common-category-element">커뮤니티 활동</a>
		                <a href="#" class="common-category-element">출석</a>
		            </aside>
		            
		            <%-- 메인 콘텐츠 영역 --%>
		            <section class="main-dashboard">
		                
		                <!-- 상단 캐러셀 -->
		                <div class="carousel-container">
		                    <%-- 캐러셀 코드는 Bootstrap에 의존하므로 그대로 사용 --%>
		                    <div id="mainCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
		                        <div class="carousel-inner">
		                            <%-- 실제 이미지 경로로 수정 필요 --%>
		                            <div class="carousel-item active"><img src="${pageContext.request.contextPath}/resources/image/banner1.png" class="d-block w-100" alt="배너1"></div>
		                            <div class="carousel-item"><img src="${pageContext.request.contextPath}/resources/image/banner3.png" class="d-block w-100" alt="배너2"></div>
		                            <div class="carousel-item"><img src="${pageContext.request.contextPath}/resources/image/luna_logo_3.png" class="d-block w-100" alt="배너3"></div>
		                        </div>
		                        <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
		                            <span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="visually-hidden">Previous</span>
		                        </button>
		                        <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
		                            <span class="carousel-control-next-icon" aria-hidden="true"></span><span class="visually-hidden">Next</span>
		                        </button>
		                    </div>
		                </div>
		
		                <!-- 정보 위젯 섹션 -->
		                <ul class="widget-list">
		                    <li class="widget-item">
		                        <h3 class="widget-header">
	                       			<a href="#" class="widget-full-link">
								        <span>내 강의</span>
								        <span class="widget-more-arrow">></span>
								    </a>
		                        </h3>
		                        <div class="widget-content">
		                            <div class="class-info">
		                                <span class="class-title">자바스크립트 기초</span>
		                                <span class="class-status">5/20 완료</span>
		                            </div>
		                            <div class="progress" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
		                                <div class="progress-bar" style="width: 25%">25%</div>
		                            </div>
		                        </div>
		                    </li>
		                    <li class="widget-item">
		                        <h3 class="widget-header">
		                        	<a href="#" class="widget-full-link">
								        <span>출석</span>
								        <span class="widget-more-arrow">></span>
								    </a>
		                        </h3>
		                        <div class="widget-content">
		                            <div class="attendance-item"><span>일간 연속 출석</span> <span><strong>5</strong>일</span></div>
		                            <div class="attendance-item"><span>주간 연속 출석</span> <span><strong>12</strong>주</span></div>
		                            <div class="attendance-item"><span>월간 연속 출석</span> <span><strong>6</strong>달</span></div>
		                        </div>
		                    </li>
		                    <li class="widget-item">
		                        <h3 class="widget-header">
		                        	<a href="#" class="widget-full-link">
								        <span>재생목록</span>
								        <span class="widget-more-arrow">></span>
								    </a>
		                        </h3>
		                        <div class="widget-content">
		                            <a href="#" class="playlist-add-button">+</a>
		                            <div class="playlist-item">첫번째 재생목록</div>
		                            <div class="playlist-item">두번째 재생목록</div>
		                        </div>
		                    </li>
		                </ul>
						
		            </section>
	            
	            </div>
	            
	        </article>
	        
	        <footer>
	            <jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
	        </footer>
	    </div>
	</body>
	
</html>