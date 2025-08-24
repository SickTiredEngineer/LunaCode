

$(async function(){
	
	let isLike = await importLikes();
	
	$("#write_comment_bt").on("click", async function(){
		var result = await writeComment(null);
		console.log(result);
	});

	$("#greate_bt").on("click", async function(){
		const res = await toggleLike(isLike);		
	});


});


function tempSwitchBool(r){
	return r=='true'? true:false;
}

async function importLikes(){

	try{
		const res = await $.ajax({
			type: "post",
			url: "ImportPostLike",
			dataType: "json",
			data:{
				post_idx: $("#main_layout").data("postIdx")
			}
		});
		
		$("#like_text").text(res.cnt);
		$("#greate_bt").css("background-color", res.bg_color);
		return tempSwitchBool(res.dup_res);
	}catch(e){return false}	
	
}

async function toggleLike(isLike){
	
	try{
		const res = await $.ajax({
			
			type: "post",
			url: "ToggleLike",
			dataType: "json",
			data:{
				post_idx: $("#main_layout").data("postIdx"),
				is_like: isLike
			}
		});
		
		importLikes();
		
	}catch(e){return false}
	
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
