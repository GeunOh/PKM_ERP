<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../common/headTag_user.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/human/myInfo.css">
<link href="resources/css/plugin/selectbox.min.css" rel="stylesheet">
<script src="resources/js/plugin/selectbox.min.js"></script>

<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
<script src="https://uicdn.toast.com/tui.chart/latest/tui-chart-all.js"></script>
<title>내 정보</title>
<style>
.tui-chart .tui-chart-series-custom-event-area {
    z-index: 0;
}
</style>
</head>
<body>
	<jsp:include page="../common/template_user.jsp"></jsp:include>
	<!-- wrap -->
	<div id="wrap">
		<h2>${vacation }</h2>
		<h1>내 공간</h1>
		<div id="leftBox">
			<!-- 프로필 -->
			<div id="profileBox" class="content_Box">
				<h2>내 정보</h2>
				<div id="userInfo">
					<c:if test="${loginUser.renameFileName eq null}"><div style="text-align: center;"><img width="100px" height="100px" src="resources/images/default-profile.jpg"></div></c:if> 
					<c:if test="${loginUser.renameFileName ne null}"><div style="text-align: center;"><img width="100px" height="100px" src="resources/Profile-images/${loginUser.renameFileName }"></div></c:if> 
					<div id="userText"><strong>${loginUser.name}</strong> ${loginUser.rname}님 환영합니다.</div>
				</div>
				<div id="userMenu">
					<p id="myInfoModify">내 정보 변경</p>
					<p>몰랑</p>
				</div>
			</div>
			
			<!-- 날씨 -->
			<div id="weatherBox" class="content_Box">
				<h2>날씨</h2>
				<div id="currentWeatherForm">
					<span>오늘의 날씨</span>
					<div class="currenticon"></div>
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
							<th>첨부파일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${nlist }" var="n">
						 	<tr>
								<td>${n.bNo }</td>
								<td><a href="/MyInfo/notice">${n.title }</a></td>
								<td>${n.modify_date }</td>
								<c:if test="${n.org_file_name ne null }">
									<td><a href="/MyInfo/fileDown?bNo=${n.bNo }"><i class="fas fa-paperclip"></i></a></td>
								</c:if>
								<c:if test="${n.org_file_name eq null }">
									<td></td>
								</c:if>
							</tr>
						</c:forEach>
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
		<form action="/Human/addVacation" class="popup-form" id="vacation-add">
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
	</div>
	<!-- 개인정보변경 팝업  -->
	<form method="post" action="/Human/myInfoModify" id="Modify-popup-form" class="popup-form" enctype="Multipart/form-data" style="display: none;">
		<div class="popupContent">
			<h1>내 정보 수정 <i class="fas fa-times"></i></h1>
			<div class="filebox bs3-primary preview-image add-image">
				<span class="add-title">프로필 수정</span>
				<div class="upload-display"><div class="upload-thumb-wrap"><img src="resources/images/default-profile.jpg" class="upload-thumb"></div></div>
				<input class="txtBox upload-name " value="${loginUser.originalFileName} " disabled="disabled" style="width: 30%; border-radius: 3px;">
				<label for="input_file">파일 선택</label> 
			  	<input type="file" name="profile_img" id="input_file" class="upload-hidden"> 
			  	<span id="image-ex">- 수정할 이미지를 선택해주세요.</span>
			</div>
			<div class="content-form">
				<span>기본 정보</span>
				<div class="add-textform">
					<span class="add-title add-title2">사번</span>
					<input type="text" class="txtBox add-text" name="eno" value="${loginUser.eno}" readonly>
					<label id="enoChk"></label>
					<input type="hidden" id="enoChk2" value="0">
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">이름</span>
					<input type="text" class="txtBox add-text" name="add-name" value="${loginUser.name}" readonly>
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">부서</span>
					<div class="selectBox" id="add-select-dept" style="height: 19px; line-height: 19px; vertical-align: middle; border-radius: 3px;">
						<a href="#none" class="link-selected" style="line-height: 0;">${loginUser.dname}</a>
					</div>
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">직급</span>
					<div class="selectBox" id="add-select-rank" style="height: 19px; line-height: 19px; vertical-align: middle; border-radius: 3px;">
						<a href="#none" class="link-selected" style="line-height: 0;">${loginUser.rname}</a>
					</div>
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">이메일</span>
					<input type="text" class="txtBox" name="modify-email" style="width: 155px; border-radius: 3px;"> @ 
					<input type="text" class="txtBox" id="modify-email2" name="modify-email2" style="width: 155px; border-radius: 3px; cursor:auto;" readonly>
					<div class="selectBox" style="height: 19px; line-height: 19px; vertical-align: unset; border-radius: 3px;">
						<input type="hidden" id="modify-email3" name="modify-email3" data-value="all" value="all">
						<a href="#none" class="link-selected" style="line-height: 0;">선택</a>
						<ul>
							<li><a  class="link-select" data-value="input-text">선택 입력</a></li>
							<li><a  class="link-select" data-value="naver.com">naver.com</a></li>
							<li><a  class="link-select" data-value="daum.net">daum.net</a></li>
							<li><a  class="link-select" data-value="gmail.com">gmail.com</a></li>
						</ul>
						<i class="fas fa-angle-down searchAngle"></i>
					</div>
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">입사일</span>
					<input type="date" class="txtBox" style="border-radius: 3px;" value="${loginUser.indate}" readonly>
				</div>
			</div>
			<div class="content-form">
				<span>부가 정보</span>
				<div class="add-textform">
					<span class="add-title add-title2">생년월일</span>
					<input type="date" class="txtBox" name="modify-date" value="${loginUser.birthday}" style="border-radius: 3px;" >
					<input type="radio" id="gender-not" name="gender" value="N" checked ><label for="gender-not" >선택안함</label>
					<input type="radio" id="gender-woman" name="gender" value="W"><label for="gender-woman">여자</label>
					<input type="radio" id="gender-man" name="gender" value="M"><label for="gender-man">남자</label>
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">주소</span>
					<input type="text" id="address1" name="address1" class="postcodify_address txtBox add-text" value="">
					<button type="button" id="postcodify_search_button" class="address-btn">검색</button>
							
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<script>
						$(function(){
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">상세 주소</span>
					<input type="text" name="address2" class="postcodify_extra_info txtBox add-text" value="">
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">핸드폰 번호</span>
					<div class="selectBox" style="height: 19px; line-height: 19px; vertical-align: middle; border-radius: 3px;">
						<input type="hidden" id="phone" name="phone" data-value="all" value="">
						<a href="#none" class="link-selected" style="line-height: 0;">선택</a>
						<ul style="max-height: 120px; overflow-y: scroll;">
							<li><a href="#" class="link-select" data-value="010">010</a></li>
							<li><a href="#" class="link-select" data-value="011">011</a></li>
							<li><a href="#" class="link-select" data-value="017">017</a></li>
							<li><a href="#" class="link-select" data-value="018">018</a></li>
							<li><a href="#" class="link-select" data-value="019">019</a></li>
						</ul>
						<i class="fas fa-angle-down searchAngle"></i>
					</div> - 
					<input type="text" class="txtBox phone2" name="phone2" size="4"> - 
					<input type="text" class="txtBox phone2" name="phone3" size="4">
				</div>
				<div class="add-textform add-btn-form">
					<button type="button" id="modify_btn"><i class="fas fa-check"></i> 변경</button>
					<button type="button" id="cancle_btn"><i class="fas fa-times"></i> 취소</button>
				</div>
			</div>
		</div>
		<div class="popupLayer"></div>
		<script>
			$('#myInfoModify').on('click',function(){
				var email   = '${loginUser.email}';
				var address = '${loginUser.address}';
				var phone   = '${loginUser.phone}';
				var gender  = '${loginUser.gender}';
				var em = email.split('@'); 
				var ad = address.split('/');
				var ph = phone.split('-');
				
				$('input[name=modify-email]').val(em[0]);
				$('input[name=modify-email2]').val(em[1]);
				$('input[name=address1]').val(ad[0]);
				$('input[name=address2]').val(ad[1]);
				
				$('input[name=phone]').next().text(ph[0]);
				$('input[name=phone]').attr('data-value',ph[0]);
				$('input[name=phone]').val(ph[0]);
				$('input[name=phone2]').val(ph[1]);
				$('input[name=phone3]').val(ph[2]);
				
				if(gender == 'M'){
					$('#gender-man').attr('checked', true);
				}else{
					$('#gender-woman').attr('checked', true);
				}
				
			})
		</script>
	</form>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/human/myInfo.js"></script>
</body>
</html>