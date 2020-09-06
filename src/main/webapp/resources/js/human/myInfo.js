$(document).ready(function() {
	var today = new Date();
	var date = today.toISOString().substring(0, 10);
	
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[today.getDay()];
	var dateText = date+" ("+dayOfWeek+")";
	$("#yyyy-mm-dd").text(dateText);
//	$("#day").text(dayOfWeek);
	timePrint();
	// 시계 작동
	var timer = setInterval(function(){
	  timePrint();
	}, 1000);
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
