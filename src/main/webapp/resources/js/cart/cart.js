document.addEventListener('DOMContentLoaded', function() {
    const selectAllCheckbox = document.getElementById('select-all');
    const itemCheckboxes = document.querySelectorAll('.cart-item .item-cell.product-info input[type="checkbox"]');
    const deleteButton = document.querySelector('.delete-button-container .positive-button');
    const cartItems = document.querySelectorAll('.cart-item');

    const totalProductPriceElem = document.querySelector('.cart-summary .summary-item:nth-child(1) .price');
    const totalDiscountPriceElem = document.querySelector('.cart-summary .summary-item:nth-child(3) .price');
    const finalPaymentPriceElem = document.querySelector('.cart-summary .total .total-price');

    function formatPrice(price) {
        return new Intl.NumberFormat('ko-KR').format(price) + '원';
    }

    function parsePrice(priceString) {
        return parseInt(priceString.replace(/[^0-9]/g, ''), 10) || 0;
    }

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

    selectAllCheckbox.addEventListener('change', function() {
        itemCheckboxes.forEach(checkbox => {
            checkbox.checked = selectAllCheckbox.checked;
        });
        updateSummary();
    });

    itemCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const allChecked = Array.from(itemCheckboxes).every(cb => cb.checked);
            selectAllCheckbox.checked = allChecked;
            updateSummary();
        });
    });
	
	// form 태그에 이벤트 리스너를 추가
    const cartForm = document.querySelector('form[action="CartPay"]');
    if (cartForm) {
        cartForm.addEventListener('submit', function(event) {
            // 현재 체크된 상품의 개수를 확인
            const checkedItems = document.querySelectorAll('input[name="selectedItems"]:checked');
            
            // 만약 체크된 상품이 하나도 없다면
            if (checkedItems.length === 0) {
                // form의 전송을 막음
                event.preventDefault(); 
                // 사용자에게 알림
                alert('결제할 상품을 선택해주세요.');
            }
        });
    }
	
    deleteButton.addEventListener('click', function() {
        const cartIdxList = [];
        cartItems.forEach(item => {
            const checkbox = item.querySelector('.item-cell.product-info input[type="checkbox"]');
            if (checkbox.checked) {
                cartIdxList.push(item.dataset.cartIdx); // JSP에 설정한 data-cart-idx 값을 가져옴
            }
        });

        if (cartIdxList.length === 0) {
            alert('삭제할 상품을 선택해주세요.');
            return;
        }

        if (confirm('선택한 상품을 삭제하시겠습니까?')) {
            // fetch API를 사용하여 서버에 비동기 삭제 요청
            fetch('CartDelete', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({ 'cartIdxList': cartIdxList })
            })
            .then(response => response.text())
            .then(data => {
                if (data === 'success') {
                    alert('선택한 상품이 삭제되었습니다.');
                    location.reload(); // 성공 시 페이지 새로고침
                } else {
                    alert('상품 삭제에 실패했습니다. 다시 시도해주세요.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('삭제 중 오류가 발생했습니다.');
            });
        }
    });

    // 페이지가 처음 로드될 때 금액을 계산하여 표시
    updateSummary();
});