/* 회원가입 입력 페이지 유효성 검사를 위한 JS파일 */

/* ID, 닉네임 최소, 최대 글짜 수 */
const MIN = 4;
const MAX = 12;

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
$(function (){
	/* 단위: ms */
	const DEBOUNCE_DELAY = 300;
	
	/* ====================================================== */
	/* 입력 정보 검사 결과 */
	/* 사용 가능한 아이디인가? */
	let isCurrentId = false;
	/* 비밀번호 유효성 */
	let isCurrentPass = false;
	/* 비밀번호 확인 결과 */
	let isEqualPass = false;
	/* 사용 가능한 닉네임인가? */
	let isCurrentNickName = false;
	/* 사용 가능한 이메일인가? */
	let isCurrentEmail = false;
	
	/* (강사 한정) 첨부파일 유무 */
	let isCurrentAttach = false;
	
	/* password는 ajax 필요 없어서 콜백 함수에 사용할 setter 들 정의했음 */
	function setPassRes(res){
		isCurrentPass = res;
	}
	
	function setPassEqRes(res){
		isEqualPass = res;
	}
	
	/* ====================================================== */
	/* 아이디 검사 -> debounce 0.3초 */
	$("#input_id").on("input", debounce(async function(event){
		const res = await checkRegexAndDuplication($(this).val(), 'id', '#span_id'); 
		isCurrentId = res;
		console.log("isCurrentId:", isCurrentId);
	}, DEBOUNCE_DELAY));
	
	/* 비밀번호 Input 검사 연결 */
	$("#input_pass").on("input", function(event){
		passwordHandler($(this).val(), setPassRes);
		checkPassEqual(setPassEqRes);
	});
	
	/* 작성한 비밀번호가 동일한지 확인 */
	$("#input_pass_check").on("input", function(event){
		checkPassEqual(setPassEqRes);
	});
	
	/* 이메일을 직접 입력 / 선택하여 자동 완성 */
	$("#email_selector").on("change", debounce(async function(event){
		emailSelector();
		let email = $("#input_email_1").val() + "@" + $("#input_email_2").val();
		const res = await checkRegexAndDuplication(email, 'email', '#span_email');
		isCurrentEmail = res;
		console.log("isCurrentEamil: " + isCurrentEmail);
	},DEBOUNCE_DELAY));
	
	/* 이메일 검사 */
	$("#input_email_1, #input_email_2").on("input", debounce(async function () {
		let email = $("#input_email_1").val() + "@" + $("#input_email_2").val();
		const res = await checkRegexAndDuplication(email, 'email', '#span_email');
	  	isCurrentEmail = res;
	  	console.log("isCurrentEamil: " + isCurrentEmail);
	}, DEBOUNCE_DELAY));
	
	/* 닉네임 검사 -> debounce 0.3초 */
	$("#input_nickname").on("input", debounce(async function(event){
		const res = await checkRegexAndDuplication($(this).val(), 'nickname', '#span_nickname'); 
		isCurrentNickName = res;
		console.log("isCurrentNickName: " + isCurrentNickName);
	}, DEBOUNCE_DELAY));
	
	/* ====================================================== */
	/* submit 버튼 -> 클릭 시 유효성 검사 후 submit 진행 */
	$("#submit_button").on("click", function(){
		
		const form = $("#join_form");
		
		let isNotNull = true;
		let isCurrent = true;

		form.find('input[type="text"], input[type="password"]').each(function(){
		
			if (!$(this).val() || !$(this).val().toString().trim()) {
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
		
		if(!isCurrent) {return false} 
		else {
			const url = new URL(window.location.href)
			const params = url.searchParams;
			const type = params.get("type");
			
			console.log("Member Type: " + type);
			
			form.submit()
		};
		
	});
	
});

/* ====================================================== */
// 정규식 검사
/* ====================================================== */
/* 아이디: 영어 시작, 영어 + 숫자 조합만 */
/* 닉네임: 영어, 한글 시작 + 숫자 조합만 */

/* 아이디, 닉네임 정규식 검사 함수 */
/* 중복 검사 전 1차적으로 선행하는 검사임, 따라서 ajax로 2차 검사 후 성공 msg가 지정됨 */
function regexHandler(value, type, span){

	let mainColor = "#839FD1"; 
	
	let val = (value ?? "").toString().trim();
	let regex;
	let msg;
	let failMsg;
	
	switch(type){
		/* id 정규식 검사 */
		case "id":
			regex = new RegExp(`^[A-Za-z][A-Za-z0-9]{${MIN-1},${MAX-1}}$`);
    		failMsg = `아이디는 영어로 시작하고 영어/숫자만 사용 (${MIN}~${MAX}자)`;
    		break;
    		
		/* nickname 정규식 검사 */
		case "nickname":
			regex = new RegExp(`^[가-힣A-Za-z][가-힣A-Za-z0-9]{${MIN-1},${MAX-1}}$`);
		    failMsg = `닉네임은 한글/영어 시작, 한글/영어/숫자만 사용 (${MIN}~${MAX}자)`;
    		break;
    		
    	/* email 정규식 검사 */
        case "email":
            regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            failMsg = `올바른 이메일 형식이 아닙니다.`;
            break;	
	}
		
	let result = regex.test(val);
	
	if(!result){
		msg = failMsg;
		color = "#ff0000";
		$(span).text(msg).css("color", color);
	}
	
	return result;
}

/* boolean 처리가 String으로 되어서, 임시 방편으로 작성한 함수 */
function tempSwitchBool(r){
	return r=='true'? true:false;
}

/* 입력받은 비밀번호의 정규식 검사 및 Span에 표시 */ 
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
// 중복 검사
/* ====================================================== */
async function checkRegexAndDuplication(value, type, span){
	
	let regexRes = regexHandler(value, type, span)
	if(!regexRes)return false;
	
	try{
		const res = await $.ajax({
			type: "get",
			url: "CheckDuplication",
			dataType: "json",
			data:{
				value: value,
				type: type
			}
		});
		
		$(span).text(res.text).css("color", res.color);
		return tempSwitchBool(res.dupResult);
		
	}catch(e){return false};
	
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











