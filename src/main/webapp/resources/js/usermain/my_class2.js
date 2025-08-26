document.addEventListener('DOMContentLoaded', function() {

	const courseList = document.querySelector('.course-list');

	/**
	 * [핵심 기능] 서버로부터 '학습 완료한 강의' 목록을 비동기적으로 가져와 화면에 표시하는 메인 함수
	 */
	async function fetchAndRenderCourses() {
		// 1. 로딩 메시지 표시
		if (courseList) {
			courseList.innerHTML = '<li class="loading-message">강의 목록을 불러오는 중입니다...</li>';
		}

		try {
			// 2. '학습 완료' API 호출 (@GetMapping("/api/mycourses/completed"))
			const response = await fetch('Completed');
			
			if (!response.ok) {
				throw new Error(`서버 응답 오류: ${response.status}`);
			}
			
			const completedCourses = await response.json();
			
			// 3. 받아온 데이터로 화면 렌더링
			renderCourseList(completedCourses);

		} catch (error) {
			console.error("학습 완료한 강의 목록을 불러오는 중 오류가 발생했습니다:", error);
			if (courseList) {
				courseList.innerHTML = '<li class="empty-message">데이터를 불러오는 데 실패했습니다. 잠시 후 다시 시도해주세요.</li>';
			}
		}
	}

	/**
	 * 서버에서 받은 강의 목록 데이터(배열)를 기반으로 HTML 목록을 생성하는 함수
	 * @param {Array} courses - MyCourseVO 객체 배열
	 */
	function renderCourseList(courses) {
		if (!courseList) return;
		courseList.innerHTML = ''; 

		if (!courses || courses.length === 0) {
			courseList.innerHTML = '<li class="empty-message">학습을 완료한 강의가 없습니다.</li>';
		} else {
			courses.forEach(course => {
				const courseElement = createCompletedCourseElement(course);
				courseList.appendChild(courseElement);
			});
		}
	}

	/**
	 * 강의 객체 하나를 받아 HTML <li> 요소를 생성하여 반환하는 함수
	 * @param {object} course - MyCourseVO와 필드명이 일치하는 강의 정보 객체
	 * @returns {HTMLElement} - 완성된 <li> 요소
	 */
	function createCompletedCourseElement(course) {
		const listItem = document.createElement('li');
		listItem.className = 'course-item';
		
		const link = document.createElement('a');
		// [수정] course.id => course.class_idx
		link.href = `MyClassDetail?id=${course.class_idx}`;
		
		// [수정] 서버에서 보내준 VO 필드명으로 모두 변경
		// - course.title => course.class_title
		// - course.totalLessons => course.total_lessons
		link.innerHTML = `
			<div class="play-icon">▶</div>
			<div class="course-details">
				<h3 class="course-title">${course.class_title}</h3>
				<p class="course-progress-text">${course.total_lessons} / ${course.total_lessons}회차 (100%)</p>
				<div class="progress" role="progressbar">
					<div class="progress-bar" style="width: 100%;"></div>
				</div>
			</div>
		`;

		listItem.appendChild(link);
		return listItem;
	}
	
	// 페이지가 처음 로드될 때 메인 함수를 실행
	fetchAndRenderCourses();
});