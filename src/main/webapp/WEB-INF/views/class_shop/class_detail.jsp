<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>

<html>
<head>
    <title>강의 상세</title>
    <meta charset="UTF-8">
    <jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
    <link href="${pageContext.request.contextPath}/resources/css/page/class_shop/class_detail.css" rel="stylesheet">
    <link rel="icon" href="data:,">
</head>
<body>

<div class="page-base container">

    <!-- 헤더 -->
    <header>
        <jsp:include page="/WEB-INF/views/inc/header.jsp"/>
    </header>

    <article class="my-5">

        <div class="row g-4">

            <!-- 왼쪽: 강의 이미지 (DB 연동 예시) -->
            <div class="col-md-5 text-center">
                <%-- 이미지 없으면 placeholder --%>
                <c:choose>
                    <c:when test="${not empty lecture.class_thumbnail}">
                        <img src="${pageContext.request.contextPath}/resources/class_thumbnails/${lecture.class_thumbnail}" 
                             alt="<c:out value='${lecture.class_title}'/>" 
                             class="img-fluid rounded-3 shadow-sm"
                             style="max-width: 600px; width: 600px; max-height: 300px; height: 300px"
                             />
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/resources/class_thumbnail/default_thumb.jpg"
                             alt="No Image" class="img-fluid rounded-3 shadow-sm"/>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 오른쪽: 강의 정보 -->
            <div class="col-md-7">
                <ul class="list-unstyled mb-4">
                    <h5 class="modal-title fw-bold fs-3" id="courseDetailLabel">
                        <c:out value="${lecture.class_title}"/>
                    </h5>
                    <%-- <li class="mb-2"><strong>기간: </strong><c:out value="${lecture.class_}"/></li> --%>
                    <li class="mb-2"><strong>수강료: </strong><c:out value="${lecture.class_price}"/></li>
                    <li class="mb-2"><strong>강사: </strong><c:out value="${lecture.instructor_id}"/></li>
                </ul>

                <!-- 비회원 로그인 유도 안내 -->
                <sec:authorize access="isAnonymous()">
                    <div class="alert alert-warning mb-2 p-2 small">
                        로그인 후 수강 신청이 가능합니다.
                    </div>
                </sec:authorize>

                <!-- 수강 신청 버튼: 권한에 따라 제어 -->
                <sec:authorize access="isAuthenticated()">
                    <form action="${pageContext.request.contextPath}/apply" method="post">
                        <input type="hidden" name="class_idx" value="${lecture.class_idx}">
                        <button class="btn btn-primary w-100" type="submit" id="applyBtn">
                            <i class="bi bi-cart3 me-2"></i> 수강 신청하기
                        </button>
                    </form>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <button class="btn btn-primary w-100" disabled>
                        <i class="bi bi-cart3 me-2"></i> 수강 신청하기 (로그인 필요)
                    </button>
                </sec:authorize>
            </div>

        </div>

        <!-- 네비게이션 바 (탭) -->
        <nav id="modal-navbar" class="navbar bg-body-tertiary px-3 my-4">
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="nav-link" href="#section1">과목 소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#section2">강사 소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#section3">수강 후기</a>
                </li>
            </ul>
        </nav>

        <!-- 스크롤 영역 -->
        <div id="page-scrollspy" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0"
             style="max-height: 600px; overflow-y:auto;">

            <h4 id="section1">과목 소개</h4>
            <div class="course-intro-video my-3">
                <iframe width="100%" height="300"
                        src="https://www.youtube.com/embed/${lecture.url}"
                        title="강의 동영상" frameborder="0" allowfullscreen></iframe>
            </div>
            <p><c:out value="${lecture.class_intro}"/></p>

            <h4 id="section2">강사 소개</h4>
            <%-- <p><c:out value="${lecture.teacherIntro}"/></p> --%>

            <h4 id="section3">수강 후기</h4>
            <%-- <p><c:out value="${lecture.review}"/></p> --%>

        </div>

    </article>

    <!-- 푸터 -->
    <footer>
        <jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
    </footer>

</div>

</body>
</html>
