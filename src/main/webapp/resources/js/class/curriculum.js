document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('sections-container');
  const sectionAddBtn = document.getElementById('add-section-btn');
  const saveBtn = document.getElementById('save-btn'); // 저장 버튼
  const iconPath = `${ctx}/resources/icons`;

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
     * 이벤트 위임 (수업 추가 & 섹션 삭제)
     ==================== */
    container.addEventListener('click', e => {

      // === 수업 추가 ===
      if (e.target.classList.contains('lesson-add')) {
        e.preventDefault();

        const lessonsContainer = e.target.closest('.section-block').querySelector('.lessons-container');
        const lesson = document.createElement('div');
        lesson.className = 'section-row lesson-row';
        lesson.setAttribute('draggable', 'true');

        lesson.innerHTML = `
          <div class="lesson-input-wrapper">
            <input type="text" class="section-input" placeholder="수업 제목 입력" />
            <div class="drag-handle" title="드래그로 순서 변경">
              <div class="drag-handle-dots">
                <span></span><span></span>
                <span></span><span></span>
                <span></span><span></span>
              </div>
            </div>
            <div class="lecture-actions">
              <img src="${iconPath}/lock.png" alt="잠금" title="잠금" />
              <img src="${iconPath}/icon_edit.png" alt="수정" title="수정" />
              <img src="${iconPath}/view.png" alt="보기" title="보기" />
              <img src="${iconPath}/icon_delete.png" alt="삭제" title="삭제" />
            </div>
          </div>
        `;
        lessonsContainer.appendChild(lesson);
      }

      // === 섹션 삭제 ===
      if (e.target.classList.contains('section-delete-icon')) {
        e.preventDefault();
        if (confirm('정말 이 섹션을 삭제하시겠습니까?\n삭제한 내용은 복구할 수 없습니다.')) {
          const sectionBlock = e.target.closest('.section-block');
          if (sectionBlock) {
            sectionBlock.remove();
          }
        }
      }
    });

    /** ====================
     * 드래그 기능
     ==================== */
    let draggedLesson = null;

    container.addEventListener('dragstart', e => {
      if (e.target.classList.contains('lesson-row')) {
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
     * 저장 버튼 클릭 이벤트
     ==================== */
    if (saveBtn) {
      saveBtn.addEventListener('click', e => {
        e.preventDefault();
        const sections = [];
        document.querySelectorAll('.section-block').forEach(sectionEl => {
          const sectionTitle = sectionEl.querySelector('> .section-row > .section-input').value.trim();
          const lessons = [];
          sectionEl.querySelectorAll('.lessons-container .lesson-row').forEach(lessonEl => {
            const lessonTitle = lessonEl.querySelector('.lesson-input-wrapper > .section-input').value.trim();
            lessons.push({ title: lessonTitle });
          });
          sections.push({ title: sectionTitle, lessons });
        });

        console.log('저장할 데이터:', sections);

        fetch(`${ctx}/saveCurriculum`, {
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
    }

    container.dataset.listener = 'true';
  }
});
