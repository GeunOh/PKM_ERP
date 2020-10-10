//체크박스 1개이상 체크확인 메서드
function checkboxOne(chkList){
	var count = 0;
	for(var i=0; i<chkList.length; i++){
		if(chkList[i].checked) count++;
	}
	return count;
}

//승인
function approval(){
	
	var chkList = document.getElementsByName("ano");
	
	// 체크박스가 하나도 체크 안되있을 시
	if(checkboxOne(chkList)<1){
		alert("승인/거절할 신청목록을 선택해주세요.");
		return;
	}
	
	var applicationForm = document.applicationForm;
	applicationForm.action = "/Stock/approvalApplication";
	applicationForm.submit();
}

//거절
function refuse(){
	
	var chkList = document.getElementsByName("ano");
	
	// 체크박스가 하나도 체크 안되있을 시
	if(checkboxOne(chkList)<1){
		alert("승인/거절할 신청목록을 선택해주세요.");
		return;
	}
	
	var applicationForm = document.applicationForm;
	applicationForm.action = "/Stock/refuseApplication";
	applicationForm.submit();
}