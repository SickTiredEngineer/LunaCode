

$(async function(){
	
	let isLike = await importLikes();
	
	
	console.log("AdminCheck: " + window.isAdmin);
	
	/* 좋아요 버튼 로직 */
	$("#greate_bt").on("click", async function(){
		const res = await toggleLike(isLike);	
		isLike = await importLikes();	
	});
	
	/* 댓글 작성 버튼 로직 */	
	$("#write_comment_bt").on("click", async function(){
		var res = await writeComment(null);
		console.log(res);
		$("#input_comment").val("");
		prependComment(res);
	});
	
	/* 댓글 삭제 버튼 */
	$("#comment_list").on("click", ".comment-delete", async function(){
		
		const $row = $(this).closest('.comment-row');
	
		let commentIdx = $row.data('commentIdx');
		let authorIdx = $row.data('authorIdx');
		
		const res = await deleteComment(commentIdx, authorIdx);		
		
		console.log(res);
		
		if(res != 0){
			const $br = $row.next('br');
	    	const $hr = $br.next('.horizontal-line');
	    	$row.remove(); $br.remove(); $hr.remove();	
		}

	});
	
	/* 댓글 수정 버튼 */
	$("#comment_list").on("click", ".comment-edit", function () {
		const $row = $(this).closest('.comment-row');
		const $ta  = $row.find('textarea');
		if ($row.data('editing')) return;
		$row.data('editing', true).data('orig', $ta.val());
		$ta.prop('readonly', false).focus();
		
		const $actions = $row.find('.comment-actions');
		const $modifyActions = $row.find('.comment-modify-actions');
		
		$actions.find('.comment-edit,.comment-delete').addClass('d-none'); // 아이콘 숨김
		$modifyActions.find('.comment-save,.comment-cancel').removeClass('d-none'); // 버튼 표시
	});
	
	/* 댓글 수정 취소 버튼 */
	$("#comment_list").on("click", ".comment-cancel", function () {
		const $row = $(this).closest('.comment-row');
		const $ta  = $row.find('textarea');
		$ta.val($row.data('orig')).prop('readonly', true);
		
		const $actions = $row.find('.comment-actions');
		const $modifyActions = $row.find('.comment-modify-actions');
		
		$modifyActions.find('.comment-save,.comment-cancel').addClass('d-none');
		$actions.find('.comment-edit,.comment-delete').removeClass('d-none');
		
		$row.removeData('editing').removeData('orig');
	});

	$("#comment_list").on("click", ".comment-save", async function () {
		const $row = $(this).closest('.comment-row');
		const id   = $row.data('commentIdx');
		const $ta  = $row.find('textarea');
		const val  = $ta.val().trim();
		const commentIdx = $row.data('commentIdx');
		const authorIdx = $row.data('authorIdx');
		
		if (!val) { alert('내용을 입력하세요.'); return; }
		
		try{
			
			const res = await $.ajax({
				
				type: "post",
				url: "ModifyComment",
				dataType: "json",
				data: {
					content: val,
					comment_idx: commentIdx,
					author_idx : authorIdx
				}
				
			});
			
			const $actions = $row.find('.comment-actions');
			const $modifyActions = $row.find('.comment-modify-actions');
			
			$modifyActions.find('.comment-save,.comment-cancel').addClass('d-none');
			$actions.find('.comment-edit,.comment-delete').removeClass('d-none');
			
			$row.removeData('editing').removeData('orig');
			

		}catch(e){return false}
		
		
	});
	
	
	

	
});


function tempSwitchBool(r){
	return r=='true'? true:false;
}

/* 해당 게시물의 좋아요 불러오는 함수 */
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

/* 좋아요,  좋아요 취소 동작 */
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

/* 댓글 작성 로직 */
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

		return res;
		
	}catch(e){return false};
	
}


/* 댓글 삭제 로직 */
async function deleteComment(commentIdx, authorIdx){
	
	if (!confirm('정말 삭제할까요?')) return;
	
	try{
		const res = await $.ajax({
			
			type:"post",
			url:"DeleteComment",
			dataType:"json",
			
			data:{
				comment_idx: commentIdx,
				author_idx: authorIdx
			}
		});
		
		return res;

	}catch(e){return false}
}



/* ------------ 댓글 렌더링 --------------- */
function renderCommentItem(c) {
  // 보안(표시)은 클라 편의일 뿐, 실제 권한은 서버에서 확인!
	const meIdx = window.isAuthenticated ? Number(window.me.idx) : null;
	const canEdit = (window.isAdmin === true) || (meIdx !== null && meIdx === Number(c.author_idx));
	const canDelete = canEdit || (window.isAdmin === true);

  	const $row = $(`
	    <div class="d-flex flex-row comment-row" data-comment-idx="${c.comment_idx}" data-author-idx="${c.author_idx}">
	      <div class="d-flex flex-column writer-layout">
	        <div class="d-flex flex-row justify-content-between">
	          <p class="comment-writer-text"></p>
	          <div class="comment-actions"></div>
	        </div>
	        <textarea rows="3" cols="30" class="common-input-form comment-layout" readonly="readonly"></textarea>
	        <div class="comment-modify-actions"></div>
	        
	      </div>
	    </div>
	  `);

  	$row.find('.comment-writer-text').text('작성자: ' + (c.nickname ?? ''));
  	$row.find('textarea').text(c.content ?? '');

	const $actions = $row.find('.comment-actions');
	const $modifyActions = $row.find('.comment-modify-actions');
	
  	if (canEdit) {
    	$actions.append(`<img class="icon-button-size comment-edit" src="${window.ctx}/resources/icons/icon_edit.png" alt=""/>`);	
  	}
  	
  	if (canDelete) {
    	$actions.append(`<img class="icon-button-size comment-delete" src="${window.ctx}/resources/icons/icon_delete.png" alt=""/>`);
  	}
  	
  	if(canEdit){
		$modifyActions.append(`
			<img class="confirm-bt comment-cancel d-none" src="${window.ctx}/resources/icons/icon_cancel.png">
			<img class="confirm-bt comment-save d-none" src="${window.ctx}/resources/icons/icon_check.png">
			`);
	}

  	return $row;
}

function prependComment(c) {
  	$("#comment_list").prepend('<div class="horizontal-line"></div>')
  	.prepend('<br>')
  	.prepend(renderCommentItem(c));
}




