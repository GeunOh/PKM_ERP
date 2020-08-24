$('.link-selected').on('click',function(){
	$(this).siblings('ul').toggle();
	$(this).siblings('.fa-angle-down').toggleClass('rotate-angle');
})

$('.link-select').on('click',function(){
	var dv = $(this).attr('data-value');
	var dt = $(this).text();
	
	$('.link-selected').text(dt);
	$('#selectVal').attr('data-value',dv);
	$(this).parents('ul').siblings('.fa-angle-down').removeClass('rotate-angle');
	$(this).parents('ul').hide();
})

$('.selectBox ul').mouseleave(function(){
	$(this).siblings('.fa-angle-down').removeClass('rotate-angle');
	$(this).hide();
})



$(function(){
	$('#human').css('display','block');

});
// 공백검증 메서드
function blankCheck(inputValue){
	if(inputValue == "") return false;
    return true;
}
// 체크박스 1개이상 체크확인 메서드
function checkboxOne(chkList){
	var count = 0;
	for(var i=0; i<chkList.length; i++){
		if(chkList[i].checked) count++;
	}
	return count;
}

// 검색 버튼 클릭 시
function searchPosition(){
	var rcode = document.getElementById("rcode");
	var rname = document.getElementById("rname");
	
	// 직급코드가 공백이면 alert
	if(!blankCheck(rcode.value) && !blankCheck(rname.value)){
        alert("검색하실 직급코드 또는 직급명을 입력해주세요.");
        rcode.focus();
		return false;
    }
	// 부서 검색
	var searchForm = document.searchForm;
	searchForm.action = "/Human/searchPosition";
	searchForm.submit();
}

// 추가 버튼 클릭 시
function addPosition(){
	var rcode = document.getElementById("rcode");
	var rname = document.getElementById("rname");
	
	// 직급코드가 공백이면 alert
	if(!blankCheck(rcode.value)){
        alert("직급코드 입력해주세요.");
        rcode.focus();
		return false;
    }
	// 직급코드가 공백이면 alert
	if(!blankCheck(rname.value)){
        alert("직급명을 입력해주세요.");
        rname.focus();
		return false;
    }
	// 부서 추가
	var searchForm = document.searchForm;
	searchForm.action = "/Human/addPosition";
	searchForm.submit();
}

// 삭제 버튼 클릭 시
function deletePosition(){
	var rcodeChk = document.getElementsByName("rcodeChk");
	
	// 체크박스가 1개도 체크가 안되어있다면
	if(checkboxOne(rcodeChk)<1){
		alert("삭제하실 직급을 선택해주세요.");
		return;
	}
	// 부서 삭제
	var tableForm = document.tableForm;
	tableForm.action = "/Human/deletePosition";
	tableForm.submit();
}

// 직급 클릭 시 사원 목록 조회
$("#positionTable tbody tr").on("click", function() {
	
//	$("#humanList tbody").empty();
	var rcode = $(this).children().eq(1).text();
		
	$.ajax({
		
		async : false,
		url: "/Human/choiceRcode",
		datatype: "json",
		data: {rcode: rcode},
		success: function(data) {
			
			console.log(data);
			
			$tbody = $("#humanList tbody");
			$tr = $("<tr/>");
			
			$tbody.html("");
			
			if(data.length==0){
				$td = $("<td colspan='4'>해당하는 직급의 사원정보가 없습니다. 직급을 선택해주세요.</td>");
				$tr.append($td);
				$tbody.append($tr);
			} else {
			
				for(var i in data){
					
					$tr = $("<tr/>");
					
					$rcode = $("<td>"+data[i].rcode +"</td>");
					$dcode = $("<td>"+data[i].dcode +"</td>");
					$eno   = $("<td>"+data[i].eno +"</td>");
					$name = $("<td>"+data[i].name +"</td>");
					
					$tr.append($rcode);
					$tr.append($dcode);
					$tr.append($eno);
					$tr.append($name);
					$tbody.append($tr);
					
					/*$("#humanList tbody").append(
							"<tr>" +
							"<td>"+data[i].rcode +"</td>" +
							"<td>"+data[i].dcode +"</td>" +
							"<td>"+data[i].eno +"</td>" +
							"<td>"+data[i].ename +"</td>" +
							"</tr>"
					)*/
				}
			}
		}
		
	});

});


