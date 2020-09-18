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
//tui.chart.registerTheme('myTheme', theme);
//options.theme = 'myTheme';
tui.chart.columnChart(container, data, options);


