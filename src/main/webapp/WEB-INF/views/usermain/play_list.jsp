<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>

<head>
    <title>PlayList</title>
    <meta charset="UTF-8">
    <jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
    <link href="${pageContext.request.contextPath }/resources/css/page/usermain/play_list.css" rel="stylesheet">  
    <link href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain_category.css" rel="stylesheet">    
</head>

<body>
    <div class="page-base container">

        <header>
            <jsp:include page="/WEB-INF/views/inc/header.jsp"/>
        </header>

        <article class="content-layout">

            <%-- 좌측 공통 카테고리 --%>
            <jsp:include page="/WEB-INF/views/usermain/usermain_category.jsp"/>

            <%-- 메인 콘텐츠 영역 --%>
            <section class="playlist-container">

                <%-- 상단 헤더 (제목 + 편집 버튼) --%>
                <div class="playlist-header">
                    <h2 class="playlist-title">재생목록</h2>
                    <button type="button" class="positive-button">편집</button>
                </div>

                <%-- 폴더 그리드 --%>
                <ul class="playlist-grid">

                    <%-- 새로 만들기 폴더 (특별한 스타일) --%>
                    <li class="playlist-item add-new">
                        <a href="">
                            <div class="add-icon">+</div>
                        </a>
                    </li>	

                </ul>

            </section>
        </article>

        <footer>
            <jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
        </footer>

    </div>
	
	<script>

		const initialPlayListData = [
            <c:forEach var="pl" items="${playlist}" varStatus="status">
                {
                    playlist_idx: ${pl.playlist_idx},
                    user_idx: ${pl.user_idx},
                    playlist_name: '${pl.playlist_name}',
                    create_date: '${pl.create_date}'
                }
                <c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];

    </script>
	
    <script src="${pageContext.request.contextPath}/resources/js/usermain/play_list.js"></script>

</body>

</html>
