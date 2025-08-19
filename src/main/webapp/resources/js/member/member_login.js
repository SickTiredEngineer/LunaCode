document.addEventListener('DOMContentLoaded', function () {
  const form = document.querySelector('form');
  const idInput = document.getElementById('inputId');
  const passwordInput = document.getElementById('inputPassword');
  const idError = document.getElementById('idError');
  const passwordError = document.getElementById('passwordError');

  form.addEventListener('submit', function(event) {
    event.preventDefault();

    idInput.classList.remove('is-invalid');
    passwordInput.classList.remove('is-invalid');
    idError.style.display = 'none';
    passwordError.style.display = 'none';

    const idVal = idInput.value.trim();
    const pwVal = passwordInput.value;

    if (!idVal) {
      idInput.classList.add('is-invalid');
      idError.textContent = '아이디를 입력해주세요.';
      idError.style.display = 'block';
      return;
    }
    if (!pwVal) {
      passwordInput.classList.add('is-invalid');
      passwordError.textContent = '비밀번호를 입력해주세요.';
      passwordError.style.display = 'block';
      return;
    }

    // 하드 코딩 수정 필요
    const validId = 'user1';
    const validPw = '123456';

    if (idVal !== validId) {
      idInput.classList.add('is-invalid');
      idError.textContent = '존재하지 않는 아이디입니다.';
      idError.style.display = 'block';
      return;
    }

    if (pwVal !== validPw) {
      passwordInput.classList.add('is-invalid');
      passwordError.textContent = '비밀번호가 틀렸습니다. 다시 입력해주세요.';
      passwordError.style.display = 'block';
      passwordInput.value = '';
      passwordInput.focus(); 
      return;
    }
    
    if (pwVal === validPw && idVal === validId) {
	  window.location.href = contextPath + '/GoHome';
	  return;
	}

  });
});

document.addEventListener('DOMContentLoaded', function() {
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

function logout() {
    if (confirm('로그아웃 하시겠습니까?')) {
        location.href = contextPath + '/MemberLogout';
    }
}

