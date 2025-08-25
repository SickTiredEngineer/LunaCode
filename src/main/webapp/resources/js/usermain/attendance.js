function initAttendanceCharts(dailyData, monthlyData, dailyChartMaxY) {

	if (document.getElementById('dailyAttendanceChart')) {
		const dailyLabels = ['월', '화', '수', '목', '금', '토', '일'];
		const dailyCtx = document.getElementById('dailyAttendanceChart').getContext('2d');
		
		new Chart(dailyCtx, {
			type: 'bar',
			data: {
				labels: dailyLabels,
				datasets: [{
					label: '요일별 출석 횟수',
					data: dailyData,
					backgroundColor: 'rgba(74, 144, 226, 0.5)',
					borderColor: '#8baee7',
					borderWidth: 1
				}]
			},
			options: {
				maintainAspectRatio: false,
				scales: {
					y: {
						beginAtZero: true,
						max: dailyChartMaxY,
						ticks: {
							display: false
						},
						grid: {
							display: false
						},
						border: {
							display: false
						}
					},
					x: {
						grid: {
							display: false,
						},
						border: {
							display: false
						}
					}
				},
				plugins: {
					legend: {
						display: false
					}
				}
			}
		});
	}

	if (document.getElementById('monthlyAttendanceChart')) {
		const monthlyLabels = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
		const monthlyCtx = document.getElementById('monthlyAttendanceChart').getContext('2d');
		
		new Chart(monthlyCtx, {
			type: 'line',
			data: {
				labels: monthlyLabels,
				datasets: [{
					label: '월별 출석일 수',
					data: monthlyData,
					fill: true,
					backgroundColor: 'rgba(74, 144, 226, 0.2)',
					borderColor: '#4A90E2',
					borderWidth: 2,
					pointBackgroundColor: '#8baee7',
					pointRadius: 3,
					tension: 0.3
				}]
			},
			options: {
				maintainAspectRatio: false,
				scales: {
					y: { 
						beginAtZero: true, 
						grid: { 
							color: '#E0E7F0' 
						} 
					},
					x: { 
						grid: { 
							display: false 
						} 
					}
				},
				plugins: {
					legend: { 
						display: false 
					}
				}
			}
		});
	}
}