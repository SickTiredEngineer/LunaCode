

//
//$(function () {
//  // 현재 URL
//  var url   = new URL(window.location.href);
//  var path  = url.pathname; // 예: /luna_code/MemberLogin
//  var error = url.searchParams.get('error') === 'true';
//
//  // 모달 DOM
//  var modalEl = document.getElementById('loginModal');
//  if (!modalEl) return;
//
//  // Spring Security가 login-page로 리다이렉트해서 도착한 경우 자동 오픈
//  if (path.endsWith('/MemberLogin')) {
//    if (error) {
//      alert('아이디 또는 비밀번호가 올바르지 않습니다.');
//    } else {
//      alert('로그인이 필요합니다.');
//    }
//    var modal = new bootstrap.Modal(modalEl, { backdrop: 'static' });
//    modal.show();
//  }
//});
