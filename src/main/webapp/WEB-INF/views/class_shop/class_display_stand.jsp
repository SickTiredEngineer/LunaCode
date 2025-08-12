<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>강의 상점</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/class_shop/class_display_stand.css" rel="stylesheet">
		
	</head>
	
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article class="container my-5">
				
				<div class="d-flex flex-row justify-content-center">
					<h1 class="shop-logo-text">강의 상점</h1>
				</div>
				
				<br>
				
				<jsp:include page="/WEB-INF/views/inc/class_category.jsp"></jsp:include>
				
				<br>
			
				<div class="row row-cols-1 row-cols-md-3 g-4">
				
				    <!-- 강의 카드 1 -->
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">JAVA 기초부터 고수까지</h5>
								<p class="card-text">강사: KimTeacher</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
				

					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_02.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">백엔드 기초부터 고수까지</h5>
								<p class="card-text">강사: ChaTeacher</p>
								<p class="text-muted">3개월 <strong>500,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
				
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_02.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">임베디드 고수만 들어오셈</h5>
								<p class="card-text">강사: IOTeacher</p>
								<p class="text-muted">6개월 <strong>350,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">C언어 기초</h5>
								<p class="card-text">강사: KimTeacher</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">Temp Class</h5>
								<p class="card-text">강사: TEM</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">Temp Class</h5>
								<p class="card-text">강사: TEM</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">Temp Class</h5>
								<p class="card-text">강사: TEM</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">Temp Class</h5>
								<p class="card-text">강사: TEM</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">Temp Class</h5>
								<p class="card-text">강사: TEM</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">Temp Class</h5>
								<p class="card-text">강사: TEM</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">Temp Class</h5>
								<p class="card-text">강사: TEM</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">Temp Class</h5>
								<p class="card-text">강사: TEM</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">Temp Class</h5>
								<p class="card-text">강사: TEM</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">Temp Class</h5>
								<p class="card-text">강사: TEM</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center class-card">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">Temp Class</h5>
								<p class="card-text">강사: TEM</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<a href="#" class="btn btn-outline-secondary w-100">
								   수강신청 하러가기
								</a>
							</div>
						</div>
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
				
			</article>

			
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
</html>
