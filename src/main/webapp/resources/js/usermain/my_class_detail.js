document.addEventListener('DOMContentLoaded', function() {

	// --- 요소 선택 ---
	const sectionListElement = document.querySelector('.section-list');
	const mainTitleElement = document.querySelector('.main-title');
    const dataContainer = document.querySelector('#course-data-container');
    const courseData = JSON.parse(dataContainer.dataset.json.replace(/&quot;/g, '"'));

    // "영상 추가 모드"인지 세션 스토리지에서 확인
    const addModeInfo = JSON.parse(sessionStorage.getItem('playlistAddMode'));
    const isAddingMode = addModeInfo && addModeInfo.isAdding;
    const targetPlaylistId = isAddingMode ? addModeInfo.targetPlaylistId : null;
    const targetPlaylistName = isAddingMode ? addModeInfo.targetPlaylistName : null;
    
    // 영상 추가 모드일 때만 사용자에게 안내문 표시
    if (isAddingMode) {
        const notice = document.createElement('div');
        notice.className = 'add-mode-notice';
        notice.textContent = `재생목록 '${targetPlaylistName}'에 추가할 영상을 선택하세요.`;
        mainTitleElement.after(notice);
    }

	/**
	 * 개별 강의 아이템(<li>) HTML 요소를 생성하는 함수
	 */
	function createLectureElement(episode) {
		const li = document.createElement('li');
		li.className = 'lecture-item';

        const addButtonHtml = isAddingMode 
            ? `<button type="button" class="add-to-playlist-btn positive-button" data-episode-idx="${episode.episode_idx}">+</button>`
            : '';

		li.innerHTML = `
			<a href="${CONTEXT_PATH}/OnlineClass?episodeId=${episode.episode_idx}">
				<span class="lecture-info">
					<span class="play-icon">▶</span>
					<span class="lecture-title">${episode.episode_name}</span>
				</span>
				<span class="lecture-duration">
					${episode.watched ? '✔️' : '❔'} 
				</span>
			</a>
            ${addButtonHtml}
		`;
		
		return li;
	}

	/**
	 * 강의 섹션(<li>) HTML 요소를 생성하는 함수
	 */
	function createSectionElement(section, isOpen = false) {
		const li = document.createElement('li');
		li.className = `section-item ${isOpen ? 'open' : ''}`;
		const header = document.createElement('div');
		header.className = 'section-header';
		header.innerHTML = `
			<span class="section-title">
				<span class="arrow-icon">▼</span>
				${section.session_name} 
			</span>
		`;
		const lectureList = document.createElement('ul');
		lectureList.className = 'lecture-list';
		section.episodes.forEach(episode => {
			const lectureElement = createLectureElement(episode);
			lectureList.appendChild(lectureElement);
		});
		li.appendChild(header);
		li.appendChild(lectureList);
		return li;
	}

	/**
	 * 페이지 전체를 렌더링하는 메인 함수
	 */
	function renderPage() {
		if (!courseData || !courseData.class_title) {
			mainTitleElement.textContent = '강의 정보를 찾을 수 없습니다.';
			return;
		}
		mainTitleElement.textContent = courseData.class_title;
		sectionListElement.innerHTML = '';
		courseData.sections.forEach((section, index) => {
			const sectionElement = createSectionElement(section, index === 0);
			sectionListElement.appendChild(sectionElement);
		});
	}

	/**
	 * 서버에 영상을 재생목록에 추가하도록 요청하는 함수
	 */
	async function addEpisodeToPlaylist(playlistIdx, episodeIdx) {
		const formData = new FormData();
		formData.append("playlist_idx", playlistIdx);
		formData.append("episode_idx", episodeIdx);
	
		try {
			const response = await fetch(`${CONTEXT_PATH}/ApiPlaylistAddItem`, {
				method: 'POST',
				body: formData
			});
			const result = await response.json();
			alert(result.message);

            if(result.success) {
                sessionStorage.removeItem('playlistAddMode');
                alert("영상 추가가 완료되었습니다. 재생목-록 페이지로 돌아갑니다.");
                window.location.href = `${CONTEXT_PATH}/PlayListPlus?id=${playlistIdx}`;
            }
		} catch (error) {
			console.error('재생목록 추가 요청 오류:', error);
			alert('요청 중 오류가 발생했습니다.');
		}
	}

	// --- 이벤트 리스너 ---
	sectionListElement.addEventListener('click', function(event) {
		const header = event.target.closest('.section-header');
		if (header) {
			header.closest('.section-item').classList.toggle('open');
			return;
		}

		if (event.target.classList.contains('add-to-playlist-btn')) {
			const episodeIdx = event.target.dataset.episodeIdx;
            
			if (!episodeIdx) {
				alert('이 영상은 재생목록에 추가할 수 없습니다.');
				return;
			}
			
			addEpisodeToPlaylist(targetPlaylistId, episodeIdx);
		}
	});

	// --- 페이지 초기화 실행 ---
	renderPage();
});