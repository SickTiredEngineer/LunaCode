<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>커리큘럼 작성</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/class/curriculum.css" rel="stylesheet" />
		
	</head>

<head>
    <meta charset="UTF-8" />
    <title>커리큘럼 작성</title>
    <jsp:include page="/WEB-INF/views/inc/common_head.jsp" />
    <link href="${pageContext.request.contextPath}/resources/css/page/class/curriculum.css" rel="stylesheet" />
</head>

<body>
    <div class="page-base container">

        <!-- 헤더 -->
        <header>
            <jsp:include page="/WEB-INF/views/inc/header.jsp" />
        </header>

        <!-- 타이틀 -->
        <h3 class="curriculum-title">커리큘럼 작성</h3>

        <article>
            <div class="curriculum-bg">
                <div class="curriculum-card">

                    <form id="curriculum-form">
                        <!-- 섹션 리스트 컨테이너 -->
                        <div id="sections-container">

                            <!-- 섹션 1 -->
                            <div class="section-block" draggable="true">
                                <div class="section-header">
                                    <div class="drag-handle" draggable="true" title="섹션 드래그">
                                        <div class="drag-handle-dots">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </div>
                                    </div>
                                    <span class="section-label">섹션 1</span>
                                </div>
                                <div class="section-row">
                                    <input type="text" class="section-input" value="프롤로그: 자바 개발환경 구축"
                                        placeholder="섹션 제목 입력" />
                                </div>
                                <div class="d-flex flex-row button-container">
                                    <a href="#" class="positive-button">수업추가</a>
                                    <a href="#" class="positive-button">퀴즈추가</a>
                                </div>
                            </div>
                            <div class="d-flex flex-row button-container" >
                            	<a href="#" class="positive-button" id="add-section-btn">섹션 추가</a>
                        	</div>

                            <!-- 섹션 2 -->
                            <div class="section-block" draggable="true">
                                <div class="section-header">
                                    <div class="drag-handle" draggable="true" title="섹션 드래그">
                                        <div class="drag-handle-dots">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </div>
                                    </div>
                                    <span class="section-label">섹션 2</span>
                                </div>
                                <div class="section-row">
                                    <input type="text" class="section-input" value="섹션 2 제목 예시"
                                        placeholder="섹션 제목 입력" />
                                </div>
                                <div class="d-flex flex-row button-container">
                                    <a href="#" class="positive-button">수업추가</a>
                                    <a href="#" class="positive-button">퀴즈추가</a>
                                </div>
                            </div>

                        </div>

                        <div class="d-flex flex-row button-container" >
                            <a href="#" class="positive-button" id="add-section-btn">섹션 추가</a>
                        </div>
                    </form>
                </div>
            </div>
        </article>

        <!-- 푸터 -->
        <footer>
            <jsp:include page="/WEB-INF/views/inc/footer.jsp" />
        </footer>
    </div>

    <!-- JS 분리파일 로드 -->
    <script src="${pageContext.request.contextPath}/resources/js/class/curriculum_drag.js"></script>
</body>

</html>