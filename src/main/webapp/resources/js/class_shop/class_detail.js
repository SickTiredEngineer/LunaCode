document.addEventListener('DOMContentLoaded', () => {
    const modalEl = document.getElementById('courseDetailModal');
    if (!modalEl) return;

    const bsModal = new bootstrap.Modal(modalEl);
    const contextPath = window.location.pathname.split('/')[1] ? '/' + window.location.pathname.split('/')[1] : '';
    let triggerButton = null; // 모달 열었던 버튼 저장용

    document.querySelectorAll('.btn-outline-secondary').forEach(button => {
        button.addEventListener('click', e => {
            e.preventDefault();
            triggerButton = button;
            bsModal.show();

            const classId = button.dataset.classId;

            fetch(`${contextPath}/ClassDetail?class_idx=${classId}`)
            .then(res => res.text())
            .then(html => {
                const modalBody = modalEl.querySelector('.modal-body');
                if(modalBody) modalBody.innerHTML = html;

                const applyBtn = modalEl.querySelector('#applyBtn');
                if (applyBtn) applyBtn.dataset.classId = classId;
            })
            .catch(err => {
                console.error('강의 상세 정보 로드 실패:', err);
            });
        });
    });

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
                alert(data.message || (data.success ? '신청 완료!' : '신청 실패'));
                if (data.success) bsModal.hide();
            })
            .catch(err => {
                console.error('수강 신청 오류:', err);
                alert('오류 발생: ' + err.message);
            });
        });
    }

    modalEl.addEventListener('hidden.bs.modal', () => {
        if (triggerButton) {
            triggerButton.focus();
        }
    });
});
