<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
	<head>
		<title>CurEdit</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/class/cur_edit.css" rel="stylesheet">     
	</head>

	<body>
		<div class="page-base container">
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article class="class-edit-container">
				<h2 class="page-title">수업 수정</h2>
			
				<div class="horizontal-line"></div>
			
				<section class="edit-form">
					<div class="form-row">
						<label for="className" class="form-label">수업 이름</label>
						<input type="text" id="className" class="common-input-form">
					</div>
			
					<div class="form-row">
						<label for="video" class="form-label">영상 선택</label>
						<div class="input-with-button">
							<input type="text" id="video" class="common-input-form">
							<a href="#" class="library-button">영상 라이브러리</a>
						</div>
					</div>
			
					<div class="form-row">
						<label for="description" class="form-label">Description</label>
						<textarea id="description" class="common-input-form"></textarea>
					</div>
				</section>
			
				<div class="horizontal-line"></div>
			
				<div class="button-group">
					<a href="#" class="negative-button">취소</a>
					<a href="#" class="positive-button open-library-modal">수정</a>
				</div>
			</article>

			<div class="modal-overlay">
				<div class="modal-container">
					
					<div class="modal-header">
						<h3>영상 라이브러리</h3>
						<a href="#" class="upload-icon">
							<span class="material-symbols-outlined">UP</span>
						</a>
					</div>
					
					<div class="modal-content">
						<div class="video-list-placeholder">
							<p class="video-list-header">업로드 해둔 영상 목록(7)</p>
						</div>
					</div>
					
					<div class="modal-footer">
						<a href="#" class="negative-button modal-close-btn">취소</a>
						<a href="#" class="positive-button">등록</a>
					</div>
			
				</div>
			</div>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		</div>
	</body>
	
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// 모달을 열기 위한 '수정' 버튼
			const openModalButton = document.querySelector('.open-library-modal');
			
			// 모달 요소들
			const modalOverlay = document.querySelector('.modal-overlay');
			const closeModalButton = document.querySelector('.modal-close-btn');
	
			// '수정' 버튼을 클릭하면 모달을 보여줌
			openModalButton.addEventListener('click', function(event) {
				event.preventDefault(); // a 태그의 기본 동작 방지
				modalOverlay.style.display = 'flex';
			});
	
			// 모달의 '취소' 버튼을 클릭하면 모달을 숨김
			closeModalButton.addEventListener('click', function(event) {
				event.preventDefault();
				modalOverlay.style.display = 'none';
			});
	
			// 모달의 어두운 배경을 클릭하면 모달을 숨김
			modalOverlay.addEventListener('click', function(event) {
				if (event.target === modalOverlay) {
					modalOverlay.style.display = 'none';
				}
			});
		});
	</script>
	
</html>
