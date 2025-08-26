document.addEventListener('DOMContentLoaded', function() {
	
	const courseList = document.querySelector('.course-list');
	// const resetBtn = document.querySelector('#reset-data-btn'); // reset 기능은 DB 초기화 API가 별도로 필요하므로 일단 주석 처리

	/**
	 * [핵심 기능] 서버로부터 '학습 중인 강의' 목록을 비동기적으로 가져와 화면에 표시하는 메인 함수
	 */
	async function fetchAndRenderCourses() {
		// 1. 사용자에게 로딩 중임을 알림
		if (courseList) {
			courseList.innerHTML = '<li class="loading-message">강의 목록을 불러오는 중입니다...</li>';
		}

		try {
			// 2. Spring Controller에 @GetMapping("/api/mycourses/in-progress")으로 매핑된 API를 호출
			const response = await fetch('InProgress');

			// 3. 서버 응답에 문제가 있으면 에러를 발생시켜 catch 블록으로 보냄
			if (!response.ok) {
				throw new Error(`서버 응답 오류: ${response.status}`);
			}
			
			// 4. 응답 본문을 JSON 객체 배열로 변환
			const inProgressCourses = await response.json();

			// 5. 받아온 데이터로 실제 화면을 그림
			renderCourseList(inProgressCourses);

		} catch (error) {
			console.error("학습 중인 강의 목록을 불러오는 중 오류가 발생했습니다:", error);
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
		courseList.innerHTML = ''; // 기존 목록(로딩 메시지 등)을 깨끗하게 비움

		// 6. 강의 데이터가 없으면 안내 메시지를 표시
		if (!courses || courses.length === 0) {
			courseList.innerHTML = '<li class="empty-message">학습 중인 강의가 없습니다.</li>';
		} else {
			// 7. 강의 데이터가 있으면 각 강의에 대해 HTML 요소를 만들어 추가
			courses.forEach(course => {
				const courseElement = createCourseElement(course);
				courseList.appendChild(courseElement);
			});
		}
	}

	/**
	 * 강의 객체 하나를 받아 HTML <li> 요소를 생성하여 반환하는 함수
	 * @param {object} course - MyCourseVO와 필드명이 일치하는 강의 정보 객체
	 * @returns {HTMLElement} - 완성된 <li> 요소
	 */
	function createCourseElement(course) {
		const listItem = document.createElement('li');
		listItem.className = 'course-item';
		
		const link = document.createElement('a');
		// [수정] course.id => course.class_idx (VO 필드명)
		link.href = `MyClassDetail?id=${course.class_idx}`;
		
		// [수정] 서버에서 보내준 VO 필드명으로 모두 변경
		// - course.title => course.class_title
		// - course.currentLesson => course.current_lesson_count
		// - course.totalLessons => course.total_lessons
		// - progressPercent => course.progress_percent (서버에서 계산해 줌)
		link.innerHTML = `
			<div class="play-icon">▶</div>
			<div class="course-details">
				<h3 class="course-title">${course.class_title}</h3>
				<p class="course-progress-text">${course.current_lesson_count} / ${course.total_lessons}회차 (${Math.floor(course.progress_percent)}%)</p>
				<div class="progress" role="progressbar">
					<div class="progress-bar" style="width: ${course.progress_percent}%;"></div>
				</div>
			</div>
		`;
		
		listItem.appendChild(link);
		return listItem;
	}

	// 페이지가 처음 로드될 때 메인 함수를 실행하여 전체 프로세스를 시작
	fetchAndRenderCourses();
});