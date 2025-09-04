<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<title>루나코드 홈 화면</title>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/inc/common_head.jsp" />
<link
	href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain_category.css"
	rel="stylesheet">
</head>

<body>
	<div class="page-base container">
		<header>
			<jsp:include page="/WEB-INF/views/inc/header.jsp" />
		</header>

		<article>

			<%-- 검색 영역 --%>
			<div class="search-area">
				<div class="search-bar-wrapper">
					<div class="class-box">
						<a href="ClassDisplayStand" class="positive-button">강의 상점</a>
					</div>
					<form action="ClassDisplayStand" name="q" class="search-box">
						<span class="search-icon">▼</span> <input type="text"
							placeholder="검색어를 입력하세요">
					</form>
				</div>
				<div class="tag-list">
					<span class="tag">#JAVA</span> <span class="tag">#DATABASE</span> <span
						class="tag">#BACK-END</span> <span class="tag">#FRONT-END</span>
				</div>
			</div>

			<div class="content-layout">
				<%-- 좌측 공통 카테고리 --%>
				<jsp:include page="/WEB-INF/views/usermain/usermain_category.jsp" />

				<%-- 메인 콘텐츠 영역 --%>
				<section class="main-dashboard">

					<!-- 상단 캐러셀 -->
					<div class="carousel-container">
						<%-- 캐러셀 코드는 Bootstrap에 의존하므로 그대로 사용 --%>
						<div id="mainCarousel" class="carousel slide"
							data-bs-ride="carousel" data-bs-interval="3000">
							<div class="carousel-inner">
								<%-- 실제 이미지 경로로 수정 필요 --%>
								<div class="carousel-item active">
									<img
										src="${pageContext.request.contextPath}/resources/image/banner1.png"
										class="d-block w-100" alt="배너1">
								</div>
								<div class="carousel-item">
									<img
										src="${pageContext.request.contextPath}/resources/image/banner3.png"
										class="d-block w-100" alt="배너2">
								</div>
								<div class="carousel-item">
									<img
										src="${pageContext.request.contextPath}/resources/image/luna_logo_3.png"
										class="d-block w-100" alt="배너3">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#mainCarousel" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#mainCarousel" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>

					<!-- 정보 위젯 섹션 -->
					<ul class="widget-list">
						<li class="widget-item">
							<h3 class="widget-header">
								<a href="MyClass" class="widget-full-link"> <span>내
										강의</span> <span class="widget-more-arrow">></span>
								</a>
							</h3> <c:forEach var="course" items="${inProgressCourses}">
								<div class="widget-content">
									<div class="class-info">
										<%-- MyCourseVO의 필드를 사용하여 동적으로 값 출력 --%>
										<span class="class-title">${course.class_title}</span>
										<%-- 							                <span class="class-status">${course.current_lesson_count} / ${course.total_lessons} 완료</span> --%>
									</div>
									<%-- 							            <div class="progress" role="progressbar" aria-valuenow="${course.progress_percent}" aria-valuemin="0" aria-valuemax="100"> --%>
									<%-- 							                <div class="progress-bar" style="width: ${course.progress_percent}%">${course.progress_percent}%</div> --%>
									<!-- 							            </div> -->
								</div>
							</c:forEach> <%-- 만약 학습 중인 강의가 하나도 없다면 안내 메시지 표시 --%> <c:if
								test="${empty inProgressCourses}">
								<div class="widget-content">
									<div class="class-info-empty">학습 중인 강의가 없습니다.</div>
								</div>
							</c:if>
						</li>

						<li class="widget-item">
							<h3 class="widget-header">
								<a href="Attendance" class="widget-full-link"> <span>출석</span>
									<span class="widget-more-arrow">></span>
								</a>
							</h3>
							<div class="widget-content">
								<div class="attendance-item">
									<span>전체 출석</span> <span><strong>${attendanceInfo.attendance_count}</strong>일</span>
								</div>
								<div class="attendance-item">
									<span>일간 연속 출석</span> <span><strong>${attendanceInfo.attendance_consecutive}</strong>일</span>
								</div>
								<div class="attendance-item">
									<span>월간 연속 출석</span> <span><strong>${attendanceInfo.consecutive_monthly_attendance}</strong>달</span>
								</div>
							</div>
						</li>

						<!-- 							<li class="widget-item"> -->
						<!-- 								<h3 class="widget-header"> -->
						<!-- 									<a href="PlayList" class="widget-full-link"> -->
						<!-- 										<span>재생목록</span> -->
						<!-- 										<span class="widget-more-arrow">></span> -->
						<!-- 									</a> -->
						<!-- 								</h3> -->
						<!-- 								<div class="widget-content"> -->
						<!-- 									<a href="PlayList" class="playlist-add-button">+</a> -->
						<%-- 									<c:forEach var="playlist" items="${recentPlaylists}"> --%>
						<!-- 							            <div class="playlist-item"> -->
						<%-- 							                <a href="<c:url value='/PlayListPlus?id=${playlist.playlist_idx}'/>"> --%>
						<%-- 							                    ${playlist.playlist_name} --%>
						<!-- 							                </a> -->
						<!-- 							            </div> -->
						<%-- 							        </c:forEach> --%>

						<!-- 							        만약 재생목록이 하나도 없다면 메시지 표시 -->
						<%-- 							        <c:if test="${empty recentPlaylists}"> --%>
						<!-- 							            <div class="playlist-item-empty"> -->
						<!-- 							                재생목록이 없습니다. -->
						<!-- 							            </div> -->
						<%-- 							        </c:if> --%>

						<!-- 								</div> -->
						<!-- 							</li> -->
					</ul>

				</section>
			</div>
		</article>

		<footer>
			<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
		</footer>
	</div>

	<script>
		const contextPath = "${pageContext.request.contextPath}";
	</script>

	<script
		src="${pageContext.request.contextPath}/resources/js/usermain/usermain.js"></script>

</body>
</html>
