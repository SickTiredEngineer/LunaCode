document.addEventListener('DOMContentLoaded', function () {
    const loginModal = document.getElementById('loginModal');
    if (!loginModal) return;

    const form = loginModal.querySelector('form');
    const idInput = document.getElementById('inputId');
    const passwordInput = document.getElementById('inputPassword');
    const idError = document.getElementById('idError');
    const passwordError = document.getElementById('passwordError');
    const serverError = document.getElementById('serverError');

    // 클라이언트 유효성 검사
    form.addEventListener('submit', function(event) {
        let hasError = false;

        idInput.classList.remove('is-invalid');
        passwordInput.classList.remove('is-invalid');
        serverError.style.display = 'none';

        const idVal = idInput.value.trim();
        const pwVal = passwordInput.value;

        if (!idVal) {
            idInput.classList.add('is-invalid');
            idError.textContent = '아이디를 입력해주세요.';
            idError.style.display = 'block';
            hasError = true;
        }

        if (!pwVal) {
            passwordInput.classList.add('is-invalid');
            passwordError.textContent = '비밀번호를 입력해주세요.';
            passwordError.style.display = 'block';
            hasError = true;
        }

        if (hasError) {
            event.preventDefault(); // 서버 전송 막기
        }
    });

    // 프로필 드롭다운
    const profileImg = document.getElementById('profileImg');
    const dropdownBox = document.getElementById('userDropdown');
    if (profileImg && dropdownBox) {
        profileImg.addEventListener('click', function(event) {
            event.stopPropagation();
            dropdownBox.style.display = dropdownBox.style.display === 'block' ? 'none' : 'block';
        });
        document.addEventListener('click', function() {
            dropdownBox.style.display = 'none';
        });
    }
});

// 로그아웃 함수
function logout() {
    if (confirm('로그아웃 하시겠습니까?')) {
        location.href = contextPath + '/MemberLogout';
    }
}
