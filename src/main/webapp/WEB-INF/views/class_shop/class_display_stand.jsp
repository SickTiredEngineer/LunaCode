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
		
	</head>
	
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article class="container my-5">
			
				<h3>강의 상점</h3>
			
				<div class="row row-cols-1 row-cols-md-3 g-4">
				
				    <!-- 강의 카드 1 -->
					<div class="col">
						<div class="card h-100 text-center">
						<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">JAVA 기초부터 고수까지</h5>
								<p class="card-text">JAVA 단기간 완성</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<button class="btn btn-outline-secondary w-100">
								  🛒 수강신청
								</button>
							</div>
						</div>
					</div>
				
					<!-- 강의 카드 2 -->
					<div class="col">
						<div class="card h-100 text-center">
							<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_02.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">컴퓨터 비전! 카메라를 내 눈처럼</h5>
								<p class="card-text">자격증 단기간 완성</p>
								<p class="text-muted">3개월 <strong>200,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<button class="btn btn-outline-secondary w-100">
								  🛒 수강신청
								</button>
							</div>
						</div>
					</div>
				
					<!-- 강의 카드 3 -->
					<div class="col">
						<div class="card h-100 text-center">
							<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">안드로이드 만져보고싶다고?</h5>
								<p class="card-text">드루와!</p>
								<p class="text-muted">3개월 <strong>100,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<button class="btn btn-outline-secondary w-100">
								  🛒 수강신청
								</button>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center">
							<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_02.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">임베디드, 너도 할 수 있어</h5>
								<p class="card-text">기계와 소통해봐</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<button class="btn btn-outline-secondary w-100">
								  🛒 수강신청
								</button>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center">
							<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_02.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">컴퓨터 그래픽쓰</h5>
								<p class="card-text">DB 단기간 완성</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<button class="btn btn-outline-secondary w-100">
								  🛒 수강신청
								</button>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card h-100 text-center">
							<img src="${pageContext.request.contextPath }/resources/class_thumbnail/class_thumb_01.png" class="card-img-top" alt="">
							<div class="card-body">
								<h5 class="card-title">이미미 강사</h5>
								<p class="card-text">DB 단기간 완성</p>
								<p class="text-muted">3개월 <strong>300,000원</strong></p>
							</div>
							<div class="card-footer bg-white border-0">
								<button class="btn btn-outline-secondary w-100">
								  🛒 수강신청
								</button>
							</div>
						</div>
					</div>
					
					
				</div>
				
				
				
				
				
				
				
				
			</article>

			
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
</html>
