<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>Main</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/support_center/support_write.css" rel="stylesheet">

	</head>
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-layout">
					<h2 class="main-text">1:1 문의 작성</h2>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<div class="d-flex flex-column align-items-center common-category category-size">
							<a href="PersonalSupport" class="common-category-element">1:1 문의</a>
							<a href="FAQList" class="common-category-element">FAQ</a>
							<a href="NoticeList" class="common-category-element">공지사항</a>
						</div>
						
						<div class="d-flex flex-column write_main_layout">
							
							
							<div class="d-flex flex-row write-layout">
									<p class="info-text">문의 카테고리</p>
									<input type="text" readonly="readonly" class="common-input-form form-size">
							</div>
							
							<div class="horizontal-line"></div>
						
							<div class="d-flex flex-row write-layout">
									<p class="info-text">문의 제목</p>
									<input type="text" class="common-input-form form-size">
							</div>
							
							<div class="horizontal-line"></div>
						
							<div class="d-flex flex-row write-layout-content">
									<p class="info-text-content">문의 내용</p>
									<textarea rows="10" cols="50" class="common-input-form"></textarea>
							</div>
							
							<div class="horizontal-line"></div>
							
							<div class="d-flex flex-row  write-layout">
									<p class="info-text">첨부 파일</p>
									<input type="text" class="common-input-form form-size">
									
									<a href="#" class="positive-button button-detail">파일 선택</a>
							</div>
							
						
						
						</div>
						

					</div>	
					
					<div>
					
						<div>
							
						
						
						
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
