<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>강의 관리 상세 정보</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_req_class_detail.css" rel="stylesheet">

	</head>
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-layout">
					<div class="d-flex flex-column justify-content-center">
						<h2 class="main-text">강의 관리</h2>
					</div>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
						
						
						<div class="d-flex flex-column">
						
							<div class="d-flex flex-column main_layout">
									
									<div class="d-flex flex-column justify-content-center content-layout">
										<div class="d-flex flex-column justify-content-center">
											
											<div class="d-flex flex-column justify-content-center">
												<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_class_video.png" class="thumbnail-image">
												<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_cancel.png" class="negative-button icon-delete">	
											</div>
											
											
											
											
<!-- 											<div class="d-flex justify-content-start"> -->
												
<!-- 											</div> -->
											
										</div>
										
										

										<!-- 정보 폼 -->								
										<div class="d-flex flex-column class-info-root-layout">
											
											<br>
											
											<div class="horizontal-line"></div>
										
										
											<div class="d-flex flex-row info-item">
												<p class="info-text">강의명 :</p>	
												<p>JAVA 기초 프로그래밍</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">강사ID :</p>
												<p>KimTeacher</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">신청일 :</p>
												<p>1999-01-01</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">카테고리 :</p>
												<p>기초 프로그래밍</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">승인 여부 :</p>
												
												<select class="member-state-selector">
													<option>승인</option>
													<option>보류</option>
													<option>거부</option>
												</select>

											</div>
											
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">보류 사유 :</p>
												<textarea rows="3" cols="5" class="common-input-form comment-input-layout margin-left"></textarea>
											</div>
											
											<br>
											
											<div class="horizontal-line"></div>
								

								
											<div class="d-flex justify-content-center attachment-text">강의 계획서</div>
											
											<div class="d-flex flex-row content-layout">
												<p class="attachment-info-text">첨부 파일1: UUID + 날짜 + 파일이름</p>
												<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a>
											</div>
											
											<div class="d-flex flex-row content-layout">
												<p class="attachment-info-text">첨부 파일2: UUID + 날짜 + 파일이름</p>
												<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a>
											</div>
											
											<div class="d-flex flex-row content-layout">
												<p class="attachment-info-text">첨부 파일3: UUID + 날짜 + 파일이름</p>
												<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a>
											</div>	
											
											
											
											

										</div>
										
									</div>
									
									<br>
									
<!-- 									<div class="horizontal-line"></div> -->
								
<!-- 									<div class="d-flex justify-content-center attachment-text">강사 증빙 자료</div> -->
									
<!-- 									<div class="d-flex flex-row content-layout"> -->
<!-- 										<p class="attachment-info-text">첨부 파일1: UUID + 날짜 + 파일이름</p> -->
<!-- 										<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a> -->
<!-- 									</div> -->
									
<!-- 									<div class="d-flex flex-row content-layout"> -->
<!-- 										<p class="attachment-info-text">첨부 파일2: UUID + 날짜 + 파일이름</p> -->
<!-- 										<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a> -->
<!-- 									</div> -->
									
<!-- 									<div class="d-flex flex-row content-layout"> -->
<!-- 										<p class="attachment-info-text">첨부 파일3: UUID + 날짜 + 파일이름</p> -->
<!-- 										<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a> -->
<!-- 									</div>							 -->
								
							</div>

							
							<!-- 
							TODO: JS 추가해야함 -> Focus 없애는코드
							const readonlyAreas = document.querySelectorAll('.readonly-textarea');
							readonlyAreas.forEach(el => {
							  el.addEventListener('focus', e => e.target.blur());
							});
							 -->


							<div class="d-flex button-container">
								<a href="ApMemberList" class="negative-button">돌아가기</a>
								<a href="ApMemberList" class="positive-button">적용</a>
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
