
const MAX_FILES = 3;

$(function(){
		
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
	
});

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