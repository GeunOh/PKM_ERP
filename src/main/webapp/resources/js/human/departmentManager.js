
$(function(){
	$('#human').css('display','block');
	
	// 각 부서 클릭시 해당 부서 내용 조회
	$("#branch-area li span").on("click", function() {
		// 해당 부서이름
		var deptName = $(this).text();
		
		$.ajax({
			async: false,
			url: "/Human/departmentShow",
			datatype: "text",
			data: {deptName: deptName},
			success: function(data, textStatus) {
				console.log(data.startDate);
				$("#dname").text(data.dname);
				$("#dname").siblings().text("부서명");
				$("#dcode").text(data.dcode);
				$("#dcode").siblings().text("부서코드");
				$("#dboss").text(data.dboss);
				$("#dboss").siblings().text("부서장");
				$("#startDate").text(data.startDate);
				$("#startDate").siblings().text("시작일");
				$("#dcomment").text(data.dcomment);
				$("#dcomment").siblings().text("부서소개");

			}
		})
	})
});
