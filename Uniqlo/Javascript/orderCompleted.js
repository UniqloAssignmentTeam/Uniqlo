
google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var data = google.visualization.arrayToDataTable([
		['Year', 'Sales', 'Expenses'],
		['2004', 1000, 400],
		['2005', 1170, 460],
		['2006', 660, 1120],
		['2007', 1030, 540]
	]);
	var data2 = google.visualization.arrayToDataTable([
		['Year', 'Sales', 'Expenses'],
		['2004', 1000, 400],
		['2005', 1170, 460],
		['2006', 660, 1120],
		['2007', 1030, 540]
	]);
	var data3 = google.visualization.arrayToDataTable([
		['Year', 'Sales', 'Expenses'],
		['2004', 1000, 400],
		['2005', 1170, 460],
		['2006', 660, 1120],
		['2007', 1030, 540]
	]);
	var data4 = google.visualization.arrayToDataTable([
		['Year', 'Sales', 'Expenses'],
		['2004', 1000, 400],
		['2005', 1170, 460],
		['2006', 660, 1120],
		['2007', 1030, 540]
	]);

	var options = {
		title: 'Sales Report',
		curveType: 'function',
		legend: { position: 'bottom' }
	};
	var options2 = {
		title: 'Top 5 Product',
		curveType: 'function',
		legend: { position: 'bottom' }
	};
	var options3 = {
		title: 'Total Wishlist Item',
		curveType: 'function',
		legend: { position: 'bottom' }
	};
	var options4 = {
		title: 'Number of User',
		curveType: 'function',
		legend: { position: 'bottom' }
	};

	var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
	chart.draw(data, options);

	var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'));

	chart.draw(data2, options2);
	var chart = new google.visualization.LineChart(document.getElementById('curve_chart3'));

	chart.draw(data3, options3);
	var chart = new google.visualization.LineChart(document.getElementById('curve_chart4'));

	chart.draw(data4, options4);
}