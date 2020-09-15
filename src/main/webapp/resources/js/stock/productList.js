//제품 클릭 시 하단 표시
$("#productListTable tbody tr").on("click", function() {
	
	$("#saveBtn").text("수정");
	$("#deleteBtn").removeAttr('disabled');
	
	var pcode = $(this).children().eq(0).text();
	
	$.ajax({
		url : "/Stock/showProduct",
		data : {pcode: pcode},
		success : function(data) {
			$("input[name=pcode]").val(data.pcode);
			$("input[name=pname]").val(data.pname);
			$("input[name=cost_price]").val(data.cost_price);
			$("input[name=selling_price]").val(data.selling_price);
			$("input[name=p_comment]").val(data.p_comment);
		}
	})
	
})
// 제품 등록
$("#saveBtn").on("click", function() {
	// 중복이면 등록 불가능
	if(pcodeChk()){
		alert("이미 존재하는 제품코드입니다.");
		return false;
	} else {	// 중복이 아니면 등록가능
		var form = document.infoForm;
		form.action = "/Stock/addProduct";
		form.submit();
	}
	
})


// 제품 삭제
$("#deleteBtn").on("click", function() {
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


