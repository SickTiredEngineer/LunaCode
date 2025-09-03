// 목차 클릭시 영상 변환
function changeVideo(url, title) {
  const video = document.getElementById("ClassVideo"); // iframe
  const titleElem = document.getElementById("ClassTitle");

  video.src = url;          // 영상 링크 변경
  titleElem.innerText = title;  // 제목 변경
}

// 메모 기능
document.addEventListener('DOMContentLoaded', () => {
  const contextPath = '${pageContext.request.contextPath}' || '';
  let accordionCount = 0;
  const addBtn = document.getElementById('addAccordionBtn');
  const accordion = document.getElementById('memoAccordion');
  const saveBtn = document.getElementById('saveMemoBtn');

  if (!addBtn || !accordion || !saveBtn) {
    console.warn('필수 요소(addAccordionBtn, memoAccordion, saveMemoBtn)를 찾을 수 없습니다.');
    return;
  }

  // 메모 삭제 함수
  function deleteMemo(memoId) {
    fetch(`${contextPath}/memo/delete/${memoId}`, { method: 'DELETE' })
      .then(res => {
        if (!res.ok) throw new Error(`서버 오류: ${res.status}`);
        return res.json();
      })
      .then(data => {
        if (data.success) {
          alert("메모가 삭제되었습니다!");
        } else {
          alert("삭제 실패");
        }
      })
      .catch(err => console.error("삭제 에러:", err));
  }

  // 아코디언 아이템 생성 함수
  function createAccordionItem(count, memoId = null, title = `새 메모 #${count}`, content = '') {
    const newId = `panel${count}`;
    const newHeaderId = `heading${count}`;
    const newItem = document.createElement('div');
    newItem.className = 'accordion-item';
    newItem.dataset.memoId = memoId || '';
    newItem.innerHTML = `
      <h2 class="accordion-header d-flex justify-content-between align-items-center" id="${newHeaderId}">
        <button class="accordion-button collapsed flex-grow-1" type="button" data-bs-toggle="collapse" data-bs-target="#${newId}" aria-expanded="false" aria-controls="${newId}">
          <input type="text" class="form-control form-control-sm memo-title-input" placeholder="메모 제목 입력" value="${title}" onclick="event.stopPropagation()" />
        </button>
        <button type="button" class="btn btn-sm btn-outline-danger ms-2 delete-accordion-btn" aria-label="삭제" title="메모 삭제">&times;</button>
      </h2>
      <div id="${newId}" class="accordion-collapse collapse" aria-labelledby="${newHeaderId}" data-bs-parent="#memoAccordion">
        <div class="accordion-body">
          <textarea class="form-control memo-content-textarea" rows="5" placeholder="메모 내용을 입력하세요...">${content}</textarea>
        </div>
      </div>
    `;

    const input = newItem.querySelector('.memo-title-input');
    const textarea = newItem.querySelector('.memo-content-textarea');
    const deleteBtn = newItem.querySelector('.delete-accordion-btn');

    input.addEventListener('blur', () => saveMemo(memoId, input.value, textarea.value));
    textarea.addEventListener('blur', () => saveMemo(memoId, input.value, textarea.value));

    deleteBtn.addEventListener('click', e => {
      e.stopPropagation();
      if (confirm('이 메모를 삭제하시겠습니까?')) {
        accordion.removeChild(newItem);
        if (memoId) deleteMemo(memoId);
      }
    });

    return newItem;
  }

  // 기존 메모 개수 파악
  accordionCount = accordion.querySelectorAll('.accordion-item').length;

  // 기존 메모 불러오기
  fetch(`${contextPath}/memo/list/${classId}`)
    .then(res => {
      if (!res.ok) throw new Error(`서버 오류: ${res.status}`);
      return res.json();
    })
    .then(data => {
      data.forEach(memo => {
        accordionCount++;
        const newItem = createAccordionItem(accordionCount, memo.memoId, memo.memoTitle, memo.memoContent);
        accordion.appendChild(newItem);
      });
    })
    .catch(err => console.error('메모 불러오기 중 에러:', err));

  // 메모 추가 버튼 클릭 이벤트
  addBtn.addEventListener('click', () => {
    accordionCount++;
    const newItem = createAccordionItem(accordionCount, null);
    accordion.appendChild(newItem);
  });

  // 저장 버튼 클릭 이벤트
  saveBtn.addEventListener('click', () => {
    const memos = [];
    const items = accordion.querySelectorAll('.accordion-item');
    items.forEach(item => {
      let memoIdRaw = item.dataset.memoId;
      let memoId = null;
      if (memoIdRaw && memoIdRaw.trim() !== '' && memoIdRaw.toLowerCase() !== 'null') {
        memoId = Number(memoIdRaw);
        if (isNaN(memoId)) memoId = null;
      }
      const titleInput = item.querySelector('.memo-title-input');
      const contentTextarea = item.querySelector('.memo-content-textarea');
      memos.push({
        memo_idx: memoId,
        title: titleInput.value,
        memo: contentTextarea.value
      });
    });
    fetch(contextPath + '/memo/save', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(memos)
    })
      .then(res => {
        if (!res.ok) throw new Error(`서버 오류: ${res.status}`);
        return res.json();
      })
      .then(data => {
        if (data.success) {
          alert('모든 메모가 저장되었습니다!');
        } else {
          alert('메모 저장에 실패했습니다.');
        }
      })
      .catch(err => {
        console.error('메모 저장 중 에러:', err);
        alert('저장 중 오류가 발생했습니다.');
      });
  });
});



// 댓글
document.addEventListener('DOMContentLoaded', () => {
  const commentList = document.querySelector('.comment-list');
  const commentInput = document.querySelector('.comment-input-area textarea');
  const commentBtn = document.querySelector('.comment-input-area button');

  if (!commentList || !commentInput || !commentBtn) {
    console.warn('댓글 요소를 찾을 수 없습니다.');
    return;
  }

  let commentIdCounter = 0; // 댓글 고유 ID

  // 댓글 등록 이벤트
  commentBtn.addEventListener('click', () => {
    const content = commentInput.value.trim();
    if (!content) {
      alert('댓글 내용을 입력해 주세요.');
      return;
    }

    commentIdCounter++;

    // 댓글 아이템 생성 (답글 영역 포함)
    const newComment = document.createElement('li');
    newComment.className = 'comment-item';
    newComment.dataset.commentId = commentIdCounter;
    newComment.innerHTML = `
      <span class="comment-writer">user</span>
      <span class="comment-content">${escapeHtml(content)}</span>
      <span class="comment-date">${getTodayDate()}</span>
      <button type="button" class="btn btn-sm btn-outline-primary reply-btn">답글 쓰기</button>
      <button type="button" class="btn btn-sm btn-outline-danger comment-delete-btn">삭제</button>
      <ul class="reply-list"></ul>
      <div class="reply-input-area" style="display:none; margin-top:8px;">
        <textarea class="form-control" placeholder="답글을 입력하세요..." rows="2"></textarea>
        <button type="button" class="btn btn-sm btn-primary reply-submit-btn mt-2">등록</button>
      </div>
    `;

    commentList.appendChild(newComment);
    commentInput.value = '';
  });

  // 댓글 및 답글 이벤트 위임 처리
  commentList.addEventListener('click', (e) => {
    const target = e.target;
    const commentItem = target.closest('.comment-item');
    if (!commentItem) return;

    // 답글 쓰기 버튼 클릭하면 입력 폼 토글
    if (target.classList.contains('reply-btn')) {
      const replyInputArea = commentItem.querySelector('.reply-input-area');
      if (replyInputArea) {
        replyInputArea.style.display = (replyInputArea.style.display === 'none' || replyInputArea.style.display === '') ? 'block' : 'none';
      }
      return;
    }

    // 답글 등록 버튼 클릭
    if (target.classList.contains('reply-submit-btn')) {
      const replyInputArea = commentItem.querySelector('.reply-input-area');
      if (!replyInputArea) return;

      const textarea = replyInputArea.querySelector('textarea');
      const replyContent = textarea.value.trim();

      if (!replyContent) {
        alert('답글 내용을 입력해 주세요.');
        return;
      }

      const replyList = commentItem.querySelector('.reply-list');
      if (!replyList) return;

      const newReply = document.createElement('li');
      newReply.className = 'comment-item reply';
      newReply.innerHTML = `
        <span class="comment-writer">user</span>
        <span class="comment-content">${escapeHtml(replyContent)}</span>
        <span class="comment-date">${getTodayDate()}</span>
        <button type="button" class="btn btn-sm btn-outline-danger comment-delete-btn">삭제</button>
      `;

      replyList.appendChild(newReply);

      textarea.value = '';
      replyInputArea.style.display = 'none';
      return;
    }

    // 삭제 버튼 클릭 - 본인 댓글/답글만 삭제 가능
    if (target.classList.contains('comment-delete-btn')) {
      const writer = commentItem.querySelector('.comment-writer');
      if (!writer) return;

      if (writer.textContent.trim() === 'user') {  // 본인 글만 삭제 가능
        if (confirm('이 댓글을 삭제하시겠습니까?')) {
          commentItem.remove();
        }
      } else {
        alert('본인이 작성한 댓글만 삭제할 수 있습니다.');
      }
    }
  });

  // 오늘 날짜 반환 (YYYY.MM.DD)
  function getTodayDate() {
    const d = new Date();
    const yyyy = d.getFullYear();
    const mm = String(d.getMonth() + 1).padStart(2, '0');
    const dd = String(d.getDate()).padStart(2, '0');
    return `${yyyy}.${mm}.${dd}`;
  }

  // XSS 방지용 HTML 이스케이프 함수
  function escapeHtml(text) {
    return text.replace(/[&<>"']/g, m => ({'&':'&amp;', '<':'&lt;', '>':'&gt;', '"':'&quot;', "'":'&#039;'}[m]));
  }
});


// 퀴즈 창
document.addEventListener("DOMContentLoaded", function() {
    const video = document.getElementById("video");
    const quizModal = new bootstrap.Modal(document.getElementById("quizModal"));
    const warningModal = new bootstrap.Modal(document.getElementById("warningModal"));

    // 퀴즈 데이터 
    const quizList = [
        { question: "생성자의 역할은 무엇인가요?" },
        { question: "this 키워드의 의미는 무엇인가요?" },
        { question: "객체지향 프로그래밍의 4대 특징은?" }
    ];

    let currentIndex = 0;
    let answers = {};

//    let quizCompleted = localStorage.getItem("quizCompleted") === "true";

    const quizQuestion = document.getElementById("quizQuestion");
    const quizAnswerInput = document.getElementById("quizAnswer");
    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");
    const submitBtn = document.getElementById("submitBtn");

    function loadQuestion(index) {
        const commonIcon = "resources/image/icon_quiz.png"; // 공통 아이콘 경로

        quizQuestion.innerHTML = `<img src="${commonIcon}" alt="문제 번호 아이콘" class="number-icon" /> ${index + 1}. ${quizList[index].question}`;
        quizAnswerInput.value = answers[index] || "";

        prevBtn.classList.toggle("d-none", index === 0);
        nextBtn.classList.toggle("d-none", index === quizList.length - 1);
        submitBtn.classList.toggle("d-none", index !== quizList.length - 1);
    }

    function validateInput() {
        const value = quizAnswerInput.value.trim();
        if (!value) {
            warningModal.show();
            return false;
        }
        answers[currentIndex] = value;
        return true;
    }

//    if (video) {
//        video.addEventListener("ended", function() {
//            if (quizCompleted) return; // ✅ 이미 제출했으면 실행 안 함
//            currentIndex = 0;
//            answers = {};
//            loadQuestion(currentIndex);
//            quizModal.show();
//        });
//    }

    prevBtn.addEventListener("click", function() {
        if (currentIndex > 0) {
            currentIndex--;
            loadQuestion(currentIndex);
        }
    });

    nextBtn.addEventListener("click", function() {
        if (validateInput()) {
            currentIndex++;
            loadQuestion(currentIndex);
        }
    });

    submitBtn.addEventListener("click", function() {
        if (validateInput()) {
            console.log("퀴즈 답안:", answers);
            alert("제출되었습니다!");
            quizCompleted = true;
            localStorage.setItem("quizCompleted", "true"); // ✅ 로컬스토리지 저장
            quizModal.hide();
        }
    });
});
