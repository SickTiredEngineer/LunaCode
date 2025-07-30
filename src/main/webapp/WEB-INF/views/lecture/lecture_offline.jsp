<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>현장 강의</title>

    <link href="${pageContext.request.contextPath}/resources/css/common/css_variables.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/page/lecture/lecture.css" rel="stylesheet">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/inc/header.jsp" />
    </header>

	<div class="page-base-custom-container">
    	<div class="container-wrapper">
        	<aside class="left-sidebar">
            	<h3>강의</h3>
	            <ul>
	                <li><a href="/lecture/realtime" class="sidebar-lecture-link">실시간 강의</a></li>
	                <li><a href="/lecture/lecture" class="sidebar-lecture-link">온라인 강의</a></li>
	                <li><a href="/lecture/offline" class="sidebar-lecture-link active">현장 강의</a></li>
	            </ul>
	        <a href="${pageContext.request.contextPath}/lecture/realtime"><button>실시간 강의</button></a>
        	<a href="${pageContext.request.contextPath}/lecture/online"><button>온라인 강의</button></a>
        	</aside>


        <main class="offline-lecture-section">
            <h2 class="offline-title">현장 강의</h2>

            <div class="month-navigation">
                <button class="month-button">&#8592;</button>
                <span>2025년 8월</span>
                <button class="month-button">&#8594;</button>
            </div>

	<div class="offline-lecture-list">
	    <div class="lecture-card">
	        <img src="${pageContext.request.contextPath}/resources/image/instructor1.png" alt="강사 사진">
	        <div class="lecture-name">김교수</div>
	        <div class="lecture-desc">알고리즘 이론 기초</div>
	        <div class="lecture-price">수강료: <strong>100,000원</strong></div>
	        <button class="apply-button" onclick="openLectureModal(this)"
    		data-title="알고리즘 이론 기초"
   			data-instructor="김교수"
   			data-day="월/수/금"
    		data-time="09:00 ~ 12:00"
    		data-place="서울 캠퍼스"
    		data-image="${pageContext.request.contextPath}/resources/image/instructor1.png">
    		수강신청
  			</button>
	    </div>
	
	    <div class="lecture-card">
	        <img src="${pageContext.request.contextPath}/resources/image/instructor2.png" alt="강사 사진">
	        <div class="lecture-name">이선생</div>
	        <div class="lecture-desc">자바스크립트 집중반</div>
	        <div class="lecture-price">수강료: <strong>120,000원</strong></div>
	        <button class="apply-button" onclick="openLectureModal(this)"
    		data-title="자바스크립트 집중반"
   			data-instructor="이선생"
   			data-day="월/수/금"
    		data-time="09:00 ~ 12:00"
    		data-place="서울 캠퍼스"
    		data-image="${pageContext.request.contextPath}/resources/image/instructor2.png">
    		수강신청
  			</button>
	    </div>
	
	    <div class="lecture-card">
	        <img src="${pageContext.request.contextPath}/resources/image/instructor3.png" alt="강사 사진">
	        <div class="lecture-name">박강사</div>
	        <div class="lecture-desc">백엔드 입문 강의</div>
	        <div class="lecture-price">수강료: <strong>90,000원</strong></div>
	        <button class="apply-button" onclick="openLectureModal(this)"
    		data-title="백엔드 입문 강의"
   			data-instructor="박강사"
   			data-day="월/수/금"
    		data-time="09:00 ~ 12:00"
    		data-place="서울 캠퍼스"
    		data-image="${pageContext.request.contextPath}/resources/image/instructor3.png">
    		수강신청
  			</button>
	    </div>
	</div>
	        </main>
	    </div>
	</div>
	<div id="lecture-modal" class="lecture-modal">
  <div class="lecture-modal-content">
    <span class="lecture-modal-close" onclick="closeLectureModal()">&times;</span>

    <div class="lecture-modal-body">
      <div class="lecture-modal-left">
        <img id="modal-image" src="" alt="강사 사진">
        <p id="modal-instructor-text"></p>
      </div>

      <div class="lecture-modal-right">
        <h3 id="modal-title">강의명</h3>

        <label for="lecture-day">요일 선택</label>
        <select id="lecture-day" name="day" class="lecture-select-field">
          <option value="mon-fri">월~금</option>
          <option value="tue-thu">화/목</option>
          <option value="weekend">주말</option>
        </select>

        <label for="lecture-time">시간 선택</label>
        <select id="lecture-time" name="time" class="lecture-select-field">
          <option value="morning">09:00 ~ 12:00</option>
          <option value="afternoon">14:00 ~ 17:00</option>
        </select>

        <label for="lecture-place">장소 선택</label>
        <select id="lecture-place" name="place" class="lecture-select-field">
          <option value="seoul">서울 캠퍼스</option>
          <option value="busan">부산 캠퍼스</option>
        </select>

        <button class="lecture-modal-apply-btn" onclick="previewLectureApply()">
          <i class="bi bi-cart"></i> 수강신청
        </button>

        <div class="lecture-curriculum">
          <h5>커리큘럼</h5>
          <ul id="modal-curriculum">
            <!-- JS로 커리큘럼 주입 -->
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
function openLectureModal(button) {
  const title = button.dataset.title;
  const instructor = button.dataset.instructor;
  const image = button.dataset.image;
  const intro = button.dataset.instructorIntro;
  const curriculum = JSON.parse(button.dataset.curriculum || '[]');

  document.getElementById("modal-title").textContent = title;
  document.getElementById("modal-image").src = image;
  document.getElementById("modal-instructor-text").innerHTML = `${instructor}<br>${intro}`;

  const ul = document.getElementById("modal-curriculum");
  ul.innerHTML = "";
  curriculum.forEach(item => {
    const li = document.createElement("li");
    li.textContent = item;
    ul.appendChild(li);
  });

  document.getElementById("lecture-modal").style.display = "block";
}

function closeLectureModal() {
  document.getElementById("lecture-modal").style.display = "none";
}

function previewLectureApply() {
  const day = document.getElementById("lecture-day").value;
  const time = document.getElementById("lecture-time").value;
  const place = document.getElementById("lecture-place").value;

  alert(`선택한 강의 정보:\n- 요일: ${day}\n- 시간: ${time}\n- 장소: ${place}`);
}
</script>
    <footer>
        <jsp:include page="/WEB-INF/views/inc/footer.jsp" />
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

