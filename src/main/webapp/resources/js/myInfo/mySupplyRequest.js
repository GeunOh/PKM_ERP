//팝업창 버튼들 작동
$('#addBtn').on('click',function(){
	$('#add-popup-form').fadeIn();	// 추가 팝업창
})
$('h1 .fa-times').on('click',function(){
	$('.popup-form').fadeOut();
})
$('.add-textform button:first-child').on('click',function(){
	$('.popup-form').fadeOut();
})

function addSupply() {
	if(dataChk()){
		$("#add-popup-form").submit();
	}
}

function dataChk() {
	sname = $("input[name=sname]").val();
	count = $("input[name=count]").val();
	
	if(sname == '') {
		alert("비품이름을 입력해주세요.");
		return false;
	}
	if(count == '' || count <= 0) {
		alert("수량을 입력해주세요.");
		return false;
	}
	return true;
}

//클릭 시  표시
$("#supplyList tbody tr").on("click", function() {
	$("#supplyList tbody tr").removeClass('noSelectTr');
	$("#supplyList tbody tr").removeClass('selectTr');
	$(this).addClass('selectTr');
	
	$("input[name=scode]").val($(this).children().eq(0).text());
	$("input[name=scode]").attr("readonly", "readonly");
	$("input[name=sname]").val($(this).children().eq(1).text());
	$("input[name=sname]").attr("readonly", "readonly");
})

//마우스 호버 효과
$("#supplyList tbody tr").on('mouseenter',function(){
	if(!$(this).hasClass('selectTr')) $(this).addClass('noSelectTr')
})
$("#supplyList tbody tr").on('mouseleave',function(){
	if($(this).hasClass('noSelectTr')) $(this).removeClass('noSelectTr')
})

