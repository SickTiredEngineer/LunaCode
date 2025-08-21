<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

	<head>
		<title>회원가입 약관</title>
		<meta charset="UTF-8">	
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>	
		<link href="${pageContext.request.contextPath }/resources/css/page/member/member_tom.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div  class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article>

				<div class="d-flex flex-column align-items-center">
					
					<div>
						<h2 class="notice-msg">회원 가입 약관(일반회원)</h2>
					</div>
					
					<div class="d-flex align-items-center justify-content-center">
					
							<c:choose>
							
								<c:when test="${param.type eq 'MB02'}">
									<jsp:include page="/WEB-INF/views/member/tom_inst.jsp"></jsp:include>
								</c:when>
							
								<c:otherwise>
									<jsp:include page="/WEB-INF/views/member/tom_normal.jsp"></jsp:include>	
								</c:otherwise>
					
							</c:choose>

					</div>
					
					
					<div class="d-flex flex-column align-items-center justify-content-center">
						
						<br>
						
						<div class="d-flex flex-row align-items-center justify-content-center" >
							<input style="zoom:1.5;" type="checkbox" id="check_agree" class="check-box-margin" >
							<label for="check_agree" class="notice-msg-no-bold" style="align-self: center;">위의 약관에 동의하십니까?
								동의하지 않을 시, 회원가입을 진행할 수 없습니다.</label>	
						</div>
						
						<br>
						
						<button id="bt_confirm" type="button" class="positive-button button-agree">다음으로</button>
			
					</div>

				</div>		
			
			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
		<script src="${pageContext.request.contextPath }/resources/js/member_join/terms_of_membership.js"></script>
	
	</body>
	
	
</html>
