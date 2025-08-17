// 현재 페이지의 URL에서 쿼리 파라미터를 쉽게 다룰 수 있게 도와주는 객체를 생성합니다.
const urlParams = new URLSearchParams(window.location.search);

// 'name'이라는 파라미터의 값을 가져옵니다. (예: "재생목록 1")
// (이전 페이지의 JS에서 <a href="...PlayListPlus?name=..."> 링크를 이렇게 만들었기 때문입니다.)
const playlistName = urlParams.get('name');

// 제목을 표시할 h2 태그를 선택합니다.
const playlistTitleElement = document.querySelector('.playlist-title');

// 파라미터로 받은 이름이 있고, h2 태그도 존재한다면,
if (playlistName && playlistTitleElement) {
	// h2 태그의 내용을 URL에서 가져온 이름으로 변경합니다.
	playlistTitleElement.textContent = decodeURIComponent(playlistName.replace(/\+/g, ' '));
}
