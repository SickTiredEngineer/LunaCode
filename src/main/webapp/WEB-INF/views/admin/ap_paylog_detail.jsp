<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>결제 기록 상세 보기</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_req_class_detail.css" rel="stylesheet">
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
						<h2 class="main-text">결제 기록</h2>
					</div>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
						
						
						<div class="d-flex flex-column">
						
							<div class="d-flex flex-column main_layout">
									
									<div class="d-flex flex-column justify-content-center align-item-center content-layout">

										<!-- 정보 폼 -->								
										<form  action="RefundPay" method="post" class="d-flex flex-column justify-content-center class-info-root-layout">
											
											<br>
											
											<div class="horizontal-line"></div>
										
											<div class="d-flex flex-row info-item">
												<p class="info-text">결제 번호 :</p>	
												<p>${payVo.merchant_uid}</p>
											</div>
										
											<div class="horizontal-line"></div>
										
											<div class="d-flex flex-row info-item">
												<p class="info-text">결제 강의명 :</p>	
												<p>${payVo.class_title}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">유저ID :</p>
												<p>${payVo.user_id}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">강사ID :</p>
												<p>${payVo.instructor_id}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">결제일 :</p>
												<p>${payVo.refunded_date}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">결제 방식 :</p>
												<p>${payVo.pay_method}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<br>
											
											<div class="d-flex flex-row info-item">
												<p class="info-text">환불 사유 :</p>
												
												<c:choose>
													<c:when test="${payVo.refunded_status}">
														<p>${payVo.refunded_reason}</p>
													</c:when>
													
													<c:otherwise>
														<textarea name="refunded_reason" rows="3" cols="5" class="common-input-form comment-input-layout margin-left">${payVo.refunded_reason}</textarea>
													</c:otherwise>
												</c:choose>	
											</div>

											<div class="d-flex button-container">
												<button type="button" onclick="history.back()" class="negative-button">돌아가기</button>
												
												<c:if test="${not payVo.refunded_status}">
												
													<input type="hidden" name="payment_idx" value="${payVo.payment_idx}">
												
													<button type="submit" class="positive-button">환불</button>
												</c:if>
												
											</div>
											
										</form>
										
									</div>
									
									<br>
									
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
