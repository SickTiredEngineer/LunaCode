<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>SearchArea</title>
		<meta charset="UTF-8">
		<jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
		<link href="${pageContext.request.contextPath }/resources/css/page/usermain/searcharea.css" rel="stylesheet">      
	</head>
	
	<body>
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>

			<article>
				<div class="search-area">
					<div class="search-box position-relative">
						<!-- 드롭다운 버튼 (인풋 내부 왼쪽에 고정) -->
						<div class="dropdown">
							<button class="btn dropdown-toggle" type="button" id="searchDropdown" data-bs-toggle="dropdown" aria-expanded="false">
								제목
							</button>
							
							<ul class="dropdown-menu" aria-labelledby="searchDropdown">
								<li><a class="dropdown-item" href="#" onclick="setDropdownText(event)">제목</a></li>
								<li><a class="dropdown-item" href="#" onclick="setDropdownText(event)">작성자</a></li>
								<li><a class="dropdown-item" href="#" onclick="setDropdownText(event)">내용</a></li>
							</ul>
						</div>

						<!-- 입력창 -->
						<input type="text" placeholder="검색어를 입력하세요">
					</div>
				</div>
			</article>

			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>

		</div>

		<!-- Bootstrap JS -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>