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