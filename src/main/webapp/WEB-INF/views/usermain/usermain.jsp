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
	</head>
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
				
				<article>
				
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
				
					<div class="top-section">
						
						<div class="box">
							<div class="box-header">내 강의</div>
							<div class="class-title">자바 스크립트 기초</div>
							<div class="class-count">5/20<br>레슨 완료</div>
							<div class="progress" role="progressbar" aria-label="Example with label" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
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
					
					<div class="weektitle">
						<h3>이번 주 - 인기 강의</h3>
					</div>
					
					<div class="middle-section">
					
						<div class="box2">
						    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
						        <div class="carousel-inner">
						        
						            <div class="carousel-item active">
						                <img src="${pageContext.request.contextPath}/resources/image/banner1.png" class="d-block w-100 h-100" alt="강의 썸네일 1">
						            </div>
						            
						            <div class="carousel-item">
						                <img src="${pageContext.request.contextPath}/resources/image/banner1.png" class="d-block w-100 h-100" alt="강의 썸네일 2">
						            </div>
						            
						            <div class="carousel-item">
						                <img src="${pageContext.request.contextPath}/resources/image/banner1.png" class="d-block w-100 h-100" alt="강의 썸네일 3">
						            </div>
						        </div>
						        
						        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
						            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						            <span class="visually-hidden">Previous</span>
						        </button>
						        
						        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
						            <span class="carousel-control-next-icon" aria-hidden="true"></span>
						            <span class="visually-hidden">Next</span>
						        </button>
						        
						    </div>
						    
						</div>
						
						<div class="box2">
							<a href="" class="thumbnail-link">
								<img src="${pageContext.request.contextPath }/resources/image/banner1.png" alt="강의 썸네일 2" class="thumbnail">
							</a>
						</div>
						
						<div class="box2">
							<a href="" class="thumbnail-link">
								<img src="${pageContext.request.contextPath }/resources/image/banner1.png" alt="강의 썸네일 2" class="thumbnail">
							</a>
						</div>
						
					</div>
					
				</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
			
		</div>
		
	</body>
	
</html>