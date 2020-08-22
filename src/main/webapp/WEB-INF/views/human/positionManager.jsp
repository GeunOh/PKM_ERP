<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"/>
<link rel="stylesheet" href="resources/css/human/positionManager.css">
<title>부서/직급 관리</title>
</head>
<body>
	
	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap  -->
	<div id="wrap">
		<h1>직급관리</h1>
		<!-- 검색영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form>
					<div class="search-area" style="height: 31px;">
						<span class="title">발령일</span>
						<div class="selectBox wid_55">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all">
							<a href="#none" class="link-selected wid_55">전체</a>
							<ul class="wid_75">
								<li><a href="#" class="link-select wid_35" data-value="all">전체</a></li>
								<li><a href="#" class="link-select wid_35" data-value="in">선택</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
						<input type="date" id="date" class="date"> <label>~</label>
						<input type="date" id="date2" class="date rightDate">
					</div>
					<div class="search-area">
						<span class="title">발령구분</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
								<li><a href="#" class="link-select wid_150" data-value="all">전체</a></li>
								<li><a href="#" class="link-select wid_150" data-value="in">선택</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					<div class="search-area">
						<span class="title">사원명</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
								<li><a href="#" class="link-select wid_150" data-value="all">전체</a></li>
								<li><a href="#" class="link-select wid_150" data-value="in">선택</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					<button id="searchBtn">검색</button>
				</form>
			</div>
		</div>
		<!-- // 검색영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="addBtn">추가</label>
			<label id="downBtn"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- // 추가 외 버튼 -->
		<!-- 테이블 -->
		<table id="positionTable">
			<tr>
				<th>발령일</th>
				<th>발령구분</th>
				<th>이름</th>
				<th>발령내용</th>
				<th>취소</th>
			</tr>
			<tr>
				<td>상태</td>
				<td>입사일</td>
				<td>사번</td>
				<td>이름</td>
				<td>직급</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>입사일</td>
				<td>사번</td>
				<td>이름</td>
				<td>직급</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>입사일</td>
				<td>사번</td>
				<td>이름</td>
				<td>직급</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>입사일</td>
				<td>사번</td>
				<td>이름</td>
				<td>직급</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>입사일</td>
				<td>사번</td>
				<td>이름</td>
				<td>직급</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>입사일</td>
				<td>사번</td>
				<td>이름</td>
				<td>직급</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>입사일</td>
				<td>사번</td>
				<td>이름</td>
				<td>직급</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>입사일</td>
				<td>이름</td>
				<td>부서</td>
				<td>직급</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>입사일</td>
				<td>이름</td>
				<td>부서</td>
				<td>직급</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>입사일</td>
				<td>이름</td>
				<td>부서</td>
				<td>직급</td>
			</tr>
		</table>
		<!-- 페이징 버튼 -->
		<div id="pagingForm">
			<a class="pg_page"><i class="fas fa-backward"></i></a>
			<a class="pg_page"><i class="fas fa-caret-left"></i></a>
			<b class="pg_current">1</b>
			<a class="pg_page">2</a>
			<a class="pg_page">3</a>
			<a class="pg_page">4</a>
			<a class="pg_page">5</a>
			<a class="pg_page">6</a>
			<a class="pg_page">7</a>
			<a class="pg_page">8</a>
			<a class="pg_page">9</a>
			<a class="pg_page">10</a>
			<a class="pg_page"><i class="fas fa-caret-right"></i></a>
			<a class="pg_page"><i class="fas fa-forward"></i></a>
		</div>
	</div>
	<!-- // wrap -->
<script type="text/javascript" src="resources/js/human/positionManager.js"></script>
</body>
</html>