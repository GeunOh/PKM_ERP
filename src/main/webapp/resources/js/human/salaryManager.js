$(function(){
	
	// 존재하는 부서 목록 조회 후 선택옵션에 추가
	$.ajax({
		url: '/Human/humanAddDeptList',
		success: function(data){
			$ul = $('#selectDept').siblings('ul');
			$ul.html('');
			if(data.length>0){
				for(var i in data){
					$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].dname +"'>"+data[i].dname+"</a></li>");		
					$ul.append($li);
				}
			}else{
				$li = $("<li><a href='#' class='link-select' data-value='N'>부서 없음</a></li>");		
				$ul.append($li);
			}
		}
	});
	
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

// 수정할 사원이름 클릭 시 해당정보 및 수정폼 
$('.human_name').on('click',function(){
	var eno = $(this).parent().siblings().eq(0).text();
	
	$("#modifyForm").fadeIn();
	
	$.ajax({
		url: '/Human/salaryModifyInfo',
		data: {eno:eno},
		success: function(data){
			$(".content-form input[type=text]:first").val(data.eno);
			$(".content-form input[type=text]:eq(1)").val(data.ename);
			$(".content-form input[type=text]:last").val(data.salary);
		}
		
	})
})
// 팝업창 닫기
$('h2 .fa-times').on('click',function(){
	$('.popup-form').fadeOut();
})
// 팝업창 닫기
$('.modify-btn-form button:first-child').on('click',function(){
	$('.popup-form').fadeOut();
})


// 급여 수정하기
$('.modify-btn-form button:last-child').on('click',function(){
	
	var modifyForm = document.modifyForm;
	modifyForm.action = "/Human/modifySalary";
	modifyForm.submit();
	
})

$("input[name=modify-salary]").on( "keyup", function(event) {
    // 1. input 태그에서 사용자가 selection을 하고 있고, selection 된 내용이 blank가 아닌 경우 (즉, 무언가 선택한 경우), listener 로직을 타지 않고 종료한다.
    var selection = window.getSelection().toString();
    if ( selection !== '' ) {
        return;
    }
    // 2. keyup 이벤트가 방향키인 경우 그대로 종료한다.
    if ( $.inArray(event.keyCode, [38,40,37,39] ) !== -1 ) {
        return;
    }
    // 3. 이 이벤트를 발생시킨 this element를 $this 변수에, $this 변수의 값을 input 변수에 넣어준다.
    var $this = $(this);
    var input = $this.val();
 
    // 4. 숫자와 관련된 로직을 수행하기 위해선 위의 text를 정수로 변환해야 한다. 먼저 정규식을 사용해서 space, underscore, dash nderscore, dash 등을 제거한다.
    var input = input.replace(/[\D\s\._\-]+/g, "");
 
    // 5. 깔끔하게 정리된 input의 값을 parseInt 함수를 사용하여 Number Type으로 변환해준다.
    input = input ? parseInt( input, 10 ) : 0;
 
    // 6. 마지막으로 1,000단위별로 comma를 추가하기 위해 toLocaleString 함수를 적용한다.
    $this.val(function() {
        return ( input === 0 ) ? "" : input.toLocaleString( "en-US" );
    });
});

