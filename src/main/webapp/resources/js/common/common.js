/**
 * 	공통(템플릿) script
 */
$(function(){
	// 사이드메뉴 슬라이드 토글 기능
	$("#mainMenu > li > span").on("click", function() {
		$(this).siblings("ul").slideToggle();
	})
	// 비밀번호 변경 팝업창
	$("#dropdown-menu li:eq(1)").on("click", function() {
		$("#changePwdPopUp").fadeIn();
	});
	$(".btn-form button:first").on("click", function() {
		$("#changePwdPopUp").fadeOut();
	});
});

// 드롭다운 메뉴 토글 기능
function showMenu(){
	var menu = document.getElementById("dropdown-menu");
	if(menu.style.display == "block"){
		menu.style.display = "none";
	} else {
		menu.style.display = "block";
	}
}

// 비밀번호 변경
function changePwd(){
	var $now_pwd = $("#now_pwd");
	var $new_pwd = $("#new_pwd");
	var $re_pwd = $("#re_pwd");
	
	if($now_pwd.val() == ''){
		alert("현재 비밀번호를 입력해주세요.");
		$now_pwd.focus();
		return;
	}
	if($new_pwd.val() == ''){
		alert("현재 비밀번호를 입력해주세요.");
		$new_pwd.focus();
		return;
	}
	if($re_pwd.val() == ''){
		alert("현재 비밀번호를 입력해주세요.");
		$re_pwd.focus();
		return;
	}
	if($new_pwd.val() != $re_pwd.val()){
		alert("새로운 비밀번호가 서로 일치하지 않습니다.");
		$re_pwd.focus();
		return;
	}
	
	$.ajax({
		url: "/Human/changePwd",
		data: {
				now_pwd: $now_pwd.val(),
				new_pwd: $new_pwd.val(),
				re_pwd: $re_pwd.val() },
		success: function(data){
			if(data == 'success'){
				alert("비밀번호가 정상적으로 변경되었습니다.");
				location.href = "/Logout";
			} else if(data == 'fail'){
				alert("현재 비밀번호가 일치하지 않습니다.\n 다시 시도해주세요.");
			}
		}
	})
}