<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

<head>
<title>온라인 강의</title>
<meta charset="UTF-8">

<link href="${pageContext.request.contextPath}/resources/css/page/class/online_class.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>

</head>

<body>

	<div class="page-base container">
	
	<!-- 헤더 -->
	<header>
	  <jsp:include page="/WEB-INF/views/inc/header.jsp"/>
	</header>
	
	<article>
	  <h2 class="title_text">강의 이름을 적는다</h2>
	
	  <div class="video-section">
	    <!-- 카테고리 -->
	    <div class="common-category-wrapper">
	      <div class="d-flex flex-column align-items-center common-category category-size">
	        <a href="#" class="common-category-element">강의 목록</a>
	        <a href="#" class="common-category-element">Quiz</a>
	        <a href="#" class="common-category-element">메모</a>
	      </div>
	    </div>
	
	    <!-- 영상 영역 + 강의명(캡션) -->
	 	<div class="video-section">  
	    <div class="video-wrapper">
	      <video id="video" class="video_play" controls controlsList="nodownload">
	        <source src="${pageContext.request.contextPath}/resources/video_upload/video1.mp4" type="video/mp4" />
	      </video>
	      <div class="lecture-caption">3 - 2. 생성자 배우기</div>
	    </div>
	  </div>
	  
	  <!-- 강의 리스트 (썸네일+강의명) -->
	  <div class="video-toc">
		<ul>
		 <li>
			<a href="#" onclick="changeVideo('video1.mp4'); return false;">
				<img src="${pageContext.request.contextPath}/resources/image/banner3.png" alt="1강 썸네일" class="thumb" />
				<span class="toc-title">1강: 오리엔테이션</span>
			</a>
		 </li>
		 <li>
			<a href="#" onclick="changeVideo('video2.mp4'); return false;">
				<img src="${pageContext.request.contextPath}/resources/image/banner3.png" alt="2강 썸네일" class="thumb" />
				<span class="toc-title">2강: 이론 설명</span>
			</a>
		 </li>
		 <li>
			<a href="#" onclick="changeVideo('video3.mp4'); return false;">
				<img src="${pageContext.request.contextPath}/resources/image/banner3.png" alt="3강 썸네일" class="thumb" />
				<span class="toc-title">3강: 실전 예제</span>
			</a>
		 </li>
		</ul>
	  </div>
	  </div>
	  <!-- 추가하기 버튼 -->
	  <div class="add-button-wrapper" style="margin-top:20px;">
	    <button type="button" class="btn btn-outline-success" id="addAccordionBtn">메모 추가</button>
	  </div>
	  
	  <div class="accordion" id="memoAccordion"></div>
	
	  <div class="lecture-comment-section"></div>
	
	  <ul class="comment-list"></ul>
	
	  <!-- 댓글 작성 영역 -->
	  <div class="comment-input-area">
	    <textarea placeholder="댓글을 입력하세요..."></textarea>
	    <button type="button" class="btn btn-outline-success">등록</button>
	  </div>
	  
	  <ul class="comment-list">
	    <li class="comment-item">
	      <ul class="reply-list"></ul>
	      <div class="reply-input-area" style="display:none; margin-top:8px;">
	        <textarea class="form-control" placeholder="답글을 입력하세요..." rows="2"></textarea>
	        <button type="button" class="btn btn-sm btn-primary reply-submit-btn mt-2">등록</button>
	      </div>
	    </li>
	  </ul>
	
	</article>
	
		<!-- 푸터 -->
		<footer>
		  <jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
		</footer>
		
		<script src="${pageContext.request.contextPath}/resources/js/video_upload/video.js"></script>
	
	</div>
	
	<!-- 퀴즈 모달 -->
	<div class="modal fade" id="quizModal" tabindex="-1" aria-labelledby="quizModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="quizModalLabel">QUIZ</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
	      </div>
	      <div class="modal-body">
	        <form id="quizForm">
	          <div class="mb-3">
	            <label id="quizQuestion" class="form-label"></label>
	            <input type="text" placeholder="Answer" class="form-control" id="quizAnswer" name="quizAnswer" required>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary d-none" id="prevBtn">이전</button>
	        <button type="button" class="btn btn-primary" id="nextBtn">다음</button>
	        <button type="button" class="btn btn-success d-none" id="submitBtn">제출</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 경고 모달 -->
	<div class="modal fade" id="warningModal" tabindex="-1" aria-labelledby="warningLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content warning-modal-content">
	      <div class="modal-body text-center">
	        <img src="${pageContext.request.contextPath}/resources/image/warning_icon.png" alt="경고 아이콘" class="warning-icon mb-3" />
	        <p class="warning-message">답변을 입력해 주세요!</p>
	        <button type="button" class="btn btn-warning mt-3" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>


</body>

</html>
