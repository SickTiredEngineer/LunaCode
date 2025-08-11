document.addEventListener('DOMContentLoaded', () => {
	const accordionSections = document.querySelectorAll('.accordion-section');

	accordionSections.forEach(section => {
		const header = section.querySelector('.section-header');

		header.addEventListener('click', () => {
			// 현재 섹션이 이미 열려있는지 확인
			const wasActive = section.classList.contains('active');
			
			// 모든 섹션을 일단 닫는다
			accordionSections.forEach(s => {
				s.classList.remove('active');
			});

			// 만약 클릭된 섹션이 원래 닫혀 있었다면, 이제 열어준다
			if (!wasActive) {
				section.classList.add('active');
			}
		});
	});

	// 페이지 로드 시 첫 번째 섹션을 기본으로 열어두기 (사용자 경험 향상)
	if (accordionSections.length > 0) {
		accordionSections[0].classList.add('active');
	}
});
