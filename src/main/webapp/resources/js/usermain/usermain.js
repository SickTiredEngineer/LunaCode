// DOM(문서 객체 모델)이 완전히 로드된 후에 스크립트를 실행합니다.
document.addEventListener('DOMContentLoaded', function () {

    // 1. 검색 기능 활성화
    const searchInput = document.querySelector('.search-box input[type="text"]');
    const searchTags = document.querySelectorAll('.tag-list .tag');

    // 검색창에서 'Enter' 키를 눌렀을 때
    if (searchInput) {
        searchInput.addEventListener('keypress', function (event) {
            if (event.key === 'Enter') {
                const query = searchInput.value;
                
                if (query.trim() !== '') {
	
                    // JSP에서 전달받은 contextPath 변수를 사용합니다.
                    window.location.href = contextPath + '/search?query=' + encodeURIComponent(query);
                }
            }
        });
    }

    // 각 태그를 클릭했을 때
    if (searchTags) {
        searchTags.forEach(tag => {
            tag.addEventListener('click', function () {
	
                // 태그 텍스트에서 '#'를 제거합니다.
                const tagName = this.textContent.trim().substring(1);
                
                // JSP에서 전달받은 contextPath 변수를 사용합니다.
                window.location.href = contextPath + '/search?tag=' + encodeURIComponent(tagName);
            });
        });
    }

});