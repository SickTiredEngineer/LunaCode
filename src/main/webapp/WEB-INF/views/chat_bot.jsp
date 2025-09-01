<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<html>

	<head>
		<title>루나 챗봇</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<script src="${pageContext.request.contextPath}/resources/js/chatbot/chatbot.js"></script>
		<link href="${pageContext.request.contextPath}/resources/css/page/chatbot/chatbot.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/page/community/community.css" rel="stylesheet">
	</head>
	
	
	<body>

		<div class="page-base container">
			
			<!-- 자기 자신 -->
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="me"/>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ADMIN')">
		    	<c:set var="isAdmin" value="true"/>
		    </sec:authorize>
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<main class="chat-page">
					<div class="chat-card">
						<div class="chat-header">
							<div class="chat-dot"></div>
							<div style="justify-content: center;">
								<div class="chat-title">LunaCode 챗봇</div>
								<div class="chat-sub">IT 관련 지식 무엇이든 물어보세요. Shift+Enter로 줄바꿈</div>
							</div>
						</div>
					
					
					<div id="chatScroll" class="chat-scroll">
						<!-- Example welcome message -->
						<div class="msg bot">
							<div class="avatar">루나챗봇</div>
							<div>
								<div class="bubble">LunaCode 도우미입니다. IT관련 질문을 해주세요!<br> 예) “스프링 시큐리티 글 정리 보여줘”, “결제 환불 규정 알려줘"</div>
								<div class="timestamp" data-ts></div>
							</div>
						</div>
					</div>
					
					
					<div class="chat-composer">
						<div class="composer-box">
							<textarea id="composer" class="composer-input" placeholder="메시지를 입력하세요…"></textarea>
							<button id="sendBtn" class="btn send-btn">전송</button>
						</div>
						<div class="util-row">
							<div class="util-left">
								<span id="typing" class="typing" style="display:none"><span></span><span></span><span></span></span>
							</div>
						</div>
					</div>
					</div>
			</main>
			
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
		
		<script defer src="${pageContext.request.contextPath }/resources/js/support_center/faq_list.js"></script>
		<script type="text/javascript">
			window.addEventListener('pageshow', function (e) {
			    // bfcache에서 복원된 경우 또는 back/forward 내비게이션이면 새로고침
			    if (e.persisted || (performance.getEntriesByType && performance.getEntriesByType('navigation')[0]?.type === 'back_forward')) {
			      location.reload();
			    }
			 });
		</script>

	</body>
	
</html>