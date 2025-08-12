
let totalResult = false;


/* 사용 가능한 아이디인가? */
let isCurrentId = false;
/* 비밀번호 유효성 */
let isCurrentPass = false;
/* 비밀번호 확인 결과 */
let isEqualPass = false;
/* 사용 가능한 닉네임인가? */
let isCurrentNickName = false;



/* (강사 한정) 첨부파일 유무 */
let isCurrentAttach = false;



/* 회원가입 입력 페이지 유효성 검사를 위한 JS파일 */
$(function (){
	
	/* ====================================================== */
	/* ID, PASS SPAN */
	/* 아이디 검사 연결 */
	
	$("#bt_check_id").on("click", function(event){
		checkIdDuplication($("#input_id").val());
	});
	
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
	
	/* ====================================================== */
	/* 이메일을 직접 입력 / 선택하여 자동 완성 */
	$("#email_selector").on("change", function(event){
		emailSelector();
	});
	
	$("#join_form").on("submit", function(event){
		 event.preventDefault(handleResult);
	});
	
	
	$("#bt_check_nickname").on("click", function(event){
		checkNickNameDuplication();
	});
	
	
});

/* ====================================================== */
/* 아이디 정규식 검사 함수 */
function idHandler(id){
	const regex = /^[A-Za-z0-9]+$/;
	
	let result = regex.test(id);

	let msg;
	let color;
	
	if(!result){
		msg = "아이디 조건: 숫자, 영어 조합만 사용가능"
		color = "#ff0000"
	}
	$("#span_id").text(msg).css("color", color);
	
	return result;
}

/* 아이디 중복 검사 함수 */
function checkIdDuplication(user_id){
	
	let regexResult = idHandler(user_id);
	
	if(!regexResult){
		return;
	}
	
	$.ajax({
			type: "GET",
			url: "CheckIdDuplication",
			dataType: "json",
			data: {
				id: user_id
			},
			
			/* 결과에 따라 span 적용 */
			success: function(res){
				/* 결과를 통해 span css 수정 */
				$('#span_id').text(res.text).css("color", res.color);
				/* 중복 결과 저장 변수에 결과 반영 */
				isCurrentId = res.dupResult
			},
			error: function(xhr, textStatus, errorThrown){}
		});
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

/* ====================================================== */
/* 닉네임 중복 검사 함수 */
function checkNickNameDuplication(){
	
	$.ajax({
			type: "GET",
			url: "CheckNickNameDuplication",
			dataType: "json",
			data: {
				nickname: $("#input_nickname").val()
			},
			
			/* 결과에 따라 span 적용 */
			success: function(res){
				/* 결과를 통해 span css 수정 */
				$('#span_nickname').text(res.text).css("color", res.color);
				/* 중복 결과 저장 변수에 결과 반영 */
				isCurrentNickName = res.dupResult;
			},
			error: function(xhr, textStatus, errorThrown){}
		});
}








