/* 회원가입 입력 페이지 유효성 검사를 위한 JS파일 */
$(function (){
	
	/* 아이디 검사 연결 */
	$("#input_id").on("keyup", function(event){
		idHandler($(this).val());
	});
	
	/* 비밀번호 Input 검사 연결 */
	$("#input_pass").on("keyup", function(event){
		passwordHandler($(this).val());
		checkPassEqual();
	});
	
	/* 작성한 비밀번호가 동일한지 확인 */
	$("#input_pass_check").on("keyup", function(event){
		checkPassEqual();
	});
	
	/* 이메일을 직접 입력 / 선택하여 자동 완성 */
	$("#email_selector").on("change", function(event){
		emailSelector();
	});
	
	
});


/* ====================================================== */
/* 아이디 핸들러 -> 현재 제작 불가능 */
function idHandler(id){
	let color = "#839FD1";
	$("#span_id").text(id).css("color", color);
}

/* ====================================================== */
/* 입력받은 비밀번호의 유효성 검사 및 Span에 표시 */ 
function passwordHandler(pass){
	// 정규식 => 비밀번호 조건: 대문자, 소문자, 특수문자 포함 10 글자 이상
	const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z0-9]).{10,}$/;
	// 입력받은 비밀번호 검사
	let result = regex.test(pass);
	// Span에 출력할 Text, Color 지정
	let msg = result? "사용하기 적합한 비밀번호 입니다.":"비밀번호 조건: 대문자, 소문자, 특수문자, 숫자 포함 10글자 이상";
	let color = result? "#839FD1":"#ff0000";
	
	$("#span_pass").text(msg).css("color", color);
}

/* ====================================================== */
/* 입력받은 비밀번호 두개가 동일한지 검사 및 Span에 표시 */
function checkPassEqual(){
	// 처음 작성한 비밀번호와 확인 폼에 작성한 비밀번호가 동일한가?
	let isEqual = $("#input_pass").val() == $("#input_pass_check").val();
	// 동일 여부에 따라 Text, Color 지정
	let msg = isEqual? "비밀번호 확인이 완료되었습니다.":"작성한 비밀번호가 동일하지 않습니다";
	let color = isEqual? "#839FD1": "#FF0000";
	
	$("#span_pass_check").text(msg).css("color", color);
}

/* ====================================================== */
/* 두 번째 이메일 선택 */
function emailSelector(){

	let selectedEmail = $("#email_selector").val();
	// 직접입력 (널스트링)인지 판별
	let isInputSelf = selectedEmail == "";
	// 직접입력이 아니면 입력란 비활성화
	 $("#email_2").attr("disabled", !isInputSelf).val(selectedEmail);
}





