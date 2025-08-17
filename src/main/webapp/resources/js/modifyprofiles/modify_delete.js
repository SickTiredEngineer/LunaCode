/* 계정 탈퇴를 위한 JS 파일 */

$(function() {
	// 유효성 검사 플래그
	let isPasswordMatch = false;

	// '회원 탈퇴' 버튼을 초기에 비활성화
	$("#submit_button").prop("disabled", true).css("opacity", "0.5");

	// 비밀번호와 비밀번호 확인 필드에 대한 입력 감지
	$("#password, #password_check").on("input", function() {
		checkPasswords();
		checkAllConditions();
	});

	// 동의 체크박스 변경 감지
	$("#agree_checkbox").on("change", function() {
		checkAllConditions();
	});

	// '회원 탈퇴' 버튼 클릭 이벤트
	$("#submit_button").on("click", function() {
		
		// 최종 확인 절차 (매우 중요)
		const confirmation = confirm("정말로 계정을 탈퇴하시겠습니까?\n모든 정보는 영구적으로 삭제되며, 이 작업은 되돌릴 수 없습니다.");
		
		if (confirmation) {
			// 사용자가 '확인'을 누르면 서버로 탈퇴 요청
			$.ajax({
				type: "POST",
				url: "/user/deleteAccount", // 계정 탈퇴를 처리할 API 주소
				data: {
					password: $("#password").val()
				},
				success: function(response) {
					if (response.success) {
						alert("회원 탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
						location.href = "/"; // 메인 페이지로 리다이렉트
					} else {
						alert(response.message || "회원 탈퇴에 실패했습니다. 비밀번호를 다시 확인해주세요.");
						// 실패 시 비밀번호 필드 초기화
						$("#password, #password_check").val("");
						checkPasswords();
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
	 * 두 비밀번호 필드가 일치하는지 확인하고 메시지를 표시하는 함수
	 */
	function checkPasswords() {
		const password = $("#password").val();
		const passwordCheck = $("#password_check").val();
		const spanCheck = $("#span_password_check");

		if (password && passwordCheck) { // 두 필드 모두에 값이 있을 때만 비교
			if (password === passwordCheck) {
				spanCheck.text("비밀번호가 일치합니다.").css("color", "#839FD1");
				isPasswordMatch = true;
			} else {
				spanCheck.text("비밀번호가 일치하지 않습니다.").css("color", "#ff0000");
				isPasswordMatch = false;
			}
		} else {
			spanCheck.text(""); // 필드 중 하나라도 비어있으면 메시지 없음
			isPasswordMatch = false;
		}
	}
	
	/**
	 * 모든 조건(비밀번호 일치, 동의 체크)이 충족되었는지 확인하고 버튼 상태를 변경하는 함수
	 */
	function checkAllConditions() {
		const isAgreed = $("#agree_checkbox").is(":checked");
		
		if (isPasswordMatch && isAgreed) {
			$("#submit_button").prop("disabled", false).css("opacity", "1");
		} else {
			$("#submit_button").prop("disabled", true).css("opacity", "0.5");
		}
	}
});