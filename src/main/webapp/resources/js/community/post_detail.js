

$(function(){
	
	$("#write_comment_bt").on("click", async function(){
		var result = await writeComment(null);
		console.log(result);
	});
	
	
});




async function importComment(){
	$("#main_layout").data("postIdx");
}




async function writeComment(parent_idx){
	
	let comment = $("#input_comment").val();

	let payload = {
		post_idx: $("#main_layout").data("postIdx"),
		content: comment
	};
	
	if(parent_idx != null){
		payload.parent_idx = parent_idx;
	}
	
	try{
		const res = await $.ajax({
			type: "post",
			url: "WriteComment",
			dataType: "json",
			data:payload
		});
		
		$("#comment-root-layout");
		
	}catch(e){return false};
	
	
}
