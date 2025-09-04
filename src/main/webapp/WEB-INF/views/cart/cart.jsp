<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
				<form action="CartPay" method="POST" id="cartForm">
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
						
							<!-- JSTL을 사용한 동적 상품 목록 생성 -->
		                    <c:forEach var="item" items="${cartList}">
		                        <div class="cart-item" data-cart-idx="${item.cart_idx}">
		                            <div class="item-cell product-info">
		                                <input type="checkbox" name="selectedItems" value="${item.cart_idx}" checked>
		                                <div class="product-image">
		                                    <img src="${pageContext.request.contextPath}/resources/class_thumbnails/${item.class_thumbnail}">
		                                </div>
		                                <div class="product-details">
		                                    <p class="product-name">${item.class_title}</p>
		                                    <p class="product-duration">(${item.total_lessons}강)</p>
		                                </div>
		                            </div>
		                            <div class="item-cell">${item.class_type}</div>
		                            <div class="item-cell">${item.user_id}</div>
		                            <div class="item-cell"><fmt:formatNumber value="${item.class_price}" pattern="#,###원" /></div>
		                            <div class="item-cell"><fmt:formatNumber value="${item.discount_price}" pattern="#,###원" /></div>
		                            <div class="item-cell"><fmt:formatNumber value="${item.final_price}" pattern="#,###원" /></div>
		                        </div>
		                    </c:forEach>
		                    
		                    <!-- 장바구니가 비어있을 경우 표시 -->
		                    <c:if test="${empty cartList}">
		                        <div class="empty-cart" style="text-align: center; padding: 50px; border-bottom: 1px solid #ddd;">
		                            <p>장바구니에 담긴 상품이 없습니다.</p>
		                        </div>
		                    </c:if>
							
							<div class="delete-button-container">
								<button type="button" class="positive-button small-button">삭제</button>
							</div>
						</div>
						
						<div class="cart-summary">
							<div class="summary-item">
								<p>총 상품 금액</p>
								<p class="price">0원</p>
							</div>
							<div class="summary-operator">-</div>
							<div class="summary-item">
								<p>할인 금액</p>
								<p class="price">0원</p>
							</div>
							<div class="summary-operator">=</div>
							<div class="summary-item total">
								<p>총 결제 금액</p>
								<p class="price total-price">0원</p>
							</div>
						</div>
						
						<div class="cart-actions">
							<a href="ClassDisplayStand" class="negative-button">강의 더보기</a>
							<button type="submit" class="positive-button">주문하기</button>
						</div>
					</div>
				</form>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
			</footer>
		</div>
	</body>
	
	<script src="${pageContext.request.contextPath }/resources/js/cart/cart.js"></script>
	
</html>
