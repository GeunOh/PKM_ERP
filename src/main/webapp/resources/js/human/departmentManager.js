$(function(){
	$('#human').css('display','block');

});

//부서 등록 버튼 클릭 시 팝업창
$("#addBtn").on("click", function() {
	$("#popupBox").show();
	$("#addDept").show();
});
// 부서 삭제 버튼 클릭 시 팝업창
$("#delBtn").on("click", function() {
	
	$("#popupBox").show();
	$("#delDept").show();
});
// 부서 수정 버튼 클릭 시 팝업창
$("#modifyBtn").on("click", function() {
	
	$("#popupBox").show();
	$("#modifyDept").show();
});

// 각 부서 클릭시 해당 부서 내용 조회 
// 및 해당 부서 사원 조회
$("#branch-area li span").on("click", function() {
	var deptName = $(this).text();	// 해당 부서 이름
	
	showDeptInfo(deptName);	// 부서 목록
	showHumanList(deptName); // 해당 부서 사원목록
	
});

// 삭제 팝업창 호버 시 각 부서 내용 조회
$("#delDept #deptList td").on("mouseenter", function() {
	var deptName = $(this).children().text();  // 해당 부서 이름
	showDeptInfo(deptName);
});

// 수정 시 각 부서 내용 조회
$("#modifyDept #deptList td").on("click", function() {
	var deptName = $(this).text();  // 해당 부서 이름
	$("#beforeDept").attr("value",deptName);
	$("#modifyDept #deptInfo td").empty();
	modifyDeptInfo(deptName); // 수정할 부서 정보
});

// 부서 등록 서비스
$(".addBtn").on("click", function() {
	
	if($("#addDept input[name='dname']").val() == ''){
		alert("부서명을 입력해주세요.");
		$("#addDept input[name='dname']").focus();
		return;
	}
	if($("#addDept input[name='dcode']").val() == ''){
		alert("부서코드를 입력해주세요.");
		$("#addDept input[name='dcode']").focus();
		return;
	}
	
	if($("#addDept .dcodeChk").text() == "이미 존재하는 부서코드"){
		alert("이미 존재하는 부서코드입니다.");
		$("input[name='dcode']").focus();
		return;
	}
	
	
	var addForm = document.addFrm;
	addForm.action = "/Human/addDept";
	addForm.submit();
})
// 부서 삭제 서비스
$(".deleteBtn").on("click", function() {
	if(confirm("정말로 삭제하시겠습니까?")){
		var delForm = document.delForm;
		delForm.action = "/Human/delDept";
		delForm.submit();
	} else {
		return;
	}
})

// 부서 수정 서비스
$(".modifyBtn").on("click", function() {
	var dcode = $("#modifyDept .dcodeChk").text();
	
	if(dcode == "이미 존재하는 부서코드"){
		alert("이미 존재하는 부서코드입니다.");
		$("input[name='dcode']").focus();
		return;
	}
	var modifyForm = document.modifyFrm;
	modifyForm.action = "/Human/modifyDept";
	modifyForm.submit();
})

// 취소 버튼시 
$(".cancleBtn").on("click", function() {
	var addForm = document.addFrm;
	addForm.reset();
	
	$("#addDept, #delDept, #modifyDept").hide();
	$("#popupBox").hide();
});


// 부서 정보 보여주기 기능
function showDeptInfo(deptName) {
	$.ajax({
		type: "post",
		async: false,
		url: "/Human/departmentShow",
		datatype: "text",
		data: {deptName: deptName},
		success: function(data, textStatus) {
			$(".dname").text(data.dname);
			$(".dname").siblings().text("부서명");
			$(".dcode").text(data.dcode);
			$(".dcode").siblings().text("부서코드");
			
			$(".dboss").text(data.eno);
			$(".dboss").siblings().text("부서장");
			if(data.eno==undefined){
				$(".dboss").text("없음");
			}
			$(".startDate").text(data.startDate);
			$(".startDate").siblings().text("시작일");
			$(".dcomment").text(data.dcomment);
			$(".dcomment").siblings().text("부서소개");
		}
	})
}

// 부서 클릭 시 해당 사원 목록 조회
function showHumanList(deptName) {
	console.log("js")
	$.ajax({
		type: "post",
		async: false,
		url: "/Human/departHumanShow",
		data: {deptName: deptName},
		success: function(hList) {
			
			$tbody = $("#hListTableWrap tbody");
			$tr = $("<tr/>");
			$tbody.html("");

			if(hList.length==0){
				$td = $("<td colspan='5' style='font-size: 16px;'>해당하는 부서의 사원정보가 없습니다. 다른 부서를 선택해주세요.</td>");
				$tr.append($td);
				$tbody.append($tr);
			} else {
				for(var i in hList){
					$tr = $("<tr/>");
					
					$dname = $("<td>"+hList[i].dname +"</td>");
					if(hList[i].rcode==undefined){
						$rcode = $("<td>미정</td>");
					} else {
						$rcode = $("<td>"+hList[i].rcode +"</td>");
					}
					
					if(hList[i].rname==undefined){
						$rname = $("<td>미정</td>");
					} else {
						$rname = $("<td>"+hList[i].rname +"</td>");
					}
					
					$eno   = $("<td>"+hList[i].eno +"</td>");
					$name = $("<td>"+hList[i].name +"</td>");
					
					$tr.append($dname);
					$tr.append($rcode);
					$tr.append($rname);
					$tr.append($eno);
					$tr.append($name);
					$tbody.append($tr);
				}
				if(hList.length < 15 ){
					for(var i=0; i<15-hList.length; i++){
						$tr = $("<tr/>");
						$td = $("<td>&nbsp;</td>");
						
						$tr.append($td);
						$tr.append("<td></td>");
						$tr.append("<td></td>");
						$tr.append("<td></td>");
						$tr.append("<td></td>");
						$tbody.append($tr);
					}
					
				}
				
			}
		

		}
	})
}

// 부서기능 수정 시 해당 부서 정보 조회 기능
function modifyDeptInfo(deptName) {
	$.ajax({
		async: false,
		url: "/Human/departmentShow",
		datatype: "text",
		data: {deptName: deptName},
		success: function(data, textStatus) {
			$("#m_dname").append("<input type='text' name='dname' value='"+data.dname+"'>");
			
			$("#m_dcode").append("<input type='text' name='dcode' value='"+data.dcode+"' onkeyup='dcodeDupChk(event);'>");
			$("#m_dcode").append("<label class='dcodeChk'></label>");

			
			if(data.eno==undefined){
				$("#m_dboss").append("<input type='text' name='ename'>");
			} else {
				$("#m_dboss").append("<input type='text' name='ename' value='"+data.eno+"'>");
			}
			$("#m_startDate").append("<input type='date' name='startDate' value='"+data.startDate+"'>");
			$("#m_dcomment").append("<input type='text' name='dcomment' value='"+data.dcomment+"'>");
		}
	})
}

// 부서코드 중복 체크
function dcodeDupChk(e) {
	
	var dcode = e.target.value;
	
	$.ajax({
		async: false,
		url: "/Human/dcodeDupChk",
		data: {dcode, dcode},
		success: function(data) {
			if(data=="true"){
				$('.dcodeChk').text('이미 존재하는 부서코드');
				$('.dcodeChk').css('color','red');
			} else {
				$('.dcodeChk').text('사용 가능');
				$('.dcodeChk').css('color','green');
			}
		}
	})
	
}

