$(document).ready(function() {
	var today = new Date();
	var date = today.toISOString().substring(0, 10);
	
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[today.getDay()];
	var dateText = date+" ("+dayOfWeek+")";
	$("#yyyy-mm-dd").text(dateText);
	timePrint();
	// 시계 작동
	var timer = setInterval(function(){
	  timePrint();
	}, 1000);
	
	Currentweather();
	workWeekTime();
})
// 버튼들 클릭 이벤트
$("#vacationUseBox").on("click", function() {
	$('.popup-form').fadeIn();
})
$('h2 .fa-times').on('click',function(){
	$('.popup-form').fadeOut();
})
$('.add-btn-form button:first-child').on('click',function(){
	$('.popup-form').fadeOut();
})

// 셀렉트박스 선택시
$(".selectBox").on("click", function() {
	$(this).children("ul").toggle();
	$(this).children('.fa-angle-down').toggleClass('rotate-angle');
})
// 셀렉트박스에서 값 선택 시
$(".link-select").on("click", function() {
	var dv = $(this).attr("data-value");
	var dt = $(this).text();
	
	$(this).parents('.selectBox').find('.link-selected').text(dt);
	$(this).parents('.selectBox').find('input').attr('data-value',dv);
	$(this).parents('.selectBox').find('input').val(dv);
	
	$(this).parents('ul').siblings('.fa-angle-down').removeClass('rotate-angle');
})
// 휴가 사용 일수 계산
$("input[name='endDate']").on("change", function(){
	
	// 입력받은 날짜
	var $endDate = $(this);
	var $startDate = $("input[name='startDate']");
	
	// 연 월 일로 나누어 배열로 저장
	var endArr = $endDate.val().split('-');
	var startArr = $startDate.val().split('-');
	
	// 날짜객체로 생성
	var EndDate = new Date(endArr[0], endArr[1], endArr[2]);
	var StartDate = new Date(startArr[0], startArr[1], startArr[2]);
	
	// 차이 계산
	var diff = EndDate - StartDate;
	var currDay = 24 * 60 * 60 * 1000;	// 시 * 분 * 초 * 밀리세컨
	var useDay = diff/currDay + 1;
	
	var vacationDay = $("input[name='vacationDay']").val();	// 잔여 일수
	
	if(useDay < 1) {
		alert("종료일자는 시작일자보다 전일수 없습니다.");
		$endDate.val("");
		return;
	}
	
	// 연차부족 예외처리
	if(useDay > vacationDay) {
		alert("잔여연차가 부족합니다.");
		$endDate.val("");
		return;
	}
	
	$("#add-useDay").val(useDay + "일");
	$("input[name='useDay']").val(useDay);
	
})



function dataChk() {
	
	var vType = $("input[name='vType']").val();
	var startDate = $("input[name='startDate']").val();
	var endDate = $("input[name='endDate']").val();
		
	if(vType == ''){
		alert('휴가 구분을 선택해주세요');
		return false;
	}
	
	if(startDate == ''){
		alert('시작날짜를 선택해주세요');
		return false;
	}
	
	if(endDate == ''){
		alert('종료날짜를 선택해주세요');
		return false;
	}
	
	console.log(vType);
	// 구분이 연차가 아니면 실질 데이터를 0으로 변경하여 실 연차소모 X
	if(vType!="연차"){
		$("input[name='useDay']").val("0");
	}
	
	
	$('.popup-form').submit();
	$(".popup-form").fadeOut();
	
}

/*
메서드 이름 : timePrint
기능 : 현재 시간을 가져와서 화면에 출력합니다.
       시,분,초가 10 미만이라면 예외처리합니다.
*/
function timePrint() {
	
	var $now = new Date(); // 객체변수입니다. 현재 날짜와 시간을 반환합니다.
	var hr = $now.getHours(); // 현재 시를 가져와 hr 변수에 담습니다.
	var min = $now.getMinutes(); // 현재 분을 가져와 min 변수에 담습니다.
	var sec = $now.getSeconds(); // 현재 초를 가져와 sec 변수에 담습니다.
	
	// [공통] 시,분,초가 10 미만일때 자리수 맞춤
	// 문자열+숫자형=문자열
	// 시(hr)
	if (hr < 10) {
		$("#hh").text("0" + hr);
	} else {
		$("#hh").text(hr);
	}
	// 분(min)
	if (min < 10) {
		$("#mm").text("0" + min);
	} else {
		$("#mm").text(min);
	}
	// 초(sec)
	if (sec < 10) {
		$("#ss").text("0" + sec);
	} else {
		$("#ss").text(sec);
	}
}

//날씨
function Currentweather(){
	var apiURI = "https://api.openweathermap.org/data/2.5/onecall?lat=37.56826&lon=126.977829&cnt=5&appid=2e9f5ced9370b9912be54146e98c437b&units=metric";
	var arr = [];
	var cnt = 0;
	let weatherIcon = {
				        '01' : 'fas fa-sun', //네이버 1번
				        '02' : 'fas fa-cloud-sun', // 5번
				        '03' : 'fas fa-cloud', // 7번
				        '04' : 'fas fa-cloud-meatball', // 7번
				        '09' : 'fas fa-cloud-sun-rain', // 22번
				        '10' : 'fas fa-cloud-showers-heavy', // 10번
				        '11' : 'fas fa-poo-storm', // 18번
				        '13' : 'far fa-snowflake', // 12번
				        '50' : 'fas fa-smog' // 17번
				       };
    $.ajax({
        url: apiURI,
        dataType: "json",
        type: "GET",
        async: "false",
        success: function(resp) {
        	var Day = new Date(resp.daily[0].dt*1000);
        	//필요한 데이터 배열로
            for(var i in resp.daily){
            	if(i<=5){
            		arr[cnt++] = resp.daily[i];
            	}
            }
        	console.log(arr)
        	$currentWeatherForm = $('#currentWeatherForm');
            $forecastForm = $('#forecastForm');
            $('#currentWeatherForm').html('');
            for(var i in arr){
            	//현재날씨
            	if(i == 0){
            		$date = date_to_str(new Date(arr[i].dt*1000), 0);
            		$day = day(new Date(arr[i].dt*1000));
            		$icon = weatherIcon[arr[i].weather[0].icon.substring(0,2)];
            		$tempMax = arr[i].temp.max.toFixed(1);
            		$tempMin = arr[i].temp.min.toFixed(1);
            		
            		$current = $('<div class="current"></div>');
                	$dateForm = $('<div class="currentDate"><p>' + $date + '('+$day+')</p></div>');
                	$iconForm = $('<div class="currentIcon"><i class="'+$icon+'"></i></div>');
                	$tempForm = $('<div class="currentTemp"><span class="tempMax">'+$tempMax+"˚</span>/<span class='tempMin'>"+ $tempMin +'˚</span></div>');
                	
                	$current.append($dateForm);
                	$current.append($iconForm);
                	$current.append($tempForm);
                	$currentWeatherForm.append($current);
            	}else{//5일 예보
            		$date = date_to_str(new Date(arr[i].dt*1000), 1);
            		$day = day(new Date(arr[i].dt*1000));
            		$icon = weatherIcon[arr[i].weather[0].icon.substring(0,2)];
            		$tempMax = arr[i].temp.max.toFixed(1);
            		$tempMin = arr[i].temp.min.toFixed(1);
            		
	            	$forecast = $('<div class="forecast"></div>');
	            	$dateForm = $('<div class="dateForm"><p>' + $date + '</p><p>('+$day+')</p></div>');
	            	$iconForm = $('<div class="iconForm"><i class="'+$icon+'"></i></div>');
	            	$tempMax = $('<div class="tempForm"><span class="tempMax">'+$tempMax+'˚</span></div>');
	            	$tempMin = $('<div class="tempForm"><span class="tempMin">'+$tempMin+'˚</span></div>');
	            	
	            	$forecast.append($dateForm);
	            	$forecast.append($iconForm);
	            	$forecast.append($tempMax);
	            	$forecast.append($tempMin);
	            	$forecastForm.append($forecast);
            	}
            	
            }
            
        }
    })
}
//요일구하기
function day(date){
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[new Date(date).getDay()];
	return dayOfWeek;
}
//날짜구하기
function date_to_str(format, num) {

	var year = format.getFullYear();
	var month = format.getMonth() + 1;
	var date = format.getDate();
	
	if (month < 10) month = '0' + month;
	if (date < 10) date = '0' + date;

	if(num == 0) return year + "-" + month + "-" + date;
	else return month + "." + date;
}
//근태 주간통계 데이터
function workWeekTime(){
	var dt = new Date();
	var i = dt.getDay();
	
	var start = new Date( dt.getFullYear(), dt.getMonth(), dt.getDate()+(1-i) ); //주간 첫째날
    var end = new Date( dt.getFullYear(), dt.getMonth(), dt.getDate()+(5-i) );   //주간 마지막날
    
    var startDay = start.getFullYear() + "-" + (start.getMonth()+1) + "-" + start.getDate();
    var endDay = end.getFullYear() + "-" + (end.getMonth()+1) + "-" + end.getDate();
    $.ajax({
    	url : '/Human/myInfoWeekWorkTime',
    	data: {startDay:startDay,
    		   endDay:endDay},
    	success:function(data){
    		worktimeChart(data)
    	}
    		  
    })
}
//근태 통계 그래프
function worktimeChart(data){
	var cate = [workChangeDate(data[0].date),workChangeDate(data[1].date),workChangeDate(data[2].date),workChangeDate(data[3].date),workChangeDate(data[4].date)];
	var worktime = [changeTimeChart(data[0].worktime),changeTimeChart(data[1].worktime),changeTimeChart(data[2].worktime),changeTimeChart(data[3].worktime),changeTimeChart(data[4].worktime)]
	
	console.log(changeTimeChart(data[1].worktime))
	var chart = tui.chart;
	var container = document.getElementById('chart-area');
	var data = {
	    categories: cate,
	    series: [
	        {
	            name: '소정근로시간',
	            data: worktime
	        }
	    ]
	};
	var options = {
	    chart: {
	        width: 340,
	        height: 350,
	        // title: 'Monthly Revenue',
	        format: '0'
	    },
	    yAxis: {
	        // title: 'Month',
	        min : 0,
	        max : 10,
	        suffix: '시간'
	    },
	    xAxis: {
	       // title: 'Amount',
	        min: 100,
	        max: 9000,
	        maxWidth: 1000
	    },
        series: {
            showLabel: false
        },
	    usageStatistics: false,
	    
	    /* 우측 메뉴 삭제 */
	    chartExportMenu: {
	    	visible: false
	    },
	    
	    legend: {
	        align: 'bottom',
	        showCheckbox : false
	    },
	    
	    tooltip: {
	    	suffix : '시간',
	    	template: function(category, item) {
	    		// 0 5  9   
	    		// 0 30 60
	    		// 6초당 0.1
	    		console.log("itemValue : " + item.value)
	    		console.log("changeHour : " + changeHour(item.value))
	    		var time = changeSecond(changeHour(item.value));
	    		var tootles = '<div class="tui-chart-default-tooltip"><div class="tui-chart-tooltip-head show">' + item.legend + '</div>';
                tootles +='<div class="tui-chart-tooltip-body"><span class="tui-chart-legend-rect column" style="background-color: rgb(97, 179, 210);"></span>'
                tootles +='<span>' + item.legend + '</span><span class="tui-chart-tooltip-value">' +chartValueChangeTooltip(time)+'</span></div></div>';
                return tootles;
	        }
	    }
	};
	var theme = {
	    series: {
	        colors: [
	            '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
	            '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
	        ]
	    }
	};

	chart.columnChart(container, data, options);
}
	//툴팁 시간계산
	var chartValueChangeTooltip = function(value) {
		console.log(value)
		
		var diff_hour   = Math.floor(value / (60 * 60));
		var diff_minute = Math.floor((value %3600) / 60);
		console.log(diff_hour)
		console.log(diff_minute)
		return  diff_hour+"시간"+  ((diff_minute < 10) ? "0" + diff_minute+"분" : diff_minute+"분");
	
	}
	// 시간->초로 변환
	var changeSecond = function(value) {
		var hms = value;   // your input string
		var a = hms.split(':'); // split it at the colons

		// minutes are worth 60 seconds. Hours are worth 60 minutes.
		return (a[0]) * 60 * 60 + (a[1]) * 60;
	}
	
	// 시간을 소수점으로 변환
	var changeTimeChart = function(value){
		var arr = value.split(':');
		var hour = arr[0];
		var minute = arr[1]==0 ? "0" : ((arr[1]/ 60)+"").substr(2);
		return hour + "." + minute;
	}
	//소수점 시간으로 변환
	var changeHour = function(value) {
		if(value==0){
			return "0:0";
		}else{
			var arr = value.split('.');
			var hour = arr[0] <= 9 ? "0" +arr[0] : arr[0];
			var min = arr[1] * 60 + " ";
			return hour + ":" + (min.substr(0,2) == ""? "0" : min.substr(0,2));
		}
	}
	//툴팁에 들어갈 날짜
	var workChangeDate = function(value){
		var dt = new Date(value);
		
		return ((dt.getMonth() < 10) ? "0" + (dt.getMonth()+1) : (dt.getMonth()+1))  + "." + dt.getDate() + "("+day(dt)+")";
	}
