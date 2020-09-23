<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/stock/applicationList.css">
<title>비품 신청목록</title>
</head>
<body>

	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>비품 신청목록</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Human/searchVacation">
					<div class="search-area">
						<span class="title">부서</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectDept" name="selectDept" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">직급</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectRank" name="selectRank" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">사원명</span>
						<input type="text" class="txtBox" name="name">
					</div>
					
					<br>
					
					<div class="search-area downSearch">
						<span class="title">상태</span>
						<div class="selectBox">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all" value="all">
							<a href="#none" class="link-selected">전체</a>
							<ul>
								<li><a href="#" class="link-select" data-value="all">전체</a></li>
								<li><a href="#" class="link-select" data-value="wait">대기</a></li>
								<li><a href="#" class="link-select" data-value="ok">승인</a></li>
								<li><a href="#" class="link-select" data-value="no">거절</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle" aria-hidden="true"></i>
						</div>
					</div>
			
					<div class="search-area" style="height: 31px;">
						<span class="title">조회일자</span>
						<div class="selectBox wid_55">
							<input type="hidden" id="selectDate" name="selectDate" data-value="dateAll" value="dateAll">
							<a href="#none" class="link-selected wid_55">전체</a>
							<ul class="wid_75">
								<li><a href="#" class="link-select wid_55" data-value="dateAll">전체</a></li>
								<li><a href="#" class="link-select wid_55" data-value="dateRequest">신청일자</a></li>
								<li><a href="#" class="link-select wid_55" data-value="dateStart">시작일</a></li>
								<li><a href="#" class="link-select wid_55" data-value="dateEnd">종료일</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
						<input type="date" id="date" name="date" class="date" disabled> <label>~</label>
						<input type="date" id="date2" name="date2" class="date rightDate" disabled>
					</div>
					<button id="searchBtn">검색</button>
					<button type="button" id="resetBtn" onclick="location.href='/Human/vacationManager'">초기화</button>
				</form>
			</div>
		</div>
		<!-- // 검색 영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="downBtn"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<form name="applicationForm">
			<!-- 비품신청 목록 테이블 -->
			<table id="applicationTable">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>소속</th>
						<th>사원명</th>
						<th>비품코드</th>
						<th>비품이름</th>
						<th>수량</th>
						<th>신청일자</th>
						<th>사유</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="scode" value=""></td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>

				</tbody>
			</table>
			<!-- // 비품신청 목록 테이블 -->
			<div class="buttons">
				<button type="button" onclick="approvalVacation();">승인</button>
				<button type="button" onclick="refuseVacation();">거절</button>
			</div>
		</form>
		<!-- 페이징 폼 -->
	</div>
	<!-- // wrap -->
</body>
</html>