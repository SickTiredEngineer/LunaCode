// 페이지의 모든 HTML이 완전히 로드되면 아래 코드를 실행합니다.
document.addEventListener('DOMContentLoaded', function() {

    // 페이지 요소(DOM) 및 변수 준비
    const paymentOptions = document.querySelectorAll('.payment-option');
    const checkoutButton = document.querySelector('.cart-actions .positive-button');
    let selectedPayMethod = ''; // 사용자가 선택한 결제 수단을 저장할 변수

    // 결제 수단 선택 기능
    paymentOptions.forEach(option => {
        option.addEventListener('click', function() {
            paymentOptions.forEach(opt => opt.classList.remove('selected'));
            this.classList.add('selected');
            const paymentType = this.querySelector('span').textContent.trim();
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
            e.preventDefault();

            const container = document.querySelector('.payment-container');
            // parseInt를 사용하여 문자열을 숫자로 변환합니다.
            const totalAmount = parseInt(container.dataset.totalAmount, 10);

            // =======================================================================
            // ★★★ 0원 결제 테스트를 위한 로직 ★★★
            // 나중에 실제 서비스 운영 시, 이 if (totalAmount === 0) { ... } else { ... } 블록 전체를
            // 아래 '원래 유료 결제 로직'으로 교체하면 됩니다.
            // =======================================================================
            if (totalAmount === 0) {
                // --- 0원 결제일 경우, 결제창 없이 바로 주문 처리 ---
                if (!confirm("0원 결제를 진행하여 수강 등록하시겠습니까?")) return;

                const paymentData = {
                    merchant_uid: 'luna_free_' + crypto.randomUUID(),
                    pay_method: 'free' // 결제수단을 '무료'로 기록
                };
                sendToServer(paymentData);

            } else {
                // --- 0원 이상일 경우, 원래의 유료 결제 로직 실행 ---
                if (selectedPayMethod === '') {
                    return alert('결제 수단을 선택해주세요.');
                }
                
                const IMP = window.IMP;
                if (!IMP) {
                    return alert("결제 라이브러리(iamport.js)를 로드하지 못했습니다.");
                }
                
                const merchantUid = 'luna_' + crypto.randomUUID();
                const orderName = container.dataset.orderName.trim();
                const buyerName = container.dataset.buyerName;
                const buyerEmail = container.dataset.buyerEmail;

                IMP.init("iamport"); 

                IMP.request_pay({
                    pg: "nice", // 또는 "tosspayments"
                    pay_method: selectedPayMethod,
                    merchant_uid: merchantUid,
                    name: orderName,
                    amount: totalAmount,
                    buyer_email: buyerEmail,
                    buyer_name: buyerName,
                    buyer_tel: "010-1234-5678",
                }, function (rsp) {
                    if (rsp.success) {
                        const paymentData = {
                            merchant_uid: rsp.merchant_uid,
                            pay_method: rsp.pay_method
                        };
                        sendToServer(paymentData);
                    } else {
                        alert("결제에 실패했습니다. 에러: " + rsp.error_msg);
                    }
                });
            }
            // =======================================================================
            // ★★★ 0원 결제 테스트 로직 끝 ★★★
            // =======================================================================
        });
    }

    // [공통 함수] 서버에 결제 완료 정보를 전송하는 함수
    function sendToServer(paymentData) {
        const cartIdxList = JSON.parse(document.querySelector('.payment-container').dataset.cartIdxList);

        fetch('/luna_code/PaymentComplete?cart_idx_list=' + cartIdxList.join(','), {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(paymentData)
        })
        .then(response => response.text())
        .then(data => {
            if (data === 'success') {
                alert("주문 처리가 완료되었습니다.");
                location.href = "CartOrder?order_id=" + paymentData.merchant_uid;
            } else {
                alert("주문 처리 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert("주문 처리 중 통신 오류가 발생했습니다.");
        });
    }
});


/*
// =======================================================================
// ★★★ 나중에 0원 결제 테스트가 끝나고 원래대로 복구할 때 사용할 코드 ★★★
// checkoutButton.addEventListener('click', ... ) 부분을 아래 코드로 교체하면 됩니다.
// =======================================================================
if (checkoutButton) {
    checkoutButton.addEventListener('click', function(e) {
        e.preventDefault();

        if (selectedPayMethod === '') {
            return alert('결제 수단을 선택해주세요.');
        }
        
        const IMP = window.IMP;
        if (!IMP) {
            return alert("결제 라이브러리(iamport.js)를 로드하지 못했습니다.");
        }

        const merchantUid = 'luna_' + crypto.randomUUID();
        const container = document.querySelector('.payment-container');
        const totalAmount = container.dataset.totalAmount;
        const orderName = container.dataset.orderName.trim();
        const buyerName = container.dataset.buyerName;
        const buyerEmail = container.dataset.buyerEmail;

        IMP.init("iamport"); 

        IMP.request_pay({
            pg: "nice", // 또는 "tosspayments"
            pay_method: selectedPayMethod,
            merchant_uid: merchantUid,
            name: orderName,
            amount: totalAmount,
            buyer_email: buyerEmail,
            buyer_name: buyerName,
            buyer_tel: "010-1234-5678",
        }, function (rsp) {
            if (rsp.success) {
                const paymentData = {
                    merchant_uid: rsp.merchant_uid,
                    pay_method: rsp.pay_method
                };
                sendToServer(paymentData);
            } else {
                alert("결제에 실패했습니다. 에러: " + rsp.error_msg);
            }
        });
    });
}
*/