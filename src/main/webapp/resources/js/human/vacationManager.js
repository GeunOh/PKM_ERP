$(function(){
	// 사이드메뉴 해당 카테고리 펼쳐놓기
	$('#human').css('display','block');	
	
	// 존재하는 부서 목록 조회 후 선택옵션에 추가
	$.ajax({
		url: '/Human/humanAddDeptList',
		success: function(data){
			$ul = $('#selectDept').siblings('ul');
			$ul.html('');
			if(data.length>0){
				for(var i in data){
					$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].dcode +"'>"+data[i].dname+"</a></li>");		
					$ul.append($li);
				}
			}else{
				$li = $("<li><a href='#' class='link-select' data-value='N'>부서 없음</a></li>");		
				$ul.append($li);
			}
		}
	});
	
	// 존재하는 직급 조회 후 선택옵션에 추가
	$.ajax({
		url: '/Human/humanAddRankList',
		success: function(data){
			$ul = $('#selectRank').siblings('ul');
			$ul.html('');
			if(data.length>0){
				for(var i in data){
					$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].rcode +"'>"+data[i].rname+"</a></li>");		
					$ul.append($li);
				}
			}else{
				$li = $("<li><a href='#' class='link-select' data-value='N'>부서 없음</a></li>");		
				$ul.append($li);
			}
		}
	})
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
	//날짜 선택 누르면 input 활성화
	if($('#selectDate').attr('data-value') != 'dateAll'){
		$('#date').attr('disabled', false);
		$('#date2').attr('disabled', false);
	}else{
		$('#date').attr('disabled', true);
		$('#date2').attr('disabled', true);
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
