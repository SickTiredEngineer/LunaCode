$(function (){
	/* 필요 위젯들 초기화 */
	const $idBtn   = $('#id_bt');
	const $pwBtn   = $('#password_bt');
	const $id_layout = $('#find_id_layout');
	const $pass_layout = $('#find_password_layout');

	/* ID, PASS 선택에 따라 Layout 스위치 하는 함수 */
	function switchTo(which){
		const showId = which === 'id';
		
		$id_layout.toggleClass('d-none', !showId)
		        .find('input,select,textarea,button').prop('disabled', !showId);
		
		$pass_layout.toggleClass('d-none', showId)
		        .find('input,select,textarea,button').prop('disabled', showId);
		
		$idBtn.toggleClass('active', showId);
		$pwBtn.toggleClass('active', !showId);
	}
	
	/* Id, Pass 선택 버튼에 이벤트 등록 */
	$idBtn.on('click', () => switchTo('id'));
	$pwBtn.on('click', () => switchTo('pw'));
	
	/* 초기 상태 -> id 로 통일 , 어차피 버튼 자체를 아이디 비번 같이 찾기로 걍 묶어서 크게 상관 없음, 필요하면 param으로 값 넘겨서 초기 상태 설정하게 코드 수정 하면 됨 */
	switchTo('id');
});
