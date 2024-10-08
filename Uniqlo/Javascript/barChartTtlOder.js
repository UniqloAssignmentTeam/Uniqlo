﻿color = Chart.helpers.color;

var months = ["Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun"];

var chartColors = {
	red: 'rgb(255, 99, 132)',
	blue: 'rgb(54, 162, 235)',
};

const ttlOrder = [40, 50, 30, 60, 70, 80, 70];
const ttlDelivered = [30, 40, 30, 50, 60, 70, 60];


var barData = {
	labels: months,
	datasets: [{
		label: 'Total Order',
		backgroundColor: color(chartColors.red).alpha(0.5).rgbString(),
		borderColor: chartColors.red,
		borderWidth: 1,
		data: ttlOrder
	}, {
		label: 'Total Delivered',
		backgroundColor: color(chartColors.blue).alpha(0.5).rgbString(),
		borderColor: chartColors.blue,
		borderWidth: 1,
		data: ttlDelivered
	}]

};

var index = 11;
var ctx = document.getElementById("barChart").getContext("2d");
var myNewChartB = new Chart(ctx, {
	type: 'bar',
	data: barData,
	options: {
		responsive: true,
		maintainAspectRatio: true,
		legend: {
			position: 'top',
		},
		scales: {
			yAxes: [{
				ticks: {
					min: 0, 
					max: 100, 
					stepSize: 20
				}
			}]
		}
	}
});

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
	

	var options = {
		title: 'Orders Completed',
		curveType: 'function',
		legend: { position: 'bottom' }
	};
	

	var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
	chart.draw(data, options);

	
}

