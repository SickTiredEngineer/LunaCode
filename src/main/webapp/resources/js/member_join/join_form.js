/* 회원가입 입력 페이지 유효성 검사를 위한 JS파일 */
$(function (){
	
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

	function setIdRes(res){
		isCurrentId = res;
		console.log("setIdRes: " + isCurrentId);
	}
	
	function setPassRes(res){
		isCurrentPass = res;
	}
	
	function setPassEqRes(res){
		isEqualPass = res;
	}
	
	function setNickRes(res){
		isCurrentNickName = res;
	}

	/* ====================================================== */
	/* ID, PASS SPAN */
	/* 아이디 검사 연결 */
	$("#input_id").on("keyup", function(event){
		checkIdDuplication($(this).val(), setIdRes);
		console.log("isCurrentId: " + isCurrentId);
	});
	
	/* 비밀번호 Input 검사 연결 */
	$("#input_pass").on("keyup", function(event){
		passwordHandler($(this).val(), setPassRes);
		checkPassEqual(setPassEqRes);
	});
	
	/* 작성한 비밀번호가 동일한지 확인 */
	$("#input_pass_check").on("keyup", function(event){
		checkPassEqual(setPassEqRes);
	});
	
	/* ====================================================== */
	/* 이메일을 직접 입력 / 선택하여 자동 완성 */
	$("#email_selector").on("change", function(event){
		emailSelector();
	});
	
	/* ====================================================== */
	/* 닉네임 검사 */
	$("#input_nickname").on("keyup", function(event){
		checkNickNameDuplication($(this).val(), setNickRes);
	});
	
	/* ====================================================== */
	/* 이메일 검사 */
	$("#input_email_1").on("keyup", function(){
		checkEmailDuplication();
	});
	
	$("#input_email_2").on("keyup", function(){
		checkEmailDuplication();
	});
	
	/* ====================================================== */
	$("#join_form").on("submit", function(event){
		
		
		console.log("Last Check: " + isCurrentId);
		console.log("Last Check: " + isCurrentPass);
		console.log("Last Check: " + isEqualPass);
		console.log("Last Check: " + isCurrentNickName);
		
		const form = this;
		let isNotNull = true;
		let isCurrent = true;
		
		event.preventDefault();

		$("#join_form").find('input[type="text"], input[type="password"]').each(function(){
		
			if(!$(this).val().trim()){
				alert("정보가 비어있습니다. 해당 정보를 정확히 입력해주세요!");
				$(this).focus();
				isNotNull = false;
				return false;
			}
		});
		
		if(!isNotNull) return false;
			
		let checks = [
			{ ok: isCurrentId,        msg: "아이디가 올바르게 작성 되었는지 확인하세요!",     focus: "#input_id" },
			{ ok: isCurrentPass,      msg: "비밀번호가 올바르게 작성 되었는지 확인하세요!",   focus: "#input_pass" },
			{ ok: isEqualPass,        msg: "비밀번호 확인이 올바르지 않습니다!",             focus: "#input_pass_check" },
			{ ok: isCurrentNickName,  msg: "닉네임이 올바르게 작성 되었는지 확인하세요!",     focus: "#input_nickname" },
		];
		
		console.log(checks);
	
		for (var c of checks) {
			if (!c.ok) {
			  alert(c.msg);
			  $(c.focus).focus();
			  isCurrent = false;
			  break;
			}	
		}
		
		if(!isCurrent) {return false} else {form.submit()};
		
		const url = new URL(window.location.href)
		const params = url.searchParams;
		const type = params.get("type");
		
		console.log("Member Type: " + type);
		
		form.submit()

	});
	
});

/* ====================================================== */
/* 아이디, 닉네임 정규식 검사 함수 */
function regexHandler(input, span){
	const regex = /^[A-Za-z0-9]+$/;
	
	let result = regex.test(input);

	let msg;
	let color;
	
	if(!result){
		msg = "숫자, 영어 조합만 사용가능"
		color = "#ff0000"
	}
	
	$(span).text(msg).css("color", color);
	
	return result;
}

/* 아이디 중복 검사 함수 */
function checkIdDuplication(user_id, callback){
	
	let regexResult = regexHandler(user_id, '#span_id');
	
	if(!regexResult){
		callback(regexResult);
		return false;
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
			callback(res.dupResult);
		},
		error: function(xhr, textStatus, errorThrown){}
	});
}

/* ====================================================== */
/* 입력받은 비밀번호의 유효성 검사 및 Span에 표시 */ 
function passwordHandler(pass, callback){
	// 정규식 => 비밀번호 조건: 대문자, 소문자, 특수문자 포함 10 글자 이상
	const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z0-9]).{10,}$/;
	// 입력받은 비밀번호 검사
	let result = regex.test(pass);
	// Span에 출력할 Text, Color 지정
	let msg = result? "사용하기 적합한 비밀번호 입니다.":"비밀번호 조건: 대문자, 소문자, 특수문자, 숫자 포함 10글자 이상";
	let color = result? "#839FD1":"#ff0000";
	
	$("#span_pass").text(msg).css("color", color);
	callback(result);
}

/* ====================================================== */
/* 입력받은 비밀번호 두개가 동일한지 검사 및 Span에 표시 */
function checkPassEqual(callback){
	// 처음 작성한 비밀번호와 확인 폼에 작성한 비밀번호가 동일한가?
	let isEqual = $("#input_pass").val() == $("#input_pass_check").val();
	// 동일 여부에 따라 Text, Color 지정
	let msg = isEqual? "비밀번호 확인이 완료되었습니다.":"작성한 비밀번호가 동일하지 않습니다";
	let color = isEqual? "#839FD1": "#FF0000";
	
	$("#span_pass_check").text(msg).css("color", color);
	callback(isEqual);
}

/* ====================================================== */
/* 두 번째 이메일 선택 */
function emailSelector(){
	let selectedEmail = $("#email_selector").val();
	// 직접입력 (널스트링)인지 판별
	let isInputSelf = selectedEmail == "";
	// 직접입력이 아니면 입력란 비활성화
	 $("#input_email_2").attr("readonly", !isInputSelf).val(selectedEmail);
}

/* 이메일 중복 검사 함수 */
function checkEmailDuplication(){
	let email =  $("#input_email_1").val() +  $("#input_email_2").val();
	console.log(email);
}

/* ====================================================== */
/* 닉네임 중복 검사 함수 */
function checkNickNameDuplication(input_nickname, callback){
	
	let regexResult = regexHandler(input_nickname, '#span_nickname');
	
	if(!regexResult){
		return;
	}
	
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
			callback(res.dupResult);
		},
		error: function(xhr, textStatus, errorThrown){}
	});
}







