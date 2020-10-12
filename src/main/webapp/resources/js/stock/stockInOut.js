$(function(){
	// 검색창 제품 목록
	$.ajax({
		url:"/Stock/addProductList",
		success: function(data){
			$ul = $("#selectProduct").siblings("ul");
			$ul.html("");
			if(data.length > 0){
				for(var i in data){
					$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].pcode +"'>"+data[i].pname+"</a></li>");
					$ul.append($li);
				}
			} else {
				$li = $("<li><a href='#' class='link-select' value='N'>제품 없음</a></li>");
				$ul.append($li);
			}
		}
	})
	// 검색창 거래처 목록
	$.ajax({
		url:"/Stock/addClientList",
		success: function(data){
			$ul = $("#selectClient").siblings("ul");
			$ul.html("");
			if(data.length > 0){
				for(var i in data){
					$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].ccode +"'>"+data[i].cname+"</a></li>");
					$ul.append($li);
				}
			} else {
				$li = $("<li><a href='#' class='link-select' value='N'>제품 없음</a></li>");
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
})

$('.selectBox ul').mouseleave(function(){
	$(this).siblings('.fa-angle-down').removeClass('rotate-angle');
	$(this).hide();
})