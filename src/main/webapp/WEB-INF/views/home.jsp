<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>Main</title>
		
		<link href="${pageContext.request.contextPath }/resources/css/main_slider.css" rel="stylesheet">
		
		
	</head>
	
	
	<body>
	
		<header>
			<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
		</header>

		
		<article>
			<div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-ride="carousel" data-bs-interval="3000">

				<div class="carousel-inner">
			    	<div class="carousel-item active">
			      		<img src="${pageContext.request.contextPath }/resources/image/main_logo.png" id="banner_1" class="d-block w-100 img-fluid" alt="...">
			    	</div>
			    	<div class="carousel-item">
			        	<img src="${pageContext.request.contextPath }/resources/image/luna_logo_2.png" id="banner_2" class="d-block w-100 img-fluid" alt="...">
			    	</div>
			    	<div class="carousel-item">
			      		<img src="${pageContext.request.contextPath }/resources/image/luna_logo_3.png" id="banner_3" class="d-block w-100 img-fluid" alt="...">
			    	</div>
			  </div>
			  	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    	<span class="visually-hidden">Previous</span>
			  	</button>
			  	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
			    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
			    	<span class="visually-hidden">Next</span>
				</button>
			</div>
		</article>
		
		<footer>
			<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
		</footer>
		
		
	</body>
	
	
</html>
