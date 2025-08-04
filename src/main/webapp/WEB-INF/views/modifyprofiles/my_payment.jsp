<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>MyPayment</title>
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
	                        <li class="payment-item">
	                            <div class="order-info">
	                                <div class="order-number">주문 번호 456456456</div>
	                                오늘도 배운다! 자바 핵심만 쏙쏙 배우는 명강의 100선
	                            </div>
	                            <div class="status-box">
	                                <div class="status paid">결제완료</div>
	                                <div class="date">2025.07.21 결제</div>
	                            </div>
	                        </li>
	                        <li class="payment-item">
	                            <div class="order-info">
	                                <div class="order-number">주문 번호 456456456</div>
	                                쉽지 않다. figma를 쉽게 이용해보자
	                            </div>
	                            <div class="status-box">
	                                <div class="status refunded">환불</div>
	                                <div class="date">2025.07.21 결제</div>
	                            </div>
	                        </li>
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