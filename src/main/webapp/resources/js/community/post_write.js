$(function(){

	/* 빈칸 검사 */
	$("#postForm").on("submit", function(e){
		e.preventDefault();
		
		let ok = true;
		
		$(this).find("input[type=text], textarea").each(function(){
		
	    	if(!$(this).val().trim()){
				alert($(this).attr("placeholder") + "을(를) 입력해주세요");
				$(this).focus();
				ok = false;
				return false; 
			}
		});
	
		if(ok) {
			this.submit();
		}
	});
});

