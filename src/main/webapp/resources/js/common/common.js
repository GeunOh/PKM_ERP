/**
 * 	공통 script
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