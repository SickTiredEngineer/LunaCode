<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>MyClassDetail</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/my_class_detail.css" rel="stylesheet">  
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain_category.css" rel="stylesheet">    
	</head>
	
	<body>
		<div class="page-base container">
			
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
			
			 <article class="content-layout">
	            <%-- 좌측 공통 카테고리 --%>
				<aside class="common-category">
	                <a href="UserMain" class="common-category-element active">홈</a>
	                <a href="MyClass" class="common-category-element">내 강의</a>
	                <a href="PlayList" class="common-category-element">재생목록</a>
	                <a href="Attendance" class="common-category-element">출석</a>
	                <a href="#" class="common-category-element">커뮤니티 활동</a>
	            </aside>
				
				<section class="course-detail-container">

				    <!-- 페이지 상단 (제목 + 정렬 버튼) -->
				    <div class="course-detail-header">
				        <h2 class="main-title">오늘도 배운다! 자바 핵심만 쏙쏙 배우는 명강의 100선</h2>
				        <button class="positive-button">최신 수강순 ▼</button>
				    </div>
				
				    <!-- 강의 섹션 목록 -->
				    <ul class="section-list">
				
				        <!-- 섹션 1 -->
				        <li class="section-item">
				            <!-- 섹션 제목/진행률 헤더 (클릭해서 열고 닫는 부분) -->
				            <div class="section-header">
				                <span class="section-title">
				                    <span class="arrow-icon">▼</span>
				                    백엔드 개발 개요와 개발 환경 설정
				                </span>
				                <span class="section-progress">진행률 : 20% <b>3개</b></span>
				            </div>
				
				            <!-- 개별 강의 목록 -->
				            <ul class="lecture-list">
				                <li class="lecture-item">
				                    <a href="#">
				                        <span class="lecture-info">
				                            <span class="play-icon">▶</span>
				                            <span class="lecture-title">프롤로그</span>
				                        </span>
				                        <span class="lecture-duration">
				                             <span class="pencil-icon">✎</span>
				                             7 : 28
				                        </span>
				                    </a>
				                </li>
				                <li class="lecture-item">
				                     <a href="#">
				                        <span class="lecture-info">
				                            <span class="play-icon">▶</span>
				                            <span class="lecture-title">개요</span>
				                        </span>
				                        <span class="lecture-duration">
				                             <span class="pencil-icon">✎</span>
				                             9 : 02
				                        </span>
				                    </a>
				                </li>
				                <li class="lecture-item">
				                    <a href="#">
				                        <span class="lecture-info">
				                            <span class="play-icon">▶</span>
				                            <span class="lecture-title">환경 설정</span>
				                        </span>
				                        <span class="lecture-duration">
				                             <span class="pencil-icon">✎</span>
				                             7 : 00
				                        </span>
				                    </a>
				                </li>
				            </ul>
				        </li>
				
				        <!-- 섹션 2 -->
				        <li class="section-item">
				            <div class="section-header">
				                 <span class="section-title">
				                    <span class="arrow-icon">▼</span>
				                    Java 문법 기초와 객체지향 이해
				                </span>
				                <span class="section-progress">진행률 : 50% <b>7개</b></span>
				            </div>
				            <!-- 이 섹션의 강의 목록은 여기에 ul.lecture-list 로 추가됩니다. -->
				        </li>
				
				    </ul>
				</section>
				
				
	        </article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
	</body>
	
</html>