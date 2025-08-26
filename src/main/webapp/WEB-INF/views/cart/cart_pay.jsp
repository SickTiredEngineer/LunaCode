<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>

	<head>
		<title>CartPay</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/cart/cart_pay.css" rel="stylesheet">      
	</head>
	
	<body>
		<div class="page-base container">
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp" />
			</header>

			<article>
				<%-- data-cart-idx-list 속성 추가 --%>
				<c:set var="cartIdxJson">
				    <c:forEach var="item" items="${orderList}" varStatus="status">
				        ${item.cart_idx}<c:if test="${!status.last}">,</c:if>
				    </c:forEach>
				</c:set>
			
				<div class="payment-container"
					data-total-amount="${totalAmount}"
					data-order-name="${orderList[0].class_title}<c:if test='${orderList.size() > 1}'>외 ${orderList.size() - 1}건</c:if>"
					data-buyer-name="${buyerName}"
					data-buyer-email="${buyerEmail}"
					data-cart-idx-list="[${cartIdxJson}]">
					
					<h1 class="page-title">주문 / 결제</h1>
					
					<!-- 진행 단계 표시 -->
					<div class="progress-container">
						<div class="progress-step">
							<div class="step-circle">01</div>
							<div class="step-label">장바구니</div>
						</div>
						<div class="progress-arrow">&gt;</div>
						<div class="progress-step active">
							<div class="step-circle">02</div>
							<div class="step-label">주문 / 결제</div>
						</div>
						<div class="progress-arrow">&gt;</div>
						<div class="progress-step">
							<div class="step-circle">03</div>
							<div class="step-label">결제완료</div>
						</div>
					</div>
					
					<!-- 주문 상품 정보 -->
					<div class="content-section">
						<div class="section-header">
							<div class="header-item product-info">상품 정보</div>
							<div class="header-item">강의유형</div>
							<div class="header-item">강사명</div>
							<div class="header-item">상품금액</div>
							<div class="header-item">할인금액</div>
							<div class="header-item">결제금액</div>
						</div>
					 <c:forEach var="item" items="${orderList}">
                        <div class="order-item-box">
                            <div class="item-cell product-info">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/resources/upload/${item.class_thumbnail}" alt="${item.class_title}">
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
                            <div class="item-cell price-cell"><fmt:formatNumber value="${item.final_price}" pattern="#,###원" /></div>
                        </div>
                    </c:forEach>
					
					<!-- 결제 수단 선택 -->
					<div class="content-section">
						<div class="section-title-box">결제 수단 선택</div>
						<div class="payment-options">
							<div class="payment-option">
								<img src="${pageContext.request.contextPath }/resources/image/kakao.png" alt="카카오페이">
								<span>카카오 페이</span>
							</div>
							<div class="payment-option">
								<img src="${pageContext.request.contextPath }/resources/image/naver.png" alt="네이버페이">
								<span>네이버 페이</span>
							</div>
							<div class="payment-option">
								<img src="" alt="신용 / 체크카드">
								<span>신용 / 체크카드</span>
							</div>
						</div>
					</div>
					
					<!-- 환불 정책 안내 -->
					<div class="content-section">
						<div class="section-header">
							<div class="header-item" style="flex-grow: 2;">수강일</div>
							<div class="header-item" style="flex-grow: 1;">구분</div>
							<div class="header-item" style="flex-grow: 2;">환불액</div>
						</div>
						<div class="refund-policy-item">
							<div class="item-cell" style="flex-grow: 2;">결제일로부터 7일 이내</div>
							<div class="item-cell" style="flex-grow: 1;">전액 환불</div>
							<div class="item-cell" style="flex-grow: 2;">결제 금액 100% 환불 가능</div>
						</div>
						<div class="refund-policy-item">
							<div class="item-cell" style="flex-grow: 2;">결제일로부터 7일 경과 후</div>
							<div class="item-cell" style="flex-grow: 1;">부분 환불</div>
							<div class="item-cell" style="flex-grow: 2;">결제 금액 50% 환불 가능</div>
						</div>
					</div>
					
					<!-- 최종 결제 금액 요약 (장바구니와 동일한 구조) -->
					<div class="cart-summary">
						<div class="summary-item">
							<p>총 상품 금액</p>
							<p class="price"><fmt:formatNumber value="${totalAmount}" pattern="#,###원" /></p>
						</div>
						<div class="summary-operator">-</div>
						<div class="summary-item">
							<p>할인 금액</p>
							<p class="price">0원</p>
						</div>
						<div class="summary-operator">=</div>
						<div class="summary-item total">
							<p>총 결제 금액</p>
							<p class="price total-price"><fmt:formatNumber value="${totalAmount}" pattern="#,###원" /></p>
						</div>
					</div>
					
					<!-- 하단 버튼 (장바구니와 동일한 구조) -->
					<div class="cart-actions">
						<a href="Cart" class="negative-button">취소하기</a>
						<a href="CartOrder" class="positive-button">결제하기</a>
					</div>
				</div>
				</div>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
			</footer>
		</div>
	</body>

		<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
		<script src="${pageContext.request.contextPath }/resources/js/cart/cart_pay.js"></script>
	
</html>
