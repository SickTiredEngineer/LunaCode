document.addEventListener('DOMContentLoaded', function() {
	
	const courseList = document.querySelector('.course-list');

	async function fetchAndRenderCourses() {
		if (courseList) {
			courseList.innerHTML = '<li class="loading-message">강의 목록을 불러오는 중입니다...</li>';
		}
		try {
			const response = await fetch('InProgress');
			if (!response.ok) {
				throw new Error(`서버 응답 오류: ${response.status}`);
			}
			const inProgressCourses = await response.json();
			renderCourseList(inProgressCourses);
		} catch (error) {
			console.error("학습 중인 강의 목록을 불러오는 중 오류가 발생했습니다:", error);
			if (courseList) {
				courseList.innerHTML = '<li class="empty-message">데이터를 불러오는 데 실패했습니다.</li>';
			}
		}
	}

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

	function createCourseElement(course) {
		const listItem = document.createElement('li');
		// CSS의 .course-item 클래스를 그대로 사용하도록 수정
		listItem.className = 'course-item'; 
		
		const link = document.createElement('a');
		if (course.url && course.url.trim() !== '') {
            // 외부 링크일 수 있으므로 contextPath를 붙이지 않습니다.
            // (예: https://www.youtube.com/...)
			link.href = course.url; 
		} else {
            // url이 없는 경우, 이전처럼 강의 상세 페이지로 이동합니다.
			link.href = `MyClassDetail?id=${course.class_idx}`;
		}
		
		const enrollDate = course.enroll_date 
			? new Date(course.enroll_date).toLocaleDateString('ko-KR', {
				year: 'numeric',
				month: '2-digit',
				day: '2-digit'
			  }).replace(/\. /g, '.').slice(0, -1)
			: '날짜 정보 없음';

		// CSS 구조에 맞춰 썸네일과 텍스트 정보를 배치합니다.
		// CSS의 .play-icon 대신 <img> 태그를 사용합니다.
		link.innerHTML = `
            <div class="course-thumbnail">
                <img src="/luna_code/resources/class_thumbnail/${course.class_thumbnail}" alt="${course.class_title}">
            </div>
            <div class="course-details">
                <h3 class="course-title">${course.class_title}</h3>
                <p class="course-enroll-date">수강 시작일: ${enrollDate}</p>
            </div>
		`;
		
		listItem.appendChild(link);
		return listItem;
	}

	fetchAndRenderCourses();
});