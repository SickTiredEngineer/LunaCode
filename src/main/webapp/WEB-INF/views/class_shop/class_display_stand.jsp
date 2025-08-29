<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
					<div class="row row-cols-1 row-cols-md-3 g-4">
			            <c:forEach var="classVo" items="${classes}">
			                <div class="col">
			                    <div class="card h-100 text-center class-card">
			                        <img src="${pageContext.request.contextPath}/resources/class_thumbnail/${classVo.thumbnail_path}" 
			                             class="card-img-top" alt="${classVo.class_name}"/>
			                        <div class="card-body">
			                            <h5 class="card-title">${classVo.class_name}</h5>
			                            <p class="card-text">강사: ${classVo.instructorName}</p>
			                            <p class="text-muted">${classVo.class_period} <strong>${classVo.class_price}원</strong></p>
			                        </div>
			                        <div class="card-footer bg-white border-0">
			                            <a href="${pageContext.request.contextPath}/ClassDetail?classId=${classVo.class_idx}" class="btn btn-outline-secondary w-100">
			                                수강신청 하러가기
			                            </a>
			                        </div>
			                    </div>
			                </div>
			            </c:forEach>
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
				
				<!-- 모달 띄우기 -->				
				<jsp:include page="/WEB-INF/views/class_shop/class_detail.jsp"/>
			</article>

			
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
</html>
								