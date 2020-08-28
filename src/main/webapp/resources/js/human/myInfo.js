// 휴가 신청 박스 클릭 시 팝업창
$("#vacationUseBox").on("click", function() {
	
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

$("input[name='add-endDate']").on("change", function(){
	
	var $endDate = $(this);
	var $startDate = $("input[name='add-startDate']");
	
	var endArr = $endDate.val().split('-');
	var startArr = $startDate.val().split('-');
	
	var EndDate = new Date(endArr[0], endArr[1], endArr[2]);
	var StartDate = new Date(startArr[0], startArr[1], startArr[2]);
	
	var diff = EndDate - StartDate;
	var currDay = 24 * 60 * 60 * 1000;	// 시 * 분 * 초 * 밀리세컨
	var useDay = diff/currDay + 1;
	
	if(useDay < 1) {
		alert("종료일자는 시작일자보다 전일수 없습니다.");
		$endDate.val("");
		return;
	}
	
	$("#add-useDay").val(useDay + "일");
	$("input[name='add-useDay']").val(useDay);
})



function dataChk() {
	
	var vType = $("input[name='add-vType']").val();
	var startDate = $("input[name='add-startDate']").val();
	var endDate = $("input[name='add-endDate']").val();
	
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
	
	
	$('.popup-form').submit();
	$(".popup-form").fadeOut();
	
}

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