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
                             style="max-width: 400px; width: 600px; max-height: 255px; height: 300px" />
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
                <iframe width="100%" height="700px"
                        src="https://www.youtube.com/embed/${lecture.url}"
                        title="강의 동영상" frameborder="0" allowfullscreen>
                </iframe>
            </div>
            <h4>강의 소개</h4>
            <p><c:out value="${lecture.class_intro}"/></p>

            <h4 id="section2">강사 소개</h4>
            <p>강사명: 김지훈 (Jihoon Kim)
				IT 전문가 & 강사<br><br>
				
				소개<br>
				안녕하세요, 김지훈입니다.<br> 
				저는 지난 15년간 다양한 IT 분야에서 실무 경험과 교육 경력을 쌓아온 소프트웨어 엔지니어이자 강사입니다.<br> 
				현업에서 쌓은 노하우를 바탕으로 누구나 쉽게 이해하고 따라할 수 있는 강의를 제공하고 있습니다.<br><br>
				
				주요 경력<br>
				∘ 대기업 IT 부서 개발팀장 (10년)<br>
				
				∘ 대규모 시스템 설계 및 운영 경험<br>
				
				∘ 팀 리딩 및 프로젝트 관리 담당<br>
				 
				∘ 스타트업 CTO (3년)<br>
				
				∘ 기술 전략 수립 및 신기술 도입 주도<br>
				
				∘ 클라우드 서비스 개발 및 출시<br>
				
				∘ 국내 유수 교육기관 IT 강의 담당 (7년)<br>
				
				∘ 프로그래밍, 웹 개발, 클라우드 컴퓨팅 강의<br>
				
				∘ 수강생 맞춤형 실습 위주 강의 진행<br><br>
				
				전문 분야<br>
				∘ 자바(Spring Framework, Spring Boot) 및 웹 백엔드 개발<br>
				
				∘ 클라우드 컴퓨팅 (AWS, Azure) 아키텍처 설계
				
				∘ DevOps 및 CI/CD 파이프라인 구축<br>
				
				∘ 데이터베이스 설계 및 최적화 (MySQL, MongoDB)<br>
				
				∘ RESTful API 및 마이크로서비스 아키텍처<br><br>
				
				자격증<br>
				∘ AWS 공인 솔루션 아키텍트 – 프로페셔널 (AWS Certified Solutions Architect – Professional)<br>
				
				∘ 정보처리기사<br>
				
				∘ 오라클 마스터 OCP(Java SE 11 Developer Certified Professional)<br>
				
				∘ Google Cloud Professional Cloud Architect<br>
				
				∘ Certified Kubernetes Administrator (CKA)<br><br>
				
				강의 철학<br>
				∘ IT 기술은 빠르게 변하지만 기본 원리와 실습 경험만이 실력을 좌우한다고 믿습니다. 현장에서 쓰이는 실무 중심의 내용을 체계적으로 전달하며,<br> 
				수강생들이 직접 문제를 해결할 수 있도록 실습과 피드백을 중요시합니다. 항상 최신 트렌드를 반영해 수업을 업데이트하고 있습니다.</p>

            <h4 id="section3">수강 후기</h4>
            <div class="review">
			    <h4>프로그래밍 기초부터 탄탄한 강의</h4>
			    <p>★★★★★</p>
			    <p>강의를 듣고 직접 코드를 작성해보는 실습이 많아서 이해가 빠르고 실력이 늘었어요. 강사님 설명도 아주 친절합니다.</p>
			</div>
			
			<div class="review">
			    <h4>현업 경험 녹여낸 실무 강의</h4>
			    <p>★★★★☆</p>
			    <p>현업 개발자 출신 강사님의 노하우가 담긴 강의여서 실무에 바로 적용할 수 있는 점이 좋았습니다. 다만 초보자가 따라오기엔 난이도가 조금 있었어요.</p>
			</div>
			
			<div class="review">
			    <h4>체계적인 커리큘럼과 친절한 피드백</h4>
			    <p>★★★★★</p>
			    <p>커리큘럼이 잘 짜여 있어 체계적으로 배울 수 있었습니다. 궁금한 점 질문하면 바로 답해줘 수강 만족도가 높았습니다.</p>
			</div>
			
			<div class="review">
			    <h4>클라우드 강의, 실습 위주라 만족</h4>
			    <p>★★★★☆</p>
			    <p>AWS와 Azure를 아우르는 실습 강의가 많아 클라우드 자체가 익숙하지 않은 저도 재미있게 따라갈 수 있었어요.</p>
			</div>
			
			<div class="review">
			    <h4>프로젝트 기반 학습 추천합니다</h4>
			    <p>★★★★★</p>
			    <p>팀 프로젝트를 통해 협업 경험도 쌓고, 실제 서비스를 만들어보는 과정이 인상적이었습니다. 실무 취업 준비에 큰 도움이 됐어요.</p>
			</div>


        </div>

    </article>

    <!-- 푸터 -->
    <footer>
        <jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
    </footer>

</div>

	<c:if test="${not empty msg}">
	    <script>
	        alert("${msg}");
	    </script>
	</c:if>


</body>
</html>
