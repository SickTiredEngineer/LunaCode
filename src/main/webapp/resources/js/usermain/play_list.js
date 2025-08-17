document.addEventListener('DOMContentLoaded', function() {
	
	const playlistGrid = document.querySelector('.playlist-grid');
	const editButton = document.querySelector('.positive-button');
	const addNewButton = document.querySelector('.playlist-item.add-new a');
	let isEditMode = false;

	if (!addNewButton || !playlistGrid || !editButton) return;

	// 1. 나중에 DB에서 가져올 데이터를 시뮬레이션하는 "가짜 데이터" 배열
	// "재생목록 1"을 기본 데이터로 설정합니다.
	let playlistData = [
		{ id: 1, name: '재생목록 1' } 
		// 필요하다면 다른 기본 재생목록을 추가할 수 있습니다.
		// { id: 2, name: '나중에 볼 영상' }
	];
	let nextId = playlistData.length + 1; // 새 항목을 위한 ID 카운터

	// 2. 재생목록 아이템 HTML 요소를 생성하는 함수 (재사용을 위해 분리)
	function createPlaylistElement(playlist) {
		const newListItem = document.createElement('li');
		newListItem.className = 'playlist-item';
		newListItem.setAttribute('data-id', playlist.id); // 고유 ID를 데이터 속성으로 저장

		const newLink = document.createElement('a');
		// 링크를 생성할 때 고유 ID를 사용하도록 변경
		newLink.href = `${contextPath}/PlayListPlus?id=${playlist.id}&name=${encodeURIComponent(playlist.name)}`;
		
		const newFolderIcon = document.createElement('div');
		newFolderIcon.className = 'folder-icon';
		
		const newPlaylistSpan = document.createElement('span');
		newPlaylistSpan.className = 'playlist-name';
		newPlaylistSpan.textContent = playlist.name;
		
		newLink.appendChild(newFolderIcon);
		newLink.appendChild(newPlaylistSpan);
		newListItem.appendChild(newLink);
		
		const deleteBtn = createDeleteButton();
		newListItem.appendChild(deleteBtn);
		
		return newListItem;
	}

	// 3. 페이지 로드 시, 초기 데이터로 화면을 그리는 함수
	function renderInitialPlaylists() {
		playlistData.forEach(playlist => {
			const playlistElement = createPlaylistElement(playlist);
			playlistGrid.appendChild(playlistElement);
		});
	}

	// '+' 버튼 클릭 시 새 재생목록 추가 로직 (수정)
	addNewButton.addEventListener('click', function(event) {
		event.preventDefault();
		const newPlaylistName = prompt('새 재생목록의 이름을 입력하세요:', '새로운 재생목록');
		if (newPlaylistName && newPlaylistName.trim() !== '') {
			// 새 데이터 객체 생성
			const newPlaylistData = {
				id: nextId++,
				name: newPlaylistName.trim()
			};
			// 화면에 요소 추가
			const newElement = createPlaylistElement(newPlaylistData);
			playlistGrid.appendChild(newElement);

			// 데이터 배열에도 추가 (시뮬레이션)
			playlistData.push(newPlaylistData);
		}
	});

	// 삭제 버튼 생성 함수
	function createDeleteButton() {
		const container = document.createElement('div');
		container.className = 'folder-actions';
		const btnDelete = document.createElement('button');
		btnDelete.className = 'btn-delete';
		btnDelete.textContent = '-';
		container.appendChild(btnDelete);
		return container;
	}

	// 편집 버튼 토글
	editButton.addEventListener('click', function() {
		isEditMode = !isEditMode;
		playlistGrid.classList.toggle('edit-mode', isEditMode);
		this.textContent = isEditMode ? '완료' : '편집';
		if (!isEditMode) {
			const activeInput = playlistGrid.querySelector('.playlist-name-input');
			if (activeInput) activeInput.blur();
		}
	});

	// 이벤트 위임 (삭제 및 이름 변경)
	playlistGrid.addEventListener('click', function(event) {
		// 삭제 처리
		if (event.target.matches('.btn-delete')) {
			const playlistItem = event.target.closest('.playlist-item');
			if (playlistItem) {
				const playlistName = playlistItem.querySelector('.playlist-name').textContent;
				if (confirm(`'${playlistName}' 재생목록을 삭제하시겠습니까?`)) {
					// 데이터 배열에서도 삭제 (시뮬레이션)
					const playlistId = parseInt(playlistItem.getAttribute('data-id'));
					playlistData = playlistData.filter(p => p.id !== playlistId);
					
					playlistItem.remove(); // 화면에서 삭제
				}
			}
			return;
		}
		
		// 이름 변경 처리
		if (isEditMode) {
			const playlistItem = event.target.closest('.playlist-item');
			if (playlistItem && !playlistItem.classList.contains('add-new')) {
				const nameSpan = playlistItem.querySelector('.playlist-name');
				if (nameSpan) {
					event.preventDefault();
					handleRename({ target: nameSpan });
				}
			}
		}
	});

	// 이름 변경 함수
	function handleRename(event) {
		const span = event.target;
		if (span.style.display === 'none') return;
		
		const currentName = span.textContent;
		const input = document.createElement('input');
		input.type = 'text';
		input.className = 'playlist-name-input';
		input.value = currentName;
		
		span.style.display = 'none';
		span.parentNode.insertBefore(input, span.nextSibling);
		input.focus();
		input.select();
		
		function saveChanges() {
			const newName = input.value.trim();
			const playlistItem = span.closest('.playlist-item');
			const playlistId = parseInt(playlistItem.getAttribute('data-id'));

			if (newName) {
				span.textContent = newName;
				const link = span.closest('a');
				if (link) {
					link.href = `${contextPath}/PlayListPlus?id=${playlistId}`;
				}
				// 데이터 배열 업데이트 (시뮬레이션)
				const dataToUpdate = playlistData.find(p => p.id === playlistId);
				if (dataToUpdate) dataToUpdate.name = newName;
			}
			input.remove();
			span.style.display = '';
		}
		
		input.addEventListener('blur', saveChanges);
		input.addEventListener('keydown', function(e) {
			if (e.key === 'Enter') saveChanges();
			else if (e.key === 'Escape') {
				input.remove();
				span.style.display = '';
			}
		});
	}

	// 페이지가 처음 로드될 때 초기 데이터를 화면에 그려줍니다.
	renderInitialPlaylists();
});
