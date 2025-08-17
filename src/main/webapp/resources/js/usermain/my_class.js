document.addEventListener('DOMContentLoaded', function() {
	
	const courseList = document.querySelector('.course-list');
	const resetBtn = document.querySelector('#reset-data-btn');

	function renderInProgressCourses() {
		if (!courseList) return;
		courseList.innerHTML = '';
		const allCourses = CourseManager.getAllCourses();
		const inProgressCourses = allCourses.filter(course => course.currentLesson < course.totalLessons);

		if (inProgressCourses.length === 0) {
			courseList.innerHTML = '<li class="empty-message">학습 중인 강의가 없습니다.</li>';
		} else {
			inProgressCourses.forEach(course => {
				const courseElement = createCourseElement(course);
				courseList.appendChild(courseElement);
			});
		}
	}

	/**
	 * [최종 수정] 제공된 CSS에 맞는 a 태그를 생성하는 함수
	 * @param {object} course - 강의 정보 객체
	 * @returns {HTMLElement} - 생성된 <li> 요소
	 */
	function createCourseElement(course) {
		const progressPercent = (course.currentLesson / course.totalLessons) * 100;
		const listItem = document.createElement('li');
		listItem.className = 'course-item';
		
		// [핵심] <a> 태그를 만들고, 모든 내용을 그 안에 넣습니다.
		const link = document.createElement('a');
		link.href = `MyClassDetail?id=${course.id}`;
		
		link.innerHTML = `
			<div class="play-icon">▶</div>
			<div class="course-details">
				<h3 class="course-title">${course.title}</h3>
				<p class="course-progress-text">${course.currentLesson} / ${course.totalLessons}회차 (${Math.floor(progressPercent)}%)</p>
				<div class="progress" role="progressbar">
					<div class="progress-bar" style="width: ${progressPercent}%;"></div>
				</div>
			</div>
		`;
		
		// 완성된 a 태그를 li에 추가합니다.
		listItem.appendChild(link);
		
		return listItem;
	}

	if (resetBtn) {
		resetBtn.addEventListener('click', function() {
			if (confirm('정말로 모든 학습 기록을 초기 상태로 되돌리시겠습니까?')) {
				CourseManager.resetData();
				alert('학습 기록이 초기화되었습니다.');
				renderInProgressCourses();
			}
		});
	}

	renderInProgressCourses();
});
