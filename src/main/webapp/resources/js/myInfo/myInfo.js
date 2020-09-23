var oEditors = []; 
var oEditors2 = []; 
var startText = '<p style="font-family:굴림체; font-size: 12px; font-weight: bold;">이미지는 최대 500x500이며, 초과될 경우 자동으로 500x500으로 들어가게 됩니다.</p>';
var text = '';
nhn.husky.EZCreator.createInIFrame({ 
	oAppRef : oEditors, 
	elPlaceHolder : "ir1",  
	sSkinURI : "resources/NaverEditor/SmartEditor2Skin.html",  
	fCreator : "createSEditor2", 
	fOnAppLoad : function(){ //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용 
		oEditors.getById["ir1"].exec("PASTE_HTML", [startText]); 
	 },
	htParams : { 
			bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseVerticalResizer : false, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseModeChanger : false,// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
			fOnBeforeUnload : function() {}
			} 
});

nhn.husky.EZCreator.createInIFrame({ 
	oAppRef : oEditors2, 
	elPlaceHolder : "ir2", 
	sSkinURI : "resources/NaverEditor/SmartEditor2Skin.html", 
	fCreator : "createSEditor2",
	fOnAppLoad : function(){ //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용 
					oEditors2.getById["ir2"].exec("PASTE_HTML", [text]); 
				 },
	htParams : { 
			bUseToolbar : true, 
			bUseVerticalResizer : false, 
			bUseModeChanger : false,
			fOnBeforeUnload : function() {}
			} 
});

//클릭시 정규표현식 or submit
$('#writeContent').click(function(){
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	var ir1 = $("#ir1").val();
	var result = true;
	
	if($('#title').val() == ''){
		alert('제목을 입력해주세요.');
		$('#title').focus();
		return;
	}
	if( ir1 == ""  || ir1 == null || ir1 == '<br>')  {
        alert("내용을 입력하세요.");
        oEditors.getById["ir1"].exec("FOCUS"); //포커싱
        return;
    }
	if(result){
		alert('등록완료');
		$('#NoticeWriteForm').submit();
	}
})

//작성하기 팝업창 ON
$('#writeBtn').click(function(){
	$('#modal').fadeIn();
	$('.class_smarteditor2').css('height', '360px'); // 스마트 에디터 height 지정
	$('.class_smarteditor2').attr('src',$('.class_smarteditor2').attr('src')); // 스마트 에디터 iframe 새로고칭
})
//작성하기 폼 OFF
$('#wclose').click(function(){
	$('#modal').fadeOut();
})

//수정/삭제 버튼 클릭시 가운데 띄우기 팝업창
$('#writeBtn').click(function(){
	var wrap = $('#wrap').outerHeight();
	var content = $('#content').outerHeight();
	
	if(wrap > content) $('.modal').css("height",wrap);
	else $('.modal').css("height",content+74);
})
$('.uBtn').click(function(){
	var wrap = $('#wrap').outerHeight();
	var content = $('#content').outerHeight();
	
	if(wrap > content) $('.modal').css("height",wrap);
	else $('.modal').css("height",content+74);
})
//공지사항 글 수정 폼 띄우기
$('.ub_left').click(function(){
	var n = document.NoticeUpdateForm;
	var title = $(this).parent('.contentForm').siblings('.title').find('.text').html();
	text = $(this).siblings('.content').html();
	$('#utitle').val(title);
	$('.class_smarteditor2').css('height', '360px'); // 스마트 에디터 height 지정
	$('.class_smarteditor2').attr('src',$('.class_smarteditor2').attr('src')); // 스마트 에디터 iframe 새로고칭
	n.no.value=$(this).siblings('.no').val();
//	$('#modal2 .modal-layer').css("height",$('#content').outerHeight());
	$('#modal2').fadeIn();
})
//공지사항 글 수정 폼 없애기
$('#uclose').click(function(){
	$('#modal2').fadeOut();
})
//클릭시 에디터에서 textarea 글로 넣어줌
$('#updateContent').click(function(){
	oEditors2.getById["ir2"].exec("UPDATE_CONTENTS_FIELD", []);
	alert('공지사항을 업데이트했습니다.');
	$('#NoticeUpdateForm').submit();
})
//공지사항 삭제 폼 띄우기
$('.ub_right').click(function(){
	var d = document.NoticeDeleteForm;
	d.no.value=$(this).siblings('.no').val();
	$('#modal3').fadeIn();
})
//공지사항 삭제 폼 없애기
$('#dclose').click(function(){
	$('#modal3').fadeOut();
})
//공지사항 삭제 하기
$('#DeleteContent').click(function(){
	if(confirm) $('#NoticeDeleteForm').submit();
	
})

//css효과
$('.title').click(function(){
	if($(this).children().hasClass('rotateArrow')){
		$(this).children('.icon').removeClass('rotateArrow');
		$(this).removeClass('clickColor');
		$(this).find('.fa-chevron-right').removeClass('clickColor2');
		$(this).find('.text').removeClass('clickColor2');
		$(this).find('.date').removeClass('clickColor2');
		$(this).siblings('.contentForm').slideUp();
	}else{
		$(this).children('.icon').addClass('rotateArrow');
		$(this).addClass('clickColor');
		$(this).find('.fa-chevron-right').addClass('clickColor2');
		$(this).find('.text').addClass('clickColor2');
		$(this).find('.date').addClass('clickColor2');
		$(this).siblings('.contentForm').slideDown();
	}
})