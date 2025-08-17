document.addEventListener('DOMContentLoaded', function() {

    // 필요한 모든 DOM 요소를 가져옵니다.
    const selectAllCheckbox = document.getElementById('select-all');
    const itemCheckboxes = document.querySelectorAll('.cart-item .item-cell.product-info input[type="checkbox"]');
    const deleteButton = document.querySelector('.delete-button-container .positive-button');
    const cartItems = document.querySelectorAll('.cart-item');

    // 금액을 표시할 요소를 가져옵니다.
    const totalProductPriceElem = document.querySelector('.cart-summary .summary-item:nth-child(1) .price');
    const totalDiscountPriceElem = document.querySelector('.cart-summary .summary-item:nth-child(3) .price');
    const finalPaymentPriceElem = document.querySelector('.cart-summary .total .total-price');

    // 숫자를 원화(KRW) 형식의 문자열로 변환하는 함수입니다.
    function formatPrice(price) {
        return new Intl.NumberFormat('ko-KR').format(price) + '원';
    }

    // 문자열에서 숫자만 추출하는 함수입니다. (예: "500,000원" -> 500000)
    function parsePrice(priceString) {
        return parseInt(priceString.replace(/[^0-9]/g, ''), 10);
    }

    // 장바구니 요약 정보를 업데이트하는 함수입니다.
    function updateSummary() {
        let totalProductPrice = 0;
        let totalDiscountPrice = 0;

        cartItems.forEach(item => {
            const checkbox = item.querySelector('.item-cell.product-info input[type="checkbox"]');
            if (checkbox.checked) {
                const productPrice = parsePrice(item.querySelector('.item-cell:nth-child(4)').textContent);
                const discountPrice = parsePrice(item.querySelector('.item-cell:nth-child(5)').textContent);
                
                totalProductPrice += productPrice;
                totalDiscountPrice += discountPrice;
            }
        });

        const finalPayment = totalProductPrice - totalDiscountPrice;

        totalProductPriceElem.textContent = formatPrice(totalProductPrice);
        totalDiscountPriceElem.textContent = formatPrice(totalDiscountPrice);
        finalPaymentPriceElem.textContent = formatPrice(finalPayment);
    }

    // '전체 선택' 체크박스 클릭 이벤트 리스너입니다.
    selectAllCheckbox.addEventListener('change', function() {
        itemCheckboxes.forEach(checkbox => {
            checkbox.checked = selectAllCheckbox.checked;
        });
        updateSummary();
    });

    // 개별 상품 체크박스 클릭 이벤트 리스너입니다.
    itemCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const allChecked = Array.from(itemCheckboxes).every(cb => cb.checked);
            selectAllCheckbox.checked = allChecked;
            updateSummary();
        });
    });

    // '삭제' 버튼 클릭 이벤트 리스너입니다.
    deleteButton.addEventListener('click', function() {
        // 삭제하기 전에 사용자에게 확인을 받는 것이 좋습니다.
        if (confirm('선택한 상품을 삭제하시겠습니까?')) {
            const itemsToRemove = [];
            cartItems.forEach(item => {
                const checkbox = item.querySelector('.item-cell.product-info input[type="checkbox"]');
                if (checkbox.checked) {
                    itemsToRemove.push(item);
                }
            });

            if (itemsToRemove.length === 0) {
                alert('삭제할 상품을 선택해주세요.');
                return;
            }
            
            itemsToRemove.forEach(item => {
                item.remove();
            });
            
            // 삭제 후에는 itemCheckboxes와 cartItems를 다시 동기화해야 합니다.
            // 여기서는 페이지를 새로고침하거나, 복잡한 SPA가 아니라면 간단히 다시 쿼리합니다.
            // 하지만 삭제 후에는 참조가 깨지므로, 이 예제에서는 updateSummary만 호출합니다.
            // 실제 애플리케이션에서는 삭제된 항목을 반영하여 DOM 요소를 다시 가져오는 로직이 필요할 수 있습니다.
            location.reload(); // 가장 간단한 방법은 페이지를 새로고침하는 것입니다.
            // 또는 updateSummary(); 만 호출하여 금액만 갱신할 수 있습니다.
        }
    });

    // 페이지 로드 시 초기 금액을 계산합니다.
    updateSummary();
});