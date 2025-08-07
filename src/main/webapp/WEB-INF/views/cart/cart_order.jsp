<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>CartOrder</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/cart/cart_order.css" rel="stylesheet">      
	</head>
	
	<body>
		<div class="page-base container">
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp" />
			</header>

			<article>
				<div class="completion-container">
					<h1 class="page-title">주문 / 결제</h1>
					
					<!-- 진행 단계 표시 -->
					<div class="progress-container">
						<div class="progress-step">
							<div class="step-circle">01</div>
							<div class="step-label">장바구니</div>
						</div>
						<div class="progress-arrow">&gt;</div>
						<div class="progress-step">
							<div class="step-circle">02</div>
							<div class="step-label">주문 / 결제</div>
						</div>
						<div class="progress-arrow">&gt;</div>
						<div class="progress-step active">
							<div class="step-circle">03</div>
							<div class="step-label">결제완료</div>
						</div>
					</div>
					
					<!-- 주문 완료 메시지 -->
					<div class="completion-message-box">
						<p class="completion-text">주문 성공적으로 완료되었습니다.</p>
						<div class="completion-actions">
							<a href="#" class="negative-button">강의 목록</a>
							<a href="UserMain" class="negative-button">홈으로</a>
						</div>
					</div>
					
					<hr class="separator-line">
					
					<!-- 주문 내역 표시 -->
					<div class="order-history-section">
						<div class="section-header">
							<div class="header-item product-info">주문 내역</div>
							<div class="header-item">강의유형</div>
							<div class="header-item">강사명</div>
							<div class="header-item">상품금액</div>
							<div class="header-item">할인금액</div>
							<div class="header-item">결제금액</div>
						</div>
						<div class="order-item-box">
							<div class="item-cell product-info">
								<div class="product-image">
									<img src="" alt="자바 단기간 완성">
								</div>
								<div class="product-details">
									<p class="product-name">자바 단기간 완성</p>
									<p class="product-duration">(3개월 / 150강)</p>
								</div>
							</div>
							<div class="item-cell">온라인</div>
							<div class="item-cell">김라라</div>
							<div class="item-cell">500,000원</div>
							<div class="item-cell">0원</div>
							<div class="item-cell">500,000원</div>
						</div>
					</div>
				</div>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
			</footer>
		</div>
	</body>
	
</html>
