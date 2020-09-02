<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/human/workInOutManager.css">
<title>근태관리</title>

</head>
<body>

	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>근태 관리</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Human/SearchHuman">
					<div class="search-area">
						<span class="title">상태</span>
						<div class="selectBox">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all" value="all">
							<a href="#none" class="link-selected">전체</a>
							<ul>
								<li><a href="#" class="link-select" data-value="all">전체</a></li>
								<li><a href="#" class="link-select" data-value="in">재직</a></li>
								<li><a href="#" class="link-select" data-value="out">퇴직</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
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
						<span class="title">업무 메일</span>
						<input type="text" class="txtBox" name="email">
					</div>
					
					<br>
					
					<div class="search-area downSearch">
						<span class="title">사번</span>
						<input type="text" class="txtBox" name="eno">
					</div>
					<div class="search-area">
						<span class="title">사원명</span>
						<input type="text" class="txtBox" name="name">
					</div>
					<div class="search-area" style="height: 31px;">
						<span class="title">입사일</span>
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
			<label id="downBtn"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- 테이블 -->
		<table id="workInOutTable" style="table-layout: fixed; max-width: 1601px;">
			<colgroup>
				<col style="width:100px;">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">9월</th>			
					<th>일자</th>			
				</tr>
				<tr>
					<th style="border-top: 0; border-left: 0;">요일</th>	
				</tr>
			</thead>
			<tbody>
				<c:set var="s" value="0"/>
				<c:set var="e" value="${size-1}"/>
				<c:forEach var="m" items="${mlist}" varStatus="stat1">
					<tr>
						<th rowspan="3" style="width: 100px;">${m.eno}</th>
						<td style="padding: 4px;">출근</td>
						<c:forEach var="w" items="${wlist}" varStatus="stat2" begin="${s}" end="${e}"> 
<!-- 							일자별 반복 -->
							<c:if test="${w.intime eq null}"><td style="padding: 0 2px;">-</td></c:if>
							<c:if test="${w.intime ne null}"><td style="padding: 0 2px;">${w.intime}</td></c:if>
						</c:forEach>
					</tr>
					<tr>
						<td style="padding: 4px;">퇴근</td>
						<c:forEach var="w" items="${wlist}" begin="${s}" end="${e}"> 
<!-- 							일자별 반복 -->
							<c:if test="${w.outtime eq null}"><td style="padding: 0 2px;">-</td></c:if>
							<c:if test="${w.outtime ne null}"><td style="padding: 0 2px;">${w.outtime}</td></c:if>
						</c:forEach>
					</tr>
					<tr>
						<td style="padding: 4px;">구분</td>
						<c:forEach var="w" items="${wlist}" begin="${s}" end="${e}"> 
<!-- 							일자별 반복 -->
							<c:if test="${w.type eq null}"><td style="padding: 0 2px;">-</td></c:if>
							<c:if test="${w.type ne null}"><td class="overtext" style="padding: 0 2px;">${w.type}</td></c:if>
						</c:forEach>
					</tr>
					<c:set var="s" value="${s+size}"/>
					<c:set var="e" value="${e+size}"/>
				</c:forEach>
<!-- 				<tr> -->
<!-- 					<th rowspan="3" style="width: 100px;">인사팀<br>홍길동</th> -->
<!-- 					<td style="padding: 4px;">출근</td> -->
<!-- 					일자별 반복 -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td style="padding: 4px;">퇴근</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td style="padding: 4px;">구분</td> -->
<!-- 				</tr> -->
			</tbody>
		</table>
		<!-- // 테이블 -->
		<!-- 페이징 -->
		<div id="pagingForm">
			<a class="pg_page" href="#"><i class="fas fa-caret-left"></i></a>
			<a class="pg_page" href="${ pagination }">1</a>
			<a class="pg_page" href="${ pagination }">2</a>
			<a class="pg_page" href="${ pagination }">3</a>
		</div>
	</div>
	<!-- // wrap -->
<script type="text/javascript" src="resources/js/human/workInOutManager.js"></script>
</body>
</html>