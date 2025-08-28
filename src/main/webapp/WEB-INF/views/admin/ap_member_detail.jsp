<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>회원 상세 정보</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_member_detail.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/admin_common.css" rel="stylesheet">
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
						<h2 class="main-text">회원 관리</h2>
					</div>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />

						<div class="d-flex flex-column">
							
							
													
							<div class="d-flex flex-column main_layout">
								
<%-- 								<c:choose> --%>
									
<%-- 									<c:when test="${member.profile_img not empty}"> --%>
<%-- 										<img alt="" src="${member.profile_img}" class="profile-image"> --%>
<%-- 									</c:when> --%>
									
<%-- 									<c:otherwise> --%>
<%-- 										<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_profile.png" class="profile-image"> --%>
<%-- 									</c:otherwise> --%>
								
<%-- 								</c:choose> --%>
								
								<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_profile.png" class="profile-image">
								
								<!-- 정보 폼 -->								
								<div class="d-flex flex-column member-info-root-layout">
								
									<div class="d-flex flex-row info-item">
										<p class="info-text">ID :</p>	
										<p>${member.user_id}</p>
									</div>
									
									<div class="horizontal-line"></div>
									
									<div class="d-flex flex-row info-item">
										<p class="info-text">Type :</p>	
										<p>
											<c:choose>
												<c:when test="${member.member_type eq 'MB01'}">관리자</c:when>
												<c:when test="${member.member_type eq 'MB02'}">강사</c:when>
												<c:otherwise>일반회원</c:otherwise>
											</c:choose>
										</p>
									</div>
									
									<div class="horizontal-line"></div>
									
									<div class="d-flex flex-row info-item">
										<p class="info-text">이름 :</p>
										<p>${member.user_name}</p>
									</div>
									
									<div class="horizontal-line"></div>
									
									<div class="d-flex flex-row info-item">
										<p class="info-text">생년월일 :</p>
										<p>${member.birth}</p>
									</div>
									
									<div class="horizontal-line"></div>
									
									
									<div class="d-flex flex-row info-item">
										<p class="info-text">닉네임 :</p>
										<p>${member.nickname}</p>
									</div>
									
									<div class="horizontal-line"></div>
									
									<div class="d-flex flex-row info-item">
										<p class="info-text">이메일 :</p>
										<p>${member.email}</p>
									</div>
									
									<div class="horizontal-line"></div>
									
									<div class="d-flex flex-row info-item">
										<p class="info-text">휴대전화 :</p>
										<p>${member.phone}</p>
									</div>
									
									<div class="horizontal-line"></div>
									
									<div class="d-flex flex-row info-item">
										<p class="info-text">계정 상태 :</p>
										
										<select class="member-state-selector">
											<option>활성화</option>
											<option>정지</option>
										</select>
										

									</div>
									
<%-- 									<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_cancel.png" class="negative-button icon-delete"> --%>

								</div>
															
								
							</div>

							
							<!-- 
							TODO: JS 추가해야함 -> Focus 없애는코드
							const readonlyAreas = document.querySelectorAll('.readonly-textarea');
							readonlyAreas.forEach(el => {
							  el.addEventListener('focus', e => e.target.blur());
							});
							 -->


							<div class="d-flex button-container">
								<button type="button" onclick="history.back()" class="negative-button">돌아가기</button>
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
