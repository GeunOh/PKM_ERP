$(function(){
	$('#human').css('display','block');
});

$('.selectBox').on('click',function(){
	$(this).children('ul').toggle();
	$(this).children('.fa-angle-down').toggleClass('rotate-angle');
})

$('.link-select').on('click',function(){
	var dv = $(this).attr('data-value');
	var dt = $(this).text();
	$(this).parents('.selectBox').find('.link-selected').text(dt);
	$(this).parents('.selectBox').find('input').attr('data-value',dv);
	$(this).parents('.selectBox').find('input').val(dv);
	
	$(this).parents('ul').siblings('.fa-angle-down').removeClass('rotate-angle');
	$(this).parents('ul').hide();
	//날씨 선택 누르면 input 활성화
	if($('#selectDate').attr('data-value') == 'dateSelect'){
		$('#date').attr('disabled', false);
		$('#date2').attr('disabled', false);
	}else{
		$('#date').attr('disabled', true);
		$('#date2').attr('disabled', true);
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
	$('.popup-form').fadeIn();
})
$('h1 .fa-times').on('click',function(){
	$('.popup-form').fadeOut();
})
$('.add-btn-form button').on('click',function(){
	$('.popup-form').fadeOut();
})
