/* 공통 코드 -> 멤버 타입 */
const M_TYPE_INST = "MB02"
const M_TYPE_NORMAL = "MB03"

$(function(){
	
	$("#bt_choice_normal").on("click", function(){
		confirmChoice(M_TYPE_NORMAL);
	});
	
	
	$("#bt_choice_inst").on("click", function(){
		confirmChoice(M_TYPE_INST);
	});

});

/* ============================================= */
/* 사용자 의사 확인 함수 */
function confirmChoice(memberType){
	
	let type;
	
	/* 선택한 회원 타입을 전달 */
	switch(memberType){
		/* 일반 회원 */
		case M_TYPE_NORMAL:
			type = "일반 회원"
			break;
		/* 강사 회원 */	
		case M_TYPE_INST:
			type = "강사 회원"
			break;
	}
	
	/* 사용자 의사 확인 후 다음 단계로 이동 */
	if(confirm(`${type}으로 회원 가입을 진행 하시겠습니까?`)){
		window.location.href = `TermsOfMembership?type=${memberType}`;
	}		
}

