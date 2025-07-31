/* 회원가입 입력 페이지 유효성 검사를 위한 JS파일 */





$(function (){
	
	/* 아이디 검사 연결 */
	$("#input_id").on("keyup", function(event){
		console.log($(this).val());
	});
	
	
	/* 비밀번호 Input 검사 연결 */
	$("#input_pass").on("keyup", function(event){
		
		passwordHandler($(this).val());
		
	});
	
	
	/* 작성한 비밀번호가 동일한지 확인 */
	$("#input_pass_check").on("keyup", function(event){
		
		
		
	});
	
	
	
});


/* ====================================================== */
/* 입력받은 비밀번호의 유효성 검사 및 Span에 표시 */
/* 비밀번호 조건: 대문자, 소문자, 특수문자 포함 10 글자 이상 */
function passwordHandler(pass){
	
	let msg = "비밀번호 조건: 대문자, 소문자, 특수문자, 숫자 포함 10글자 이상";	
	const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z0-9]).{10,}$/;

	let result = regex.test(pass);

	if(result){
		msg = "사용하기 적합한 비밀번호 입니다.";
	}
	
	
	

	console.log(result);
}


/* ====================================================== */
/* 입력받은 비밀번호 두개가 동일한지 검사 및 Span에 표시 */
function checkPassEqual(){
	
	let msg = "작성한 비밀번호가 동일하지 않습니다.";
	
	let pass1 = $("#input_pass").val();
	let pass2 = $("#input_pass_check").val();
	
	let isEqual = pass1 == pass2;
	
	if(isEqual){
		msg = "비밀번호 확인이 완료되었습니다.";		
	}
	
}







