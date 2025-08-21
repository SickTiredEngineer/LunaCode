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
      });

      tag.appendChild(btn);
      chosenTagsWrap.appendChild(tag);
    });
  }

  // 초기 렌더링
  renderMainCategories();
  renderSubCategories();
  renderChosenTags();

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

  // 서브 카테고리 클릭 이벤트 
  subcategoryList.addEventListener('click', (e) => {
    const btn = e.target.closest('.reg-cat-btn');
    if (!btn) return;
    const name = btn.dataset.name;
    if (!selectedTags.has(name)) {
      selectedTags.add(name);
      renderChosenTags();
    }
  });
});

	// 강의 유형 밎 난이도
document.addEventListener('DOMContentLoaded', () => {
  const difficultyGroup = document.getElementById('difficulty-group');
  const typeGroup = document.getElementById('type-group');

  // 단일 선택 처리 함수
  function handleSingleSelect(group, clickedBtn) {
    if (!clickedBtn.classList.contains('reg-toggle-btn')) return;
    group.querySelectorAll('.reg-toggle-btn.selected').forEach(btn => btn.classList.remove('selected'));
    clickedBtn.classList.add('selected');
    // 접근성용 aria-pressed 업데이트
    group.querySelectorAll('.reg-toggle-btn').forEach(btn => btn.setAttribute('aria-pressed', 'false'));
    clickedBtn.setAttribute('aria-pressed', 'true');
  }

  // 복수 선택 처리 함수
  function handleMultiSelect(clickedBtn) {
    if (!clickedBtn.classList.contains('reg-toggle-btn')) return;
    const selected = clickedBtn.classList.toggle('selected');
    clickedBtn.setAttribute('aria-pressed', selected ? 'true' : 'false');
  }

  // 난이도(단일 선택) 
  if (difficultyGroup) {
    difficultyGroup.addEventListener('click', e => {
      const btn = e.target.closest('.reg-toggle-btn');
      if (!btn || !difficultyGroup.contains(btn)) return;
      handleSingleSelect(difficultyGroup, btn);
    });
  }

  // 강의 유형(복수 선택)
  if (typeGroup) {
    typeGroup.addEventListener('click', e => {
      const btn = e.target.closest('.reg-toggle-btn');
      if (!btn || !typeGroup.contains(btn)) return;
      handleMultiSelect(btn);
    });
  }
});

	// 강의 유형 상세 선택
document.addEventListener('DOMContentLoaded', () => {
  const typeGroup = document.getElementById('type-group');
  const typeDetailsList = document.querySelectorAll('.type-details');

  // 켜질 영역 id 매칭용 맵 (data-value → 표시할 div id)
  const typeToDivId = {
    '1': 'type-hyunsang',
    '2': 'type-online',
    '3': 'type-live'
  };

  // 모든 type-details div 숨기기
  function hideAllTypeDetails() {
    typeDetailsList.forEach(div => {
      div.style.display = 'none';
    });
  }

  // 단일 선택 강의 유형일 때 내용 보여주기, 선택 없으면 모두 숨김
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

  // 초기 숨기기
  hideAllTypeDetails();

  // 버튼 클릭 이벤트 처리 (단일 선택으로 가정)
  typeGroup.addEventListener('click', (e) => {
    const btn = e.target.closest('.reg-toggle-btn');
    if (!btn) return;

    // 단일 선택 가정: 모든 버튼 selected 제거
    typeGroup.querySelectorAll('.reg-toggle-btn').forEach(button => {
      button.classList.remove('selected');
      button.setAttribute('aria-pressed', 'false');
      button.querySelector('.chk-ico').textContent = '';
    });

    // 클릭한 버튼만 선택 표시 추가
    btn.classList.add('selected');
    btn.setAttribute('aria-pressed', 'true');
    btn.querySelector('.chk-ico').textContent = '\u2713';

    // 해당 유형에 맞는 UI 보여주기
    showTypeDetail(btn.dataset.value);
  });

  // 페이지 로드 시 기본 선택 (있으면)
  const initiallySelected = typeGroup.querySelector('.reg-toggle-btn.selected');
  if (initiallySelected) {
    showTypeDetail(initiallySelected.dataset.value);
  }
});

	// 강의 등록 날짜
document.addEventListener('DOMContentLoaded', function() {
  const today = new Date();
  const yyyy = today.getFullYear();
  const mm = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1 필요
  const dd = String(today.getDate()).padStart(2, '0'); 

  const todayStr = `${yyyy}-${mm}-${dd}`;

  // 시작일과 종료일 input 요소 찾기
  const startDateInput = document.getElementById('start-date');
  const endDateInput = document.getElementById('end-date');

  if (startDateInput) {
    startDateInput.value = todayStr;
  }
  if (endDateInput) {
    endDateInput.value = todayStr;
  }
});


// 강의 기한
document.addEventListener('DOMContentLoaded', function () {
  const startInput = document.getElementById('start-date');
  const endInput = document.getElementById('end-date');
  const periodSelect = document.getElementById('period-select');

  // 시작일 ~ 종료일 차이로 개월 수 계산 (30일 기준)
  function calculateMonths(startStr, endStr) {
    const start = new Date(startStr);
    const end = new Date(endStr);
    if (isNaN(start) || isNaN(end) || end < start) return null;

    const diffDays = (end - start) / (1000 * 60 * 60 * 24);
    return Math.round(diffDays / 30);
  }

  // 시작일에 개월 수 더해서 종료일 계산 (월 단순 계산)
  function calculateEndDate(startStr, months) {
    const start = new Date(startStr);
    if (isNaN(start)) return null;

    // 1개월을 30일로 가정해 더함
    const newEnd = new Date(start.getTime() + months * 30 * 24 * 60 * 60 * 1000);

    // yyyy-MM-dd 포맷으로 변경
    const yyyy = newEnd.getFullYear();
    const mm = String(newEnd.getMonth() + 1).padStart(2, '0');
    const dd = String(newEnd.getDate()).padStart(2, '0');
    return `${yyyy}-${mm}-${dd}`;
  }

  // 날짜 변경 -> 수강기한 셀렉트 값 자동 변경
  function onDateChange() {
    const months = calculateMonths(startInput.value, endInput.value);
    if (months && periodSelect) {
      // 범위내 가장 가까운 옵션 찾기
      const options = Array.from(periodSelect.options);
      const closest = options.reduce((prev, curr) => {
        return (Math.abs(parseInt(curr.value) - months) < Math.abs(parseInt(prev.value) - months)) ? curr : prev;
      });
      periodSelect.value = closest.value;
    }
  }

  // 수강기한 변경 -> 종료일 자동 변경
  function onPeriodChange() {
    if (startInput && endInput && periodSelect) {
      const selectedMonths = parseInt(periodSelect.value);
      if (!isNaN(selectedMonths)) {
        const newEnd = calculateEndDate(startInput.value, selectedMonths);
        if (newEnd) {
          endInput.value = newEnd;
        }
      }
    }
  }

  // 이벤트 바인딩
  if (startInput && endInput && periodSelect) {
    startInput.addEventListener('change', function () {
      // 종료일이 시작일 이전이면 종료일 = 시작일 + 선택된 기간(기본 3개월)
      if (new Date(endInput.value) < new Date(startInput.value)) {
        const defaultMonths = parseInt(periodSelect.value) || 3;
        endInput.value = calculateEndDate(startInput.value, defaultMonths);
      }
      onDateChange();
    });

    endInput.addEventListener('change', onDateChange);
    periodSelect.addEventListener('change', onPeriodChange);

    // 초기 로드 시 동기화
    onDateChange();
  }
});

// 판매가 자동 계산
const supplyInput = document.getElementById('supply-amount');
const sellingInput = document.getElementById('selling-amount');

supplyInput.addEventListener('input', function() {
  let supplyValue = Number(supplyInput.value);
  if (isNaN(supplyValue)) supplyValue = 0;
  let sellingValue = Math.round(supplyValue * 1.1); // 10% 부가세 포함
  sellingInput.value = sellingValue > 0 ? sellingValue : '';
});
