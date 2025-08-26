document.addEventListener('DOMContentLoaded', function() {
	
	// --- 가상 데이터베이스 ---
	// 실제로는 서버 API를 통해 id에 해당하는 강의 데이터만 받아옵니다.
	// my_class.js의 데이터와 id, title이 일치해야 합니다.
	const allCourseData = {
		'1': { // courseId가 1인 강의의 데이터
			courseTitle: '오늘도 배운다! 자바 핵심만 쏙쏙 배우는 명강의 100선',
			sections: [
				{
					sectionTitle: '백엔드 개발 개요와 개발 환경 설정',
					lectures: [
						{ title: '프롤로그', duration: '7:28', watched: true },
						{ title: '개요', duration: '9:02', watched: false },
						{ title: '환경 설정', duration: '7:00', watched: false },
						{ title: '첫 프로젝트 생성하기', duration: '11:45', watched: false }
					]
				},
				{
					sectionTitle: 'Java 문법 기초와 객체지향 이해',
					lectures: [
						{ title: '변수와 데이터 타입', duration: '15:10', watched: false },
						{ title: '연산자', duration: '12:30', watched: false },
						{ title: '조건문과 반복문', duration: '20:05', watched: false },
					]
				}
			]
		},
		'2': { // courseId가 2인 강의의 데이터
			courseTitle: 'SQL 기초부터 활용까지, 데이터베이스 입문',
			sections: [
				{
					sectionTitle: '데이터베이스 소개',
					lectures: [
						{ title: 'DB와 SQL이란?', duration: '8:00', watched: true },
						{ title: 'RDBMS vs NoSQL', duration: '10:15', watched: true },
					]
				},
				{
					sectionTitle: '기본 SQL 문법',
					lectures: [
						{ title: 'SELECT', duration: '18:50', watched: false },
						{ title: 'INSERT, UPDATE, DELETE', duration: '14:20', watched: false },
						{ title: 'WHERE', duration: '11:00', watched: false },
					]
				}
			]
		},
		'3': { // courseId가 3인 강의의 데이터 (테스트용)
			courseTitle: '새로운-3 REACT 강의',
			sections: [
				{
					sectionTitle: 'React 시작하기',
					lectures: [
						{ title: 'CRA와 Vite', duration: '12:00', watched: false },
						{ title: 'JSX 문법', duration: '15:30', watched: false },
					]
				}
			]
		}
	};

	// --- 요소 선택 ---
	const mainTitleElement = document.querySelector('.main-title');
	const sectionListElement = document.querySelector('.section-list');

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
	 * @param {object} lecture - 강의 정보 객체
	 * @param {string} courseId - 강의 ID
	 * @param {number} lectureIndex - 섹션 내 강의 순서
	 * @returns {HTMLElement} - 생성된 <li> 요소
	 */
	function createLectureElement(lecture, courseId, lectureIndex) {
		const li = document.createElement('li');
		li.className = 'lecture-item';

		// courseId와 lectureIndex를 URL 파라미터로 포함
		const link = document.createElement('a');
		link.href = contextPath + '/OnlineClass?classId=' + courseId + '&episodeId=' + lectureIndex;
		 // 실제 비디오 페이지 링크로 변경 가능

		link.innerHTML = `
			<span class="lecture-info">
				<span class="play-icon">▶</span>
				<span class="lecture-title">${lecture.title}</span>
			</span>
			<span class="lecture-duration">
				${lecture.watched ? '✔️' : '❔'}
				${lecture.duration}
			</span>
		`;

		li.appendChild(link);
		return li;
	}

	/**
	 * 강의 섹션(<li>) HTML 요소를 생성하는 함수
	 * @param {object} section - 섹션 정보 객체
	 * @param {boolean} isOpen - 섹션이 기본적으로 열려있을지 여부
	 * @param {string} courseId - 강의 ID
	 * @returns {HTMLElement} - 생성된 <li> 요소
	 */
	function createSectionElement(section, isOpen = false, courseId) {
		const li = document.createElement('li');
		li.className = `section-item ${isOpen ? 'open' : ''}`;

		// 진행률 계산
		const watchedCount = section.lectures.filter(lec => lec.watched).length;
		const totalCount = section.lectures.length;
		const progress = totalCount > 0 ? Math.floor((watchedCount / totalCount) * 100) : 0;

		// 섹션 헤더 생성
		const header = document.createElement('div');
		header.className = 'section-header';
		header.innerHTML = `
			<span class="section-title">
				<span class="arrow-icon">▼</span>
				${section.sectionTitle}
			</span>
			<span class="section-progress">진행률 : ${progress}% <b>${totalCount}개</b></span>
		`;

		// 강의 목록(<ul>) 생성
		const lectureList = document.createElement('ul');
		lectureList.className = 'lecture-list';
		section.lectures.forEach((lecture, lecIndex) => {
			const lectureElement = createLectureElement(lecture, courseId, lecIndex); // courseId와 lectureIndex 전달
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
		const courseId = getCourseIdFromURL();
		const courseData = allCourseData[courseId];

		if (!courseData) {
			mainTitleElement.textContent = '강의 정보를 찾을 수 없습니다.';
			return;
		}

		// 1. 페이지 제목 설정
		mainTitleElement.textContent = courseData.courseTitle;

		// 2. 섹션 목록 렌더링
		sectionListElement.innerHTML = ''; // 기존 내용 초기화
		courseData.sections.forEach((section, index) => {
			// 첫 번째 섹션만 기본적으로 열리도록 설정
			const sectionElement = createSectionElement(section, index === 0, courseId); // courseId 전달
			sectionListElement.appendChild(sectionElement);
		});
	}

	// --- 이벤트 리스너 ---
	// 아코디언 메뉴 기능 (이벤트 위임 사용)
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
