<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

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
					
<!-- 					<textarea readonly="readonly" class="terms-textarea"> -->
					
					<div class="d-flex align-items-center justify-content-center">
						<section id="term_box" class="terms-box">
	
							<h4>1. 가입 자격</h4>
							<p>
							  	회원가입은 만 14세 이상부터 가능합니다.<br>
							  	14세 미만의 경우, 부모님 또는 법정 대리인의 동의가 필요합니다.
							</p>
							
							<h4>2. 회원 정보의 정확성</h4>
							<p>
							 	회원은 가입 시 정확하고 최신의 정보를 입력해야 하며,<br>
							  	허위 정보 또는 타인의 정보를 도용할 경우 서비스 이용이 제한될 수 있습니다.
							</p>
							
							<h4>3. 계정 관리 책임</h4>
							<p>
							  	계정의 아이디 및 비밀번호는 본인의 책임 하에 관리되어야 합니다.<br>
							  	이를 타인에게 공유하거나 유출하여 발생하는 모든 문제에 대한 책임은 회원 본인에게 있습니다.
							</p>
							
							<h4>4. 서비스 이용 목적</h4>
							<p>
								루나코드는 개인적인 학습 또는 전문적인 교육 목적으로 사용할 수 있습니다.<br>
							 	콘텐츠의 무단 복제, 배포, 상업적 이용 등은 엄격히 금지됩니다.
							</p>
							
							<h4>5. 이용 제한 및 탈퇴</h4>
							<p>
							  	약관을 위반하거나 서비스 질서를 해치는 경우, 사전 경고 없이 이용이 제한되거나 계정이 삭제될 수 있습니다.<br>
							  	회원은 언제든지 직접 탈퇴할 수 있으며, 탈퇴 시 관련 데이터는 정책에 따라 처리됩니다.
							</p>
							
							
							<h4>6. 약관의 변경</h4>
							<p>
							  	루나코드는 약관 내용을 개정할 수 있으며, 변경 시 사전 고지를 통해 안내드립니다.<br>
							  	변경된 약관에 동의하지 않을 경우, 회원 탈퇴를 통해 이용을 중단하실 수 있습니다.
							</p>
	
						</section>

					</div>
					
					
					<form action="JoinForm" class="d-flex flex-column align-items-center justify-content-center">
					
					
						<div class="d-flex flex-row align-items-center">
						
							<input type="checkbox" id="agree-check-box">
						
							<p class="notice-msg-no-bold">위의 약관에 동의하십니까?
								동의하지 않을 시, 회원가입을 진행할 수 없습니다.
							</p>	

						</div>
					
						
						<input type="submit" class="positive-button button-agree" value="다음으로">
					
					
<!-- 					<form action="JoinForm" class="d-flex flex-column align-items-center"> -->
<!-- 						<input type="checkbox" id="agree-check-box"> -->
<!-- 						<input type="submit" class="button-agree" value="다음으로"> -->
<!-- 					</form> -->
					</form>
					
					

					
					
				
				</div>		
			
			</article>
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
	
</html>
