/* 계정 탈퇴를 위한 JS 파일 */

$(function() {
	// 유효성 검사 플래그
	let isCurrentPassOk = false; // ★★★ '현재 비밀번호' 일치 여부 플래그 추가 ★★★
	let isPasswordMatch = false;

	// '회원 탈퇴' 버튼을 초기에 비활성화
	$("#submit_button").prop("disabled", true).css("opacity", "0.5");
	
	// ★★★ '현재 비밀번호' 입력 시, 실시간으로 서버에 일치 여부 확인 ★★★
	$("#password").on("input", function() {
		// 1. 현재 비밀번호 실시간 검증 함수 호출
		checkCurrentPassword($(this).val());
		// 2. 비밀번호 확인 필드와 일치하는지 재검사
		checkPasswordConfirmation(); 
	});

	// 비밀번호 확인 필드에 대한 입력 감지
	$("#password_check").on("input", function() {
		checkPasswordConfirmation();
		checkAllConditions();
	});

	// 동의 체크박스 변경 감지
	$("#agree_checkbox").on("change", function() {
		checkAllConditions();
	});

	// '회원 탈퇴' 버튼 클릭 이벤트
	$("#submit_button").on("click", function() {
		
		// 최종 확인 절차
		const confirmation = confirm("정말로 계정을 탈퇴하시겠습니까?\n모든 정보는 영구적으로 삭제되며, 이 작업은 되돌릴 수 없습니다.");
		
		if (confirmation) {
			$.ajax({
				type: "POST",
				url: "DeleteAccount",
				data: {
					password: $("#password").val()
				},
				success: function(response) {
					if (response.success) {
						alert("회원 탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
						location.href = contextPath + "/"; // contextPath 사용
					} else {
						alert(response.message || "회원 탈퇴에 실패했습니다. 비밀번호를 다시 확인해주세요.");
						$("#password, #password_check").val("");
						checkPasswordConfirmation();
						checkAllConditions();
					}
				},
				error: function() {
					alert("계정 탈퇴 처리 중 오류가 발생했습니다.");
				}
			});
		}
	});

	/**
	 * ★★★ [추가] 현재 비밀번호가 DB와 일치하는지 서버에 확인 요청 ★★★
	 * (비밀번호 변경 JS에서 가져온 함수)
	 */
	async function checkCurrentPassword(currentPass) {
		const span = $("#span_password"); // 메시지를 표시할 span 선택
		if(!currentPass) {
			span.text("");
			isCurrentPassOk = false;
			checkAllConditions(); // 조건 재검사
			return;
		}
	
		try {
			// '비밀번호 변경'에서 사용했던 것과 동일한 컨트롤러 API 재사용
			const response = await $.ajax({
				type: "POST",
				url: "CheckCurrentPassword", 
				data: { current_pass: currentPass }
			});
	
			if(response.isValid) {
				span.text("현재 비밀번호와 일치합니다.").css("color", "#839FD1");
				isCurrentPassOk = true;
			} else {
				span.text("현재 비밀번호가 일치하지 않습니다.").css("color", "#ff0000");
				isCurrentPassOk = false;
			}
		} catch (error) {
			span.text("비밀번호 확인 중 오류가 발생했습니다.").css("color", "#ff0000");
			isCurrentPassOk = false;
		}
		
		checkAllConditions(); // 조건 재검사
	}

	/**
	 * 두 비밀번호 필드가 일치하는지 확인하고 메시지를 표시하는 함수
	 * (기존 checkPasswords 함수 이름 변경 및 로직 수정)
	 */
	function checkPasswordConfirmation() {
		const password = $("#password").val();
		const passwordCheck = $("#password_check").val();
		const spanCheck = $("#span_password_check");

		if (password && passwordCheck) {
			if (password === passwordCheck) {
				spanCheck.text("비밀번호가 일치합니다.").css("color", "#839FD1");
				isPasswordMatch = true;
			} else {
				spanCheck.text("비밀번호가 일치하지 않습니다.").css("color", "#ff0000");
				isPasswordMatch = false;
			}
		} else {
			spanCheck.text("");
			isPasswordMatch = false;
		}
		
		checkAllConditions(); // 조건 재검사
	}
	
	/**
	 * ★★★ [수정] 모든 조건(현재 비밀번호 일치, 비밀번호 확인 일치, 동의 체크)을 확인 ★★★
	 */
	function checkAllConditions() {
		const isAgreed = $("#agree_checkbox").is(":checked");
		
		if (isCurrentPassOk && isPasswordMatch && isAgreed) {
			$("#submit_button").prop("disabled", false).css("opacity", "1");
		} else {
			$("#submit_button").prop("disabled", true).css("opacity", "0.5");
		}
	}
});