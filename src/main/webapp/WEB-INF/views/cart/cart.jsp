<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>

	<head>
		<title>Cart</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/cart/cart.css" rel="stylesheet">      
	</head>
	
	<body>
		<div class="page-base container">
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp" />
			</header>

			<article>
				<div class="cart-container">
					<h1 class="cart-title">장바구니</h1>
					
					<div class="progress-container">
						<div class="progress-step active">
							<div class="step-circle">01</div>
							<div class="step-label">장바구니</div>
						</div>
						<div class="progress-arrow">&gt;</div>
						<div class="progress-step">
							<div class="step-circle">02</div>
							<div class="step-label">주문 / 결제</div>
						</div>
						<div class="progress-arrow">&gt;</div>
						<div class="progress-step">
							<div class="step-circle">03</div>
							<div class="step-label">결제완료</div>
						</div>
					</div>
					
					<div class="cart-table">
						<div class="cart-header">
							<div class="header-item product-info">
								<input type="checkbox" id="select-all" checked>
								<label for="select-all">상품 정보</label>
							</div>
							<div class="header-item">강의유형</div>
							<div class="header-item">강사명</div>
							<div class="header-item">상품금액</div>
							<div class="header-item">할인금액</div>
							<div class="header-item">결제금액</div>
						</div>
					
						<div class="cart-item">
							<div class="item-cell product-info">
								<input type="checkbox">
								<div class="product-image">
									<img src="https://via.placeholder.com/80x60/E0E8F8/444444?text=Course" alt="자바 단기간 완성">
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
					
						<div class="cart-item">
							<div class="item-cell product-info">
								<input type="checkbox">
								<div class="product-image">
									<img src="https://via.placeholder.com/80x60/E0E8F8/444444?text=Course" alt="DB 단기간 완성">
								</div>
								<div class="product-details">
									<p class="product-name">DB 단기간 완성</p>
									<p class="product-duration">(3개월 / 150강)</p>
								</div>
							</div>
							<div class="item-cell">온라인</div>
							<div class="item-cell">이미미</div>
							<div class="item-cell">300,000원</div>
							<div class="item-cell">0원</div>
							<div class="item-cell">300,000원</div>
						</div>
						
						<div class="delete-button-container">
							<button class="positive-button small-button">삭제</button>
						</div>
					</div>
					
					<div class="cart-summary">
						<div class="summary-item">
							<p>총 상품 금액</p>
							<p class="price">500,000원</p>
						</div>
						<div class="summary-operator">-</div>
						<div class="summary-item">
							<p>할인 금액</p>
							<p class="price">0원</p>
						</div>
						<div class="summary-operator">=</div>
						<div class="summary-item total">
							<p>총 결제 금액</p>
							<p class="price total-price">500,000원</p>
						</div>
					</div>
					
					<div class="cart-actions">
						<a class="negative-button">강의 더보기</a>
						<a href="CartPay" class="positive-button">주문하기</a>
					</div>
				</div>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
			</footer>
		</div>
	</body>
	
	<script src="${pageContext.request.contextPath }/resources/js/cart/cart.js"></script>
	
</html>
