document.addEventListener('DOMContentLoaded', function() {

	const courseList = document.querySelector('.course-list');

	function renderCompletedCourses() {
		if (!courseList) return;
		courseList.innerHTML = '';
		const allCourses = CourseManager.getAllCourses();
		const completedCourses = allCourses.filter(course => course.currentLesson === course.totalLessons);

		if (completedCourses.length === 0) {
			courseList.innerHTML = '<li class="empty-message">학습을 완료한 강의가 없습니다.</li>';
		} else {
			completedCourses.forEach(course => {
				const courseElement = createCompletedCourseElement(course);
				courseList.appendChild(courseElement);
			});
		}
	}

	/**
	 * [최종 수정] 제공된 CSS에 맞는 a 태그를 생성하는 함수
	 * @param {object} course - 강의 정보 객체
	 * @returns {HTMLElement} - 생성된 <li> 요소
	 */
	function createCompletedCourseElement(course) {
		const listItem = document.createElement('li');
		listItem.className = 'course-item';
		
		// [핵심] <a> 태그를 만들고, 모든 내용을 그 안에 넣습니다.
		const link = document.createElement('a');
		link.href = `MyClassDetail?id=${course.id}`;
		
		link.innerHTML = `
			<div class="play-icon">▶</div>
			<div class="course-details">
				<h3 class="course-title">${course.title}</h3>
				<p class="course-progress-text">${course.totalLessons} / ${course.totalLessons}회차 (100%)</p>
				<div class="progress" role="progressbar">
					<div class="progress-bar" style="width: 100%;"></div>
				</div>
			</div>
		`;

		// 완성된 a 태그를 li에 추가합니다.
		listItem.appendChild(link);
		
		return listItem;
	}
	
	renderCompletedCourses();
});
