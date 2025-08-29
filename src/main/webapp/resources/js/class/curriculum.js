document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('sections-container');
  const sectionAddBtn = document.getElementById('add-section-btn');
  const saveBtn = document.getElementById('saveBtn');
  const iconPath = `${ctx}/resources/icons`;
  const classId = parseInt(window.classId || "0", 10);

  if (!container.dataset.listener) {

    /** ====================
     * 섹션 추가
     ==================== */
    sectionAddBtn.addEventListener('click', e => {
      e.preventDefault();
      const count = container.querySelectorAll('.section-block').length + 1;
      const section = document.createElement('div');
      section.className = 'section-block';
      section.innerHTML = `
        <div class="section-header d-flex align-items-center justify-content-between">
          <span class="section-label">섹션 ${count}</span>
          <img src="${iconPath}/icon_delete.png" 
               alt="섹션 삭제" 
               title="섹션 삭제" 
               class="section-delete-icon" 
               style="cursor:pointer; width:24px; height:24px; margin-left:8px;" />
        </div>
        <div class="section-row">
          <input type="text" class="section-input" placeholder="섹션 제목 입력" />
        </div>
        <div class="lessons-container"></div>
        <div class="d-flex flex-row button-container">
          <a href="#" class="positive-button lesson-add">수업추가</a>
        </div>
      `;
      container.appendChild(section);
    });

    /** ====================
     * 수업 추가 / 섹션 삭제 / 레슨 수정/삭제 / 아이콘 토글
     ==================== */
    container.addEventListener('click', e => {
      // 수업 추가
      if (e.target.classList.contains('lesson-add')) {
        e.preventDefault();
        const lessonsContainer = e.target.closest('.section-block').querySelector('.lessons-container');
        const lesson = document.createElement('div');
        lesson.className = 'section-row lesson-row';
        lesson.setAttribute('draggable', 'true');
        lesson.innerHTML = `
          <div class="lesson-input-wrapper" data-lesson-id="">
            <input type="text" class="section-input" placeholder="수업 제목 입력" />
            <div class="drag-handle" title="드래그로 순서 변경">
              <div class="drag-handle-dots">
                <span></span><span></span>
                <span></span><span></span>
                <span></span><span></span>
              </div>
            </div>
            <div class="lecture-actions">
              <img src="${iconPath}/icon_unlock.png" alt="잠금 해제" title="잠금 해제" data-locked="false"/>
              <img src="${iconPath}/icon_edit.png" alt="수정" title="수정" class="lesson-edit"/>
              <img src="${iconPath}/icon_view.png" alt="보기" title="보기" data-viewed="true"/>
              <img src="${iconPath}/icon_delete.png" alt="삭제" title="삭제" class="lesson-delete"/>
            </div>
          </div>
        `;
        lessonsContainer.appendChild(lesson);
      }

      // 섹션 삭제 (서버 호출 추가)
      if (e.target.classList.contains('section-delete-icon')) {
        e.preventDefault();
        if (confirm('섹션을 삭제하시겠습니까?\n삭제된 내용은 복구할 수 없습니다.')) {
          const sectionBlock = e.target.closest('.section-block');
          const sessionId = sectionBlock.dataset.sessionId;

          if (sessionId) {
            fetch(`${ctx}/Curriculum/deleteSession?sessionId=${encodeURIComponent(sessionId)}`, {
              method: 'POST'
            }).then(res => {
              if (res.ok) {
                sectionBlock.remove();
              } else {
                alert('섹션 삭제 실패');
              }
            }).catch(() => alert('네트워크 오류로 섹션 삭제 실패'));
          } else {
            sectionBlock.remove();
          }
        }
      }

      // 레슨 수정
      if (e.target.classList.contains('lesson-edit')) {
        e.preventDefault();
        const lessonRow = e.target.closest('.lesson-row');
        const lessonId = lessonRow.dataset.lessonId || 0;
        window.location.href = `${ctx}/lesson/edit/${lessonId}`;
      }

      // 레슨 삭제 (서버 호출 추가)
      if (e.target.classList.contains('lesson-delete')) {
        e.preventDefault();
        if (confirm('수업을 삭제하시겠습니까?')) {
          const lessonRow = e.target.closest('.lesson-row');
          const episodeId = lessonRow.dataset.lessonId;

          if (episodeId) {
            fetch(`${ctx}/Curriculum/deleteEpisode?episodeId=${encodeURIComponent(episodeId)}`, {
              method: 'POST'
            }).then(res => {
              if (res.ok) {
                lessonRow.remove();
              } else {
                alert('수업 삭제 실패');
              }
            }).catch(() => alert('네트워크 오류로 수업 삭제 실패'));
          } else {
            lessonRow.remove();
          }
        }
      }

      // 락 토글
      if (e.target.tagName === 'IMG' && (e.target.alt === '잠금' || e.target.alt === '잠금 해제')) {
        const locked = e.target.dataset.locked === 'true';
        const lessonRow = e.target.closest('.lesson-row');
        if (locked) {
          e.target.src = `${iconPath}/icon_unlock.png`;
          e.target.alt = '잠금 해제';
          e.target.title = '잠금 해제';
          e.target.dataset.locked = 'false';
          lessonRow.draggable = true;
          lessonRow.querySelector('.section-input').disabled = false;
          lessonRow.querySelector('.drag-handle').style.pointerEvents = 'auto';
        } else {
          e.target.src = `${iconPath}/icon_lock.png`;
          e.target.alt = '잠금';
          e.target.title = '잠금';
          e.target.dataset.locked = 'true';
          lessonRow.draggable = false;
          lessonRow.querySelector('.section-input').disabled = true;
          lessonRow.querySelector('.drag-handle').style.pointerEvents = 'none';
        }
      }

      // 보기 토글
      if (e.target.tagName === 'IMG' && (e.target.alt === '보기' || e.target.alt === '숨김')) {
        const viewed = e.target.dataset.viewed === 'true';
        if (viewed) {
          e.target.src = `${iconPath}/icon_hide.png`;
          e.target.alt = '숨김';
          e.target.title = '숨김';
          e.target.dataset.viewed = 'false';
        } else {
          e.target.src = `${iconPath}/icon_view.png`;
          e.target.alt = '보기';
          e.target.title = '보기';
          e.target.dataset.viewed = 'true';
        }
      }
    });

    /** ====================
     * 드래그 기능
     ==================== */
    let draggedLesson = null;

    container.addEventListener('dragstart', e => {
      if (e.target.classList.contains('lesson-row') && e.target.draggable) {
        draggedLesson = e.target;
        e.target.classList.add('dragging');
      }
    });

    container.addEventListener('dragend', e => {
      if (e.target.classList.contains('lesson-row')) {
        e.target.classList.remove('dragging');
        draggedLesson = null;
      }
    });

    container.addEventListener('dragover', e => {
      if (draggedLesson) {
        e.preventDefault();
        const lessonsContainer = draggedLesson.parentElement;
        if (lessonsContainer.classList.contains('lessons-container')) {
          const afterElement = getDragAfterElement(lessonsContainer, e.clientY);
          if (!afterElement) {
            lessonsContainer.appendChild(draggedLesson);
          } else {
            lessonsContainer.insertBefore(draggedLesson, afterElement);
          }
        }
      }
    });

    function getDragAfterElement(container, y) {
      const elements = [...container.querySelectorAll('.lesson-row:not(.dragging)')];
      return elements.reduce((closest, child) => {
        const box = child.getBoundingClientRect();
        const offset = y - box.top - box.height / 2;
        if (offset > 0 && offset < closest.offset) {
          return { offset, element: child };
        } else {
          return closest;
        }
      }, { offset: Number.POSITIVE_INFINITY }).element;
    }

    /** ====================
     * 저장 버튼 클릭
     ==================== */
    saveBtn.addEventListener('click', e => {
	  e.preventDefault();
	  if (!confirm('저장하시겠습니까?')) return;
	
	  const sections = [];
	  document.querySelectorAll('.section-block').forEach((sectionEl, sectionIdx) => {
	    const sectionTitle = sectionEl.querySelector('.section-row > .section-input').value.trim();
	    if (!sectionTitle) return; // 제목 없는 섹션은 저장 안 함
	
	    const lessons = [];
	    sectionEl.querySelectorAll('.lessons-container .lesson-row').forEach(lessonEl => {
	      const lessonTitle = lessonEl.querySelector('.lesson-input-wrapper > .section-input').value.trim();
	      if (!lessonTitle) return; // 제목 없는 레슨 제외
	
	      lessons.push({
	        episode_idx: lessonEl.dataset.lessonId || null, 
	        episode_name: lessonTitle,
	        locked: lessonEl.querySelector('img[alt="잠금"], img[alt="잠금 해제"]')?.dataset.locked === 'true',
	        viewed: lessonEl.querySelector('img[alt="보기"], img[alt="숨김"]')?.dataset.viewed === 'true',
	        deleted: lessonEl.dataset.deleted === 'true' || false
	      });
	    });
	
	    sections.push({
	      session_idx: sectionEl.dataset.sessionId || null, // 기존 ID 있으면 update
	      class_idx: classId,
	      session_name: sectionTitle,
	      session_index: sectionIdx,
	      deleted: sectionEl.dataset.deleted === 'true' || false,
	      episodes: lessons
	    });
	  });
	
	  console.log('저장할 데이터:', sections);
	
	  fetch(`${ctx}/Curriculum/${classId}`, { 
	    method: 'POST',
	    headers: { 'Content-Type': 'application/json' },
	    body: JSON.stringify(sections)
	  })
	  .then(res => res.json())
	  .then(result => {
	    alert('저장 완료!');
	    console.log(result);
	  })
	  .catch(err => {
	    console.error('저장 실패:', err);
	    alert('저장 실패!');
	  });
	});


    container.dataset.listener = 'true';
  }
});
