//팝업창 버튼들 작동
$('#addBtn').on('click',function(){
	$('#product-InOut-add').fadeIn();	// 추가 팝업창
})
$('h2 .fa-times').on('click',function(){
	$('.popup-form').fadeOut();
})
$('.add-btn-form button:first-child').on('click',function(){
	$('.popup-form').fadeOut();
})
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

// 제품코드 중복확인
function pcodeChk() {
	var pcode = $("input[name=pcode]").val();
	var chk;
	$.ajax({
		async: false,
		url: "/Stock/pcodeChk",
		data: {pcode:pcode},
		success: function(data){
			chk = data;
		}
	})
	if(chk == true){
		$("input[name=pcode] + label").text("사용가능");
	} else {
		$("input[name=pcode] + label").text("");
	}
}
// 거래처 존재확인
function ccodeChk(){
	var ccode = $("input[name=ccode]").val();
	var chk;
	$.ajax({
		async: false,
		url: "/Stock/ccodeChk",
		data: {ccode:ccode},
		success: function(data){
			chk = data;
		}
	})
	if(chk == 'exist'){
		$("input[name=ccode] + label").text("사용가능");
	} else {
		$("input[name=ccode] + label").text("");
	}
}
function dataChk(){
	
	var pcode = $("input[name=pcode]").val();
	var ccode = $("input[name=ccode]").val();
	var count = $("input[name=count]").val();
	
	if($("input[name=ccode] + label").text() != "사용가능") {
		alert("존재하지않는 거래처입니다.");
		return false;
	}
	if($("input[name=pcode] + label").text() != "사용가능") {
		alert("존재하지않는 제품입니다.");
		return false;
	}
	if(ccode == '') {
		alert("사업자등록번호를 입력해주세요.");
		return false;
	}
	if(pcode == '') {
		alert("제품코드를 입력해주세요.");
		return false;
	}
	if(count == '' || count <= 0) {
		alert("수량을 입력해주세요.");
		return false;
	}
	$("#product-InOut-add").submit();
}
// 조건 클릭 시
$(document).on('click', '.link-select', function(){
	var value = $(this).attr('value');
	var text = $(this).text();
	// 속성 및 텍스트 변경
	$(this).parents('ul').siblings('.link-selected').text(text);
	$(this).parents('ul').siblings('input').attr('value', value);
})