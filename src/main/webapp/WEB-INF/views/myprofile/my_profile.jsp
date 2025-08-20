<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>MyProfile</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/myprofile/my_profile.css" rel="stylesheet"> 
	</head>
	
	<body>
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
			
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
							<li><a href="#" class="active">학습 통계</a></li>
							<li><a href="PersonalSupport">고객센터</a></li>
						</ul>
					</nav>

					<!-- 대시보드 콘텐츠 그리드 -->
					<div class="dashboard-grid">
						<!-- 출석 패널 -->
						<div class="dashboard-panel attendance-panel">
							<h4>출석</h4>
							<div class="chart">
								<div class="bar-container"><div class="bar" style="height: 50%;"></div><span>월</span></div>
								<div class="bar-container"><div class="bar" style="height: 10%;"></div><span>화</span></div>
								<div class="bar-container"><div class="bar" style="height: 50%;"></div><span>수</span></div>
								<div class="bar-container"><div class="bar" style="height: 10%;"></div><span>목</span></div>
								<div class="bar-container"><div class="bar" style="height: 50%;"></div><span>금</span></div>
								<div class="bar-container"><div class="bar" style="height: 10%;"></div><span>토</span></div>
								<div class="bar-container"><div class="bar" style="height: 50%;"></div><span>일</span></div>
							</div>
						</div>

						<!-- 학습 현황 패널 -->
						<div class="dashboard-panel learning-status-panel">
							<h4>학습 현황</h4>
							<ul>
								<li>최근 완료 강의</li>
								<li>쉽지 않다 Figma를 쉽게 이용해보자</li>
								<li>따라해보는 클론 코딩</li>
								<li>TDD 쓰는 회사가 있나요?</li>
							</ul>
						</div>

						<!-- 커뮤니티 활동 패널 -->
						<div class="dashboard-panel community-activity-panel">
							<h4>커뮤니티 활동</h4>
							<p>최근 커뮤니티에서 작성한 게시글</p>
							<ul>
								<li><a href="#">◦ 게시글 1</a></li>
								<li><a href="#">◦ 게시글 2</a></li>
							</ul>
							<!-- 공용 수평선 클래스 적용 -->
							<div class="horizontal-line"></div>
							<p>최근 커뮤니티에서 작성한 댓글</p>
							<ul>
								<li><a href="#">◦ 댓글 1</a></li>
								<li><a href="#">◦ 댓글 2</a></li>
							</ul>
						</div>
					</div>
				</section>
				
			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
			
		</div>
	</body>
	
</html>
