document.addEventListener('DOMContentLoaded', () => {
    const modalEl = document.getElementById('courseDetailModal');
    if (!modalEl) return;

    const bsModal = new bootstrap.Modal(modalEl);
    const contextPath = window.location.pathname.split('/')[1] ? '/' + window.location.pathname.split('/')[1] : '';

    // 강의 상세보기 버튼 클릭 시 모달 표시 및 정보 로드
    document.querySelectorAll('.btn-outline-secondary').forEach(button => {
        button.addEventListener('click', e => {
            e.preventDefault();
            bsModal.show();

            const classId = button.dataset.classId;
            
            // AJAX로 강의 정보 가져오기
            fetch(`${contextPath}/ClassDetail?id=${classId}`)
                .then(res => res.text())
                .then(html => {
                    // 임시 div에 삽입 후 필요한 정보 추출
                    const tempDiv = document.createElement('div');
                    tempDiv.innerHTML = html;

                    const lecture = {
                        title: tempDiv.querySelector('.modal-title')?.textContent || '',
                        price: tempDiv.querySelector('#modalPrice')?.textContent || '',
                        thumbnail: tempDiv.querySelector('img.img-fluid')?.src || '',
                        teacherIntro: tempDiv.querySelector('#modalTeacherIntro')?.textContent || '',
                        review: tempDiv.querySelector('#modalReview')?.textContent || '',
                        intro: tempDiv.querySelector('#modalIntro3')?.textContent || ''
                    };

                    // 모달에 데이터 채우기
                    modalEl.querySelector('.modal-title').textContent = lecture.title;
                    const priceEl = modalEl.querySelector('#modalPrice');
                    if(priceEl) priceEl.textContent = lecture.price;
                    const imgEl = modalEl.querySelector('img.img-fluid');
                    if(imgEl) imgEl.src = lecture.thumbnail;
                    const teacherEl = modalEl.querySelector('#modalTeacherIntro');
                    if(teacherEl) teacherEl.textContent = lecture.teacherIntro;
                    const reviewEl = modalEl.querySelector('#modalReview');
                    if(reviewEl) reviewEl.textContent = lecture.review;
                    const introEl = modalEl.querySelector('#modalIntro3');
                    if(introEl) introEl.textContent = lecture.intro;

                    // 신청 버튼에 classId 설정
                    const applyBtn = modalEl.querySelector('#applyBtn');
                    if (applyBtn) applyBtn.dataset.classId = classId;
                })
                .catch(err => {
                    console.error('강의 상세 정보 로드 실패:', err);
                });
        });
    });

    // 수강 신청 버튼 클릭
    const applyBtn = modalEl.querySelector('#applyBtn');
    if (applyBtn) {
        applyBtn.addEventListener('click', e => {
            e.preventDefault();
            const classId = applyBtn.dataset.classId;
            if (!classId) return alert('강의 ID가 없습니다.');

            fetch(`${contextPath}/apply`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ courseId: parseInt(classId) })
            })
            .then(res => res.json())
            .then(data => {
                alert(data.message); // 이미 신청했으면 "이미 신청됨" 메시지 표시
                if (data.success) bsModal.hide();
            })
            .catch(err => {
                console.error('수강 신청 오류:', err);
                alert('오류 발생: ' + err.message);
            });
        });
    }
});
