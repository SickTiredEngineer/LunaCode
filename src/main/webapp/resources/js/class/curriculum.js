document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('sections-container');
  let draggedEl = null;

  // 드래그 핸들 이벤트 바인딩
  container.querySelectorAll('.drag-handle').forEach(handle => {
    handle.addEventListener('dragstart', e => {
      draggedEl = handle.closest('.section-block');
 	 // 핸들의 부모가 섹션블록(.section-block)
      draggedEl.style.opacity = '0.5';
      e.dataTransfer.effectAllowed = 'move';

      // Firefox 호환성용 데이터 세팅
      e.dataTransfer.setData('text/plain', '');
    });

    handle.addEventListener('dragend', () => {
      if (draggedEl) {
        draggedEl.style.opacity = '1';
        draggedEl = null;
        updateSectionLabels();
      }
    });
  });

  // 섹션에서 드롭 가능하도록 이벤트 처리
  container.querySelectorAll('.section-block').forEach(section => {
    section.addEventListener('dragover', e => {
      e.preventDefault();
      e.dataTransfer.dropEffect = 'move';
    });

    section.addEventListener('drop', e => {
      e.preventDefault();
      if (draggedEl && draggedEl !== section) {
        container.insertBefore(draggedEl, section);
      }
    });
  });

  // 섹션 레이블 자동 재정렬
  function updateSectionLabels() {
    container.querySelectorAll('.section-block').forEach((sec, idx) => {
      const label = sec.querySelector('.section-label');
      if (label) {
        label.textContent = `섹션 ${idx + 1}`;
      }
    });
  }

  // 섹션 추가 버튼 클릭 이벤트
  const addBtn = document.getElementById('add-section-btn');
  if (addBtn) {
    addBtn.addEventListener('click', e => {
      e.preventDefault();

      const newIndex = container.children.length;
      const newSection = document.createElement('div');
      newSection.className = 'section-block';
      newSection.setAttribute('draggable', 'false');

      newSection.innerHTML = `
        <div class="section-header">
          <div class="drag-handle" draggable="true" title="섹션 드래그">
            <div class="drag-handle-dots">
              <span></span>
              <span></span>
              <span></span>
            </div>
          </div>
          <span class="section-label">섹션 ${newIndex + 1}</span>
        </div>
        <div class="section-row">
          <input type="text" class="section-input" placeholder="섹션 제목 입력" />
        </div>
        <div class="d-flex flex-row button-container">
          <a href="#" class="positive-button">수업추가</a>
          <a href="#" class="positive-button">퀴즈추가</a>
        </div>
      `;

      container.appendChild(newSection);
      bindDragEvents(newSection);
    });
  }

  // 새 섹션 드래그 이벤트 바인딩 함수
  function bindDragEvents(section) {
    const handle = section.querySelector('.drag-handle');
    handle.addEventListener('dragstart', e => {
      draggedEl = section;
      draggedEl.style.opacity = '0.5';
      e.dataTransfer.effectAllowed = 'move';
      e.dataTransfer.setData('text/plain', '');
    });
    handle.addEventListener('dragend', () => {
      if (draggedEl) {
        draggedEl.style.opacity = '1';
        draggedEl = null;
        updateSectionLabels();
      }
    });

    section.addEventListener('dragover', e => {
      e.preventDefault();
      e.dataTransfer.dropEffect = 'move';
    });
    section.addEventListener('drop', e => {
      e.preventDefault();
      if (draggedEl && draggedEl !== section) {
        container.insertBefore(draggedEl, section);
      }
    });
  }
});
