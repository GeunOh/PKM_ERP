/* pie Chart */
var chart = tui.chart;
var container = document.getElementById('chart-area');
var data = {
    categories: ['Browser'],
    series: [
        {
            name: 'Chrome',
            data: 46.02
        },
        {
            name: 'IE',
            data: 20.47
        },
        {
            name: 'Firefox',
            data: 17.71
        },
        {
            name: 'Safari',
            data: 5.45
        },
        {
            name: 'Opera',
            data: 3.10
        },
        {
            name: 'Etc',
            data: 7.25
        }
    ]
};
var options = {
    chart: {
        width: 550,
        height: 300,
        title: '거래처별 거래현황',
        format: function(value, chartType, areaType, valuetype, legendName) {
            if (areaType === 'makingSeriesLabel') { // formatting at series area
                value = value + '%';
            }

            return value;
        }
    },
    series: {
        radiusRange: ['40%', '100%'],
        showLabel: false
    },
    tooltip: {
        suffix: '%'
    },
    legend: {
        align: 'right'
    },	
    /* 우측 메뉴 삭제 */
    chartExportMenu: {
    	visible: false
    }
};
var theme = {
    series: {
        series: {
            colors: [
                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
                '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
            ]
        },
        label: {
            color: '#fff',
            fontFamily: 'sans-serif'
        }
    }
};

// For apply theme
chart.registerTheme('myTheme', theme);
options.theme = 'myTheme';

chart.pieChart(container, data, options);

/* Column Chart */
var container = document.getElementById('columnChart-area');
var data = {
    categories: ['May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    series: [
        {
            name: 'Budget',
            data: [4000, 5000, 3000, 5000, 7000, 6000, 4000, 1000]
        },
        {
            name: 'Income',
            data: [7000, 8000, 1000, 7000, 2000, 7000, 3000, 5000]
        },
        {
            name: 'Expenses',
            data: [-5000, -4000, -4000, -6000, -3000, -4000, -5000, -7000]
        },
        {
            name: 'Debt',
            data: [-3000, -6000, -3000, -3000, -1000, -2000, -4000, -3000]
        }
    ]
};
var options = {
    chart: {
        width: 550,
        height: 300,
        title: 'Monthly Revenue',
        "format": "1,000"
    },
    yAxis: {
        title: 'Amount',
        min: -10000,
        max: 10000
    },
    xAxis: {
        title: 'Month'
    },
    legend: {
        visible: false
    },
    chartExportMenu: {
    	visible: false /* 우측 메뉴 삭제 */
    },
    
};
var theme = {
    series: {
        colors: [
            '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
            '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
        ]
    }
};

// For apply theme
//tui.chart.registerTheme('myTheme', theme);
//options.theme = 'myTheme';
tui.chart.columnChart(container, data, options);

// 팝업창 버튼들 작동
$('#addBtn').on('click',function(){
	$('#add-popup-form').fadeIn();	// 추가 팝업창
})
$('h1 .fa-times').on('click',function(){
	$('.popup-form').fadeOut();
})
$('.add-btn-form button:first-child').on('click',function(){
	$('.popup-form').fadeOut();
})

// 거래처 추가시 ccode 중복확인
$("input[name=add_ccode]").on("keyup", function(){
	var ccode = $(this).val();
	
	$.ajax({
		url: "/Stock/ccodeChk",
		data: {ccode, ccode},
		success: function(data) {
			if(data == "exist"){
				$("#addCcodeChk").text("사용 불가능").css('color','red');
				$("input[name=addCcodeChk]").attr('value',0);
			} else {
				$("#addCcodeChk").text("사용 가능").css('color','green');
				$("input[name=addCcodeChk]").attr('value',1);
			}
		}
	})
})
// 거래처  수정시 ccode 중복 확인
$("input[name=modify_ccode]").on("keyup", function(){
	var ccode = $(this).val();
	var beforeCcode = $("input[name=beforeCcode]").val()
	if(ccode == beforeCcode){
		$("#modifyCcodeChk").text("");
		$("input[name=modifyCcodeChk]").attr('value','allow');
	}
	// 수정할 코드와 이전 코드가 다르면 중복확인
	if(ccode != beforeCcode){
		$.ajax({
			url: "/Stock/ccodeChk",
			data: {ccode, ccode},
			success: function(data) {
				if(data == "exist"){
					$("#modifyCcodeChk").text("사용 불가능").css('color','red');
					$("input[name=modifyCcodeChk]").attr('value',"refuse");
				} else {
					$("#modifyCcodeChk").text("사용 가능").css('color','green');
					$("input[name=modifyCcodeChk]").attr('value',"allow");
				}
			}
		})
	}
})
// 입력값 체크
function dataChk(value) {
	var $ccode;
	var $cname;
	var $cmanager;
	var $cphone;
	
	if(value=="add") {
		$ccode = $("input[name=add_ccode]");
		$cname = $("input[name=add_cname]");
		$cmanager = $("input[name=add_cmanager]");
		$cphone = $("input[name=add_cphone]");
	} else if(value == "modify") {
		$ccode = $("input[name=modify_ccode]");
		$cname = $("input[name=modify_cname]");
		$cmanager = $("input[name=modify_cmanager]");
		$cphone = $("input[name=modify_cphone]");
	}
	if($ccode.val() == ''){
		alert("사업자등록번호를 입력해주세요.");
		$ccode.focus();
		return false;
	}
	if($cname.val() == ''){
		alert("거래처명을 입력해주세요.");
		$cname.focus();
		return false;
	}
	if($cmanager.val() == ''){
		alert("담당자를 입력해주세요.");
		$cmanager.focus();
		return false;
	}
	if($cphone.val() == ''){
		alert("연락처를 입력해주세요.");
		$cphone.focus();
		return false;
	}
	return true;
}
// 거래처 추가
function addClient() {
	var chk = $("input[name=addCcodeChk]").val();
	if(dataChk("add")){
		if(chk==0) {
			alert("중복된 사용자등록번호입니다.");
			return;
		}
		if(confirm("거래처를 추가하시겠습니까?")){
			$("#add-popup-form").submit();
	 		$(".popup-form").fadeOut();
		}
	}
}
// 거래처 수정/삭제 선택
$("#clientTable tbody tr").on("dblclick", function() {
	$("#delete-popup-form").fadeIn();
	var cname = $(this).children("td").eq(0).text();
	var ccode = $(this).children("td").eq(1).text();
	$("input[name=del_ccode").attr("value", ccode);
	$("input[name=beforeCcode").attr("value", ccode);
	
	$("#selectInfo").text("["+ccode+"] " +cname + " " );
})
$("#clientTable tbody tr").on("mouseenter", function() {
	$("#clientTable tbody tr").css('background-color','#fff');
	$(this).css('background-color','#f6f6f6').css('cursor','pointer');
})
// 거래처 삭제
function deleteClient() {
	if(confirm("정말로 삭제하시겠습니까?")){
		$("#delete-popup-form").submit();
	}
}
//거래처 수정 화면
function modifyForm() {
	$("#delete-popup-form").hide();
	$("#modify-popup-form").fadeIn();
	var ccode = $("input[name=del_ccode").val();
	
	$.ajax({
		url: "/Operation/showClient",
		data: {ccode, ccode},
		success: function(data){
			$("input[name=modify_ccode").val(data.ccode);
			$("input[name=modify_cname").val(data.cname);
			$("input[name=modify_cmanager").val(data.cmanager);
			$("input[name=modify_cphone").val(data.cphone);
			$("input[name=modify_c_comment").val(data.c_comment);
		}
	})
}
function modifyClient(){
	var chk = $("input[name=modifyCcodeChk]").val();
	if(dataChk("modify")){
		if(chk=="refuse") {
			alert("중복된 사용자등록번호입니다.");
			return;
		}
		if(confirm("거래처를 수정하시겠습니까?")){
			$("#modify-popup-form").submit();
		}
	}
}

