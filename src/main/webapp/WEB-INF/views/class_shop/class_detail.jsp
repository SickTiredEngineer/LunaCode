<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
  <head>
    <title>강의 신청</title>
    <meta charset="UTF-8">
    <jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
    <link href="${pageContext.request.contextPath}/resources/css/page/class_shop/class_detail.css" rel="stylesheet">
  </head>
  <body>
    <!-- 모달 -->
    <div class="modal fade" id="courseDetailModal" tabindex="-1" aria-labelledby="courseDetailLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content shadow rounded-4 border-0 p-4">
          <!-- 헤더 -->
          <div class="modal-header border-0 pb-0">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
          </div>
          <!-- 바디 -->
          <div class="modal-body pt-3">
            <div class="row g-4">
              
              <!-- 왼쪽: 강의 이미지 (DB 연동 예시) -->
              <div class="col-md-5 text-center">
                <img src="<c:out value='${lecture.thumbnail}'/>" alt="<c:out value='${lecture.name}'/>" class="img-fluid rounded-3 shadow-sm" />
              </div>
              
              <!-- 오른쪽: 강의 정보 -->
              <div class="col-md-7">
                <ul class="list-unstyled mb-4">
                  <h5 class="modal-title fw-bold fs-3" id="courseDetailLabel">
                    <c:out value="${lecture.name}"/>
                  </h5>
<%--                   <li class="mb-2"><strong>기간: </strong><c:out value="${lecture.class_}"/></li> --%>
                  <li class="mb-2"><strong>수강료: </strong><c:out value="${lecture.class_price}"/></li>
                  <li class="mb-2"><strong>강사: </strong><c:out value="${lecture.teacher}"/></li>
                </ul>
                
                <!-- 비회원 로그인 유도 안내 -->
                <sec:authorize access="isAnonymous()">
                  <div class="alert alert-warning mb-2 p-2 small">
                    로그인 후 수강 신청이 가능합니다.
                  </div>
                </sec:authorize>

                <!-- 수강 신청 버튼: 권한에 따라 제어 -->
                <sec:authorize access="isAuthenticated()">
                  <button class="btn btn-primary w-100" onclick="applyCourse('${lecture.class_idx}')">
                    <i class="bi bi-cart3 me-2"></i> 수강 신청하기
                  </button>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                  <button class="btn btn-primary w-100" disabled>
                    <i class="bi bi-cart3 me-2"></i> 수강 신청하기 (로그인 필요)
                  </button>
                </sec:authorize>
              </div>
            </div>

            <!-- 네비게이션 바 (탭) -->
            <nav id="modal-navbar" class="navbar bg-body-tertiary px-3 mb-3">
              <ul class="nav nav-pills">
                <li class="nav-item">
                  <a class="nav-link" href="#modalSection1">과목 소개</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#modalSection2">강사 소개</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#modalSection3">수강 후기</a>
                </li>
              </ul>
            </nav>
            
            <!-- 스크롤 영역 -->
            <div id="modal-scrollspy" data-bs-spy="scroll" data-bs-target="#modal-navbar"
              data-bs-offset="0" class="scrollspy-example bg-body-tertiary p-3 rounded-2"
              tabindex="0" style="max-height: 400px; overflow-y:auto;">
              
              <h4 id="modalSection1">과목 소개</h4>
              <div class="course-intro-video" style="margin : 1rem;">
                <iframe width="100%" height="300" src="<c:out value='${lecture.url}'/>"
                  title="샘플 강의 동영상" frameborder="0" allowfullscreen></iframe>
              </div>
              <p><c:out value="${lecture.intro}"/></p>
              <p><c:out value="${lecture.intro}"/></p>
              <p><c:out value="${lecture.intro}"/></p>
              <h4 id="modalSection2">강사 소개</h4>
<%--               <p><c:out value="${lecture.teacherIntro}"/></p> --%>
              <h4 id="modalSection3">수강 후기</h4>
<%--               <p><c:out value="${lecture.review}"/></p> --%>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap 5 JS + Popper (bundle) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      function applyCourse(lectureId) {
        fetch('/class/apply', {
          method: 'POST',
          headers: {'Content-Type': 'application/json'},
          body: JSON.stringify({ courseId: lectureId })
        }).then(res => res.json())
          .then(data => {
            if(data.success) { alert('신청 완료!'); }
            else { alert('신청 실패: ' + data.message); }
          });
      }
    </script>
    <script src="${pageContext.request.contextPath}/resources/js/class_shop/class_detail.js"></script>
  </body>
</html>
