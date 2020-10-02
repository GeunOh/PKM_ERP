$(document).ready(function(){
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
	})
	
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
	
	if($('#modify-email3').attr('data-value') == 'input-text'){
		$('#modify-email2').attr('disabled', false);
		$('#modify-email2').css('cursor', 'pointer');
	}else{
		$('#modify-email2').val('');
		$('#modify-email2').attr('disabled', true);
		$('#modify-email2').css('cursor', 'auto');
	}
})

$('.selectBox ul').mouseleave(function(){
	$(this).siblings('.fa-angle-down').removeClass('rotate-angle');
	$(this).hide();
})
