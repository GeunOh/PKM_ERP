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
		<h1>마이페이지</h1>
		<!-- 기본정보수정 -->
		<h2>기본정보수정</h2>
		<div id="myInfo-wrap">
			<form action="">
				<table>
					<colgroup>
						<col width="10%">
						<col width="7%">
						<col>
						<col width="7%">
						<col>
						<col width="7%">
						<col>
					</colgroup>
					<tr>
						<td rowspan="11" id="image-col">
							<img src="http://placehold.it/120x150">
							<p>120 * 150</p>
							<a>사진변경</a>
						</td>
						<th>사번</th>
						<td>000001</td>
						<th>이메일</th>
						<td colspan="4">spring@naver.com</td>
					</tr>
					<tr>
						<th>성명</th>
						<td>스프링</td>
						<th>주민번호</th>
						<td colspan="4">960416 - ●●●●●●●</td>
					</tr>
					<tr>
						<th>영문성명</th>
						<td>Spring</td>
						<th>표준시각</th>
						<td colspan="4">한국/서울</td>
					</tr>
					<tr>
						<th>소속법인</th>
						<td>PKM company</td>
						<th>소속</th>
						<td>PKM Development</td>
						<th>직위</th>
						<td>사원</td>
					</tr>
					<tr>
						<th>직무</th>
						<td>웹 개발</td>
						<th>재직여부</th>
						<td>재직</td>
						<th>언어</th>
						<td>한국어</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>남자</td>
						<th>양/음력</th>
						<td>양력</td>
						<th>생년월일</th>
						<td>1996-04-16</td>
					</tr>   
					<tr>
						<th>계좌번호</th>
						<td colspan="5">111-111-51415</td>
					</tr>
					<tr>
						<th>입사일</th>
						<td>2020-08-20</td>
						<th>전화번호</th>
						<td>02-111-2222</td>
						<th>휴대전화</th>
						<td>010-444-7777</td>
					</tr>   
					<tr>
						<th>호봉</th>
						<td>1</td>
						<th>타메일</th>
						<td colspan="4">9</td>
					</tr>
					<tr>
						<th>결혼여부</th>
						<td>미혼</td>
						<th>결혼기념일</th>
						<td>~</td>
						<th>우편번호</th>
						<td>1</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="2">1</td>
						<th>상세주소</th>
						<td colspan="2">11</td>
					</tr>
				</table>
				<a class="buttons" id="modifyBtn">수정완료</a>	
			</form>
		</div>
		<!-- // 기본정보수정 -->
		<!-- 휴가관리-->
		<h2>휴가관리</h2>
		<div id="vacation-wrap">
			<select class="justselect">
				<option>2020</option>
				<option>2019</option>
			</select>
			<p>&nbsp;연도별 휴가 사용내역을 확인합니다.</p>
			<!-- 총 휴가 일수 -->
			<div id="total-vacation" class="day-boxs">
				<i class="fas fa-plane-departure"></i>
				<h3>총 휴가 일 수</h3><br>
				<p>15일</p>
			</div>
			<!-- 사용 휴가 일수 -->
			<div id="use-vacation" class="day-boxs">
				<i class="fas fa-plane-departure"></i>
				<h3>사용 휴가 일 수</h3>
				<p>3일</p>
			</div>
			<!-- 잔여 휴가 일수 -->
			<div id="residual-vacation" class="day-boxs">
				<i class="fas fa-plane-departure"></i>
				<h3>잔여 휴가 일 수</h3>
				<p>12일</p>
			</div>
			<a class="buttons" id="requestBtn" onclick="request();">휴가신청</a>
		</div>
		<!-- // 휴가관리 -->
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