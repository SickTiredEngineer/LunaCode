<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>

	<head>
		<title>MyProfile</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/my_profile/my_profile.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	</head>
	
	<body>
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
			
			<c:if test="${user.member_type == 'MB02' && user.deny_reason == '서류 검토가 필요합니다.'}">
				<div class="dashboard-panel notice-panel">
					<h4>강사 기능 사용 안내</h4>
					<p>
						현재 강사 서류 검토가 진행 중입니다. 관리자의 승인이 완료된 후에 정상적으로 강사 기능을 이용하실 수 있습니다.
					</p>
				</div>
			</c:if>
			
			<article class="mypage-container">
				
				<!-- 왼쪽 프로필 영역 -->
				<aside class="profile-section">
					<c:if test="${not empty user.profile_img}">
						<div class="profile-image" style="background-image: 
							url('${pageContext.request.contextPath}${user.profile_img}');">
						</div>
					</c:if>
					<c:if test="${empty user.profile_img}">
						<div class="profile-image"></div>
					</c:if>
					<div class="profile-nickname" >${user.nickname}</div>
					<div class="profile-info">${user.bio}</div>
					<div class="profile-info">github : ${user.github_url}</div>
					<!-- 공용 버튼 클래스 적용 -->
					<a href="ModifyProfile" type="button" class="positive-button">계정 설정</a>
				</aside>

				<!-- 오른쪽 대시보드 영역 -->
				<section class="dashboard-section">
				
					<!-- 대시보드 네비게이션 -->
					<nav class="dashboard-nav">
						<ul>
							<li><a href="" class="active">학습 통계</a></li>
							<li><a href="PersonalSupport">고객센터</a></li>
						</ul>
					</nav>
					
					<!-- 대시보드 콘텐츠 그리드 -->
					<div class="dashboard-grid">
						<!-- 출석 패널 -->
						<div class="dashboard-panel attendance-panel">
							<h4><a href="Attendance">출석</a></h4>
							<div class="chart">
								<div class="bar-container">
									<div class="bar" style="height: ${attendanceInfo.daily_attendance_stats['MON'] * 75}%;">
									</div><span>월</span>
								</div>
								<div class="bar-container">
									<div class="bar" style="height: ${attendanceInfo.daily_attendance_stats['TUE'] * 75}%;">
									</div><span>화</span>
								</div>
								<div class="bar-container">
									<div class="bar" style="height: ${attendanceInfo.daily_attendance_stats['WED'] * 75}%;">
									</div><span>수</span>
								</div>
								<div class="bar-container">
									<div class="bar" style="height: ${attendanceInfo.daily_attendance_stats['THU'] * 75}%;">
									</div><span>목</span>
								</div>
								<div class="bar-container">
									<div class="bar" style="height: ${attendanceInfo.daily_attendance_stats['FRI'] * 75}%;">
									</div><span>금</span>
								</div>
								<div class="bar-container">
									<div class="bar" style="height: ${attendanceInfo.daily_attendance_stats['SAT'] * 75}%;">
									</div><span>토</span>
								</div>
								<div class="bar-container">
									<div class="bar" style="height: ${attendanceInfo.daily_attendance_stats['SUN'] * 50}%;">
									</div><span>일</span>
								</div>
							</div>
						</div>

						<!-- 학습 현황 패널 -->
						<div class="dashboard-panel learning-status-panel">
							<h4>학습 현황</h4>
							<p>내 강의</p>
							<ul>
						        <c:forEach var="course" items="${enrolledCourses}">
						            <li>${course.class_title}</li>
						        </c:forEach>
						
						        <c:if test="${empty enrolledCourses}">
						            <li>수강 중인 강의가 없습니다.</li>
						        </c:if>
							</ul>
						</div>

						<!-- 커뮤니티 활동 패널 -->
						<div class="dashboard-panel community-activity-panel">
							<h4>커뮤니티 활동</h4>
							<p>최근 커뮤니티에서 작성한 게시글</p>
							<ul>
						        <%-- recentPosts 리스트가 비어있지 않으면, 각 항목을 반복 --%>
						        <c:forEach var="post" items="${recentPosts}">
						            <%-- 다른 개발자가 만든 'PostDetail' URL 구조를 활용합니다. --%>
						            <li><a href="${pageContext.request.contextPath}/PostDetail?post_idx=${post.post_idx}">◦ ${post.title}</a></li>
						        </c:forEach>
						        <%-- 만약 글이 하나도 없다면 메시지 표시 --%>
						        <c:if test="${empty recentPosts}">
						            <li>작성한 게시글이 없습니다.</li>
						        </c:if>
						    </ul>
							<!-- 공용 수평선 클래스 적용 -->
							<div class="horizontal-line"></div>
							<p>최근 커뮤니티에서 작성한 댓글</p>
							<ul>
						        <c:forEach var="comment" items="${recentComments}">
						            <%-- 댓글을 클릭하면 해당 댓글이 달린 게시글로 이동합니다. --%>
						            <li><a href="${pageContext.request.contextPath}/PostDetail?post_idx=${comment.post_idx}">◦ ${comment.content}</a></li>
						        </c:forEach>
						        <c:if test="${empty recentComments}">
						            <li>작성한 댓글이 없습니다.</li>
						        </c:if>
						    </ul>
						</div>
					</div>
				</section>
				
			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
			
		</div>
		
		<script src="${pageContext.request.contextPath}/resources/js/my_profile/my_profile.js"></script>
		
	</body>
	
</html>
