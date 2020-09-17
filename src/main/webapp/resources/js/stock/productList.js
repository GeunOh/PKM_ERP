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
				$li = $("<li><a href='#' class='link-select' data-value='N'>제품 없음</a></li>");
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
				$li = $("<li><a href='#' class='link-select' data-value='N'>제품 없음</a></li>");
				$ul.append($li);
			}
		}
	})
}); 
// 검색창 메뉴 펼치기
$('.selectBox').on('click',function(){
	$(this).children('ul').toggle();
	$(this).children('.fa-angle-down').toggleClass('rotate-angle');
})
// 검색창 메뉴 접기
$('.selectBox ul').mouseleave(function(){
	$(this).siblings('.fa-angle-down').removeClass('rotate-angle');
	$(this).hide();
})
// 검색 조건 클릭 시
$(document).on('click', '.link-select', function(){
	var value = $(this).attr('data-value');
	var text = $(this).text();
	// 속성 및 텍스트 변경
	$(this).parents('ul').siblings('.link-selected').text(text);
	$(this).parents('ul').siblings('input').attr('data-value', value);
})

//제품 클릭 시 하단 표시
$("#productListTable tbody tr").on("click", function() {
	
	$("#saveBtn").text("수정");
	$("#deleteBtn").removeAttr('disabled');
	
	var pcode = $(this).children().eq(0).text();
	$("input[name=beforePcode]").val(pcode);
	
	$.ajax({
		url : "/Stock/showProduct",
		data : {pcode: pcode},
		success : function(data) {
			$("input[name=pcode]").val(data.pcode);
			$("input[name=pname]").val(data.pname);
			$("input[name=cost_price]").val(data.cost_price);
			$("input[name=selling_price]").val(data.selling_price);
			$("input[name=ccode]").val(data.ccode);
			$("input[name=p_comment]").val(data.p_comment);
		}
	})
	
})

// 제품 등록 OR 수정
$("#saveBtn").on("click", function() {
	// 입력 예외처리
	if(!dataChk()) return;
	
	if($(this).text() == "추가"){
		// 중복이면 등록 불가능
		if(pcodeChk()){
			alert("이미 존재하는 제품코드입니다.");
			return false;
		} 
		// 거래처가 없으면 등록 불가능
		if (ccode != '' && ccodeChk() == 'notExist'){
			alert("거래처가 존재하지 않습니다.");
			$("input[name=ccode]").focus();
			return false;
		} 
		var form = document.infoForm;
		form.action = "/Stock/addProduct";
		form.submit();
	} else if($(this).text() == "수정"){
		var beforePcode = $("input[name=beforePcode]").val();
		var afterPcode = $("input[name=pcode]").val();
		var ccode = $("input[name=ccode]").val();
		// pcode를 수정할때
		if(beforePcode != afterPcode){
			if(pcodeChk()){	// 이미 존재하는 pcode라면
				alert("이미 존재하는 제품코드입니다.");
				$("input[name=pcode]").focus();
				return false;
			}
		}
		// 존재하지 않는 거래처라면
		if(ccode != '' && ccodeChk() != 'exist'){
			alert("거래처가 존재하지 않습니다.");
			$("input[name=ccode]").focus();
			return false;
		} 
		var form = document.infoForm;
		form.action = "/Stock/modifyProduct";
		form.submit();
	}
})


// 제품 삭제
$("#deleteBtn").on("click", function() {
	
	var pcode = $("input[name=pcode]");
	if(pcode.val="")
	
	if(confirm("정말로 삭제하시겠습니까?")){
		// 필요 없는 정보 컨트롤러로 안보냄
		$("input[name=pname]").prop('disabled','true');
		$("input[name=cost_price]").prop('disabled','true');
		$("input[name=selling_price]").prop('disabled','true');
		$("input[name=p_comment]").prop('disabled','true');
		
		var form = document.infoForm;
		form.action = "/Stock/deleteProduct";
		form.submit();
	} else {
		return false;
	}
})
// 수정/추가 스위치
$(".fa-exchange-alt").on("click", function() {
	var btnText = $("#saveBtn").text();
	if(btnText == '수정'){
		$("#saveBtn").text('추가');
	} else {
		$("#saveBtn").text('수정');
	}
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
	return chk;
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
			console.log(data);
			chk = data;
		}
	})
	console.log(chk);
	return chk;
}
// 입력 예외처리
function dataChk(){
	var $pcode = $("input[name=pcode]");
	var $pname = $("input[name=pname]");
	var $ccode = $("input[name=ccode]");
	var $cost_price = $("input[name=cost_price]");
	var $selling_price = $("input[name=selling_price]");
	var $p_comment = $("input[name=p_comment]");
	
	if($pcode.val() == ''){
		alert("제품코드를 입력해주세요.");
		$pcode.focus();
		return false;
	} else if($pname.val() == ''){
		alert("제품이름을 입력해주세요.");
		$pname.focus();
		return false;
	} else if($cost_price.val() == ''){
		alert("원가를 입력해주세요.");
		$cost_price.focus();
		return false;
	} else if($selling_price.val() == ''){
		alert("판매가를 입력해주세요.");
		$selling_price.focus();
		return false;
	} else {
		return true;
	}
}


