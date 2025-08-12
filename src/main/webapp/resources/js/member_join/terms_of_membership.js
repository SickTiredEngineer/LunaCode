

$(function(){
	
	const url = new URL(window.location.href)
	const params = url.searchParams;
	const type = params.get("type");
		
	$("#bt_confirm").on("click", function(event){
		
		/* 약관에 동의하지 않을 시, 알람과 함께 회원가입 진행 거부 */
		if(!$("#check_agree").is(':checked')){			
			alert("약관에 동의하지 않으시면 회원가입을 진행하실 수 없습니다.")
			return;
		}

		window.location.href = `JoinForm?type=${type}`;
	});

});