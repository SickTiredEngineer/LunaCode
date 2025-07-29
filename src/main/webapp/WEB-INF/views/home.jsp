<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>Main</title>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath}/resources/css/common/css_variables.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/layout/carousel_main_banner.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/base.css" rel="stylesheet">	
		<link href="bootstrap.min.css" rel="stylesheet">	
		<link href="${pageContext.request.contextPath}/resources/css/layout/home.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

		
			<article >
				<div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-ride="carousel" data-bs-interval="2000">
	
					<div class="carousel-inner align-self-center">
				    	<div class="carousel-item active">
				      		<img src="${pageContext.request.contextPath }/resources/image/banner1.png" id="banner_1" class="d-block w-100 img-fluid" alt="...">
				    	</div>
				    	<div class="carousel-item align-self-center">
				        	<img src="${pageContext.request.contextPath }/resources/image/banner2.jpg" id="banner_2" class="d-block w-100 img-fluid" alt="...">
					    </div>
				    	<div class="carousel-item align-self-center">
				      		<img src="${pageContext.request.contextPath }/resources/image/luna_logo_3.png" id="banner_3" class="d-block w-100 img-fluid" alt="...">
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
	
					
			</article>
			
			<div class="card-container">
				  <div class="card" style="width: 18rem;">
				    <img src="${pageContext.request.contextPath }/resources/image/banner1.png" class="card-img-top" alt="카드 광고 1">
				    <div class="card-body">
				      <h5 class="card-title">JAVA 단기간 완성</h5>
				      <p class="card-text">3개월 500,000원</p>
				      <a href="#" class="btn btn-primary">신청하기</a>
				    </div>
				  </div>
				  <div class="card" style="width: 18rem;">
				    <img src="${pageContext.request.contextPath }/resources/image/banner1.png" class="card-img-top" alt="카드 광고 2">
				    <div class="card-body">
				      <h5 class="card-title">JAVA 단기간 완성</h5>
				      <p class="card-text">3개월 500,000원</p>
				      <a href="#" class="btn btn-primary">신청하기</a>
				    </div>
				  </div>
				  <div class="card" style="width: 18rem;">
				    <img src="${pageContext.request.contextPath }/resources/image/banner1.png" class="card-img-top" alt="카드 광고 3">
				    <div class="card-body">
				      <h5 class="card-title">JAVA 단기간 완성</h5>
				      <p class="card-text">3개월 500,000원</p>
				      <a href="#" class="btn btn-primary">신청하기</a>
				    </div>
				  </div>
			</div>

			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
		
		</div>
	
	</body>
	
	
</html>


