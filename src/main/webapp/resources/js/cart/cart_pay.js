
// 페이지의 모든 HTML이 완전히 로드되면 아래 코드를 실행합니다.
document.addEventListener('DOMContentLoaded', function() {

    // 페이지 요소(DOM) 및 변수 준비
    const paymentOptions = document.querySelectorAll('.payment-option');
    const checkoutButton = document.querySelector('.cart-actions .positive-button');
    let selectedPayMethod = ''; // 사용자가 선택한 결제 수단을 저장할 변수

    // 결제 수단 선택 기능
    paymentOptions.forEach(option => {
        option.addEventListener('click', function() {
            // 모든 결제 수단의 선택 효과(테두리 등)를 우선 제거
            paymentOptions.forEach(opt => opt.classList.remove('selected'));
            // 현재 클릭한 것에만 선택 효과를 추가
            this.classList.add('selected');

            // 클릭한 결제 수단의 이름을 가져옴
            const paymentType = this.querySelector('span').textContent.trim();

            // 이름에 따라 포트원이 요구하는 형식의 값으로 변환하여 변수에 저장
            if (paymentType === '카카오 페이') {
                selectedPayMethod = 'kakaopay';
            } else if (paymentType === '네이버 페이') {
                selectedPayMethod = 'naverpay';
            } else if (paymentType === '신용 / 체크카드') {
                selectedPayMethod = 'card';
            }
        });
    });


    // '결제하기' 버튼 클릭 이벤트 연결
    if (checkoutButton) {
        checkoutButton.addEventListener('click', function(e) {
            // a 태그의 기본 기능인 페이지 이동막기
            e.preventDefault();

            // 결제 수단을 선택했는지 확인하고, 선택하지 않았다면 알림을 띄움
            if (selectedPayMethod === '') {
                return alert('결제 수단을 선택해주세요.');
            }

            // 아임포트(IMP) 객체를 직접 호출하여 결제창을 띄움
            const IMP = window.IMP;
            if (!IMP) {
                return alert("결제 라이브러리(iamport.js)를 로드하지 못했습니다.");
            }
            
            // 포트원의 공용 만능 테스트 ID("iamport") 사용
            IMP.init("iamport"); 

            // 결제에 필요한 정보들을 모아서 포트원에 전달
            IMP.request_pay({
                pg: "html5_inicis", // KG이니시스 테스트 결제
                pay_method: selectedPayMethod, // [2단계]에서 사용자가 선택한 결제 수단
                merchant_uid: "order_no_" + new Date().getTime(), // 매번 다른 주문번호를 생성
                name: document.querySelector('.product-name').textContent, // HTML에서 상품명 가져오기
                amount: parseInt(document.querySelector('.total-price').textContent.replace(/[^0-9]/g, ''), 10), // HTML에서 가격 가져오기
                buyer_email: "test@iamport.kr", // 테스트용 구매자 이메일
                buyer_name: "구매자이름", // 테스트용 구매자 이름
                buyer_tel: "010-1234-5678", // 테스트용 구매자 번호
            }, function (rsp) { // 결제창이 닫힌 후 결과를 받는 함수(콜백 함수)
                if (rsp.success) {
                    // 결제 성공 시
                    alert("결제에 성공했습니다!");
                    // 결제 완료 페이지로 이동
                    location.href = "CartOrder"; 
                } else {
                    // 결제 실패 시
                    alert("결제에 실패했습니다. 에러: " + rsp.error_msg);
                }
            });
        });
    } else {
        // '결제하기' 버튼을 찾지 못한 경우, 개발자에게 알려줍니다.
        console.error("'결제하기' 버튼을 찾을 수 없습니다. HTML 클래스명을 확인해주세요.");
    }
});