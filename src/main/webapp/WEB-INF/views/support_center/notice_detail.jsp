<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 본 JSP 파일은 헤더, 푸터와 body에 container 틀을 작성한 예시입니다. -->


<html>

	<head>
		<title>공지사항 세부내용</title>
		<meta charset="UTF-8">
		
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath}/resources/css/page/support_center/notice_detail.css" rel="stylesheet">

	</head>
	
	<body>
		
		<div class="page-base container">
			
			<!-- 헤더 -->		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
				<div class="d-flex flex-row justify-content-center top-layout">
					<h2 class="main-text">공지사항 세부</h2>
				</div>
			
				<div class="d-flex flex-row">
				
					<div class="d-flex flex-row">
					
						<jsp:include page="/WEB-INF/views/support_center/support_center_sidebar.jsp"/>
						
						<div class="d-flex flex-column">
						
							<div class="d-flex flex-column write_main_layout">
									
									<div class="d-flex flex-row justify-content-between tmi-layout">
										<p class="tmi-text">조회수: ${noticeVo.view_count}</p>
										
										<div class="d-flex flex-row">
											
											<c:if test="${isAdmin}">
												<a href="ModifyNotice?notice_idx=${noticeVo.notice_idx}"><img alt="" src="${pageContext.request.contextPath }/resources/icons/icon_edit.png" class="edit-icon"></a>
												
												<form action="DeleteNotice" method="post" class="align-form">
													<input type="hidden" name="notice_idx" value="${noticeVo.notice_idx}">
													<input type="image" onclick="return confirm('정말 해당 공지사항을 삭제 하시겠습니까?');" src="${pageContext.request.contextPath }/resources/icons/icon_delete.png" class="edit-icon">
												</form>

											</c:if>
												 
										</div>	
									</div>
	
									<div class="d-flex flex-row write-layout">
										<p class="info-text">${noticeVo.notice_subject}</p>
									</div>
									
									<div class="horizontal-line"></div>
									
									<div class="d-flex flex-row content-layout">
										<pre class="post-content">${noticeVo.notice_content}</pre>
									</div>
<!-- 									<div class="d-flex flex-row write-layout-content"> -->
									
										
<!-- 										<p class="info-text-content">내용</p> -->
<!-- 										<textarea rows="10" cols="50" class="common-input-form"></textarea> -->
<%-- 											<pre class="notice-content">${noticeVo.notice_content}</pre> --%>
<!-- 									</div> -->
									
<!-- 									<div class="horizontal-line"></div> -->
									
<!-- 									<div class="d-flex flex-row write-layout"> -->
<!-- 										<p class="info-text">첨부 파일1:</p> -->
<!-- 										<input type="text" class="common-input-form form-size" value="UUID + 파일이름.jpg"> -->
<!-- 										<a href="#" class="positive-button button-detail add-attachment-bt">다운로드</a> -->
<!-- 									</div> -->
								
								</div>
							
							<div class="d-flex flex-row button-container">
								<a href="NoticeList" class="positive-button">돌아가기</a>
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
