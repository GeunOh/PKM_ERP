// input에 금액단위 , 자동생성 메서드
function numberWithCommas(x, t) {
	x = x.replace(/[^0-9]/g, ''); // 입력값이 숫자가 아니면 공백
	x = x.replace(/,/g, ''); // ,값 공백처리
	t.value = x.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가
}
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

// 비품 추가시 scode 중복확인
$("input[name=add_scode]").on("keyup", function(){
	var scode = $(this).val();
	
	$.ajax({
		url: "/Stock/scodeChk",
		data: {scode, scode},
		success: function(data) {
			if(data == "exist"){
				$("#addScodeChk").text("사용 불가능").css('color','red');
				$("input[name=addScodeChk]").attr('value',0);
			} else {
				$("#addScodeChk").text("사용 가능").css('color','green');
				$("input[name=addScodeChk]").attr('value',1);
			}
		}
	})
})

// 입력값 체크
function dataChk(value) {
	var $scode;
	var $sname;
	var $sprice;
	var $s_comment;
	
	if(value=="add") {
		$scode = $("input[name=add_scode]");
		$sname = $("input[name=add_sname]");
		$sprice = $("input[name=add_price]");
		$s_comment = $("input[name=add_s_comment]");
	} else if(value == "modify") {
		$scode = $("input[name=modify_scode]");
		$sname = $("input[name=modify_sname]");
		$sprice = $("input[name=modify_price]");
		$s_comment = $("input[name=modify_s_comment]");
	}
	if($scode.val() == ''){
		alert("비품코드를 입력해주세요.");
		$scode.focus();
		return false;
	}
	if($sname.val() == ''){
		alert("비품이름을 입력해주세요.");
		$sname.focus();
		return false;
	}
	if($sprice.val() == ''){
		alert("비품가격을 입력해주세요.");
		$sprice.focus();
		return false;
	}
	return true;
}
// 비품 추가
function addSupply() {
	var chk = $("input[name=addScodeChk]").val();
	if(dataChk("add")){
		if(chk==0) {
			alert("중복된 비품코드입니다.");
			return;
		}
		if(confirm("비품을 추가하시겠습니까?")){
			$("#add-popup-form").submit();
	 		$(".popup-form").fadeOut();
		}
	}
}
// 비품  수정시 scode 중복 확인
$("input[name=modify_scode]").on("keyup", function(){
	var scode = $(this).val();
	var beforeScode = $("input[name=beforeScode]").val()
	if(scode == beforeScode){
		$("#modifyScodeChk").text("");
		$("input[name=modifyScodeChk]").attr('value','allow');
	}
	// 수정할 코드와 이전 코드가 다르면 중복확인
	if(scode != beforeScode){
		$.ajax({
			url: "/Stock/scodeChk",
			data: {scode, scode},
			success: function(data) {
				if(data == "exist"){
					$("#modifyScodeChk").text("사용 불가능").css('color','red');
					$("input[name=modifyScodeChk]").attr('value',"refuse");
				} else {
					$("#modifyScodeChk").text("사용 가능").css('color','green');
					$("input[name=modifyScodeChk]").attr('value',"allow");
				}
			}
		})
	}
})
// 비품 수정/삭제 선택
$("#supplyListTable tbody tr").on("dblclick", function() {
	$("#delete-popup-form").fadeIn();
	var sname = $(this).children("td").eq(1).text();
	var scode = $(this).children("td").eq(0).text();
	$("input[name=del_scode").attr("value", scode);
	$("input[name=beforeScode").attr("value", scode);
	
	$("#selectInfo").text("["+scode+"] " +sname + " " );
})
$("#supplyListTable tbody tr").on("mouseenter", function() {
	$("#supplyListTable tbody tr").css('background-color','#fff');
	$(this).css('background-color','#f6f6f6').css('cursor','pointer');
})
// 비품 삭제
function deleteSupply() {
	if(confirm("정말로 삭제하시겠습니까?")){
		$("#delete-popup-form").submit();
	}
}
//비품 수정 화면
function modifyForm() {
	$("#delete-popup-form").hide();
	$("#modify-popup-form").fadeIn();
	var scode = $("input[name=del_scode").val();
	
	$.ajax({
		url: "/Stock/showSupply",
		data: {scode, scode},
		success: function(data){
			$("input[name=modify_scode").val(data.scode);
			$("input[name=modify_sname").val(data.sname);
			$("input[name=modify_price").val(data.cost_price);
			$("input[name=modify_s_comment").val(data.s_comment);
		}
	})
}
function modifySupply(){
	var chk = $("input[name=modifyScodeChk]").val();
	if(dataChk("modify")){
		if(chk=="refuse") {
			alert("중복된 비품코드 입니다.");
			return;
		}
		if(confirm("비품을 수정하시겠습니까?")){
			$("#modify-popup-form").submit();
		}
	}
}