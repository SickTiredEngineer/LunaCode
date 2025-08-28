<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
    <meta charset="UTF-8" />
    <title>커리큘럼</title>
    <jsp:include page="/WEB-INF/views/inc/common_head.jsp" />
    <link href="${pageContext.request.contextPath}/resources/css/page/class/curriculum.css" rel="stylesheet" />
</head>

<body>
<div class="page-base container">
    
    <script>
        window.classId = "${classId}";
        const ctx = "${pageContext.request.contextPath}";
    </script>

    <!-- 헤더 -->
    <header>
        <jsp:include page="/WEB-INF/views/inc/header.jsp" />
    </header>

    <!-- 타이틀 -->
    <h3 class="curriculum-title">커리큘럼</h3>

    <article>
	    <div class="curriculum-bg">
	        <div class="curriculum-card">
	            <form id="curriculum-form">
	                <div id="sections-container">
	                    <c:forEach var="session" items="${sessions}" varStatus="s">
	                        <div class="section-block" data-session-id="${session.session_idx}">
	                            <div class="section-header">
	                                <span class="section-label">섹션 ${s.index + 1}</span>
	                                <!-- 섹션 삭제 아이콘 추가 -->
	                                <img src="${pageContext.request.contextPath}/resources/icons/icon_delete.png" 
	                                     alt="섹션 삭제" title="섹션 삭제" class="section-delete-icon" />
	                            </div>
	                            <div class="section-row">
	                                <!-- 세션 PK 전달 -->
	                                <input type="hidden" name="sessions[${s.index}].session_idx" value="${session.session_idx}" />
	                                <input type="text" name="sessions[${s.index}].session_name" 
	                                       class="section-input" value="${session.session_name}" placeholder="섹션 제목 입력" />
	                            </div>
	                            <div class="lessons-container">
	                                <c:forEach var="episode" items="${session.episodes}" varStatus="e">
	                                    <div class="section-row lesson-row" data-episode-id="${episode.episode_idx}" draggable="true">
	                                        <div class="lesson-input-wrapper">
	                                            <!-- 수업 PK 전달 -->
	                                            <input type="hidden" name="sessions[${s.index}].episodes[${e.index}].episode_idx" value="${episode.episode_idx}" />
	                                            <input type="text" name="sessions[${s.index}].episodes[${e.index}].episode_name" 
	                                                   class="section-input" value="${episode.episode_name}" placeholder="수업 제목 입력" />
	                                            <div class="drag-handle" title="드래그로 순서 변경">
	                                                <div class="drag-handle-dots"> <span></span><span></span> <span></span><span></span> <span></span><span></span> </div>
	                                            </div>
	                                            <div class="lecture-actions">
	                                                <img src="${pageContext.request.contextPath}/resources/icons/icon_lock.png" 
	                                                     alt="잠금" title="잠금" class="lesson-lock" />
	                                                <img src="${pageContext.request.contextPath}/resources/icons/icon_edit.png" 
	                                                     alt="수정" title="수정" class="lesson-edit" />
	                                                <img src="${pageContext.request.contextPath}/resources/icons/icon_view.png" 
	                                                     alt="보기" title="보기" class="lesson-view" />
	                                                <img src="${pageContext.request.contextPath}/resources/icons/icon_delete.png" 
	                                                     alt="삭제" title="삭제" class="lesson-delete" />
	                                            </div>
	                                        </div>
	                                    </div>
	                                </c:forEach>
	                            </div>
	                            <div class="d-flex flex-row button-container">
	                                <a href="#" class="positive-button lesson-add">수업 추가</a>
	                                <a href="#" class="positive-button quiz-add">퀴즈 추가</a>
	                            </div>
	                        </div>
	                    </c:forEach>
	                </div>
	
	                <div class="d-flex flex-row button-container">
	                    <a href="#" class="positive-button" id="add-section-btn">섹션 추가</a>
	                </div>
	            </form>
	
	            <div class="d-flex flex-row button-container">
	                <a href="${pageContext.request.contextPath}/CourseRegistration" class="negative-button">돌아가기</a>
	                <button type="button" class="positive-button" id="saveBtn">저장</button>
	            </div>
	        </div>
	    </div>
	</article>


    <!-- 푸터 -->
    <footer>
        <jsp:include page="/WEB-INF/views/inc/footer.jsp" />
    </footer>
</div>

<!-- JS 분리파일 로드 -->
<script src="${pageContext.request.contextPath}/resources/js/class/curriculum.js"></script>
</body>
</html>
