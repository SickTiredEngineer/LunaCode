/*
 * =========================================
 * 프로필 수정을 위한 JavaScript 파일
 * (modify_profile.js)
 * =========================================
 */

// 닉네임 글자 수 제약 조건 (필요 시 정규식에서 사용)
const MIN_NICKNAME_LENGTH = 4;
const MAX_NICKNAME_LENGTH = 12;

/**
 * Debounce 함수: 연속적인 이벤트 발생 시, 마지막 이벤트 후 일정 시간 뒤에만 콜백 실행
 * @param {function} func - 실행할 콜백 함수
 * @param {number} delay - 지연 시간 (ms)
 */
function debounce(func, delay) {
	let timer;
	return function(...args) {
		clearTimeout(timer);
		timer = setTimeout(() => func.apply(this, args), delay);
	};
}

// jQuery: 문서가 완전히 로드된 후 실행
$(function() {
	const DEBOUNCE_DELAY = 300; // 0.3초

	/*
	 * -----------------------------------------
	 * 페이지 로드 시 초기화 함수 실행
	 * -----------------------------------------
	 */
	// 자기소개 글자 수 카운터를 페이지 로드 시 바로 업데이트
	$('#bio').trigger('input');


	/*
	 * -----------------------------------------
	 * 이벤트 핸들러 등록
	 * -----------------------------------------
	 */

	// 닉네임 입력 시 실시간 유효성 검사 (디바운스 적용)
	$('#input_nickname').on('input', debounce(async function() {
		await validateNickname($(this).val());
	}, DEBOUNCE_DELAY));
	
	// 이메일 입력시 실시간 유효성 검사 (디바운스 적용)
	$('#email').on('input', debounce(function() {
		validateEmail($(this).val());
	}, DEBOUNCE_DELAY));
	
	// 자기소개 글자 수 실시간 카운팅
	$('#bio').on('input', function() {
		const maxLength = 200;
		let currentLength = $(this).val().length;

		if (currentLength > maxLength) {
			$(this).val($(this).val().substring(0, maxLength));
			currentLength = maxLength;
		}
		$('#bio_char_count').text(`(${currentLength} / ${maxLength})`);
	});

	// 깃허브 URL 입력 시 실시간 형식 검사 (디바운스 적용)
	$('#github').on('input', debounce(function() {
		validateGithubUrl($(this).val());
	}, DEBOUNCE_DELAY));

	// '사진 업로드' 버튼 클릭 시 숨겨진 파일 선택창 열기
	$('#photo-upload-btn').on('click', function() {
		$('#profile_image_input').click();
	});

	// 프로필 이미지 파일이 선택되면 미리보기 업데이트
	$('#profile_image_input').on('change', function(event) {
		previewProfileImage(event);
	});

	// '변경 완료' 버튼 클릭 시 최종 유효성 검사 및 제출
	$('#submit_button').on('click', async function(e) {
		e.preventDefault(); // 폼의 기본 제출 동작을 막음

		const currentNickname = $('#input_nickname').val();
		let isNicknameValid = false;

		// 1. 닉네임 최종 유효성 검사
		//    - 닉네임이 원래 닉네임과 같다면, 무조건 '유효'로 처리
		if (currentNickname === originalNickname) {
			isNicknameValid = true;
		} else {
			//    - 닉네임이 변경되었다면, 실시간 검사 함수를 다시 호출하여 최종 확인
			isNicknameValid = await validateNickname(currentNickname);
		}

		if (!isNicknameValid) {
			alert('닉네임이 유효하지 않습니다. 확인해주세요.');
			$('#input_nickname').focus();
			return;
		}
		
		// 2. 이메일 최종 유효성 검사
		const isEmailValid = validateEmail($('#email').val());
		if (!isEmailValid) {
			alert('올바른 이메일 주소를 입력해주세요.');
			$('#email').focus();
			return;
		}
		
		// 3. 깃허브 URL 최종 유효성 검사
		const isGithubValid = validateGithubUrl($('#github').val());
		if (!isGithubValid) {
			alert('올바른 깃허브 URL을 입력해주세요.');
			$('#github').focus();
			return;
		}

		// 3. 모든 검사를 통과하면 FormData로 폼 데이터 전송 (파일 포함)
		const formData = new FormData($('#profile_form')[0]);

		$.ajax({
			type: 'POST',
			url: 'ModifyProfile', // form의 action 속성과 동일
			data: formData,
			processData: false, // FormData 사용 시 필수
			contentType: false, // FormData 사용 시 필수
			success: function(response) {
				if(response.success) {
					alert('프로필이 성공적으로 변경되었습니다.');
					location.reload(); // 성공 시 페이지 새로고침
				} else {
					// Controller에서 success:false와 함께 message를 보냈을 경우
					alert(response.message || '프로필 변경에 실패했습니다.');
				}
			},
			error: function(xhr) {
				// 서버에서 JSON 형태의 에러 메시지를 보낼 경우
				const response = xhr.responseJSON;
				const message = (response && response.message) ? response.message : '프로필 변경 중 오류가 발생했습니다.';
				alert(message);
				console.error('Error:', xhr.responseText);
			}
		});
	});
});


/*
 * =========================================
 * 유효성 검사 및 헬퍼 함수
 * =========================================
 */

/**
 * 닉네임 유효성(자신의 닉네임, 정규식, 서버 중복)을 검사하고 결과를 span에 표시
 * @param {string} nickname - 검사할 닉네임
 * @returns {Promise<boolean>} - 유효성 통과 여부
 */
async function validateNickname(nickname) {
	const span = '#span_nickname';

	// 1. 자신의 '원래 닉네임'인지 가장 먼저 확인
	//    (JSP 파일 하단에서 선언해준 `originalNickname` 전역 변수를 사용)
	if (nickname === originalNickname) {
		$(span).text('현재 사용 중인 닉네임입니다.').css('color', 'blue');
		return true; // 자신의 닉네임은 항상 유효함
	}

	// 2. 닉네임 형식(정규식) 검사
	const regex = new RegExp(`^[가-힣A-Za-z][가-힣A-Za-z0-9]{${MIN_NICKNAME_LENGTH - 1},${MAX_NICKNAME_LENGTH - 1}}$`);
	if (!regex.test(nickname)) {
		$(span).text(`닉네임은 한글/영어로 시작, 한글/영어/숫자만 사용 (${MIN_NICKNAME_LENGTH}~${MAX_NICKNAME_LENGTH}자)`).css('color', 'red');
		return false;
	}

	// 3. 서버에 새로운 닉네임 중복 확인 요청 (AJAX)
	try {
		const response = await $.ajax({
			type: 'get',
			// =================================================================================
			// [중요] 프로필 수정 전용으로 새로 만든 Controller의 URL을 호출합니다.
			// =================================================================================
			url: 'CheckNicknameForProfile', 
			dataType: 'json',
			data: {
				value: nickname
			}
		});
		
		$(span).text(response.text).css('color', response.color);
		
		// 서버가 보내준 boolean 값을 직접 비교합니다.
		// response.dupResult가 false일 때만 유효한 닉네임입니다.
		return response.dupResult === false;

	} catch (e) {
		$(span).text('닉네임 중복 확인 중 오류가 발생했습니다.').css('color', 'red');
		console.error('AJAX Error:', e);
		return false;
	}
}

/**
 * ★★★ 이메일 형식을 검사하고 결과를 span에 표시 ★★★
 * @param {string} email - 검사할 이메일 주소
 * @returns {boolean} - 유효성 통과 여부
 */
function validateEmail(email) {
	const span = '#span_email';

	// 이메일은 필수값이므로 비어있으면 유효하지 않음
	if (!email || email.trim() === '') {
		$(span).text('이메일을 입력해주세요.').css('color', 'red');
		return false;
	}

	// 이메일 형식 검사를 위한 정규식
	const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	const isValid = regex.test(email);

	if (isValid) {
		$(span).text('올바른 이메일 형식입니다.').css('color', 'green');
	} else {
		$(span).text('올바르지 않은 이메일 형식입니다.').css('color', 'red');
	}
	return isValid;
}

/**
 * 깃허브 URL 형식을 검사하고 결과를 span에 표시
 * @param {string} url - 검사할 URL
 * @returns {boolean} - 유효성 통과 여부
 */
function validateGithubUrl(url) {
	const span = '#span_github';

	// 깃허브 URL은 선택 사항이므로 비어있으면 유효한 것으로 처리
	if (!url || url.trim() === '') {
		$(span).text('');
		return true;
	}

	const regex = /^https:\/\/github\.com\/[a-zA-Z0-9_-]+$/;
	const isValid = regex.test(url);

	if (isValid) {
		$(span).text('올바른 깃허브 URL 형식입니다.').css('color', 'green');
	} else {
		$(span).text('https://github.com/username 형식으로 입력해주세요.').css('color', 'red');
	}
	return isValid;
}

/**
 * 선택된 프로필 이미지를 미리보기로 보여줌
 * @param {Event} event - 파일 input의 change 이벤트 객체
 */
function previewProfileImage(event) {
	const file = event.target.files[0];
	if (file) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const photobox = $('#profile_photobox');
			// 'background-image' 속성을 변경하여 이미지 미리보기 설정
			photobox.css({
				'background-image': `url(${e.target.result})`,
				'background-size': 'cover',
				'background-position': 'center'
			});
			// 이미지 등록 시 '사진' 텍스트 숨기기
			photobox.find('span').hide();
		}
		reader.readAsDataURL(file);
	}
}
