/* 회원가입 입력 페이지 유효성 검사를 위한 JS파일 */

/* ID, 닉네임 최소, 최대 글짜 수 */
const MIN = 4;
const MAX = 12;
/* 최대 증빙자료 갯수 */
const MAX_FILES = 3;

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
	const DEBOUNCE_DELAY_PHONE = 100;
	const MAX_ATTACHMENT = 3;
	
	/* Date Picker Option */
	const datePickerOptions = {
		dateFormat: "yy-mm-dd",
		maxDate: new Date(),
		showOtherMonths: true,        
		selectOtherMonths: true, 
		changeMonth: true,
		changeYear: true,      
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년',
		onSelect: function(dateText){
			$("#input_birth").val(dateText);
    		$("#calendar_box").hide(); 
		}
	}

	/* ====================================================== */
	/* 아이디 검사 -> debounce 0.3초 */
	$("#input_id").on("input", debounce(async function(event){
		this.value = this.value
			.replace(/[^a-zA-Z0-9]/g, "")   // 영문/숫자 이외 제거
			.replace(/^([^a-zA-Z])/, "");   // 맨 앞이 영문 아니면 제거
		const res = await checkRegexAndDuplication($(this).val(), 'id', '#span_id'); 
	}, DEBOUNCE_DELAY));
	
	/* 비밀번호 Input 검사 연결 */
	$("#input_pass").on("input", function(event){
		passwordHandler($(this).val());
		checkPassEqual();
	});
	
	/* 작성한 비밀번호가 동일한지 확인 */
	$("#input_pass_check").on("input", function(event){
		checkPassEqual();
	});
	
	/* 이름 정규식 핸들러 -> 한글, 영어만 허용하게 설정해둠 */
	$("#input_name").on("keyup", function(event){
		this.value = this.value.replace(/[^가-힣a-zA-Z]/g, "");
	});
	
	/* 선택자로 이메일 선택해도 검사 진행해야 하니까.. */
	$("#email_selector").on("change", debounce(async function(event){
		emailSelector();
		let email = $("#input_email_1").val() + "@" + $("#input_email_2").val();
		const res = await checkRegexAndDuplication(email, 'email', '#span_email');
	},DEBOUNCE_DELAY));
	
	/* 이메일 검사 */
	$("#input_email_1, #input_email_2").on("input", debounce(async function () {
		let email = $("#input_email_1").val() + "@" + $("#input_email_2").val();
		const res = await checkRegexAndDuplication(email, 'email', '#span_email');
	}, DEBOUNCE_DELAY));
	
	/* 닉네임 검사 -> debounce 0.3초 */
	$("#input_nickname").on("input", debounce(async function(event){
		const res = await checkRegexAndDuplication($(this).val(), 'nickname', '#span_nickname'); 
	}, DEBOUNCE_DELAY));
	
	/* 전화번호 정규식 및 중복 검사 -> 전화번호는 replace ()string -> "") 과정 필요하여 0.1초로 지정했음 */
	$("#input_phone").on("input", debounce(async function(){
		this.value = this.value.replace(/[^0-9]/g, "");
		const res = await checkRegexAndDuplication($(this).val(),'phone', '#span_phone');
	},DEBOUNCE_DELAY_PHONE));
	
	/* 생일 날짜 선택 */
	$("#calendar_box").datepicker(datePickerOptions);
	
	$("#date_picker").on("click", function(){
		$("#calendar_box").toggle();
		
		let offset = $(this).offset();
	    $("#calendar_box").css({
	      top: offset.top + $(this).outerHeight(),
	      left: offset.left
	    });
	});

	$('#add_attachment_bt').on('click', function(){
		const count = $("#attachement_area .file-input-box").length;
		if(count >= MAX_FILES) return;
		const nextIdx = count + 1;
		$("#attachement_area").append(boxTemplate(nextIdx));
		reindex();
	});
	
	$('#attachement_area').on('change', 'input[type="file"]', function(){
		const files = this.files;
		const fileName = files && files.length ? files[0].name : '선택된 파일 없음';
		const $disp = $(`#${this.id}_name`);
		if($disp.length) $disp.val(fileName);
	});


	$('#attachement_area').on('click', '.remove-attach', function(){
	    $(this).closest('.file-input-box').remove();
	    reindex();
	});
	
	/* TODO: 최종 검사 중복 부분 함수화 필요 */
	$("#submit_button").on("click", async function(){
		
		const form = $("#join_form");
		let isNotNull = true;
		/* =============== */
		/* 빈칸 검사 */
		form.find('input[type="text"], input[type="password"]').each(function(){
		
			if (!$(this).val() || !$(this).val().toString().trim()) {
		        alert("정보가 비어있습니다. 해당 정보를 정확히 입력해주세요!");
		        $(this).focus();
		        isNotNull = false;
		        return false; 
		    }
		});
		
		if(!isNotNull) return false;
		
		/* =============== */
		/* 중복 및 정규식 검사 TODO: 함수화 해서 코드 간소화 필요 */
		
		/* ID 최종 결과 핸들링 */	
		if(!await checkRegexAndDuplication($("#input_id").val(), 'id', '#span_id')){
			alert($("#span_id").text());
			$("#input_id").focus();
			return false;
		}
		
		/* 비밀번호 최종 결과 핸들링 */
		if(!passwordHandler($("#input_pass").val())||!checkPassEqual()){
			alert($("#span_pass").text());
			return false;
		}
		
		if(!await checkRegexAndDuplication($("#input_phone").val(), 'phone', '#span_phone')){
			alert($("#span_phone").text());
			$("#input_phone").focus();
			return false;
		}
		
		if(!await checkRegexAndDuplication($("#input_nickname").val(), 'nickname', '#span_nickname')){
			alert($("#span_nickname").text());
			$("#input_nickname").focus();
			return false;
		}
		
		if(!await checkRegexAndDuplication($("#input_email_1").val() + "@" + $("#input_email_2").val(), 'email', '#span_email')){
			alert($("#span_email").text());
			$("#input_email_1").focus();
			return false;
		}

		/* 검사 결과 문제 없으면 submit 진행 */
		form.submit();

	});
	
	reindex();
	
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
            
        /* phone 정규식 검사 */
    	case "phone":
    		// 010 으로 시작, 총 11자리 숫자
    		regex = /^010\d{8}$/;
    		failMsg = `전화번호는 010으로 시작하는 11자리 숫자여야 합니다.`;
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
function passwordHandler(pass){
	// 정규식 => 비밀번호 조건: 대문자, 소문자, 특수문자 포함 10 글자 이상
	const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z0-9]).{10,}$/;
	// 입력받은 비밀번호 검사
	let result = regex.test(pass);
	// Span에 출력할 Text, Color 지정
	let msg = result? "사용하기 적합한 비밀번호 입니다.":"비밀번호 조건: 대문자, 소문자, 특수문자, 숫자 포함 10글자 이상";
	let color = result? "#839FD1":"#ff0000";
	
	$("#span_pass").text(msg).css("color", color);
	
	return result;
}

/* 입력받은 비밀번호 두개가 동일한지 검사 및 Span에 표시 */
function checkPassEqual(){
	// 처음 작성한 비밀번호와 확인 폼에 작성한 비밀번호가 동일한가?
	let isEqual = $("#input_pass").val() == $("#input_pass_check").val();
	// 동일 여부에 따라 Text, Color 지정
	let msg = isEqual? "비밀번호 확인이 완료되었습니다.":"작성한 비밀번호가 동일하지 않습니다";
	let color = isEqual? "#839FD1": "#FF0000";
	
	$("#span_pass_check").text(msg).css("color", color);

	return isEqual;
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

/* ====================================================== */
/* 첨부파일 관련 로직 */
/* ====================================================== */
/* 첨부파일 추가 양식 */
function boxTemplate(idx){
    const n = String(idx).padStart(2,'0');
    const fileId = `certificate_${n}`;
    return `
      <div class="d-flex flex-row input-form-layout file-input-box">
        <input type="file" name="certificate_${n}" id="${fileId}"
               class="input-form-size common-input-form" style="display:none;">
        <input type="text" id="${fileId}_name"
               class="input-form-size common-input-form" placeholder="선택된 파일 없음" readonly>
        <label for="${fileId}">
          <div class="positive-button attach-bt-margin">파일 선택</div>
        </label>
        <button type="button" class="negative-button remove-attach">삭제</button>
      </div>`;
}

/* 삭제, 추가 등 고려 시 첨부파일에 다시 index 지정하는 함수임 */
function reindex(){
    const $boxes = $("#attachement_area .file-input-box");
    $boxes.each(function(i){
      const idx = i + 1;
      const n = String(idx).padStart(2,'0');
      const fileId = `certificate_${n}`;
      const $file = $(this).find('input[type="file"]');
      const $text = $(this).find('input[type="text"]');
      const $label = $(this).find('label');

      $file.attr({ name: `certificate_${n}`, id: fileId });
      $text.attr('id', `${fileId}_name`);
      $label.attr('for', fileId);
    });

    // 추가 버튼 on/off
    $("#add_attachment_bt").prop('disabled', $boxes.length >= MAX_FILES);
}

