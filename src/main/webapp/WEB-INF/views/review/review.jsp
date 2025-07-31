<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>

	<head>
		<title>수강 후기</title>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath }/resources/css/layout/carousel_main_banner.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/css_variables.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/resources/css/common/base.css" rel="stylesheet">	
		<link href="${pageContext.request.contextPath }/resources/css/review/review.css" rel="stylesheet">
	</head>
	
	
	<body>
	
		<div class="page-base container">
		
			<header>
				<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
			</header>
		
			<article>
			
			<section class="sec_best w1100">
			<div class="rev_tit"><span class="rev__tit"><br>BEST</span> 수강후기</div>

			<ul class="best_wrap">
				<li class="best card position">
					<div class="profile">
						<div class="info">
							<p class="lec_name">AI란 무엇인가</p>
							<span>우솝 | 2025-06-29</span>
						</div>
						<i class="avata"></i>
					</div>
					
					<h1 class="best_tit"></h1>
					<h2 class="best_txt">책배송이 오기까지 2-3일, 마음먹기까지 2일이 걸렸지만,,
										 시작한 제자신, 엘바쌤 말처럼 재생버튼 누른 제 엄지 손가락에 칭찬하면서
										 OT영상부터 그동안 왜 코딩이 어렵게 느껴졌는지 단번에 이해시켜주시고,,
										 적당한 강의시간과 집중력 완전 되는 엘바쌤 목소리로 100일까지 열심히 달려보겠습니다~
					</h2>

					<ul class="img_wrap">
						<li class="img_area">
							<img src="//data.siwonschool.com/basics/review/2025/06/29/1_1751159308.jpg" aria-hidden="true" alt="미리보기 썸네일">
						</li>
						<li class="img_area">
							<img src="//data.siwonschool.com/basics/review/2025/06/29/1_1751159311.jpg" aria-hidden="true" alt="미리보기 썸네일">
						</li>
					</ul>

					<a href="javascript:void(0);" class="btn_more" onclick="openModal({
		                img: 'https://data.siwonschool.com/basics/review/2025/06/29/1_1751159308.jpg',
		                thumbnails: ['https://data.siwonschool.com/basics/review/2025/06/29/1_1751159308.jpg', 'https://data.siwonschool.com/basics/review/2025/06/29/1_1751159311.jpg'],
		                rating: '★★★★★',
		                title: 'AI란 무엇인가',
		                meta: '우솝 | 2025-06-29',
		                tags: { '난이도': '적당해요' },
		                text: '책배송이 오기까지 2-3일, 마음먹기까지 2일이 걸렸지만,
							   시작한 제자신, 엘바쌤 말처럼 재생버튼 누른 제 엄지 손가락에 칭찬하면서
							   OT영상부터 그동안 왜 코딩이 어렵게 느껴졌는지 단번에 이해시켜주시고,
							   적당한 강의시간과 집중력 완전 되는 엘바쌤 목소리로 100일까지 열심히 달려보겠습니다~'
		            })">
						<i class="ii">+</i>
					</a>
				</li>
				<li class="best card position">
					<div class="profile">
						<div class="info">
							<p class="lec_name">코딩 기초 1탄</p>
							<span>루피 | 2025-06-24</span>
						</div>
						<i class="avata"></i>
					</div>

					<h1 class="best_tit"></h1>
					<h2 class="best_txt">오늘도 15분으로 코딩 실력 한 단계 성장했습니다! 요새 바빠서 코딩공부 어떻게 하지 고민 많이 했는데 
										 바빠도 15분만 하면 되니 꾸준히 하게되는 것 같아요 재밌게 강의 해줘서 다음 강의도 열심히 들으러 옵니당!
					</h2>

					<ul class="img_wrap">
						<li class="img_area">
							<img src="//data.siwonschool.com/basics/review/2025/06/24/1_1750741875.jpg" aria-hidden="true" alt="미리보기 썸네일">
						</li>
					</ul>

					<a href="javascript:void(0);" class="btn_more" onclick="openModal({
		                img: 'https://data.siwonschool.com/basics/review/2025/06/24/1_1750741875.jpg',
		                thumbnails: ['https://data.siwonschool.com/basics/review/2025/06/24/1_1750741875.jpg'],
		                rating: '★★★★☆',
		                title: '코딩 기초 1탄',
		                meta: '루피 | 2025-06-24',
		                tags: { '난이도': '쉬워요' },
		                text: '오늘도 15분으로 코딩 실력 한 단계 성장했습니다! 요새 바빠서 코딩공부 어떻게 하지 고민 많이 했는데 바빠도 15분만 하면 되니 꾸준히 하게되는 것 같아요 재밌게 강의 해줘서 다음 강의도 열심히 들으러 옵니당!'
		            })">
						<i class="ii">+</i>
					</a>
				</li>
				<li class="best card position">
					<div class="profile">
						<div class="info">
							<p class="lec_name">데니쌤의 코딩 치트키</p>
							<span>상디 | 2025-06-18</span>
						</div>
						<i class="avata"></i>
					</div>
					<h1 class="best_tit"></h1>
					<h2 class="best_txt">오늘도 15분으로 코딩 실력 한 단계 성장했습니다!
										 요새 바빠서 영어공부 어떻게 하지 고민 많이하는데
										 치트키는 바빠도 15분만 하면 되니까 꾸준히 하게되는 것 같아요ㅋㅋ!
										 역시 그리고 제가 정말 애정하는 코딩 팁도 오늘도 많이 얻어갑니다
										 데니썜이 재밌게 강의 해줘서 다음 강의도 열심히 들으러 옵니당!
										 오늘도 화이팅!!
					</h2>

					<ul class="img_wrap">
						<li class="img_area">
							<img src="//data.siwonschool.com/basics/review/2025/06/18/1_1750230656.jpg" aria-hidden="true" alt="미리보기 썸네일">
						</li>
					</ul>
				    <a href="javascript:void(0);" class="btn_more" onclick="openModal({
		                img: 'https://data.siwonschool.com/basics/review/2025/06/18/1_1750230656.jpg',
		                thumbnails: ['https://data.siwonschool.com/basics/review/2025/06/18/1_1750230656.jpg'],
		                rating: '★★★★★',
		                title: '데니쌤의 코딩 치트키',
		                meta: '상디 | 2025-06-18',
		                tags: { '난이도': '적당해요', '수강기간': '짧아요', '수업방식': '핵심만' },
		                text: '오늘도 15분으로 코딩 실력 한 단계 성장했습니다! 요새 바빠서 영어공부 어떻게 하지 고민 많이하는데 치트키는 바빠도 15분만 하면 되니까 꾸준히 하게되는 것 같아요ㅋㅋ! 역시 그리고 제가 정말 애정하는 코딩 팁도 오늘도 많이 얻어갑니다 데니썜이 재밌게 강의 해줘서 다음 강의도 열심히 들으러 옵니당! 오늘도 화이팅!!'
		            })">
						<i class="ii">+</i>
					</a>
				</li>
			</ul>
			
		    <div id="modal" class="modal">
		        <div class="modal-content">
		            <span class="close" onclick="closeModal()">×</span>
		            <div class="modal-body">
		                <div class="left">
		                    <img id="modalMainImg" src="" alt="리뷰 이미지">
		                    <div id="modalThumbnails" class="thumbnails">
		                        <!-- 썸네일 이미지가 여기에 동적으로 추가됩니다. -->
		                    </div>
		                </div>
		                <div class="right">
		                    <div id="modalRating" class="rating"></div>
		                    <div class="info-top">
		                        <h3 id="modalTitle"></h3>
		                        <span id="modalMeta" class="meta"></span>
		                    </div>
		                    <div id="modalTags" class="info-tags">
		                        <!-- 태그가 여기에 동적으로 추가됩니다. -->
		                    </div>
		                    <div class="review-scroll">
		                        <p id="modalText"></p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>

			<script>
			 // 모달 열기 함수
    // 모달 열기 함수 (수정 없음)
		    function openModal(data) {
		        document.getElementById("modalMainImg").src = data.img;
		        document.getElementById("modalRating").innerText = data.rating;
		        document.getElementById("modalTitle").innerText = data.title;
		        document.getElementById("modalMeta").innerText = data.meta;
		        document.getElementById("modalText").innerText = data.text;
		
		        const thumbnailsContainer = document.getElementById("modalThumbnails");
		        thumbnailsContainer.innerHTML = '';
		        if (data.thumbnails && data.thumbnails.length > 1) {
		            data.thumbnails.forEach(src => {
		                const thumb = document.createElement('img');
		                thumb.src = src;
		                thumb.onclick = () => { document.getElementById("modalMainImg").src = src; };
		                thumbnailsContainer.appendChild(thumb);
		            });
		        }
		        
		        const tagsContainer = document.getElementById("modalTags");
		        tagsContainer.innerHTML = '';
		        if(data.tags){
		            for (const key in data.tags) {
		                const tagSpan = document.createElement('span');
		                tagSpan.innerHTML = `${data.tags[key]}`; // 태그 텍스트만 표시
		                tagsContainer.appendChild(tagSpan);
		            }
		        }
		        
		        document.getElementById("modal").style.display = "block";
		    }
			
		    // 모달 닫기 함수 (수정 없음)
		    function closeModal() {
		        document.getElementById("modal").style.display = "none";
		    }

			</script>	
			</section>
			
			<section class="sec_graph">
				<div class="scope">
					<h1 class="scope_num">4.9</h1>
		
					<div class="star_wrap position" data-star="star_wi50">
						<div class="star_rating star_rating_m">
							<div class="star_on" style="width:98%"></div>
						</div>
					</div>
		
					<h2 class="desc"><span>35,913</span>개의 실사용자 수강후기가 있습니다.</h2>
				</div>
		
				<ul class="score_wrap">
					<!-- 높은 점수인 li에 class high_score  -->
					<li class="score high_score">
						<h3 class="score_tit">5점</h3>
						<div class="progress position">
							<div class="bar" style="width:97%;"></div>
						</div>
						<div class="score_percent">97%</div>
					</li>
		
					<li class="score">
						<h3 class="score_tit">4점</h3>
						<div class="progress position">
							<div class="bar" style="width:2%;"></div>
						</div>
						<div class="score_percent">2%</div>
					</li>
		
					<li class="score">
						<h3 class="score_tit">3점</h3>
						<div class="progress position">
							<div class="bar" style="width:0%;"></div>
						</div>
						<div class="score_percent">0%</div>
					</li>
		
					<li class="score">
						<h3 class="score_tit">2점</h3>
						<div class="progress position">
							<div class="bar" style="width:0%;"></div>
						</div>
						<div class="score_percent">0%</div>
					</li>
		
					<li class="score">
						<h3 class="score_tit">1점</h3>
						<div class="progress position">
							<div class="bar" style="width:0%;"></div>
						</div>
						<div class="score_percent">0%</div>
					</li>
				</ul>
			</section>
			
			
			
			
			
			
			</article>			
			
			<footer>
				<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
			</footer>
		
		</div>
	
	</body>
	
	
</html>