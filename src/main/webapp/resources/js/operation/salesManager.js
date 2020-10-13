$('.selectBox').on('click',function(){
	$(this).children('ul').toggle();
	$(this).children('.fa-angle-down').toggleClass('rotate-angle');
})

$('.selectBox ul').mouseleave(function(){
	$(this).siblings('.fa-angle-down').removeClass('rotate-angle');
	$(this).hide();
})

$(document).on('click', '.link-select', function(){
	var dv = $(this).attr('data-value');
	var dt = $(this).text();
	
	$(this).parents('.selectBox').find('.link-selected').text(dt);
	$(this).parents('.selectBox').find('input').attr('data-value',dv);
	$(this).parents('.selectBox').find('input').val(dv);
	
	$(this).parents('ul').siblings('.fa-angle-down').removeClass('rotate-angle');
})

// 파라메터 추출
function getParam(sname) {
    var params = location.search.substr(location.search.indexOf("?") + 1);
    var sval = "";
    params = params.split("&");
    for (var i = 0; i < params.length; i++) {
        temp = params[i].split("=");
        if ([temp[0]] == sname) { sval = temp[1]; }
    }
    return sval;
}
window.onload = function() {
	var year = getParam('year');
	if(year == ''){
		year = new Date().getFullYear();
	}
	var inOutJson;
	$.ajax({
		url: "/Operation/getInOutCount?year="+year,
		async: false,
        success: function(data){
        	inOutJson = data;
        }
	})
	makeChart(inOutJson);
} 

function makeChart(inOutJson){
	var container = document.getElementById('chart-area');
	var data = {
	    categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    series: {
	        column: [
	            {
	                name: '입고',
	                data: [inOutJson[0].INCOUNT, inOutJson[1].INCOUNT, inOutJson[2].INCOUNT, inOutJson[3].INCOUNT,
	                	   inOutJson[4].INCOUNT, inOutJson[5].INCOUNT, inOutJson[6].INCOUNT, inOutJson[7].INCOUNT,
	                	   inOutJson[8].INCOUNT, inOutJson[9].INCOUNT, inOutJson[10].INCOUNT, inOutJson[11].INCOUNT]
	            },
	            {
	                name: '출고',
	                data: [inOutJson[0].OUTCOUNT, inOutJson[1].OUTCOUNT, inOutJson[2].OUTCOUNT, inOutJson[3].OUTCOUNT,
	                	   inOutJson[4].OUTCOUNT, inOutJson[5].OUTCOUNT, inOutJson[6].OUTCOUNT, inOutJson[7].OUTCOUNT,
	                	   inOutJson[8].OUTCOUNT, inOutJson[9].OUTCOUNT, inOutJson[10].OUTCOUNT, inOutJson[11].OUTCOUNT]
	            },
	        ],
	        line: [
	            {
	                name: '평균',
	                data: [
	                	(inOutJson[0].INCOUNT + inOutJson[0].OUTCOUNT)/2,
	                	(inOutJson[1].INCOUNT + inOutJson[1].OUTCOUNT)/2,
	                	(inOutJson[2].INCOUNT + inOutJson[2].OUTCOUNT)/2,
	                	(inOutJson[3].INCOUNT + inOutJson[3].OUTCOUNT)/2,
	                	(inOutJson[4].INCOUNT + inOutJson[4].OUTCOUNT)/2,
	                	(inOutJson[5].INCOUNT + inOutJson[5].OUTCOUNT)/2,
	                	(inOutJson[6].INCOUNT + inOutJson[6].OUTCOUNT)/2,
	                	(inOutJson[7].INCOUNT + inOutJson[7].OUTCOUNT)/2,
	                	(inOutJson[8].INCOUNT + inOutJson[8].OUTCOUNT)/2,
	                	(inOutJson[9].INCOUNT + inOutJson[9].OUTCOUNT)/2,
	                	(inOutJson[10].INCOUNT + inOutJson[10].OUTCOUNT)/2,
	                	(inOutJson[11].INCOUNT + inOutJson[11].OUTCOUNT)/2,
	                ]
	            }
	        ]
	    }
	};
	var options = {
	    chart: {
	        width: 750,
	        height: 540,
	        title: 'Month InOut Chart'
	    },
	    yAxis: [{
	       title: 'count',
	       chartType: 'column',
	       labelMargin: 15
	    }],
	    xAxis: {
	        title: 'Month'
	    },
	    series: {
	        line: {
	            showDot: true
	        }
	    },
	    tooltip: {
	        grouped: true,
	        suffix: '개'
	    },
	    plot: [{
	    	bands: {
	    		 color : ['black']
	    	}
	    }]
	};
	var theme = {
	    series: {
	        column: {
	            colors: [
	                '#00a9ff', '#ff5a46'
	            ]
	        },
	        line: {
	            colors: ['#ffb840']
	        }
	    }
	};
	// For apply theme
	tui.chart.registerTheme('myTheme', theme);
	options.theme = 'myTheme';
	var chart = tui.chart.comboChart(container, data, options);
}
