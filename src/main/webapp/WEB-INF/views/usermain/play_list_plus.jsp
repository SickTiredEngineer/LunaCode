<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>PlayList - ${playlist.playlist_name}</title>
    <meta charset="UTF-8">
    <jsp:include page="/WEB-INF/views/inc/common_head.jsp"/>
    <link href="${pageContext.request.contextPath }/resources/css/page/usermain/play_list_plus.css" rel="stylesheet">  
    <link href="${pageContext.request.contextPath }/resources/css/page/usermain/usermain_category.css" rel="stylesheet">    
</head>
<body>
    <div class="page-base container">
        <header>
            <jsp:include page="/WEB-INF/views/inc/header.jsp"/>
        </header>
        <article class="content-layout">
            <jsp:include page="/WEB-INF/views/usermain/usermain_category.jsp"/>
            <section class="playlist-container">
                <div class="playlist-header">
                    <h2 class="playlist-title">${playlist.playlist_name}</h2>
                    <div class="header-buttons">
                        <a href="${pageContext.request.contextPath}/PlayList" class="negative-button">이전</a>
                        <button type="button" class="positive-button" id="edit-playlist-btn">편집</button>
                    </div>
                </div>
                
                <ul class="playlist-grid">
                    <li class="playlist-item add-new">
                        <a href="#" id="add-video-btn">
                            <div class="add-icon">+</div>
                        </a>
                    </li>

                    <c:forEach var="episode" items="${playlist.episodes}">
                        <li class="playlist-item" data-item-idx="${episode.item_idx}" data-title="${episode.episode_name}">
                            <a href="${pageContext.request.contextPath}/OnlineClass?episodeId=${episode.episode_idx}">
                                <div class="item-thumbnail"></div>
                                <div class="item-title">${episode.episode_name}</div>
                            </a>
                            <div class="item-actions">
                                <button type="button" class="btn-delete">-</button>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </section>
        </article>
        <footer>
            <jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
        </footer>
    </div>
    
    <script>
        const CONTEXT_PATH = "${pageContext.request.contextPath}";
        const currentPlaylistId = "${playlist.playlist_idx}";
        const currentPlaylistName = "${playlist.playlist_name}";
    </script>
    
    <script src="${pageContext.request.contextPath}/resources/js/usermain/play_list_plus.js"></script>
</body>
</html>