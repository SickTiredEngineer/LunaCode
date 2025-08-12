<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>Main</title>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath}/resources/css/common/css_variables.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/layout/carousel_main_banner.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/base.css" rel="stylesheet">	
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">	
		<link href="${pageContext.request.contextPath}/resources/css/layout/home.css" rel="stylesheet">
		  <!-- 구글 폰트 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		<!-- AOS CSS (스크롤 애니메이션용) -->
		<link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet"> 
		
	</head>
	<body>
		
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
	
	<!-- 상단 배너 영역 -->
    <div class="banner-visual">
      <img src="${pageContext.request.contextPath}/resources/image/home.png" class="banner-bg" alt="상단 배경 그림" />
      <div class="banner-slide-text"> <!-- 텍스트 움직이는 곳 -->
        <span id="slide-text"></span>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/inc/class_category.jsp"></jsp:include>

    <!-- 본문 섹션들 (AOS 효과 포함) -->
    <section class="fade-section1" >
      <img src="${pageContext.request.contextPath}/resources/image/home_banner1.png" class="banner-bg1" alt="하단 광고1" />
    </section>

    <section class="fade-section2" data-aos="fade-left" data-aos-delay="200" >
       <img src="${pageContext.request.contextPath}/resources/image/home_banner2.png" class="banner-bg2" alt="하단 광고2" />
       <div class="banner-bg2-text"> 
 	  	 <span id= "bottom-typer">IT 공부 재밌게 하는 법</span>
	   </div>
	   <div id="observeTarget"></div>
	    <div id="suggestions" class="suggestions">
	      <ul>
	        <li><span class="icon">🔍</span>비전공자 코딩 입문 추천</li>
	        <li><span class="icon">🔍</span>실무 중심 IT 자격증 강의</li>
	        <li><span class="icon">🔍</span>단기완성 웹 개발 부트캠프</li>
	        <li><span class="icon">🔍</span>취업에 강한 프로그래밍 강의</li>
	        <li><span class="icon">🔍</span>가성비 최고의 IT 인강 사이트</li>
	      </ul>
    	</div>
    </section>

<!-- 		 홈 화면 시간 나면 하단 주석 풀고 꾸밀 수 있게 -->
<!--     <section class="fade-section" data-aos="fade-up"> -->
<!--       <h2>실무 중심 커리큘럼 & 실전 프로젝트</h2> -->
<!--       <p>개발자·디자이너·데이터분석가 등 다양한 진출 가능</p> -->
<!--       <p>[LunaCode]은 현업으로 가는 가장 실용적인 길입니다</p> -->
<!--     </section> -->
   

<!--     <section class="fade-section" data-aos="fade-up"> -->
<!--       <h2>이미 수많은 사람들이 우리와 함께 했습니다</h2> -->
<!--       <p>불안한 시작이지만, 끝은 달랐어요</p> -->
<!--       <p>당신도 할 수 있어요. [LunaCode]가 함께해요</p> -->
<!--     </section> -->

    <footer>
      <jsp:include page="/WEB-INF/views/inc/footer.jsp" />
    </footer>

  </div>

  <!-- AOS JS -->
  <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>

  <!-- 슬라이드 텍스트 스크립트 -->
  <script src="${pageContext.request.contextPath}/resources/js/admin/home.js"></script>

  <!-- AOS 초기화 -->
  <script>
    AOS.init({
      duration: 800,
      easing: 'ease-in-out',
      once: true
    });
  </script>

  <!-- Bootstrap Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>


