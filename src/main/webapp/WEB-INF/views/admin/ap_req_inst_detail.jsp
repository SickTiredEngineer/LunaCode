<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>강사 신청 상세 정보</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_req_inst_detail.css" rel="stylesheet">
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
						<h2 class="main-text">강사 신청 관리</h2>
					</div>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
						
						
						<form action="ApModifyInst" method="post" class="d-flex flex-column">
						
							<input type="hidden" name="idx" value="${instVo.idx}">
						
							<div class="d-flex flex-column main_layout">
									
									<div class="d-flex flex-row content-layout">
									
									
										<img alt="" src="${pageContext.request.contextPath}/resources/icons/icon_profile.png" class="profile-image">

										<!-- 정보 폼 -->								
										<div class="d-flex flex-column member-info-root-layout">
										
											<div class="d-flex flex-row info-item">
												<p class="info-text">ID :</p>	
												<p>${instVo.user_id}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">이름 :</p>
												<p>${instVo.user_name}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">생년월일 :</p>
												<p>${instVo.birth}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">닉네임 :</p>
												<p>${instVo.nickname}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">이메일 :</p>
												<p>${instVo.email}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">휴대전화 :</p>
												<p>${instVo.phone}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">승인 여부 :</p>
												
												<select name="accept_status" class="member-state-selector">
													<option value="IS01" ${instVo.accept_status eq 'IS01'? 'selected':''}>승인</option>
													<option value="IS02" ${instVo.accept_status eq 'IS02'? 'selected':''}>보류</option>
													<option value="IS03" ${instVo.accept_status eq 'IS03'? 'selected':''}>거부</option>
												</select>

											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">보류 사유 :</p>
												<textarea name="deny_reason" rows="3" cols="5" class="common-input-form comment-input-layout margin-left">${instVo.deny_reason}</textarea>
											</div>

										</div>
										
									</div>
									
									<br>
									
									<div class="horizontal-line"></div>
								
									<div class="d-flex justify-content-center attachment-text">강사 증빙 자료</div>
									
									<div class="d-flex flex-row content-layout">
										<p class="attachment-info-text">첨부 파일1: </p>
										<a href="${pageContext.request.contextPath}/resources/attachment_upload/${instVo.certificate_01}" download>${instVo.certificate_01}</a>
									</div>
									
									<div class="d-flex flex-row content-layout">
										<p class="attachment-info-text">첨부 파일2: </p>
										<a href="${pageContext.request.contextPath}/resources/attachment_upload/${instVo.certificate_02}" download>${instVo.certificate_02}</a>
									</div>
									
									<div class="d-flex flex-row content-layout">
										<p class="attachment-info-text">첨부 파일3: </p>
										<a href="${pageContext.request.contextPath}/resources/attachment_upload/${instVo.certificate_03}" download>${instVo.certificate_03}</a>
									</div>							
								
							</div>

							<div class="d-flex button-container">
								<button type="button" onclick="history.back()" class="negative-button">돌아가기</button>
								<button type="submit" class="positive-button">적용</button>
							</div>
		
						</form>
	
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
