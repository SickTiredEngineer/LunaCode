/* 프로필 수정을 위한 JS파일 */

/* 닉네임 최소, 최대 글자 수 */
const MIN = 4;
const MAX = 12;
/* 현재 사용자의 원래 닉네임 (페이지 로드 시 서버로부터 받아와야 함) */
let originalNickname = ""; 

/* ====================================================== */
// 특정 이벤트가 짧은 시간 간격으로 여러번 발생 시 마지막 이벤트 발생 후 지정한 delay(ms)동안 추가 이벤트가 없을 경우에만
// 콜백 함수를 실행
/* ====================================================== */
function debounce(fn, delay) {
  let timer;
  return function(...args) {
    clearTimeout(timer); // 이전 타이머 취소
    timer = setTimeout(() => fn.apply(this, args), delay);
  };
}

/* 화면 렌더링 완료 후 로직 */
$(async function (){
	/* 단위: ms */
	const DEBOUNCE_DELAY = 300;

	// 페이지 로드 시, 현재 사용자 정보를 불러와 폼에 채워넣는 함수 호출
	await loadUserProfile();
	
	/* ====================================================== */
	/* 이벤트 핸들러 등록 */
	/* ====================================================== */

	/* 닉네임 검사 -> debounce 0.3초 */
	$("#input_nickname").on("input", debounce(async function(event){
		const nickname = $(this).val();
		await validateNickname(nickname);
	}, DEBOUNCE_DELAY));

	/* 닉네임 중복 체크 버튼 클릭 */
	$("#check_nickname_btn").on("click", async function(){
		const nickname = $("#input_nickname").val();
		await validateNickname(nickname);
	});

	/* 자기소개 글자 수 카운팅 */
	$("#bio").on("input", function() {
		const maxLength = 200; // 최대 200자
		let currentLength = $(this).val().length;
		if (currentLength > maxLength) {
			$(this).val($(this).val().substring(0, maxLength));
			currentLength = maxLength;
		}
		$("#bio_char_count").text(`(${currentLength} / ${maxLength})`);
	});

	/* 깃허브 URL 정규식 검사 */
	$("#github").on("input", debounce(function(){
		validateGithubUrl($(this).val());
	}, DEBOUNCE_DELAY));

	/* 사진 업로드 버튼 클릭 시 파일 입력창 트리거 */
	$("#photo-upload-btn").on("click", function(){
		$("#profile_image_input").click();
	});

	/* 프로필 이미지 파일 선택 시 미리보기 처리 */
	$("#profile_image_input").on("change", function(event){
		previewProfileImage(event);
	});
	
	/* '변경 완료' 버튼 클릭 시 최종 검사 및 제출 */
	$("#submit_button").on("click", async function(e){
		e.preventDefault(); // 기본 폼 제출 방지

		// 1. 닉네임 최종 유효성 검사
		const isNicknameValid = await validateNickname($("#input_nickname").val());
		if (!isNicknameValid) {
			alert("닉네임이 유효하지 않습니다. 확인해주세요.");
			$("#input_nickname").focus();
			return;
		}

		// 2. 깃허브 URL 최종 유효성 검사
		const isGithubValid = validateGithubUrl($("#github").val());
		if(!isGithubValid) {
			alert("올바른 깃허브 URL을 입력해주세요.");
			$("#github").focus();
			return;
		}

		// 3. FormData를 사용하여 폼 데이터 전송 (파일 포함)
		const formData = new FormData($("#profile_form")[0]);
		
		// 서버로 데이터 전송 (현재는 비활성화)
		alert("프로필 변경이 요청되었습니다. (현재는 테스트 모드로 서버에 전송되지 않습니다.)");
		/*
		$.ajax({
			type: "POST",
			url: "/user/updateProfile", // 실제 프로필 업데이트를 처리할 URL
			data: formData,
			processData: false,  // FormData 사용 시 필수
			contentType: false,  // FormData 사용 시 필수
			success: function(response) {
				if(response.success){
					alert("프로필이 성공적으로 변경되었습니다.");
					location.reload(); // 성공 시 페이지 새로고침
				} else {
					alert(response.message || "프로필 변경에 실패했습니다.");
				}
			},
			error: function(xhr, status, error) {
				console.error("Error:", error);
				alert("프로필 변경 중 오류가 발생했습니다.");
			}
		});
		*/
	});
});

/* ====================================================== */
// 프로필 정보 로드 및 설정
/* ====================================================== */
async function loadUserProfile(){
	// --- 시작: 프론트엔드 화면 테스트를 위한 임시 코드 ---
	// 실제 서버 연동 시 이 부분은 삭제하고 아래 주석처리된 try-catch 블록을 활성화해야 합니다.
	const dummyUser = {
		nickname: "테스트유저",
		email: "test@example.com",
		bio: "안녕하세요! 이것은 테스트용 자기소개입니다.",
		github: "https://github.com/testuser",
		profileImageUrl: "https://placehold.co/사진" // 임시 프로필 이미지
	};

	originalNickname = dummyUser.nickname;
	$("#input_nickname").val(dummyUser.nickname);
	$("#email").val(dummyUser.email);
	$("#bio").val(dummyUser.bio).trigger("input");
	$("#github").val(dummyUser.github);
	if(dummyUser.profileImageUrl) {
		$("#profile_photobox").css("background-image", `url(${dummyUser.profileImageUrl})`);
		$("#profile_photobox span").hide();
	}
	// --- 종료: 프론트엔드 화면 테스트를 위한 임시 코드 ---


	/*
	try {
		// 실제 서버에서 사용자 정보를 가져오는 API URL로 변경해야 합니다.
		const response = await $.ajax({
			type: "GET",
			url: "/user/getProfile", 
			dataType: "json"
		});

		if(response.success){
			const user = response.data;
			originalNickname = user.nickname; // 원래 닉네임 저장
			
			$("#input_nickname").val(user.nickname);
			$("#email").val(user.email);
			$("#bio").val(user.bio).trigger("input"); // 자기소개 채우고 글자 수 업데이트
			$("#github").val(user.github);

			// 프로필 이미지가 있으면 표시
			if(user.profileImageUrl) {
				$("#profile_photobox").css("background-image", `url(${user.profileImageUrl})`);
				$("#profile_photobox span").hide();
			}
		}
	} catch (e) {
		console.error("프로필 정보를 불러오는 데 실패했습니다.", e);
		alert("사용자 정보를 불러오는 중 오류가 발생했습니다.");
	}
	*/
}


/* ====================================================== */
// 유효성 검사 함수
/* ====================================================== */

/**
 * 닉네임 유효성(정규식, 중복)을 검사하고 결과를 span에 표시합니다.
 * @param {string} nickname - 검사할 닉네임
 * @returns {Promise<boolean>} - 유효성 통과 여부
 */
async function validateNickname(nickname) {
	const span = "#span_nickname";

	// 1. 닉네임이 원래 닉네임과 동일한 경우
	if (nickname === originalNickname) {
		$(span).text("현재 사용 중인 닉네임입니다.").css("color", "#ff0000");
		return true;
	}
	
	// 2. 정규식 검사
	const regex = new RegExp(`^[가-힣A-Za-z][가-힣A-Za-z0-9]{${MIN-1},${MAX-1}}$`);
	if (!regex.test(nickname)) {
		$(span).text(`닉네임은 한글/영어로 시작, 한글/영어/숫자만 사용 (${MIN}~${MAX}자)`).css("color", "#ff0000");
		return false;
	}

	// 3. 중복 검사 (AJAX)
	try {
		const res = await $.ajax({
			type: "get",
			url: "CheckDuplication", // 회원가입 시 사용한 URL과 동일하게 사용 가능
			dataType: "json",
			data: {
				value: nickname,
				type: 'nickname'
			}
		});
		
		$(span).text(res.text).css("color", res.color);
		return res.dupResult === 'true' || res.dupResult === true;

	} catch(e) {
		$(span).text("닉네임 중복 확인 중 오류 발생").css("color", "#ff0000");
		console.error(e);
		return false;
	}
}

/**
 * 깃허브 URL 형식을 검사하고 결과를 span에 표시합니다.
 * @param {string} url - 검사할 URL
 * @returns {boolean} - 유효성 통과 여부
 */
function validateGithubUrl(url) {
	const span = "#span_github";
	
	// URL이 비어있으면 검사 통과 (필수 입력이 아닐 경우)
	if (!url || url.trim() === "") {
		$(span).text("");
		return true;
	}

	const regex = /^https:\/\/github\.com\/[a-zA-Z0-9_-]+$/;
	const isValid = regex.test(url);

	if (isValid) {
		$(span).text("올바른 깃허브 URL 형식입니다.").css("color", "#839FD1");
	} else {
		$(span).text("https://github.com/username 형식으로 입력해주세요.").css("color", "#ff0000");
	}
	return isValid;
}


/* ====================================================== */
// 프로필 이미지 미리보기
/* ====================================================== */

/**
 * 선택된 프로필 이미지를 미리보기로 보여줍니다.
 * @param {Event} event - 파일 input의 change 이벤트 객체
 */
function previewProfileImage(event) {
	const file = event.target.files[0];
	if (file) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const photobox = $("#profile_photobox");
			photobox.css('background-image', `url(${e.target.result})`);
			photobox.css('background-size', 'cover');
			photobox.css('background-position', 'center');
			photobox.find("span").hide(); // '사진' 텍스트 숨기기
		}
		reader.readAsDataURL(file);
	}
}