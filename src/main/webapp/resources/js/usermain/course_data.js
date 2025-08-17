// 초기 데이터 (변경 없음)
const initialCourses = [
	{ id: 1, title: '오늘도 배운다! 자바 핵심만 쏙쏙 배우는 명강의 100선', currentLesson: 8, totalLessons: 10 },
	{ id: 2, title: 'SQL 기초부터 활용까지, 데이터베이스 입문', currentLesson: 3, totalLessons: 15 },
	{ id: 101, title: '파이썬 입문부터 웹 개발까지', currentLesson: 20, totalLessons: 20 },
	{ id: 102, title: '너도 할 수 있다! 스프링 기초', currentLesson: 15, totalLessons: 15 },
	{ id: 103, title: '리눅스 서버 기본 명령어 마스터', currentLesson: 28, totalLessons: 30 } // 2번만 더 들으면 완료
];

// CourseManager 객체 수정
const CourseManager = {
	key: 'myCourses',
	init: function() {
		if (!localStorage.getItem(this.key)) {
			localStorage.setItem(this.key, JSON.stringify(initialCourses));
		}
	},
	getAllCourses: function() {
		return JSON.parse(localStorage.getItem(this.key));
	},
	saveAllCourses: function(courses) {
		localStorage.setItem(this.key, JSON.stringify(courses));
	},

	/**
	 * [수정] 특정 강의의 진행률을 1 증가시키는 함수
	 * @param {number} courseId - 진행률을 증가시킬 강의의 ID
	 * @returns {object|null} - 업데이트된 강의 정보 또는 null
	 */
	incrementProgress: function(courseId) {
		let courses = this.getAllCourses();
		const courseToUpdate = courses.find(c => c.id === courseId);
		
		if (courseToUpdate && courseToUpdate.currentLesson < courseToUpdate.totalLessons) {
			// 현재 수강 회차를 1 증가시킴
			courseToUpdate.currentLesson++;
			// 변경된 데이터를 localStorage에 다시 저장
			this.saveAllCourses(courses);
			console.log(`Course ID ${courseId} progress: ${courseToUpdate.currentLesson}/${courseToUpdate.totalLessons}`);
			return courseToUpdate;
		}
		return null; // 이미 완료되었거나 강의를 찾지 못한 경우
	}
};

CourseManager.init();
