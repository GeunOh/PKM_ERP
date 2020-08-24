/**
 * 	공통(템플릿) script
 */

// 드롭다운 메뉴 토글 기능
function showMenu(){
	var menu = document.getElementById("dropdown-menu");
	if(menu.style.display == "block"){
		menu.style.display = "none";
	} else {
		menu.style.display = "block";
	}
}

// 사이드메뉴 슬라이드 토글 기능
$(function(){
	$("#mainMenu > li > span").on("click", function() {
		$(this).siblings("ul").slideToggle();
	})
});

