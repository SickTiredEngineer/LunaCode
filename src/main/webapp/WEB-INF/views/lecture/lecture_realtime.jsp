<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>실시간 강의</title>

<link
	href="${pageContext.request.contextPath}/resources/css/common/css_variables.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/layout/header.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/layout/carousel_main_banner.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/page/lecture/lecture.css">
</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/inc/header.jsp" />
	</header>

	<div class="page-base-custom-container">
		<div class="container-wrapper">

			<!-- ✅ 왼쪽 사이드바 -->
        <div class="left-area">
            <aside class="left-sidebar">
                <h3>강의</h3>
                <ul>
                    <li><a href="/lecture/realtime" class="sidebar-lecture-link active">실시간 강의</a></li>
                    <li><a href="/lecture/lecture" class="sidebar-lecture-link">온라인 강의</a></li>
                    <li><a href="/lecture/offline" class="sidebar-lecture-link">현장 강의</a></li>
                </ul>
            </aside>

            <div class="sidebar-recommend">
                <h3 class="sidebar-section-title">추천 강의</h3>
                <div class="sidebar-recommend-item">
                    <div class="sidebar-image-item">
                        <img src="${pageContext.request.contextPath}/resources/image/lecture_image1.png" alt="추천 강의 이미지" class="responsive-image">
                    </div>
                    <h6 class="sidebar-section-title">자격증 특강</h6>
            <a href="${pageContext.request.contextPath}/lecture/offline"><button>현장 강의</button></a>
        	<a href="${pageContext.request.contextPath}/lecture/online"><button>온라인 강의</button></a>
                </div>
            </div>
        </div>

			<!-- ✅ 메인 콘텐츠 -->
			<main class="main-content-area">
				<h2 class="section-title">실시간 강의</h2>

				<div class="lecture-page-controls">

				</div>

				<div class="realtime-lecture-info">
					<h5>오늘의 강의 주제</h5>
					<p>생성자에 대한 기초부터 알아보아요</p>
				</div>

				<div class="video-player-container realtime-video">
					<span class="play-overlay icon-play">▶</span>
					<div class="video-controls">
						<div class="control-buttons">
							<span class="icon-custom">❚❚</span> <span class="icon-custom">▶</span>
							<span class="icon-custom">🔊</span>
						</div>
						<div class="progress-bar">
							<div class="progress-fill"></div>
							<div class="playhead"></div>
						</div>
						<div class="control-buttons">
							<span class="icon-custom">⚙️</span> <span class="icon-custom">⛶</span>
						</div>
					</div>
				</div>
			</main>

			<!-- ✅ 오른쪽 목차 -->
			<aside class="right-sidebar">
				<h3>
					<i class="bi bi-list"></i> 목차
				</h3>
				<div class="toc-list">
					<div class="toc-item">
						<div class="image-thumb">
							<img
								src="${pageContext.request.contextPath}/resources/image/lecturethumbnail1.png"
								alt="강의 썸네일" class="toc-thumbnail">
						</div>
						<div class="chapter-info">1 - OT</div>
					</div>

					<div class="toc-item">
						<div class="image-thumb">
							<img
								src="${pageContext.request.contextPath}/resources/image/lecturethumbnail2.png"
								alt="강의 썸네일" class="toc-thumbnail">
						</div>
						<div class="chapter-info">2 - 실습</div>
					</div>
				</div>
			</aside>

		</div>
	</div>

	<footer>
		<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
