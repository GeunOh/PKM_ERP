<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/stock/productList.css">
<title>제품 목록</title>
</head>
<body>

	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>제품 목록</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="">
					<!-- <div class="search-area">
						<span class="title">구분</span>
						<div class="selectBox">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all" value="all">
							<a href="#none" class="link-selected">전체</a>
							<ul>
								<li><a href="#" class="link-select" data-value="all">전체</a></li>
								<li><a href="#" class="link-select" data-value="in">입고</a></li>
								<li><a href="#" class="link-select" data-value="out">출고</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div> -->
					
					<div class="search-area">
						<span class="title">거래처명</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectDept" name="selectDept" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">제품명</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectRank" name="selectRank" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<br>
					
					<div class="search-area downSearch" style="height: 31px;">
						<span class="title">입/출고일자</span>
						<div class="selectBox wid_55">
							<input type="hidden" id="selectDate" name="selectDate" data-value="dateAll" value="dateAll">
							<a href="#none" class="link-selected wid_55">전체</a>
							<ul class="wid_75">
								<li><a href="#" class="link-select wid_55" data-value="dateAll">전체</a></li>
								<li><a href="#" class="link-select wid_55" data-value="dateSelect">선택</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
						<input type="date" id="date" name="date" class="date" disabled> <label>~</label>
						<input type="date" id="date2" name="date2" class="date rightDate" disabled>
					</div>
					<button id="searchBtn">검색</button>
				</form>
			</div>
		</div>
		<!-- // 검색 영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="downBtn" onclick="location.href='/Human/excelDown'"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- 거래처 테이블 -->
		<table id="clientTable" class="tables">
			<thead>
				<tr>
					<th>거래처명</th>
					<th>사업자등록번호</th>
					<th>담당자</th>
					<th>연락처</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td>자바 개발회사</td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
				<tr>
					<td>PM-Company</td>
					<td>01-15699-7891-1</td>
					<td>죠리퐁</td>
					<td>010-1225-8874</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<!-- // 거래처 테이블 -->
		<!-- 제품목록 테이블 -->
		<table id="productListTable" class="tables">
			<thead> 
				<tr>
					<th>제품코드</th>
					<th>제품이름</th>
					<th>원가</th>
					<th>판매가</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>AA-16584</td>
					<td>ERP PROGRAM</td>
					<td>10,000,000</td>
					<td>12,000,000</td>
					<td>인사,재고,매출관리 ERP 프로그램</td>
				</tr>
				<tr>
					<td>AA-16584</td>
					<td>ERP PROGRAM</td>
					<td>10,000,000</td>
					<td>12,000,000</td>
					<td>인사,재고,매출관리 ERP 프로그램</td>
				</tr>
				<tr>
					<td>AA-16584</td>
					<td>ERP PROGRAM</td>
					<td>10,000,000</td>
					<td>12,000,000</td>
					<td>인사,재고,매출관리 ERP 프로그램</td>
				</tr>
				<tr>
					<td>AA-16584</td>
					<td>ERP PROGRAM</td>
					<td>10,000,000</td>
					<td>12,000,000</td>
					<td>인사,재고,매출관리 ERP 프로그램</td>
				</tr>
				<tr>
					<td>AA-16584</td>
					<td>ERP PROGRAM</td>
					<td>10,000,000</td>
					<td>12,000,000</td>
					<td>인사,재고,매출관리 ERP 프로그램</td>
				</tr>
				<tr>
					<td>AA-16584</td>
					<td>ERP PROGRAM</td>
					<td>10,000,000</td>
					<td>12,000,000</td>
					<td>인사,재고,매출관리 ERP 프로그램</td>
				</tr>
				<tr>
					<td>AA-16584</td>
					<td>ERP PROGRAM</td>
					<td>10,000,000</td>
					<td>12,000,000</td>
					<td>인사,재고,매출관리 ERP 프로그램</td>
				</tr>
				<tr>
					<td>AA-16584</td>
					<td>ERP PROGRAM</td>
					<td>10,000,000</td>
					<td>12,000,000</td>
					<td>인사,재고,매출관리 ERP 프로그램</td>
				</tr>
			</tbody>
		</table>
		<!-- // 제품목록 테이블 -->
		<!-- 제품정보 테이블 -->
		<table id="productInfoTable" class="tables">
			<thead>
				<tr>
					<th>제품코드</th>
					<th>제품명</th>
					<th>원가</th>
					<th>판매가</th>
					<th>잔여수량</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>AA-16584</td>
					<td>ERP PROGRAM</td>
					<td>10,000,000</td>
					<td>12,000,000</td>
					<td>500개</td>
					<td>인사,재고,매출관리 ERP 프로그램</td>
				</tr>
			</tbody>
		</table>
		<!-- // 제품 정보 테이블 -->
	</div>
	<!-- // wrap -->
	
</body>
</html>