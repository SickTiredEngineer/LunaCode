document.addEventListener('DOMContentLoaded', function() {
    
    /**
     * ===================================================================
     * 1. 월별 수익 차트 (Area Chart) - 최근 6개월
     * ===================================================================
     */
    if (typeof revenueData !== 'undefined' && document.getElementById('revenueChart')) {
        const revenueCtx = document.getElementById('revenueChart');

        // 1. [핵심] 최근 6개월치 X축 라벨을 JS에서 직접 생성 (예: '2025-03', '2025-04', ...)
        const revenueLabels = [];
        for (let i = 5; i >= 0; i--) {
            const date = new Date();
            date.setMonth(date.getMonth() - i);
            const month = (date.getMonth() + 1).toString().padStart(2, '0');
            const year = date.getFullYear();
            revenueLabels.push(`${year}-${month}`);
        }

        // 2. [핵심] 서버에서 받은 데이터를 { 'YYYY-MM': revenue } 형태의 맵으로 변환 (빠른 조회를 위함)
        const revenueMap = {};
        revenueData.forEach(item => {
            revenueMap[item.month] = Number(item.revenue);
        });

        // 3. [핵심] 직접 생성한 라벨을 기준으로, 맵에서 데이터를 찾아 채워넣습니다. 없는 달은 0으로 처리.
        const chartData = revenueLabels.map(month => revenueMap[month] || 0);

        // 4. 차트 생성
        new Chart(revenueCtx, {
            type: 'line',
            data: {
                labels: revenueLabels, // 직접 생성한 라벨 사용
                datasets: [{
                    label: '월별 수익',
                    data: chartData,      // 위에서 가공한 데이터 사용
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
                scales: { y: { 
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
                plugins: { legend: { display: false } }
            }
        });
    }

    /**
     * ===================================================================
     * 2. 월별 신규 수강생 차트 (Bar Chart) - 올해 12개월
     * ===================================================================
     */
    if (typeof studentCountData !== 'undefined' && document.getElementById('studentChart')) {
        const studentCtx = document.getElementById('studentChart');
        
        // 1. [핵심] 올해 1월부터 12월까지의 X축 라벨을 JS에서 직접 생성
        const studentLabelsFull = []; // 'YYYY-MM' 형식
        const currentYear = new Date().getFullYear();
        for (let i = 1; i <= 12; i++) {
            const month = i.toString().padStart(2, '0');
            studentLabelsFull.push(`${currentYear}-${month}`);
        }
        
        // 2. [핵심] 서버 데이터를 맵으로 변환
        const studentMap = {};
        studentCountData.forEach(item => {
            studentMap[item.month] = Number(item.student_count);
        });
        
        // 3. [핵심] 생성한 라벨 기준으로 데이터 채우기 (없는 달은 0)
        const studentChartData = studentLabelsFull.map(month => studentMap[month] || 0);
        
        // 4. 차트에 표시될 라벨은 '1월', '2월' 형식으로 변경
        const displayLabels = studentLabelsFull.map(month => new Date(month).getMonth() + 1 + '월');

        new Chart(studentCtx, {
            type: 'bar',
            data: {
                labels: displayLabels,
                datasets: [{
                    label: '신규 수강생 수',
                    data: studentChartData,
                    backgroundColor: 'rgba(94, 135, 201, 0.7)',
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: { y: { beginAtZero: true, ticks: { stepSize: 1 } } },
                plugins: { legend: { display: false } }
            }
        });
    }
});