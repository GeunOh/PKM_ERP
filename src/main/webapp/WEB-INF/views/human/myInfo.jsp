<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/human/myInfo.css">
<link href="resources/css/plugin/selectbox.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
<script src="https://uicdn.toast.com/tui.chart/latest/tui-chart-all.js"></script>
<title>내 정보</title>
</head>
<body>

	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h2>${vacation }</h2>
		<h1>내 공간</h1>
		<div id="leftBox">
			<!-- 프로필 -->
			<div id="profileBox" class="content_Box">
				<h2>내 정보</h2>
<!-- 				<table id="profileTable"> -->
<!-- 					<tr> -->
<!-- 						<td rowspan="3"> -->
<%-- 							<div style="text-align: center;"><img width="70px" height="70px" src="resources/Profile-images/${loginUser.renameFileName }"></div> --%>
<%-- 							<div><label>${loginUser.name}</label> ${loginUser.rcode}님 환영합니다.</div> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
				<div id="userInfo">
					<c:if test="${loginUser.renameFileName eq null}"><div style="text-align: center;"><img width="100px" height="100px" src="resources/images/default-profile.jpg"></div></c:if> 
					<c:if test="${loginUser.renameFileName ne null}"><div style="text-align: center;"><img width="100px" height="100px" src="resources/Profile-images/${loginUser.renameFileName }"></div></c:if> 
					<div id="userText"><strong>${loginUser.name}</strong> ${loginUser.rname}님 환영합니다.</div>
				</div>
			</div>
			
			<!-- 날씨 -->
			<div id="weatherBox" class="content_Box">
				<h2>날씨</h2>
				<div id="currentWeatherForm">
					<span>오늘의 날씨</span>
					<div class="currenticon">아이콘</div>
					<div class="currentTemp"></div>
				</div>
				<div id="forecastForm">
<!-- 					<div class="forecast"><div class="dateForm"><p>09-12</p><p>(금)</p></div></div> -->
				</div>
			</div>
			
			<!-- 차트 -->
			<div id="chartBox" class="content_Box">
				<h2>출근 통계</h2>
				<div id="chart-area"></div>
			</div>
			
			<!-- 공지사항  -->
			<div id="noticeBox" class="content_Box">
				<h2>공지사항</h2>
				<table id="noticeTable">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>게시날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>test 제목</td>
							<td>2020-08-27</td>
							<td>5</td>
						</tr>
						<tr>
							<td>2</td>
							<td>test 제목</td>
							<td>2020-08-27</td>
							<td>5</td>
						</tr>
						<tr>
							<td>3</td>
							<td>test 제목</td>
							<td>2020-08-27</td>
							<td>5</td>
						</tr>
						<tr>
							<td>4</td>
							<td>test 제목</td>
							<td>2020-08-27</td>
							<td>5</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 쪽지 -->
			<div id="messaeBox" class="content_Box">
				<h2>쪽지</h2>
			</div>
		</div>
		<div id="rightBox">
			<!-- 출퇴근 -->
			<div id="commuteBox" class="content_Box">
				<h2>출퇴근</h2>
				<div id="sysdateBox">
					<span>
						<span id="yyyy-mm-dd" class="date"></span>
						<span id="hh" class="time"></span><span id="mm" class="time"></span><span id="ss" class="time"></span>
					</span>
				</div>
				<div id="buttons">
					<dl>
						<dt><a href="javascript:workInOut(1);">출근</a></dt>
						<dd><strong>${work.intime}</strong>${work.type}</dd>
					</dl>
					<dl>
						<dt><a href="javascript:workInOut(2);" >퇴근</a></dt>
						<dd><strong>${work.outtime}</strong></dd>
					</dl>
				</div>
			</div>
			<script>
				//출,퇴근 시간 찍기
				var work = '${work}';
				var workIn = '${work.intime}';
				var workOut = '${work.outtime}';
				function workInOut(e){
					
					if(e==1){
						if(workIn != '') alert('이미 출근체크를 하셨습니다.')
						else location.href = '/Human/WorkTimeInOutAdd?num=1';
					}else{
						if(workIn == '') alert('출근체크가 되지 않았습니다. \n출근체크부터 해주시길 바랍니다.')
						else if(workOut != '') alert('이미 퇴근체크를 하셨습니다.')
						else location.href = '/Human/WorkTimeInOutAdd?num=2';
					}
				}
			</script>
			<!-- 남은 휴가 일수 -->
			<div id="vacationDayBox" class="content_Box">
				<h2>연차 정보</h2>
				<div>
					<c:if test="${empty vacationDay}"><p>0일</p></c:if>
					<c:if test="${not empty vacationDay}"><p>${vacationDay}일</p></c:if>
					<span>남은 연차</span>
					<input type="hidden" name="vacationDay" value="${vacationDay }">
				</div>
			</div>
			<!-- 휴가 신청 -->
			<div id="vacationUseBox" class="content_Box">
				<h2>휴가 신청</h2>
				<div>
					<i class="fas fa-plane"></i>
				</div>
			</div>
		</div>
		
		<!-- 휴가신청 팝업창 -->
		<form action="/Human/addVacation" class="popup-form">
			<input type="hidden" name="eno" value="${loginUser.eno }">
			<div class="popupContent">
				<h2>휴가 신청
				<i class="fas fa-times" aria-hidden="true"></i>
				</h2>
				<div class="content-form">
					<span>휴가 신청 정보</span>
					<span style="top: -23px; right: 0; font-size: 12px; text-align: right;">* 필수 정보 입력란입니다.</span>
					<div class="add-form">
						<span class="add-title">휴가구분</span>
						<div class="selectBox" id="add-select-vType" style="height: 19px; line-height: 19px; vertical-align: middle; border-radius: 3px;">
							<input type="hidden" id="add-vType" name="vType" value="">
							<a href="#none" class="link-selected" style="line-height: 0;">선택</a>
							<ul style="max-height: 120px; overflow-y: scroll;">
								<li><a href="#" class="link-select" data-value="연차">연차</a></li>
								<li><a href="#" class="link-select" data-value="병가">병가</a></li>
								<li><a href="#" class="link-select" data-value="공가">공가</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle" aria-hidden="true"></i>
						</div>
					</div>
					<div class="add-form">
						<span class="add-title">휴가 날짜</span>
						<input type="date" class="txtBox" name="startDate" required style="border-radius: 3px;">
						<span>&nbsp;~&nbsp;</span>
						<input type="date" class="txtBox" name="endDate" required style="border-radius: 3px;">
						<input type="text" class="txtBox" id="add-useDay" disabled value="0일">
						<input type="hidden" name="useDay" value="0">
					</div>
				</div>
				<div class="content-form">
					<span>휴가 신청 사유</span>
					<span style="top: -23px; right: 0; font-size: 12px; text-align: right;">선택 사항입니다.</span>
					<input type="text" class="txtBox add-text" name="reason">
				</div>
				<div class="content-form add-btn-form">
					<button type="button">
						<i class="fas fa-times" aria-hidden="true"></i> 취소
					</button>
					<button type="button" onclick="dataChk()">
						<i class="fas fa-check" aria-hidden="true"></i> 신청
					</button>
				</div>
			</div>
			<div class="popupLayer"></div>
		</form>
		<!-- // 휴가신청 팝업창 -->
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/human/myInfo.js"></script>
	<script>
			$(document).ready(function(){
				var chart = tui.chart;
				var container = document.getElementById('chart-area');
				var data = {
				    categories: ['June', 'July', 'Aug', 'Sep', 'Oct', 'Nov'],
				    series: [
				        {
				            name: 'Budget',
				            data: [5000, 3000, 5000, 7000, 6000, 4000]
				        },
				        {
				            name: 'Income',
				            data: [8000, 1000, 7000, 2000, 5000, 3000]
				        }
				    ]
				};
				var options = {
				    chart: {
				        width: 350,
				        height: 350,
				        title: 'Monthly Revenue',
				        format: '1,000'
				    },
				    yAxis: {
				        title: 'Month'
				    },
				    xAxis: {
				        title: 'Amount',
				        min: 0,
				        max: 9000,
				        suffix: '$'
				    },
				     series: {
				         showLabel: true
				     },
				    usageStatistics: false
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

//	 			tui.chart.registerTheme('myTheme', theme);
//	 			options.theme = 'myTheme';

				chart.barChart(container, data, options);
			})
		</script>
</body>
</html>