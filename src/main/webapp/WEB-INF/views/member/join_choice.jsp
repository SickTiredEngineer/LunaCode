<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>루나코드 회원가입</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>		
		<link href="${pageContext.request.contextPath }/resources/css/page/member/member_choice.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

		
			<article>
				
				<div class="d-flex flex-row align-items-center justify-content-center member-base-layout">
					
					<!-- 일반 회원 가입 버튼 -->
					<button type="button" id="bt_choice_normal" class="d-flex flex-column align-items-center text-decoration-none member-sub-layout">
<!-- 						<div class="d-flex flex-column align-items-center member-choice-bt"> -->
							<img class="member-icon-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_normal_member.png">
							<p class="member-font">일반 회원</p>	
<!-- 						</div> -->
					</button>
					
					<!-- 강사 회원 가입 버튼 -->
					<button type="button" id="bt_choice_inst" class="d-flex flex-column align-items-center text-decoration-none member-sub-layout">
<!-- 						<div class="d-flex flex-column align-items-center member-choice-bt"> -->
							<img class="member-icon-size" alt="" src="${pageContext.request.contextPath}/resources/icons/icon_instructor_member.png">
							<p class="member-font">강사 회원</p>	
<!-- 						</div> -->
					</button>

<!-- 					<div class="vertical-line"></div> -->
				
				</div>		
			
			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
		
		<script src="${pageContext.request.contextPath}/resources/js/member_join/member_join_choice.js"></script>
	
	</body>
	
	
</html>
