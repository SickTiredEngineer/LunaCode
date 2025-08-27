document.addEventListener('DOMContentLoaded', function() {
    if (typeof revenueData !== 'undefined') {
        const ctx = document.getElementById('revenueChart');

        // 최근 6개월 라벨 생성 (YYYY-MM 형식)
        const monthLabels = [];
        for (let i = 5; i >= 0; i--) { // 최근 6개월
            const date = new Date();
            date.setMonth(date.getMonth() - i);
            const month = (date.getMonth() + 1).toString().padStart(2, '0');
            const year = date.getFullYear();
            monthLabels.push(`${year}-${month}`);
        }

        // revenueData를 map으로 변환해서 없는 달은 0으로 채우기
        const revenueMap = {};
        revenueData.forEach(item => {
            revenueMap[item.month] = Number(item.revenue);
        });

        const chartData = monthLabels.map(month => revenueMap[month] || 0);

        // 차트 생성
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: monthLabels,
                datasets: [{
                    label: '월별 수익',
                    data: chartData,
                    fill: true,
                    borderColor: '#4A90E2',
                    borderWidth: 2,
                    backgroundColor: 'rgba(74, 144, 226, 0.2)',
                    pointRadius: 3,
                    tension: 0.3
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: { 
                        beginAtZero: true,
                        min: 0,
                        max: 1000,      // 최대값
                        ticks: { stepSize: 200 }, // 200 단위
                        grid: { color: '#E0E7F0' }
                    },
                    x: { 
                        grid: { display: false }
                    }
                },
                plugins: {
                    legend: { display: false }
                }
            }
        });
    }
});
