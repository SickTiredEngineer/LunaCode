<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>CurEdit</title>
    <meta charset="UTF-8">
    <jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
    <link href="${pageContext.request.contextPath}/resources/css/page/class/cur_edit.css" rel="stylesheet">
</head>

<body>
<div class="page-base container">
    <header>
        <jsp:include page="/WEB-INF/views/inc/header.jsp"/>
    </header>

    <article class="class-edit-container">
        <h2 class="page-title">수업 수정</h2>
        <div class="horizontal-line"></div>

        <form method="post" action="${pageContext.request.contextPath}/CurEdit/${episode.episode_idx}">
            <section class="edit-form">
                <div class="form-row">
                    <label for="className" class="form-label">수업 이름</label>
                    <input type="text" id="className" name="episode_name" class="common-input-form"
                           value="${episode.episode_name}">
                </div>

                <div class="form-row">
                    <label for="video" class="form-label">영상 업로드</label>
                    <div class="input-with-button">
                        <input type="text" id="video" name="episode_video_path" class="common-input-form"
                               value="${episode.episode_video_path}">
                    </div>
                </div>
				
				<input type="hidden" name="episode_index" value="${episode.episode_index}">
				
                <div class="form-row">
                    <label for="description" class="form-label">Description</label>
                    <textarea id="description" name="episode_description" class="common-input-form">${episode.episode_description}</textarea>
                </div>
            </section>

            <div class="horizontal-line"></div>
            
            <c:if test="${not empty msg}">
			    <script>
			        alert('${msg}');
			        history.back();
			    </script>
			</c:if>
            
            <div class="button-group">
                <a href="javascript:history.back()" class="negative-button">취소</a>
                <button type="submit" class="positive-button">수정</button>
            </div>
        </form>

        <!--
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
        -->
    </article>

    <footer>
        <jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
    </footer>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        /*
        const openModalButton = document.querySelector('.open-library-modal');
        const modalOverlay = document.querySelector('.modal-overlay');
        const closeModalButton = document.querySelector('.modal-close-btn');

        openModalButton.addEventListener('click', function(event) {
            event.preventDefault();
            modalOverlay.style.display = 'flex';
        });

        closeModalButton.addEventListener('click', function(event) {
            event.preventDefault();
            modalOverlay.style.display = 'none';
        });

        modalOverlay.addEventListener('click', function(event) {
            if (event.target === modalOverlay) {
                modalOverlay.style.display = 'none';
            }
        });
        */
    });
</script>

</body>
</html>
