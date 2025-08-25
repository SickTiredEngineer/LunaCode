document.addEventListener('DOMContentLoaded', () => {
  const categories = [
    { name: "IT 자격증", sub: ["정보처리 기사", "정보보안 기사", "리눅스마스터"] },
    { name: "컴퓨터 활용", sub: ["컴퓨터 활용 능력 1급", "컴퓨터 활용 능력 2급", "컴퓨터 활용 능력 1급 실기", "컴퓨터 활용 능력 2급 실기", "컴퓨터 활용 능력 1급 올인원", "컴퓨터 활용 능력 2급 올인원"] },
    { name: "기초 코딩", sub: ["파이썬 기초", "코딩 스타트", "C언어 입문"] }
  ];

  const categoryList = document.getElementById('category-list');
  const subcategoryList = document.getElementById('subcategory-list');
  const chosenTagsWrap = document.getElementById('chosen-tags-wrap');

  let selectedMainIndex = 0; // 기본 첫 번째 카테고리 선택
  const selectedTags = new Set();

  // 메인 카테고리 렌더링
  function renderMainCategories() {
    categoryList.innerHTML = categories.map((cat, idx) => `
      <button type="button" class="reg-cat-btn" data-index="${idx}" aria-selected="${idx === selectedMainIndex}">
        ${cat.name}
      </button>
    `).join('');
  }

  // 서브 카테고리 렌더링
  function renderSubCategories() {
    const subs = categories[selectedMainIndex].sub;
    subcategoryList.innerHTML = subs.map((sub, idx) => `
      <button type="button" class="reg-cat-btn" data-sub-index="${idx}" aria-selected="false" data-name="${sub}">
        ${sub}
      </button>
    `).join('');
  }

  // 선택된 태그 렌더링
  function renderChosenTags() {
    chosenTagsWrap.innerHTML = '';
    selectedTags.forEach(name => {
      const tag = document.createElement('span');
      tag.className = 'reg-chosen-tag';
      tag.textContent = name;

      const btn = document.createElement('button');
      btn.type = 'button';
      btn.className = 'reg-chosen-x';
      btn.setAttribute('aria-label', `${name} 삭제`);
      btn.innerHTML = '&times;';

      btn.addEventListener('click', () => {
        selectedTags.delete(name);
        renderChosenTags();
        updateClassCategoryInput();
      });

      tag.appendChild(btn);
      chosenTagsWrap.appendChild(tag);
    });
  }

  subcategoryList.addEventListener('click', (e) => {
    const btn = e.target.closest('.reg-cat-btn');
    if (!btn) return;
    const name = btn.dataset.name;
    if (!selectedTags.has(name)) {
      selectedTags.add(name);
      renderChosenTags();
      updateClassCategoryInput();
    }
  });

  function updateClassCategoryInput() {
    const input = document.getElementById('classCategoryInput');
    if (input) {
      input.value = Array.from(selectedTags).join(',');
    }
  }

  // 초기 렌더링
  renderMainCategories();
  renderSubCategories();
  renderChosenTags();
  updateClassCategoryInput();

  // 메인 카테고리 클릭 이벤트 
  categoryList.addEventListener('click', (e) => {
    const btn = e.target.closest('.reg-cat-btn');
    if (!btn) return;
    const idx = Number(btn.dataset.index);
    if (idx === selectedMainIndex) return;
    selectedMainIndex = idx;
    renderMainCategories();
    renderSubCategories();
  });

  // 강의 유형 밎 난이도
  const difficultyGroup = document.getElementById('difficulty-group');
  const typeGroup = document.getElementById('type-group');
  const classTypeInput = document.getElementById('classTypeInput'); 
  const classLevelInput = document.getElementById('classLevelInput'); 

  function handleSingleSelect(group, clickedBtn) {
    if (!clickedBtn.classList.contains('reg-toggle-btn')) return;
    group.querySelectorAll('.reg-toggle-btn.selected').forEach(btn => btn.classList.remove('selected'));
    clickedBtn.classList.add('selected');
    group.querySelectorAll('.reg-toggle-btn').forEach(btn => btn.setAttribute('aria-pressed', 'false'));
    clickedBtn.setAttribute('aria-pressed', 'true');

    if (group.id === 'type-group' && classTypeInput) {
      classTypeInput.value = clickedBtn.dataset.value;
    }

    if (group.id === 'difficulty-group' && classLevelInput) {
      classLevelInput.value = clickedBtn.dataset.value;
    }
  }

  function handleMultiSelect(clickedBtn) {
    if (!clickedBtn.classList.contains('reg-toggle-btn')) return;
    const selected = clickedBtn.classList.toggle('selected');
    clickedBtn.setAttribute('aria-pressed', selected ? 'true' : 'false');
  }

  if (difficultyGroup) {
    difficultyGroup.addEventListener('click', e => {
      const btn = e.target.closest('.reg-toggle-btn');
      if (!btn || !difficultyGroup.contains(btn)) return;
      handleSingleSelect(difficultyGroup, btn);
    });
  }

  if (typeGroup) {
    typeGroup.addEventListener('click', e => {
      const btn = e.target.closest('.reg-toggle-btn');
      if (!btn || !typeGroup.contains(btn)) return;
      handleMultiSelect(btn);
    });
  }

  // 강의 유형 상세 선택
  const typeDetailsList = document.querySelectorAll('.type-details');
  const typeToDivId = {
    '1': 'type-hyunsang',
    '2': 'type-online',
    '3': 'type-live'
  };

  function hideAllTypeDetails() {
    typeDetailsList.forEach(div => {
      div.style.display = 'none';
    });
  }

  function showTypeDetail(selectedValue) {
    hideAllTypeDetails();
    if (!selectedValue) return;

    const showDivId = typeToDivId[selectedValue];
    if (showDivId) {
      const showDiv = document.getElementById(showDivId);
      if (showDiv) {
        showDiv.style.display = 'flex';
      }
    }
  }

  hideAllTypeDetails();

  typeGroup.addEventListener('click', (e) => {
    const btn = e.target.closest('.reg-toggle-btn');
    if (!btn) return;

    typeGroup.querySelectorAll('.reg-toggle-btn').forEach(button => {
      button.classList.remove('selected');
      button.setAttribute('aria-pressed', 'false');
      button.querySelector('.chk-ico').textContent = '';
    });

    btn.classList.add('selected');
    btn.setAttribute('aria-pressed', 'true');
    btn.querySelector('.chk-ico').textContent = '\u2713';

    showTypeDetail(btn.dataset.value);
  });

  const initiallySelected = typeGroup.querySelector('.reg-toggle-btn.selected');
  if (initiallySelected) {
    showTypeDetail(initiallySelected.dataset.value);
  }

  // 강의 등록 날짜
  const today = new Date();
  const yyyy = today.getFullYear();
  const mm = String(today.getMonth() + 1).padStart(2, '0'); 
  const dd = String(today.getDate()).padStart(2, '0'); 

  const todayStr = `${yyyy}-${mm}-${dd}`;

  const startDateInput = document.getElementById('start-date');
  const endDateInput = document.getElementById('end-date');

  if (startDateInput) {
    startDateInput.value = todayStr;
  }
  if (endDateInput) {
    endDateInput.value = todayStr;
  }

  // 강의 기한
  const periodSelect = document.getElementById('period-select');
  function calculateMonths(startStr, endStr) {
    const start = new Date(startStr);
    const end = new Date(endStr);
    if (isNaN(start) || isNaN(end) || end < start) return null;
    const diffDays = (end - start) / (1000 * 60 * 60 * 24);
    return Math.round(diffDays / 30);
  }

  function calculateEndDate(startStr, months) {
    const start = new Date(startStr);
    if (isNaN(start)) return null;

    const newEnd = new Date(start.getTime() + months * 30 * 24 * 60 * 60 * 1000);
    const yyyy = newEnd.getFullYear();
    const mm = String(newEnd.getMonth() + 1).padStart(2, '0');
    const dd = String(newEnd.getDate()).padStart(2, '0');
    return `${yyyy}-${mm}-${dd}`;
  }

  function onDateChange() {
    const months = calculateMonths(startDateInput.value, endDateInput.value);
    if (months && periodSelect) {
      const options = Array.from(periodSelect.options);
      const closest = options.reduce((prev, curr) => {
        return (Math.abs(parseInt(curr.value) - months) < Math.abs(parseInt(prev.value) - months)) ? curr : prev;
      });
      periodSelect.value = closest.value;
    }
  }

  function onPeriodChange() {
    if (startDateInput && endDateInput && periodSelect) {
      const selectedMonths = parseInt(periodSelect.value);
      if (!isNaN(selectedMonths)) {
        const newEnd = calculateEndDate(startDateInput.value, selectedMonths);
        if (newEnd) {
          endDateInput.value = newEnd;
        }
      }
    }
  }

  if (startDateInput && endDateInput && periodSelect) {
    startDateInput.addEventListener('change', function () {
      if (new Date(endDateInput.value) < new Date(startDateInput.value)) {
        const defaultMonths = parseInt(periodSelect.value) || 3;
        endDateInput.value = calculateEndDate(startDateInput.value, defaultMonths);
      }
      onDateChange();
    });

    endDateInput.addEventListener('change', onDateChange);
    periodSelect.addEventListener('change', onPeriodChange);

    onDateChange();
  }

  // 판매가 자동 계산
  const supplyInput = document.getElementById('supply-amount');
  const sellingInput = document.getElementById('selling-amount');

  supplyInput.addEventListener('input', function() {
    let supplyValue = Number(supplyInput.value);
    if (isNaN(supplyValue)) supplyValue = 0;
    let sellingValue = Math.round(supplyValue * 1.1); // 10% 부가세 포함
    sellingInput.value = sellingValue > 0 ? sellingValue : '';
  });

  // 유효성 검사
  function validateForm() {
    const title = document.getElementById('lec-title').value.trim();
    const summary = document.getElementById('lec-summary').value.trim();
    const classCategoryInput = document.getElementById('classCategoryInput').value.trim();
    const supplyAmount = document.getElementById('supply-amount').value.trim();

    if (title === "") {
      alert("강의 제목을 입력하세요.");
      document.getElementById('lec-title').focus();
      return false;
    }
    if (summary === "") {
      alert("강의 요약을 입력하세요.");
      document.getElementById('lec-summary').focus();
      return false;
    }
    if (classCategoryInput === "") {
      alert("카테고리를 선택하세요.");
      return false;
    }
    if (supplyAmount === "" || isNaN(Number(supplyAmount)) || Number(supplyAmount) <= 0) {
      alert("공급가액을 올바르게 입력하세요.");
      document.getElementById('supply-amount').focus();
      return false;
    }
    return true;
  }

  const form = document.getElementById('class-regist-form');
  if (form) {
    form.addEventListener('submit', function(event) {
      if (!validateForm()) {
        event.preventDefault();
      } else if (!confirm('등록하시겠습니까?')) {
        event.preventDefault();
      }
    });
  }
});
