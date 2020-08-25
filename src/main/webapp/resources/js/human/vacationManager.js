$(function(){
	// 사이드메뉴 해당 카테고리 펼쳐놓기
	$('#human').css('display','block');	
	
});

$('.selectBox').on('click',function(){
	$(this).children('ul').toggle();
	$(this).children('.fa-angle-down').toggleClass('rotate-angle');
})

$(document).on('click', '.link-select', function(){
	var dv = $(this).attr('data-value');
	var dt = $(this).text();
	
	$(this).parents('.selectBox').find('.link-selected').text(dt);
	$(this).parents('.selectBox').find('input').attr('data-value',dv);
	$(this).parents('.selectBox').find('input').val(dv);
	
	$(this).parents('ul').siblings('.fa-angle-down').removeClass('rotate-angle');
	//날씨 선택 누르면 input 활성화
	if($('#selectDate').attr('data-value') == 'dateSelect'){
		$('#date').attr('disabled', false);
		$('#date2').attr('disabled', false);
	}else{
		$('#date').attr('disabled', true);
		$('#date2').attr('disabled', true);
	}
	//이메일 선택입력되면 입력할 수 있음.
	if($('#email3').attr('data-value') == 'input-text'){
		$('#add-email2').attr('disabled', false);
		$('#add-email2').css('cursor', 'pointer');
	}else{
		$('#add-email2').attr('disabled', true);
		$('#add-email2').css('cursor', 'auto');
	}
})

$('.selectBox ul').mouseleave(function(){
	$(this).siblings('.fa-angle-down').removeClass('rotate-angle');
	$(this).hide();
})

// 체크박스 1개이상 체크확인 메서드
function checkboxOne(chkList){
	var count = 0;
	for(var i=0; i<chkList.length; i++){
		if(chkList[i].checked) count++;
	}
	return count;
}

// 휴가 승인
function approvalVacation(){
	
	var chkList = document.getElementsByName("vno");
	
	// 체크박스가 하나도 체크 안되있을 시
	if(checkboxOne(chkList)<1){
		alert("변경할 휴가를 선택해주세요.");
		return;
	}
	
	var vacationForm = document.vacationForm;
	vacationForm.action = "/Human/approvalVacation";
	vacationForm.submit();
	
	
}

// 휴가 거절
function refuseVacation(){
	
	var chkList = document.getElementsByName("vno");
	
	// 체크박스가 하나도 체크 안되있을 시
	if(checkboxOne(chkList)<1){
		alert("변경할 휴가를 선택해주세요.");
		return;
	}
		
	var vacationForm = document.vacationForm;
	vacationForm.action = "/Human/refuseVacation";
	vacationForm.submit();
}


function test() {
	alert("Test");
	
}