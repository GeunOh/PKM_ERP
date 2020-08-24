
$(function(){
	$('#human').css('display','block');
	
	// 부서 등록 버튼 클릭 시 팝업창
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
	$("#branch-area li span").on("click", function() {
		var deptName = $(this).text();	// 해당 부서 이름
		showDeptInfo(deptName);
	});
	
	// 취소 시 각 부서 내용 조회
	$("#delDept #deptList td").on("mouseenter", function() {
		var deptName = $(this).children().text();  // 해당 부서 이름
		showDeptInfo(deptName);
	});
	
	// 수정 시 각 부서 내용 조회
	$("#modifyDept #deptList td").on("click", function() {
		var deptName = $(this).text();  // 해당 부서 이름
		$("#beforeDept").attr("value",deptName);
		$("#modifyDept #deptInfo td").empty();
		modifyDeptInfo(deptName);
	});

	
	
	// 취소 버튼시 
	$(".cancleBtn").on("click", function() {
		var addForm = document.addFrm;
		addForm.reset();
		
		$("#addDept, #delDept, #modifyDept").hide();
		$("#popupBox").hide();
	});
	
	
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
				$(".dboss").text("X");
			}
			$(".startDate").text(data.startDate);
			$(".startDate").siblings().text("시작일");
			$(".dcomment").text(data.dcomment);
			$(".dcomment").siblings().text("부서소개");
		}
	})
}

// 부서기능 수정 기능
function modifyDeptInfo(deptName) {
	$.ajax({
		type: "post",
		async: false,
		url: "/Human/departmentShow",
		datatype: "text",
		data: {deptName: deptName},
		success: function(data, textStatus) {
			$("#m_dname").append("<input type='text' name='dname' value='"+data.dname+"'>");
			$("#m_dcode").append("<input type='text' name='dcode' value='"+data.dcode+"'>");
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
