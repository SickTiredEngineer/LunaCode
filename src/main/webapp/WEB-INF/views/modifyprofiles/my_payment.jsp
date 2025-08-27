<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>

	<head>
		<title>결제 내역</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/my_payment.css" rel="stylesheet">      
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_category.css" rel="stylesheet">
	</head>
	
	<body>
		<div class="page-base container">
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp" />
			</header>

			<article>
				<%-- 페이지 제목 --%>
				<div class="title-layout">
					<h2 class="page-main-title">결제 내역</h2>
				</div>

				<%-- 메인 콘텐츠 레이아웃 --%>
				<div class="content-layout">
				
					<%-- 좌측 공통 카테고리 --%>
					<aside class="common-category">
						<a href="ModifyProfile" class="common-category-element">프로필 설정</a>
						<a href="ModifyPasswd" class="common-category-element">비밀번호 설정</a>
						<a href="MyPayment" class="common-category-element active">결제 내역</a>
						<a href="ModifyDelete" class="common-category-element">계정 탈퇴</a>
					</aside>
					
					<%-- 결제 내역 목록 컨테이너 --%>
					<section class="payment-history-container">
						<ul class="payment-list">
	
	                        <c:forEach var="payment" items="${paymentList}">
	                            <li class="payment-item">
	                                <div class="order-info">
	                                    <div class="order-number">주문 번호 ${payment.merchant_uid}</div>
	                                    
	                                    ${payment.representative_item_name}
	                                    <c:if test="${payment.total_item_count > 1}">
	                                        외 ${payment.total_item_count - 1}건
	                                    </c:if>
	                                </div>
	                                <div class="status-box">
	                                    <c:choose>
	                                        <c:when test="${payment.is_refunded == 'Y' or payment.is_refunded == '1'}">
	                                            <div class="status refunded">환불완료</div>
	                                        </c:when>
	                                        <c:otherwise>
	                                            <div class="status paid">결제완료</div>
	                                        </c:otherwise>
	                                    </c:choose>

	                                    <div class="date"><fmt:formatDate value="${payment.pay_date}" pattern="yyyy.MM.dd"/> 결제</div>
	                                </div>
	                            </li>
	                        </c:forEach>

	                        <c:if test="${empty paymentList}">
	                            <li class="empty-payment">
	                                <p>결제 내역이 없습니다.</p>
	                            </li>
	                        </c:if>
						</ul>
					</section>
				</div>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
			</footer>
		</div>
	</body>

</html>
