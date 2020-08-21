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
