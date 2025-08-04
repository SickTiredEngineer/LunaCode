<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>ModifyProfile</title>
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
	                    <form method="post" action="<c:url value='/user/modifyProfileAction'/>">
	                    
	                        <%-- 프로필 사진 및 닉네임 행 (특별한 구조) --%>
	                        <div class="form-row profile-area">
	                            <label class="form-label">프로필</label>
	                            <div class="profile-inputs">
	                                <label class="profile-photobox">
	                                    <span>사진 추가</span>
	                                    <input type="file" name="profileImage" style="display: none;">
	                                </label>
	                                <div class="profile-nickname">
	                                    <input type="text" name="nickname" placeholder="닉네임" class="common-input-form-main-color">
	                                    <button type="button" class="positive-button">중복 체크</button>
	                                </div>
	                            </div>
	                        </div>
	
	                        <div class="horizontal-line"></div>
	                        
	                        <%-- 이메일 행 --%>
	                        <div class="form-row">
	                            <label for="email" class="form-label">이메일</label>
	                            <input type="email" id="email" name="email" class="common-input-form-main-color" readonly>
	                        </div>
	                        
	                        <div class="horizontal-line"></div>
	
	                        <%-- 자기소개 행 --%>
	                        <div class="form-row">
	                            <label for="bio" class="form-label">자기소개</label>
	                            <textarea id="bio" name="bio" class="common-input-form-main-color"></textarea>
	                        </div>
	
	                        <div class="horizontal-line"></div>
	
	                        <%-- 깃허브 행 --%>
	                        <div class="form-row">
	                            <label for="github" class="form-label">깃허브</label>
	                            <input type="text" id="github" name="github" class="common-input-form-main-color" placeholder="https://github.com/username">
	                        </div>
	                        
	                        <div class="horizontal-line"></div>
	
	                        <%-- 하단 버튼 영역 --%>
	                        <div class="action-buttons">
	                            <button type="button" class="negative-button">취소</button>
	                            <button type="submit" class="positive-button">완료</button>
	                        </div>
	                    </form>
	                </section>
	            </div>
	        </article>
	
	        <footer>
	            <jsp:include page="/WEB-INF/views/inc/footer.jsp" />
	        </footer>
	    </div>
	</body>
	
</html>
