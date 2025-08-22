<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>

	<head>
		<title>프로필 설정</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/modifyprofiles/modify_profile.css" rel="stylesheet">
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
					<h2 class="page-main-title">프로필 설정</h2>
				</div>
	
				<%-- 메인 콘텐츠 레이아웃 --%>
				<div class="content-layout">
				
					<%-- 좌측 공통 카테고리 --%>
					<aside class="common-category">
						<a href="ModifyProfile" class="common-category-element active">프로필 설정</a>
						<a href="ModifyPasswd" class="common-category-element">비밀번호 설정</a>
						<a href="MyPayment" class="common-category-element">결제 내역</a>
						<a href="ModifyDelete" class="common-category-element">계정 탈퇴</a>
					</aside>
					
					<%-- 메인 폼 영역 --%>
					<section class="form-container">
						<form id="profile_form" action="ModifyProfile" method="post" enctype="multipart/form-data">
					
							<%-- 프로필 사진 행 --%>
							<div class="form-row">
								<label class="form-label">프로필 사진</label>
								<div class="profile-photo-group">
									<label class="profile-photobox" id="profile_photobox" for="profile_image_input"
										<c:if test="${not empty user.profile_img}">
											style="background-image: url('<c:url value='/${user.profile_img}'/>');"
										</c:if>
									>
										<c:if test="${empty user.profile_img}">
											<span>사진</span>
										</c:if>
									</label>
									<input type="file" name="profileImage" id="profile_image_input" accept="image/*" style="display: none;">
									<button type="button" class="positive-button" id="photo-upload-btn">사진 업로드</button>
								</div>
							</div>
					
							<div class="horizontal-line"></div>
							
							<%-- 닉네임 행 --%>
							<div class="form-row">
								<label for="input_nickname" class="form-label">닉네임</label>
								<div class="input-wrapper">
									<input type="text" name="nickname" id="input_nickname" value="${user.nickname}" placeholder="닉네임" class="common-input-form-main-color">
									<span class="validation-message" id="span_nickname"></span>
								</div>
							</div>
					
							<div class="horizontal-line"></div>
							
							<%-- 이메일 행 --%>
							<div class="form-row">
								<label for="email" class="form-label">이메일</label>
								<input type="email" id="email" name="email" value="${user.email}" class="common-input-form-main-color" readonly>
							</div>
							
							<div class="horizontal-line"></div>
					
							<%-- 자기소개 행 --%>
							<div class="form-row">
								<label for="bio" class="form-label">자기소개</label>
								<div class="input-wrapper">
									<textarea id="bio" name="bio" class="common-input-form-main-color" placeholder="최대 200자까지 입력 가능합니다.">${user.bio}</textarea>
									<span class="char-counter" id="bio_char_count">(0 / 200)</span>
								</div>
							</div>
					
							<div class="horizontal-line"></div>
					
							<%-- 깃허브 행 --%>
							<div class="form-row">
								<label for="github" class="form-label">깃허브</label>
								<div class="input-wrapper">
									<input type="text" id="github" name="github_url" value="${user.github_url}" class="common-input-form-main-color" placeholder="https://github.com/username">
									<span class="validation-message" id="span_github"></span>
								</div>
							</div>
							
							<div class="horizontal-line"></div>
					
							<%-- 하단 버튼 영역 --%>
							<div class="action-buttons">
								<button type="button" class="positive-button" id="submit_button">변경 완료</button>
							</div>
						</form>
					</section>
				</div>
			</article>
	
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp" />
			</footer>
		</div>
		
		<script>
			let originalNickname = "${user.nickname}";
		</script>
		
		<script src="${pageContext.request.contextPath}/resources/js/modifyprofiles/modify_profile.js"></script>
		
	</body>

</html>
