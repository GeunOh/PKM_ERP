<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/human/myInfo.css">
<link href="resources/css/plugin/selectbox.min.css" rel="stylesheet">
<script src="resources/js/plugin/selectbox.min.js"></script>
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
				<table id="profileTable">
					<tr>
						<td rowspan="3">
							<img width="200px" height="230px" src="resources/Profile-images/${loginUser.renameFileName }">
						</td>
						<th>사원번호</th>
						<td>${loginUser.eno }</td>
						<th>사원명</th>
						<td>${loginUser.name }</td>
						<th>이메일</th>
						<td>${loginUser.email }</td>
					</tr>
					<tr>
						<th>부서명</th>
						<td>${loginUser.dcode }</td>
						<th>직급</th>
						<td>${loginUser.rcode }</td>
						<th>입사일</th>
						<td>${loginUser.indate }</td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td>${loginUser.phone }</td>
						<th>생년월일</th>
						<td>${loginUser.birthday }</td>
						<th>주소</th>
						<td>${loginUser.address }</td>
					</tr>
				</table>
			</div>
			<!-- 공지사항  -->
			<div id="noticeBox" class="content_Box">
				<h2>공지사항</h2>
				<!-- 테이블 -->
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
		</div>
		<div id="rightBox">
			<!-- 출퇴근 -->
			<div id="commuteBox" class="content_Box">
				<h2>출퇴근</h2>
				<div id="sysdateBox">
					<span>현재시간 
						<span id="hh">00</span>:<span id="mm">00</span>:<span id="ss">00</span>
						<span id="yyyy-mm-dd"></span>
						<span id="day">TUE</span>
					</span>
				</div>
				<div id="buttons">
					<button>ON</button>
					<button>OFF</button>
				</div>
			</div>
			<!-- 남은 휴가 일수 -->
			<div id="vacationDayBox" class="content_Box">
				<h2>연차 정보</h2>
				<div>
					<p>10일</p>
					<span>남은 연차</span>
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
</body>
</html>