var id = $('#id');
var pwd = $('#pwd');
var btn = $('#btn');

btn.on('click',function(){
	if(id.val() == ""){
		id.next('label').addClass('warning');
		setTimeout(function(){
			$('label').removeClass('warning');
		}, 1500);
	}
	else if(pwd.val() == ""){
		pwd.next('label').addClass('warning');
		setTimeout(function(){
			$('label').removeClass('warning');
		}, 1500);
	}
})
// 취소 버튼
$(".btn-form button:eq(0), .btn-form button:eq(2)").on("click", function() {
	$(this).parents(".popupContent").fadeOut();
})
// 전화번호 자동 하이픈
$(document).on("keyup", ".phoneNumber", function() { 
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
});
// 아이디 찾기
function idFind() {
	 
	var ename = $("#id_ename");
	var phone = $("#id_phone");
	
	if(ename.val() == ''){
		alert("이름을 입력해주세요.");
		ename.focus();
		return;
	}
	if(phone.val() == ''){
		alert("핸드폰번호를 입력해주세요.");
		phone.focus();
		return;
	}
	
	$.ajax({
		type: "post",
		url: "/idFind",
		data: {ename: ename.val(), phone: phone.val()},
		success: function(data) {
			if(data == 'fail'){
				alert("존재하지않는 정보입니다.");
			} else {
				alert("이메일이 발송되었습니다.");
				location.href = "/LoginForm";
			}
		}
	})
}

// 비밀번호 찾기
function pwdFind() {
	 
	var id = $("#pwd_id");
	var ename = $("#pwd_ename");
	var phone = $("#pwd_phone");
	
	if(id.val() == ''){
		alert("아이디를 입력해주세요.");
		id.focus();
		return;
	}
	if(ename.val() == ''){
		alert("이름을 입력해주세요.");
		ename.focus();
		return;
	}
	if(phone.val() == ''){
		alert("핸드폰번호를 입력해주세요.");
		phone.focus();
		return;
	}
	
	$.ajax({
		type: "post",
		url: "/pwdFind",
		data: {ename: ename.val(), phone: phone.val(),
			   id: id.val()},
		success: function(data) {
			if(data == 'fail'){
				alert("존재하지않는 정보입니다.");
			} else {
				alert("이메일이 발송되었습니다.");
				location.href = "/LoginForm";
			}
		}
	})
}

