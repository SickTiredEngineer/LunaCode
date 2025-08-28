/*
 * =====================================================================================
 * 파일: my_class.js (학습 중인 강의)
 * 설명: '학습 중인 강의' 목록을 서버에서 불러와 화면에 표시합니다.
 * =====================================================================================
 */
document.addEventListener('DOMContentLoaded', function() {
	
	const courseList = document.querySelector('.course-list');

	/**
	 * [핵심] 서버로부터 '학습 중인 강의' 목록을 비동기적으로 가져와 화면에 표시하는 메인 함수
	 */
	async function fetchAndRenderCourses() {
		if (courseList) {
			courseList.innerHTML = '<li class="loading-message">강의 목록을 불러오는 중입니다...</li>';
		}

		try {
			// [1] Controller의 @GetMapping("InProgress")에 매핑된 API를 호출합니다.
			// (주의!) CONTEXT_PATH 변수는 JSP 파일에서 미리 정의되어 있어야 합니다.
			const response = await fetch(`${CONTEXT_PATH}/InProgress`);

			if (!response.ok) {
				throw new Error(`서버 응답 오류: ${response.status}`);
			}
			
			const inProgressCourses = await response.json();
			renderCourseList(inProgressCourses);

		} catch (error) {
			console.error("학습 중인 강의 목록 로딩 중 오류:", error);
			if (courseList) {
				courseList.innerHTML = '<li class="empty-message">데이터를 불러오는 데 실패했습니다.</li>';
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
			courseList.innerHTML = '<li class="empty-message">학습 중인 강의가 없습니다.</li>';
		} else {
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
		// [2] 클릭 시 MyClassDetail 페이지로 이동하는 링크 생성
		link.href = `${CONTEXT_PATH}/MyClassDetail?id=${course.class_idx}`;
		
		link.innerHTML = `
			<div class="play-icon">▶</div>
			<div class="course-details">
				<h3 class="course-title">${course.class_title}</h3>
				<p class="course-date">수강날짜: ${course.enroll_date}</p>
			</div>
		`;
		
		listItem.appendChild(link);
		return listItem;
	}

	// 페이지가 로드되면 메인 함수를 실행하여 강의 목록을 불러옵니다.
	fetchAndRenderCourses();
});