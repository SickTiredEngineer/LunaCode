document.addEventListener('DOMContentLoaded', function() {

	// --- 요소 선택 ---
	const sectionListElement = document.querySelector('.section-list');
	const mainTitleElement = document.querySelector('.main-title');

	/**
	 * URL에서 'id' 파라미터 값을 가져오는 함수
	 * @returns {string|null} - id 값 또는 없으면 null
	 */
	function getCourseIdFromURL() {
		const urlParams = new URLSearchParams(window.location.search);
		return urlParams.get('id');
	}
	
	/**
	 * 개별 강의 아이템(<li>) HTML 요소를 생성하는 함수
	 * @param {object} episode - 강의 정보 객체
	 * @returns {HTMLElement} - 생성된 <li> 요소
	 */
	function createLectureElement(episode) {
		const li = document.createElement('li');
		li.className = 'lecture-item';
		
		const link = document.createElement('a');
		link.href = `/luna_code/OnlineClass?episodeId=${episode.episode_idx}`; // contextPath는 필요 시 JSP에서 변수로 받아와야 함

		link.innerHTML = `
			<span class="lecture-info">
				<span class="play-icon">▶</span>
				<span class="lecture-title">${episode.episode_name}</span>
			</span>
			<span class="lecture-duration">
                <%-- [수정] watched 필드 이름 변경 --%>
				${episode.watched ? '✔️' : '❔'} 
				${episode.episode_duration}
			</span>
		`;

		li.appendChild(link);
		return li;
	}

	/**
	 * 강의 섹션(<li>) HTML 요소를 생성하는 함수
	 * @param {object} section - 섹션 정보 객체
	 * @param {boolean} isOpen - 섹션이 기본적으로 열려있을지 여부
	 * @returns {HTMLElement} - 생성된 <li> 요소
	 */
	function createSectionElement(section, isOpen = false) {
		const li = document.createElement('li');
		li.className = `section-item ${isOpen ? 'open' : ''}`;

		const watchedCount = section.episodes.filter(ep => ep.watched).length;
		const totalCount = section.episodes.length;
		const progress = totalCount > 0 ? Math.floor((watchedCount / totalCount) * 100) : 0;

		const header = document.createElement('div');
		header.className = 'section-header';
		header.innerHTML = `
			<span class="section-title">
				<span class="arrow-icon">▼</span>
                <%-- [수정] 필드명 변경: sectionTitle -> session_name --%>
				${section.session_name} 
			</span>
			<span class="section-progress">진행률 : ${progress}% <b>${totalCount}개</b></span>
		`;

		const lectureList = document.createElement('ul');
		lectureList.className = 'lecture-list';
		
		section.episodes.forEach(episode => {
			const lectureElement = createLectureElement(episode);
			lectureList.appendChild(lectureElement);
		});

		li.appendChild(header);
		li.appendChild(lectureList);
		return li;
	}

	/**
	 * 페이지 전체를 렌더링하는 메인 함수
	 */
	function renderPage() {

		if (!courseData || !courseData.class_title) {
			mainTitleElement.textContent = '강의 정보를 찾을 수 없습니다.';
			return;
		}

		// 1. 페이지 제목 설정
		mainTitleElement.textContent = courseData.class_title;

		// 2. 섹션 목록 렌더링
		sectionListElement.innerHTML = '';

		courseData.sections.forEach((section, index) => {
			const sectionElement = createSectionElement(section, index === 0);
			sectionListElement.appendChild(sectionElement);
		});
	}

	// --- 이벤트 리스너 ---
	sectionListElement.addEventListener('click', function(event) {
		const header = event.target.closest('.section-header');
		if (header) {
			const sectionItem = header.closest('.section-item');
			if (sectionItem) {
				sectionItem.classList.toggle('open');
			}
		}
	});

	// --- 페이지 초기화 실행 ---
	renderPage();
});