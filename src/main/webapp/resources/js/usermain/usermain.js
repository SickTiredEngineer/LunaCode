// DOM(문서 객체 모델)이 완전히 로드된 후에 스크립트를 실행합니다.
document.addEventListener('DOMContentLoaded', function () {

	// --- 검색 관련 요소 가져오기 ---
	const searchInput = document.querySelector('.search-box input[type="text"]');
	const searchTags = document.querySelectorAll('.tag-list .tag');
	const searchIcon = document.querySelector('.search-icon');
	const searchBox = document.querySelector('.search-box');
	let rsContainer = null; // 최근 검색어 컨테이너 DOM 요소를 저장할 변수

	// --- 로컬 스토리지 관련 함수 ---
	const RECENT_SEARCHES_KEY = 'recentSearches';

	// 로컬 스토리지에서 검색어 목록 가져오기
	function getSearches() {
		const searches = localStorage.getItem(RECENT_SEARCHES_KEY);
		return searches ? JSON.parse(searches) : [];
	}

	// 로컬 스토리지에 검색어 목록 저장하기
	function saveSearches(searches) {
		localStorage.setItem(RECENT_SEARCHES_KEY, JSON.stringify(searches));
	}
	
	// 날짜를 'MM.DD' 형식으로 포맷하는 함수
	function formatDate(date) {
		const month = String(date.getMonth() + 1).padStart(2, '0');
		const day = String(date.getDate()).padStart(2, '0');
		return `${month}.${day}`;
	}

	// 새 검색어 추가하기
	function addSearch(term) {
		if (!term) return;
		let searches = getSearches();
		// 이미 있는 검색어는 제거 (최신으로 올리기 위함)
		searches = searches.filter(search => search.term !== term);
		// 새 검색어를 맨 앞에 추가
		searches.unshift({ term: term, date: formatDate(new Date()) });
		// 최대 10개까지만 저장
		if (searches.length > 10) {
			searches = searches.slice(0, 10);
		}
		saveSearches(searches);
	}

	// --- 검색 기능 이벤트 리스너 ---

	// 검색창에서 'Enter' 키를 눌렀을 때
	searchInput.addEventListener('keypress', function (event) {
		if (event.key === 'Enter') {
			const query = searchInput.value.trim();
			if (query) {
				addSearch(query); // 검색 시 최근 검색어에 추가
				window.location.href = `${contextPath}/ClassDisplayStand?q=${encodeURIComponent(query)}`;
			}
		}
	});

	// 태그를 클릭했을 때
	searchTags.forEach(tag => {
		tag.addEventListener('click', function () {
			const tagName = this.textContent.trim().substring(1);
			addSearch(tagName); // 태그 클릭 시에도 최근 검색어에 추가
			window.location.href = `${contextPath}/ClassDisplayStand?category=${encodeURIComponent(tagName)}`;
		});
	});

	// --- 최근 검색어 드롭다운 기능 ---

	// 드롭다운을 열고 닫는 동작을 관리하는 헬퍼 함수
	function openRecentSearches() {
		if (!rsContainer) {
			rsContainer = createRecentSearchesElement();
			searchBox.appendChild(rsContainer);
		}
		renderSearchList();
		rsContainer.style.display = 'block';
	}
	function closeRecentSearches() {
		if (rsContainer) {
			rsContainer.style.display = 'none';
		}
	}

	// 검색 아이콘(▼) 클릭 시 드롭다운 토글
	searchIcon.addEventListener('click', function (event) {
		event.stopPropagation(); // 이벤트 버블링 방지
		
		const isVisible = rsContainer && rsContainer.style.display === 'block';
		if (isVisible) {
			closeRecentSearches();
		} else {
			openRecentSearches();
		}
	});

	// 검색창에 포커스(클릭)될 때, 입력값이 없으면 드롭다운 열기
	searchInput.addEventListener('focus', function() {
		if (this.value.trim() === '') {
			openRecentSearches();
		}
	});

	// [수정] 검색창 자체를 클릭했을 때 이벤트가 전파되어 창이 바로 닫히는 것을 방지
	searchInput.addEventListener('click', function(event) {
		event.stopPropagation();
	});
	
	// 검색창에 무언가 입력될 때 드롭다운 상태 관리
	searchInput.addEventListener('input', function() {
		if (this.value.trim() === '') {
			// 사용자가 텍스트를 모두 지웠을 경우 다시 보여줌
			openRecentSearches();
		} else {
			// 사용자가 타이핑을 시작하면 숨김
			closeRecentSearches();
		}
	});

	// 최근 검색어 드롭다운 UI를 생성하는 함수
	function createRecentSearchesElement() {
		const container = document.createElement('div');
		container.className = 'rs-container';
		
		// 클릭 시 드롭다운이 닫히지 않도록 이벤트 전파 중단
		container.addEventListener('click', e => e.stopPropagation());

		// 헤더 생성
		const header = document.createElement('div');
		header.className = 'rs-header';
		header.innerHTML = `
			<span class="rs-title">최근 검색어</span>
			<button type="button" class="rs-delete-all">전체삭제</button>
		`;
		
		// 목록(ul) 생성
		const list = document.createElement('ul');
		list.className = 'rs-list';
		
		container.appendChild(header);
		container.appendChild(list);

		// "전체삭제" 버튼 이벤트 리스너
		header.querySelector('.rs-delete-all').addEventListener('click', () => {
			saveSearches([]); // 로컬 스토리지 비우기
			renderSearchList(); // 목록 다시 그리기
		});
		
		// 개별 항목 삭제 및 검색어 클릭 이벤트 리스너 (이벤트 위임)
		list.addEventListener('click', (e) => {
			const item = e.target.closest('.rs-item');
			if (!item) return;

			// 개별 삭제 버튼('x')을 클릭했을 때
			if (e.target.closest('.rs-delete-item')) {
				const termToDelete = item.dataset.term;
				let searches = getSearches().filter(s => s.term !== termToDelete);
				saveSearches(searches);
				item.remove(); // DOM에서 즉시 삭제
				
				// 모든 항목이 삭제되면 "없음" 메시지 표시
				if(getSearches().length === 0) {
					renderSearchList();
				}

			// 검색어 자체를 클릭했을 때
			} else if (e.target.closest('.rs-term')) {
				e.preventDefault();
				const term = item.dataset.term;
				searchInput.value = term;
				addSearch(term); // 검색 기록 순서 최신화
				window.location.href = `${contextPath}/ClassDisplayStand?q=${encodeURIComponent(term)}`;
			}
		});

		return container;
	}

	// 최신 데이터로 검색어 목록을 다시 그리는 함수
	function renderSearchList() {
		if (!rsContainer) return;

		const list = rsContainer.querySelector('.rs-list');
		const searches = getSearches();
		list.innerHTML = ''; // 기존 목록 초기화

		if (searches.length === 0) {
			list.innerHTML = '<li class="rs-no-item">최근 검색어가 없습니다.</li>';
		} else {
			searches.forEach(search => {
				const listItem = document.createElement('li');
				listItem.className = 'rs-item';
				listItem.dataset.term = search.term; // 삭제 시 식별을 위해 데이터 속성 사용
				listItem.innerHTML = `
					<a href="#" class="rs-term">${search.term}</a>
					<span class="rs-date">${search.date}</span>
					<button type="button" class="rs-delete-item" aria-label="삭제">
						<svg viewBox="0 0 24 24"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
					</button>
				`;
				list.appendChild(listItem);
			});
		}
	}

	// 페이지의 다른 곳을 클릭하면 드롭다운을 숨김
	document.addEventListener('click', function () {
		closeRecentSearches();
	});

});