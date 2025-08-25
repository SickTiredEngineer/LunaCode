document.addEventListener('DOMContentLoaded', function() {
	
	const playlistGrid = document.querySelector('.playlist-grid');
	const editButton = document.querySelector('.positive-button');
	const addNewButton = document.querySelector('.playlist-item.add-new a');
	let isEditMode = false;

	if (!addNewButton || !playlistGrid || !editButton) return;

	// 1. JSP가 DB에서 가져와 만들어준 'initialPlaylistData'를 바로 사용합니다.
	let playlistData = initialPlayListData.map(p => ({
		playlist_idx: p.playlist_idx,
		playlist_name: p.playlist_name
	}));

	// 2. 재생목록 아이템 HTML 요소를 생성하는 함수
	function createPlaylistElement(playlist) {
		const newListItem = document.createElement('li');
		newListItem.className = 'playlist-item';
		newListItem.setAttribute('data-id', playlist.playlist_idx);

		const newLink = document.createElement('a');
		newLink.href = `${contextPath}/PlayListPlus?id=${playlist.playlist_idx}&name=${encodeURIComponent(playlist.playlist_name)}`;
		
		const newFolderIcon = document.createElement('div');
		newFolderIcon.className = 'folder-icon';
		
		const newPlaylistSpan = document.createElement('span');
		newPlaylistSpan.className = 'playlist-name';
		newPlaylistSpan.textContent = playlist.playlist_name;
		
		newLink.appendChild(newFolderIcon);
		newLink.appendChild(newPlaylistSpan);
		newListItem.appendChild(newLink);
		
		const deleteBtn = createDeleteButton();
		newListItem.appendChild(deleteBtn);
		
		return newListItem;
	}

	// 3. 페이지 로드 시, 초기 데이터로 화면을 그리는 함수
	function renderInitialPlaylists() {
		playlistGrid.querySelectorAll('.playlist-item:not(.add-new)').forEach(item => item.remove());

		playlistData.forEach(playlist => {
			const playlistElement = createPlaylistElement(playlist);
			playlistGrid.appendChild(playlistElement);
		});
	}

	// '+' 버튼 클릭 시 새 재생목록 추가 (DB 연동)
	addNewButton.addEventListener('click', function(event) {
		event.preventDefault();
		const newPlaylistName = prompt('새 재생목록의 이름을 입력하세요:', '새로운 재생목록');
		
		if (newPlaylistName && newPlaylistName.trim() !== '') {
			$.ajax({
				type: 'POST',
				url: `${contextPath}/PlayListAdd`,
				data: {
					playlist_name: newPlaylistName.trim()
				},
				dataType: 'json',
				success: function(response) {
					if (response.success) {
						// 서버가 반환한 실제 데이터(ID 포함)로 화면 요소 생성
						const newElement = createPlaylistElement(response.newPlaylist);
						playlistGrid.appendChild(newElement);
						playlistData.push(response.newPlaylist);
					} else {
						alert('재생목록 추가에 실패했습니다.');
					}
				},
				error: function() {
					alert('재생목록 추가 중 오류가 발생했습니다.');
				}
			});
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
		// 삭제 처리 (DB 연동)
		if (event.target.matches('.btn-delete')) {
			const playlistItem = event.target.closest('.playlist-item');
			if (playlistItem) {
				const playlistName = playlistItem.querySelector('.playlist-name').textContent;
				if (confirm(`'${playlistName}' 재생목록을 삭제하시겠습니까?`)) {
					const playlistId = parseInt(playlistItem.getAttribute('data-id'));
					
					$.ajax({
						type: 'POST',
						url: `${contextPath}/PlayListDelete`,
						data: { playlist_idx: playlistId },
						dataType: 'json',
						success: function(response) {
							if (response.success) {
								playlistData = playlistData.filter(p => p.playlist_idx !== playlistId);
								playlistItem.remove(); // 화면에서 삭제
							} else {
								alert('재생목록 삭제에 실패했습니다.');
							}
						},
						error: function() {
							alert('삭제 중 오류가 발생했습니다.');
						}
					});
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

			if (newName && newName !== currentName) {
				// 이름 변경 (DB 연동)
				$.ajax({
					type: 'POST',
					url: `${contextPath}/PlayListUpdate`,
					data: {
						playlist_idx: playlistId,
						new_name: newName
					},
					dataType: 'json',
					success: function(response) {
						if (response.success) {
							// 성공 시 화면과 데이터 업데이트
							span.textContent = newName;
							const link = span.closest('a');
							if(link) {
								link.href = `${contextPath}/PlayListPlus?id=${playlistId}&name=${encodeURIComponent(newName)}`;
							}
							const dataToUpdate = playlistData.find(p => p.playlist_idx === playlistId);
							if (dataToUpdate) dataToUpdate.playlist_name = newName;
						} else {
							alert('이름 변경에 실패했습니다.');
						}
					},
					error: function() {
						alert('이름 변경 중 오류가 발생했습니다.');
					}
				});
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

	// 페이지가 처음 로드될 때 DB에서 가져온 초기 데이터를 화면에 그려줍니다.
	renderInitialPlaylists();
});