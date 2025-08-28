/*
 * =====================================================================================
 * 파일: my_class.js (학습 중인 강의 목록 페이지)
 * 설명: '/InProgress' API를 호출하여 학습 중인 강의 목록을 불러오고,
 *      '영상 추가 모드'일 경우 안내 문구를 표시합니다.
 * =====================================================================================
 */
document.addEventListener('DOMContentLoaded', function() {
	
	const courseList = document.querySelector('.course-list');

	// [핵심] '내 강의' 페이지에 진입할 때마다 상태를 점검하고 초기화하는 로직
    // 이전 페이지가 '재생목록 상세'가 아니라면, "영상 추가 모드" 상태를 해제합니다.
    if (!document.referrer.includes('/PlayListPlus')) {
        if (sessionStorage.getItem('playlistAddMode')) {
            console.log("'내 강의' 페이지 일반 접근: 'playlistAddMode' 상태를 초기화합니다.");
            sessionStorage.removeItem('playlistAddMode');
        }
    }
    
    // "영상 추가 모드"가 활성화된 상태라면 안내 문구를 표시합니다.
    const addModeInfo = JSON.parse(sessionStorage.getItem('playlistAddMode'));
    if (addModeInfo && addModeInfo.isAdding) {
        const targetPlaylistName = addModeInfo.targetPlaylistName;
        const noticeContainer = document.getElementById('add-mode-notice-container');

        if (noticeContainer) {
            const noticeHtml = `
                <div class="add-mode-notice">
                    <strong>'${targetPlaylistName}'</strong> 재생목록에 추가할 강의를 선택하세요.
                </div>
            `;
            noticeContainer.innerHTML = noticeHtml;
        }
    }
	
	/**
	 * 서버로부터 '학습 중인 강의' 목록을 비동기적으로 가져와 화면에 표시하는 메인 함수
	 */
	async function fetchAndRenderCourses() {
		if (!courseList) return;
		courseList.innerHTML = '<li class="loading-message">강의 목록을 불러오는 중입니다...</li>';

		try {
			// Controller의 @GetMapping("InProgress")에 매핑된 API를 호출
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
	 */
	function createCourseElement(course) {
		const listItem = document.createElement('li');
		listItem.className = 'course-item';
		
		const link = document.createElement('a');
		// 클릭 시 MyClassDetail 페이지로 이동하는 링크 생성
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