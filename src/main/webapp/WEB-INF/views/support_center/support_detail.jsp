<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>문의 자세히 보기</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/support_center/support_detail.css" rel="stylesheet">

	</head>
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-text-margin">
					<h2 class="main-text">문의 상세내용</h2>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<div class="d-flex flex-column align-items-center common-category category-size">
							<a href="PersonalSupport" class="common-category-element">1:1 문의</a>
							<a href="FAQList" class="common-category-element">FAQ</a>
							<a href="NoticeList" class="common-category-element">공지사항</a>
						</div>
						
						
						<div class="d-flex flex-column">
						
							<div class="d-flex flex-column detail-main-layout qna_layout">
								
								
								<div class="d-flex flex-row child-layout">
										<p class="info-text">문의 카테고리</p>
										<input type="text" class="common-input-form form-size" readonly="readonly" value="기타">
								</div>
								
								<div class="horizontal-line"></div>
							
									<div class="d-flex flex-row child-layout">
											<p class="info-text">문의 제목</p>
											<input type="text" class="common-input-form form-size" readonly="readonly">
									</div>
									
									<div class="horizontal-line"></div>
								
									<div class="d-flex flex-row child-layout-content">
											<p class="info-text-content">문의 내용</p>
											<textarea rows="10" cols="50" class="common-input-form" readonly="readonly">문의 내용 - 
											응애ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ!
											</textarea>
									</div>
									
									<div class="horizontal-line"></div>
									
										<div class="d-flex flex-row child-layout">
											<p class="attachment-text">첨부 파일1: UUID + 날짜 + 파일이름</p>
											<a href="#" class="positive-button button-detail attachment-bt">다운로드</a>
										</div>
										
										<div class="d-flex flex-row child-layout">
											<p class="attachment-text">첨부 파일2: UUID + 날짜 + 파일이름</p>
											<a href="#" class="positive-button button-detail attachment-bt">다운로드</a>
										</div>
										
										<div class="d-flex flex-row child-layout">
											<p class="attachment-text">첨부 파일3: UUID + 날짜 + 파일이름</p>
											<a href="#" class="positive-button button-detail attachment-bt">다운로드</a>
										</div>	
								
								</div>
								
								<div class="d-flex flex-column detail-main-layout">
									
										<div class="d-flex flex-row child-layout-content">
												<p class="info-text-content">답변</p>
												<textarea rows="10" cols="50" class="common-input-form" readonly="readonly">답변 내용 - 
												응애ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ
												</textarea>
										</div>
										
										<div class="horizontal-line"></div>
										
<!-- 										<div class="d-flex flex-column  child-layout"> -->
										
<!-- 											<div class="d-flex flex-row"> -->
<!-- 												<p class="info-text">첨부 파일1:</p> -->
<!-- 												<input type="text" class="common-input-form form-size" value="UUID + 파일이름.jpg"> -->
<!-- 												<a href="#" class="positive-button button-detail attachment-bt">다운로드</a> -->
<!-- 											</div> -->
										
<!-- 											<div class="d-flex flex-row"> -->
<!-- 												<p class="info-text">첨부 파일2:</p> -->
<!-- 												<input type="text" class="common-input-form form-size" value="UUID + 파일이름.jpg"> -->
<!-- 												<a href="#" class="positive-button button-detail attachment-bt">다운로드</a> -->
<!-- 											</div> -->
											
<!-- 											<div class="d-flex flex-row"> -->
<!-- 												<p class="info-text">첨부 파일3:</p> -->
<!-- 												<input type="text" class="common-input-form form-size" value="UUID + 파일이름.jpg"> -->
<!-- 												<a href="#" class="positive-button button-detail attachment-bt">다운로드</a> -->
<!-- 											</div> -->
	
<!-- 										</div> -->

										<div class="d-flex flex-row child-layout">
											<p class="attachment-text">첨부 파일1: UUID + 날짜 + 파일이름</p>
											<a href="#" class="positive-button button-detail attachment-bt">다운로드</a>
										</div>
										
										<div class="d-flex flex-row child-layout">
											<p class="attachment-text">첨부 파일2: UUID + 날짜 + 파일이름</p>
											<a href="#" class="positive-button button-detail attachment-bt">다운로드</a>
										</div>
										
										<div class="d-flex flex-row child-layout">
											<p class="attachment-text">첨부 파일3: UUID + 날짜 + 파일이름</p>
											<a href="#" class="positive-button button-detail attachment-bt">다운로드</a>
										</div>		
																	
									</div>
									
							
							<div class="d-flex flex-row button-container">
								<a href="PersonalSupport" class="positive-button">돌아가기</a>
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
