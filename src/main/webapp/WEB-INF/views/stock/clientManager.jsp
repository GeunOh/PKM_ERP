<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/stock/clientManager.css">

<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
<script src="https://uicdn.toast.com/tui.chart/latest/tui-chart-all.js"></script>
<title>거래처 관리</title>
</head>
<body>
	<jsp:include page="../common/template.jsp"></jsp:include>
	<!-- wrap -->
	<div id="wrap">
		<h1>거래처 관리</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Human/searchVacation">
					
					<div class="search-area">
						<span class="title">거래처명</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectDept" name="selectDept" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">사업자등록번호</span>
						<input type="text" class="txtBox wid_150" name="name">
					</div>
					
					<br>
					
					<div class="search-area downSearch">
						<span class="title">담당자</span>
						<input type="text" class="txtBox wid_150" name="name">
					</div>
					
					<div class="search-area downSearch">
						<span class="title">연락처</span>
						<input type="text" class="txtBox wid_150" name="name">
					</div>
					
					<div class="search-area">
						<span class="title">비고</span>
						<input type="text" class="txtBox wid_150" name="name">
					</div>
			
					<button id="searchBtn">검색</button>
				</form>
			</div>
		</div>
		<!-- // 검색 영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="addBtn">추가</label>
			<label id="downBtn" onclick="location.href='/Human/excelDown'"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- 거래처 테이블 -->
		<table id="clientTable" class="tables">
			<thead>
				<tr>
					<th>거래처명</th>
					<th>사업자등록번호</th>
					<th>담당자</th>
					<th>연락처</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td>자바 개발회사</td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<!-- // 거래처 테이블 -->
		<!-- 거래처 차트 -->
		<div class="clientChart" id="pieChart">
			<div id="chart-area"></div>
		</div>
		
		<div class="clientChart" id="columnChart">
			<div id="columnChart-area"></div>
		</div>
		
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/stock/clientManager.js"></script>
	<script>
		/* pie Chart */
		var chart = tui.chart;
		var container = document.getElementById('chart-area');
		var data = {
		    categories: ['Browser'],
		    series: [
		        {
		            name: 'Chrome',
		            data: 46.02
		        },
		        {
		            name: 'IE',
		            data: 20.47
		        },
		        {
		            name: 'Firefox',
		            data: 17.71
		        },
		        {
		            name: 'Safari',
		            data: 5.45
		        },
		        {
		            name: 'Opera',
		            data: 3.10
		        },
		        {
		            name: 'Etc',
		            data: 7.25
		        }
		    ]
		};
		var options = {
		    chart: {
		        width: 500,
		        height: 300,
		        title: '거래처별 거래현황',
		        format: function(value, chartType, areaType, valuetype, legendName) {
		            if (areaType === 'makingSeriesLabel') { // formatting at series area
		                value = value + '%';
		            }

		            return value;
		        }
		    },
		    series: {
		        radiusRange: ['40%', '100%'],
		        showLabel: false
		    },
		    tooltip: {
		        suffix: '%'
		    },
		    legend: {
		        align: 'right'
		    },	
		    /* 우측 메뉴 삭제 */
		    chartExportMenu: {
		    	visible: false
		    }
		};
		var theme = {
		    series: {
		        series: {
		            colors: [
		                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
		                '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
		            ]
		        },
		        label: {
		            color: '#fff',
		            fontFamily: 'sans-serif'
		        }
		    }
		};

		// For apply theme

		chart.registerTheme('myTheme', theme);
		options.theme = 'myTheme';

		chart.pieChart(container, data, options);
		
		/* Column Chart */
		var container = document.getElementById('columnChart-area');
		var data = {
		    categories: ['May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
		    series: [
		        {
		            name: 'Budget',
		            data: [4000, 5000, 3000, 5000, 7000, 6000, 4000, 1000]
		        },
		        {
		            name: 'Income',
		            data: [7000, 8000, 1000, 7000, 2000, 7000, 3000, 5000]
		        },
		        {
		            name: 'Expenses',
		            data: [-5000, -4000, -4000, -6000, -3000, -4000, -5000, -7000]
		        },
		        {
		            name: 'Debt',
		            data: [-3000, -6000, -3000, -3000, -1000, -2000, -4000, -3000]
		        }
		    ]
		};
		var options = {
		    chart: {
		        width: 500,
		        height: 300,
		        title: 'Monthly Revenue',
		        "format": "1,000"
		    },
		    yAxis: {
		        title: 'Amount',
		        min: -10000,
		        max: 10000
		    },
		    xAxis: {
		        title: 'Month'
		    },
		    legend: {
		        visible: false
		    },
		    chartExportMenu: {
		    	visible: false /* 우측 메뉴 삭제 */
		    },
		    
		};
		var theme = {
		    series: {
		        colors: [
		            '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
		            '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
		        ]
		    }
		};

		// For apply theme

		// tui.chart.registerTheme('myTheme', theme);
		// options.theme = 'myTheme';

		tui.chart.columnChart(container, data, options);

	</script>
</body>
</html>