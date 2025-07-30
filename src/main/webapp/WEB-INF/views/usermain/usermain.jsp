<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>UserMain</title>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath }/resources/css/common/css_variables.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/component.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/base.css" rel="stylesheet">
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
							<a href="" class="thumbnail-link">
								<img src="${pageContext.request.contextPath }/resources/image/banner1.png" alt="강의 썸네일 1" class="thumbnail">
							</a>
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