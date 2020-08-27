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

<script type="text/javascript">
	
	// 휴가 신청하기 버튼 클릭 시 나타나는 창
	function request() {
		var requestBox = document.getElementById("request-box");
		requestBox.style.display = "block";
	}
	
	// 나가기 버튼 클릭 시 나타나는 창
	function exit() {
		var requestBox = document.getElementById("request-box");
		requestBox.style.display = "none";
	}
	
</script>

</head>
<body>

	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>내 공간</h1>
		<div id="leftBox">
			<!-- 프로필 -->
			<div id="profileBox" class="content_Box">
				<h2>내 정보</h2>
				
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
					<span>현재시간 10:42 2020-08-27 TUE</span>
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
				<h2>연차 신청</h2>
				<div>
					<i class="fas fa-plane"></i>
				</div>
			</div>
		</div>
		
		<!-- 휴가신청란 -->
		<div id="request-box">
			<div id="dim-box"></div>
			<div id="request-content">
				<h2>휴가신청</h2>
				<form action="">
					<table>
						<tr>
							<th>사원번호</th>
							<td>000001</td>
							<th>성명</th>
							<td>홍길동</td>
							<th>부서</th>
							<td>PKM Development</td>
							<th>직급</th>
							<td>사원</td>
						</tr>
						<tr>
							<th>휴가분류</th>
							<td>
								<select class="justselect">
									<option>연차</option>
									<option>병가</option>
									<option>공가</option>
								</select>
							</td>
							<th>휴가시작일</th>
							<td><input type="date"></td>
							<th>휴가종료일</th>
							<td><input type="date"></td>
							<th>잔여일</th>
							<td id="residual-date">12일</td>
						</tr>
					</table>
					<p>휴가신청사유 & 비고</p>
					<textarea rows="6"></textarea>
					<div id="button-box">
						<input class="buttons" type="submit" value="휴가신청">
						<button class="buttons" type="button" onclick="exit();">나가기</button>
					</div>
				</form>
			</div>
		</div>
		<!-- // 휴가신청 -->
	</div>
	<!-- // wrap -->

</body>
</html>