/*
 * =====================================================================================
 * 파일: play_list_plus.js (재생목록 상세 페이지)
 * 설명: '영상 추가' 모드 활성화, '편집/완료' 모드 전환, 개별 영상 삭제 기능을 담당합니다.
 * =====================================================================================
 */
document.addEventListener('DOMContentLoaded', function() {
    
    // --- 요소 선택 ---
    const editButton = document.getElementById('edit-playlist-btn');
    const addVideoButton = document.getElementById('add-video-btn');
    const playlistGrid = document.querySelector('.playlist-grid');
    let isEditMode = false;

    if (!editButton || !addVideoButton || !playlistGrid) {
        console.error("필수 요소를 찾을 수 없습니다.");
        return;
    }

    // --- 이벤트 리스너 등록 ---

    // '영상 추가' 버튼 클릭 이벤트
    addVideoButton.addEventListener('click', function(event) {
        event.preventDefault();

        // [핵심] JSP에서 만들어준 전역 변수를 사용하여 세션 스토리지에 정보 저장
        sessionStorage.setItem('playlistAddMode', JSON.stringify({
            isAdding: true,
            targetPlaylistId: currentPlaylistId,
            targetPlaylistName: currentPlaylistName 
        }));

        alert("추가할 영상을 선택하기 위해 '내 강의' 페이지로 이동합니다.");
        
        // [핵심] JSP에서 만들어준 CONTEXT_PATH 변수를 사용하여 올바른 URL로 이동
        window.location.href = `${CONTEXT_PATH}/MyClass`;
    });

    // '편집' 버튼 클릭 이벤트
    editButton.addEventListener('click', function() {
        isEditMode = !isEditMode;
        playlistGrid.classList.toggle('edit-mode', isEditMode);
        this.textContent = isEditMode ? '완료' : '편집';
    });
    
    // 삭제 버튼 클릭 이벤트 (이벤트 위임)
    playlistGrid.addEventListener('click', function(event) {
        // 편집 모드가 아니거나, 클릭한 대상이 삭제 버튼이 아니면 아무것도 안 함
        if (!isEditMode || !event.target.classList.contains('btn-delete')) {
            return;
        }
        
        const playlistItem = event.target.closest('.playlist-item');
        const itemTitle = playlistItem.dataset.title;

        if (confirm(`'${itemTitle}' 영상을 재생목록에서 삭제하시겠습니까?`)) {
            const itemIdx = playlistItem.dataset.itemIdx;
            
            // JQuery AJAX를 사용하여 서버에 삭제 요청
            $.ajax({
                type: 'POST',
                url: `${CONTEXT_PATH}/ApiPlaylistRemoveItem`,
                data: { item_idx: itemIdx },
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                        playlistItem.remove(); // 성공 시 화면에서 아이템 삭제
                    }
                    alert(response.message);
                },
                error: function() {
                    alert('삭제 중 오류가 발생했습니다.');
                }
            });
        }
    });
});