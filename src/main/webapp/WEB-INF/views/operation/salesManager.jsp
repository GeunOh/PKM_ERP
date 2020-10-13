<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/operation/salesManager.css">
<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
<script src="https://uicdn.toast.com/tui.chart/latest/tui-chart-all.js"></script>
<title>매출 관리</title>
</head>
<body>
	<jsp:include page="../common/template.jsp"></jsp:include>
	<!-- wrap -->
	<div id="wrap">
		<h1>매출 관리</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Operation/salesManager">
					<div class="search-area">
						<span class="title">연도선택</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectClient" name="year" value="2020">
							<a href="#none" class="link-selected wid_170">2020</a>
							<ul class="wid_170">
								<li><a href="#" class="link-select" data-value="2018">2018</a></li>
								<li><a href="#" class="link-select" data-value="2019">2019</a></li>
								<li><a href="#" class="link-select" data-value="2020">2020</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					<button id="searchBtn" class="buttons">검색</button>
				</form>
			</div>
		</div>
		<!-- // 검색 영역 -->
		<div id="leftBox">
			<h2>2020년도 입출고 현황</h2>
			<!-- 입출고 현황 테이블 -->
			<div id="inOutWrap">
				<table id="inOutTable" class="tables">
					<thead>
						<tr>
							<th>구분</th>
							<th>입고수량</th>
							<th>입고금액</th>
							<th>출고수량</th>
							<th>출고금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${slist }" var="s">
							<tr>
								<td>${s.MONTH }월</td>
								<td>${s.INCOUNT }</td>
								<td><fmt:formatNumber value="${s.INPRICE }" type="currency" /></td>
								<td>${s.OUTCOUNT }</td>
								<td><fmt:formatNumber value="${s.OUTPRICE }" type="currency" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- // 입출고 현황 테이블 -->
			</div>
		</div>
		<div id="rightBox">
			<h2>입출고 현황(수량)</h2>
			<div id="chart-area"></div>
		</div>
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/operation/salesManager.js"></script>
</body>
</html>