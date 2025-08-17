document.addEventListener('DOMContentLoaded', () => {
    const modalEl = document.getElementById('courseDetailModal');
    if (!modalEl) return;
    const bsModal = new bootstrap.Modal(modalEl);

    // 수강신청 하러가기 버튼 -> 모달 띄우기
    document.querySelectorAll('.btn-outline-secondary').forEach(button => {
        button.addEventListener('click', e => {
            e.preventDefault();
            bsModal.show();
        });
    });

    // 모달 내 수강 신청 버튼 -> 알림 띄우고 모달 닫기
    const applyBtn = modalEl.querySelector('.btn-primary.w-100');
    if (applyBtn) {
        applyBtn.addEventListener('click', event => {
            event.preventDefault();

            alert('강의가 장바구니에 담겼습니다!');

            bsModal.hide();
        });
    }
});
