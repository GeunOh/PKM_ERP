$(document).ready(function(){
	$.ajax({
		url: '/Human/humanAddDeptList',
		success: function(data){
			$ul = $('#selectDept').siblings('ul');
			$ul.html('');
			if(data.length>0){
				for(var i in data){
					$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].dcode +"'>"+data[i].dname+"</a></li>");		
					$ul.append($li);
				}
			}else{
				$li = $("<li><a href='#' class='link-select' data-value='N'>부서 없음</a></li>");		
				$ul.append($li);
			}
		}
	})
	
	$.ajax({
		url: '/Human/humanAddRankList',
		success: function(data){
			$ul = $('#selectRank').siblings('ul');
			$ul.html('');
			if(data.length>0){
				for(var i in data){
					$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].rcode +"'>"+data[i].rname+"</a></li>");		
					$ul.append($li);
				}
			}else{
				$li = $("<li><a href='#' class='link-select' data-value='N'>부서 없음</a></li>");		
				$ul.append($li);
			}
		}
	})
});

$('.selectBox').on('click',function(){
	$(this).children('ul').toggle();
	$(this).children('.fa-angle-down').toggleClass('rotate-angle');
})

$(document).on('click', '.link-select', function(){
	var dv = $(this).attr('data-value');
	var dt = $(this).text();
	
	$(this).parents('.selectBox').find('.link-selected').text(dt);
	$(this).parents('.selectBox').find('input').attr('data-value',dv);
	$(this).parents('.selectBox').find('input').val(dv);
	
	$(this).parents('ul').siblings('.fa-angle-down').removeClass('rotate-angle');
	//날씨 선택 누르면 input 활성화
	if($('#selectDate').attr('data-value') == 'dateSelect'){
		$('#date').attr('disabled', false);
		$('#date2').attr('disabled', false);
	}else{
		$('#date').attr('disabled', true);
		$('#date2').attr('disabled', true);
	}
	//이메일 선택입력되면 입력할 수 있음.
	if($('#email3').attr('data-value') == 'input-text'){
		$('#add-email2').attr('disabled', false);
		$('#add-email2').css('cursor', 'pointer');
	}else{
		$('#add-email2').attr('disabled', true);
		$('#add-email2').css('cursor', 'auto');
	}
	
	if($('#modify-email3').attr('data-value') == 'input-text'){
		$('#modify-email2').attr('disabled', false);
		$('#modify-email2').css('cursor', 'pointer');
	}else{
		$('#modify-email2').val('');
		$('#modify-email2').attr('disabled', true);
		$('#modify-email2').css('cursor', 'auto');
	}
})

$('.selectBox ul').mouseleave(function(){
	$(this).siblings('.fa-angle-down').removeClass('rotate-angle');
	$(this).hide();
})
//파일 미리보기
$(document).ready(function(){
   var fileTarget = $('.filebox .upload-hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }
        
        if ($(this)[0].files[0].type.match(/image/)) $(this).siblings('.upload-name').val(filename);
        
    });

    var imgTarget = $('.preview-image .upload-hidden');

    imgTarget.on('change', function(){
        var parent = $(this).parent();
        if(window.FileReader){
            if (!$(this)[0].files[0].type.match(/image/)) {
            	alert('이미지파일만 가능합니다.');
            	return;
            }else{
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.find('.upload-thumb-wrap img').attr('src',src);
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
            }
        }
        else {
           alert('파일을 읽을 수 없습니다.')      
        }
    });
});
$('#addBtn').on('click',function(){
	$('#add-popup-form').fadeIn();
})
$('h1 .fa-times').on('click',function(){
	$('.popup-form').fadeOut();
})
$('.add-btn-form button:first-child').on('click',function(){
	$('.popup-form').fadeOut();
})

$('#addBtn').on('click',function(){
	$.ajax({
		url: '/Human/humanAddDeptList',
		success: function(data){
			console.log(data.length);
			$ul = $('#add-select-dept ul');
			$ul.html('');
			if(data.length>0){
				for(var i in data){
					$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].dcode +"'>"+data[i].dname+"</a></li>");		
					$ul.append($li);
				}
			}else{
				$li = $("<li><a href='#' class='link-select' data-value='N'>부서 없음</a></li>");		
				$ul.append($li);
			}
		}
	})
	
	$.ajax({
		url: '/Human/humanAddRankList',
		success: function(data){
			console.log(data.length);
			$ul = $('#add-select-rank ul');
			$ul.html('');
			if(data.length>0){
				for(var i in data){
					$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].rcode +"'>"+data[i].rname+"</a></li>");		
					$ul.append($li);
				}
			}else{
				$li = $("<li><a href='#' class='link-select' data-value='N'>부서 없음</a></li>");		
				$ul.append($li);
			}
		}
	})
})

$('input[name="add-eno"]').on('keyup',function(){
	var eno = $('input[name="add-eno"]').val();
	
	if(eno == ''){
		$('#enoChk').text('');
	}else{
		$.ajax({
			url: '/Human/enoDupChk',
			data: {eno:eno},
			success: function(data){
				if(data=='true'){
					$('#enoChk').text('사용 불가능');
					$('#enoChk').css('color','red');
					$('#enoChk2').val(0);
				}else{
					$('#enoChk').text('사용 가능');
					$('#enoChk').css('color','green');
					$('#enoChk2').val(1);
				}
			}
		})
	}
})

function dataChk(){
	var eno = $('input[name="add-eno"]');
	var name = $('input[name="add-name"]');
	var email = $('input[name="add-email"]');
	var email2 = $('input[name="add-email2"]');
	var email3 = $('input[name="add-email3"]');
	var inDate = $('input[name="add-inDate"]');
	var birthDay = $('input[name="add-date"]');
	var gender = $('input[name="gender-not"]');
	var address1 = $('input[name="address1"]');
	var address2 = $('input[name="address2"]');
	var phone = $('input[name="phone"]');
	var phone2 = $('input[name="phone2"]');
	var phone3 = $('input[name="phone3"]');
	var bool = true;
	
	if(eno.val() == ''){
		alert('사원번호를 입력해주세요.');
		eno.focus();
		return false;
	}
	
	if(name.val() == ''){
		alert('이름을 입력해주세요.');
		name.focus();
		return false;
	}
	
	if(email.val() == ''){
		alert('이메일을 입력해주세요.');
		email.focus();
		return false;
	}
	
	if(email3.val() == 'input-text'){
		if(email2.val() == ''){
			alert('이메일을 입력해주세요');
			email2.focus();
			return false;
		}
	}
	if(email3.val() == ''){
		alert('이메일을 선택해주세요');
		return false;
	}
	
	if(inDate.val() == ''){
		alert('날짜를 선택해주세요');
		return false;
	}
	
	if(birthDay.val() == ''){
		alert('날짜를 선택해주세요');
		return false;
	}
	
	if(gender.val() == 'N'){
		alert('성별을 선택해주세요');
		return false;
	}
	if(address1.val() == ''){
		alert('주소를 입력해주세요');
		address1.focus();
		return false;
	}
	if(address2.val() == ''){
		alert('상세 주소를 입력해주세요');
		address2.focus();
		return false;
	}
	if(phone.val() == ''){
		alert('핸드폰 앞자리를 선택해주세요');
		return false;
	}
	
	if(phone2.val() == ''){
		alert('핸드폰 번호를 입력해주세요');
		phone2.focus();
		return false;
	}
	
	if(phone3.val() == ''){
		alert('핸드폰 번호를 입력해주세요');
		phone3.focus();
		return false;
	}
	
	if(bool){
		$('.popup-form').submit();
 		$(".popup-form").fadeOut();
	}
}


$('.human_name').on('click',function(){
	var eno = $(this).parent().prev().text();
	
	$.ajax({
		url: '/Human/humanModifyInfo',
		data: {eno:eno},
		success: function(data){
			console.log(data)
			if(data.outyn=='Y'){
				$('#popup-Modify-form .add-btn-form div').show();
				$('#popup-Modify-form .add-btn-form button').hide();
			}else{
				$('#popup-Modify-form .add-btn-form div').hide();
				$('#popup-Modify-form .add-btn-form button').show();
			}
			if(data.renameFileName != null){
				$('.upload-thumb').attr('src','resources/Profile-images/'+data.renameFileName);
			}else{
				$('.upload-thumb').attr('src','resources/images/default-profile.jpg');
			}
			
			$('input[name="modify-eno"]').val(data.eno);
			$('input[name="modify-name"]').val(data.name);
			$('#modify-dept').attr('data-value', data.dcode);
			$('#modify-dept').val(data.dcode);
			$('#modify-select-dept .link-selected').text(data.dname);
			$('#modify-rank').attr('data-value', data.rcode);
			$('#modify-rank').val(data.rcode);
			
			var eNum = data.email.indexOf("@");
			var emailId = data.email.substring(0,eNum);
			var email = data.email.substring(eNum+1);
			$('input[name="modify-email"]').val(emailId);
			$('input[name="modify-email2"]').val(email);
			
			
			$('#modify-select-rank .link-selected').text(data.rname);
			$('input[name=modify-inDate]').val(data.indate);
			$('input[name=modify-date]').val(data.birthday);
			if(data.gender == 'W'){
				$('#modify-gender-woman').prop('checked',true);
			}else{
				$('#modify-gender-man').prop('checked',true);
			}
			var addressArr = data.address.split("/");
			$('#popup-Modify-form input[name=address1]').val(addressArr[0]);
			$('#popup-Modify-form input[name=address2]').val(addressArr[1]);
			
			
			var pArr = data.phone.split("-");	
			$('#modify-phone').attr('data-value',pArr[0]).val(pArr[0]);
			$('#modify-phone').next().text(pArr[0]);
			$('input[name=modify-phone2]').val(pArr[1]);
			$('input[name=modify-phone3]').val(pArr[2]);
			}
		
	})
	
	$.ajax({
		url: '/Human/humanAddDeptList',
		success: function(data){
			$ul = $('#modify-select-dept ul');
			$ul.html('');
			if(data.length>0){
				for(var i in data){
					$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].dcode +"'>"+data[i].dname+"</a></li>");		
					$ul.append($li);
				}
			}else{
				$li = $("<li><a href='#' class='link-select' data-value='N'>부서 없음</a></li>");		
				$ul.append($li);
			}
		}
	})
	
	$.ajax({
		url: '/Human/humanAddRankList',
		success: function(data){
			$ul = $('#modify-select-rank ul');
			$ul.html('');
			if(data.length>0){
				for(var i in data){
					$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].rcode +"'>"+data[i].rname+"</a></li>");		
					$ul.append($li);
				}
			}else{
				$li = $("<li><a href='#' class='link-select' data-value='N'>부서 없음</a></li>");		
				$ul.append($li);
			}
		}
	})
	
	
	$('#popup-Modify-form').fadeIn();
})

$('input[name="modify-eno"]').on('keyup',function(){
	var eno = $('input[name="modify-eno"]').val();
	
	if(eno == ''){
		$('#modify-enoChk').text('');
	}else{
		$.ajax({
			url: '/Human/enoDupChk',
			data: {eno:eno},
			success: function(data){
				if(data=='true'){
					$('#modify-enoChk').text('사용 불가능');
					$('#modify-enoChk').css('color','red');
					$('#modify-enoChk2').val(0);
				}else{
					$('#modify-enoChk').text('사용 가능');
					$('#modify-enoChk').css('color','green');
					$('#modify-enoChk2').val(1);
				}
			}
		})
	}
})