<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<html>

	<head>
		<title>공통 코드 상세 보기</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/ap_group_code_writer.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/page/admin/admin_common.css" rel="stylesheet">
		
	</head>
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-layout">
					<div class="d-flex flex-column justify-content-center">
						<h2 class="main-text">공통 코드 그룹 상세</h2>
					</div>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
						<jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp" />
						
						
						<div class="d-flex flex-column">
						
							<div class="d-flex flex-column main_layout">
									
									<div class="d-flex flex-column justify-content-center align-item-center content-layout">
										
										<!-- 정보 폼 -->								
										<div class="d-flex flex-column justify-content-center class-info-root-layout">
											
											<br>
										
											<div class="d-flex flex-row info-item">
												<p class=""><strong>그룹 코드</strong> :${groupVo.group_code}</p>	
												<a href="ModifyGroupCode?group_idx=${groupVo.group_idx}" onclick="return confirm('수정 하시겠습니까?');"><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class=""><strong>등록 날짜</strong> : <fmt:formatDate value="${group.create_date}" pattern="yyyy.MM.dd"/></p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class=""><strong>등록인 ID</strong> : ${groupVo.creater_id}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class=""><strong>그룹 설명</strong> : ${groupVo.group_desc}</p>
											</div>
											
											<div class="horizontal-line"></div>
											
											<div class="d-flex flex-row info-item">
												<p class=""><strong>사용여부</strong> : 
													<c:choose>
														<c:when test="${groupVo.using_status}">사용</c:when>
														<c:otherwise>미사용</c:otherwise>	
													</c:choose>
												</p>
											</div>
										</div>
									</div>
									
									<br>					
								
							</div>

							
							<!-- 
							TODO: JS 추가해야함 -> Focus 없애는코드
							const readonlyAreas = document.querySelectorAll('.readonly-textarea');
							readonlyAreas.forEach(el => {
							  el.addEventListener('focus', e => e.target.blur());
							});
							 -->


							<div class="d-flex button-container">
								<button type="button" onclick="history.back()" class="negative-button">돌아가기</button>
<!-- 								<a href="ApGroupCodeList" class="positive-button">적용</a> -->
							</div>
		
						</div>
	
					</div>
				</div>
			
				
			
			</article>
			
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
</html>
