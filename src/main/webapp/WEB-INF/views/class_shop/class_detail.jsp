<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<html>

	<head>
		<title>강의 신청</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/class_shop/class_detail.css" rel="stylesheet">
	</head>
	
	
	<body>
		

    <!-- 모달 -->
		<div class="modal fade" id="courseDetailModal" tabindex="-1" aria-labelledby="courseDetailLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg modal-dialog-centered">
		    <div class="modal-content shadow rounded-4 border-0 p-4">
		      
		      <!-- 헤더 -->
		      <div class="modal-header border-0 pb-0">
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
		      </div>
		      
		      <!-- 바디 -->
		      <div class="modal-body pt-3">
		        <div class="row g-4">
		          
		          <!-- 왼쪽: 강의 이미지 -->
		          <div class="col-md-5 text-center">
		            <img src="resources/class_thumbnail/class_thumb_01.png" alt="JAVA 단기간 완성" class="img-fluid rounded-3 shadow-sm"  />
		          </div>
		          
		          <!-- 오른쪽: 강의 정보 -->
		         <div class="col-md-7">
				  <ul class="list-unstyled mb-4" >
					<h5 class="modal-title fw-bold fs-3" id="courseDetailLabel">JAVA 단기간 완성</h5>
				    <li class="mb-2"><strong>기간: </strong>2025.09.01 ~ 2025.12.01</li>
				    <li class="mb-2"><strong>수강료: </strong>100,000원</li>
				    <li class="mb-2"><strong>강사:</strong> 김라라</li>
				    <li class="mb-2"><strong>장소:</strong> 부산광역시 진구 5485  OO 빌딩 17층 A 강의실</li>
				    <li class="mb-2"><strong>강의 형태: </strong>온라인 강의</li>
				  </ul>
				</div>
		
		            
		            <!-- 수강 신청 버튼 -->
		            <button class="btn btn-primary w-100" >
		              <i class="bi bi-cart3 me-2"></i>수강 신청하기
		            </button>
		            
		          </div>
		          
		            <nav id="navbar-example2" class="navbar bg-body-tertiary px-3 mb-3">
					  <ul class="nav nav-pills">
					    <li class="nav-item">
					      <a class="nav-link" href="#scrollspyHeading1">과목 소개</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link" href="#scrollspyHeading2">강사 소개</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link" href="#scrollspyHeading3">수강 후기</a>
					    </li>
					  </ul>
					</nav>
					<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">
					  <h4 id="scrollspyHeading1">과목 소개</h4>
					  <p>제 1강 백드 개발 개요와 개발 환경 설정</p>
					  <p>제 2강 Java 문법 기초와 객체지향 이해</P>
					  <p>제 3강 서블릿(Servlet)과 웹 요청 흐름</P>
					  <h4 id="scrollspyHeading2">강사 소개</h4>
					  <p>...</p>
					  <p>...</p>
					  <p>...</p>
					  <p>...</p>
					  <p>...</p>
					  <p>...</p>
					  <p>...</p>
					  <p>...</p>
					  <p>...</p>
					  <h4 id="scrollspyHeading3">수강 후기</h4>
					  <p>...</p>
					</div>
					
		      </div>
		      
		    </div>
		  </div>
		</div>

	  <!-- Bootstrap 5 JS + Popper (bundle) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	  

      
	  <script src="${pageContext.request.contextPath}/resources/js/class_shop/class_detail.js"></script>
	</body>
	
</html>
