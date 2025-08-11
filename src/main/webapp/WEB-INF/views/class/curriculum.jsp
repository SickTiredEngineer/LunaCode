<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

<head>
    <meta charset="UTF-8" />
    <title>커리큘럼 작성</title>
    <jsp:include page="/WEB-INF/views/inc/common_head.jsp" />
    <link href="${pageContext.request.contextPath}/resources/css/page/class/curriculum.css" rel="stylesheet" />
    <script>  const ctx = '${pageContext.request.contextPath}';</script>
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
		        <div id="sections-container">
		
		          <!-- 섹션 1 -->
		          <div class="section-block">
		            <div class="section-header">
		              <span class="section-label">섹션 1</span>
		            </div>
		            <div class="section-row">
		              <input type="text" class="section-input" placeholder="섹션 제목 입력" />
		            </div>
		
		            <div class="lessons-container">
					  <div class="section-row lesson-row" draggable="true">
					    <div class="lesson-input-wrapper">
					      <input type="text" class="section-input" placeholder="수업 제목 입력" />
					      <!-- 왼쪽 드래그 핸들 -->
					      <div class="drag-handle" title="드래그로 순서 변경">
					        <div class="drag-handle-dots">
					          <span></span><span></span>
					          <span></span><span></span>
					          <span></span><span></span>
					        </div>
					      </div>
					      <!-- 오른쪽 아이콘 -->
					      <div class="lecture-actions">
					        <img src="${pageContext.request.contextPath}/resources/icons/icon_lock.png" alt="잠금" title="잠금" />
					        <img src="${pageContext.request.contextPath}/resources/icons/icon_edit.png" alt="수정" title="수정" class="lesson-edit"/>
					        <img src="${pageContext.request.contextPath}/resources/icons/icon_view.png" alt="보기" title="보기" />
					        <img src="${pageContext.request.contextPath}/resources/icons/icon_delete.png" alt="삭제" title="삭제" class="lesson-delete" />
					      </div>
					    </div>
					  </div>
					</div>
		
		            <div class="d-flex flex-row button-container">
		              <a href="#" class="positive-button lesson-add">수업추가</a>
		              <a href="#" class="positive-button" id="">퀴즈추가</a>
		            </div>
		          </div>
		
		        </div>
		
		        <div class="d-flex flex-row button-container">
		          <a href="#" class="positive-button" id="add-section-btn">섹션 추가</a>
		        </div>
		      </form>
		        <div class="d-flex flex-row button-container">
		          <a href="" class="negative-button" id="">돌아가기</a>
		          <a href="" class="positive-button" id="saveBtn ">저장</a>
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