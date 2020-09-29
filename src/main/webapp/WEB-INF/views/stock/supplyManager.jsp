<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/stock/supplyManager.css">
<title>비품 재고관리</title>
</head>
<body>

	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>비품 재고관리</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Stock/searchSupply">
					
					<div class="search-area">
						<span class="title">비품코드</span>
						<input type="text" class="txtBox" name="scode">
					</div>
					
					<div class="search-area">
						<span class="title">비품명</span>
						<input type="text" class="txtBox" name="sname">
					</div>
					
					<br>
					
					<div class="search-area downSearch" style="height: 31px;">
						<span class="title">비품가격</span>
						<input type="text" id="price" name="price" class="txtBox wid_150" onkeyup="numberWithCommas(this.value, this)"> 
						<label>~</label>
						<input type="text" id="price2" name="price2" class="txtBox rightDate wid_150" onkeyup="numberWithCommas(this.value, this)">
					</div>
					<button id="searchBtn">검색</button>
				</form>
			</div>
		</div>
		<!-- // 검색 영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="addBtn">추가</label>
			<label id="downBtn" onclick="location.href='/Human/excelDown'"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- 테이블 -->
		<table id="supplyManagerTable">
			<thead>
				<tr>
					<th>비품코드</th>
					<th>비품이름</th>
					<th>비품가격</th>
					<th>수량</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${slist }" var="s">
					<tr>
						<td>${s.scode }</td>
						<td>${s.sname }</td>
						<td>
							<fmt:formatNumber value="${s.cost_price }" type="currency" />
						</td>
						<td>${s.scount }</td>
						<td>${s.s_comment }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 테이블 -->
		<!-- 페이징 -->
		<div id="pagingForm">
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="start" value="${ loc }">
					<c:param name="page" value="1"/>
					<c:if test="${not empty hs}">
						<c:param name="scode" value="${hs.scode }" />
						<c:param name="sname" value="${hs.sname }" />
						<c:param name="price" value="${hs.price }" />
						<c:param name="price2" value="${hs.price2 }" />
					</c:if>
				</c:url>
				<a class="pg_page" href="${ start }"><i class="fas fa-backward"></i></a>
			</c:if>
			<!--10개씩 전 페이징  -->
			<c:if test="${ pi.currentPage > 10 }">
				<c:url var="prev" value="${ loc }">
					<c:param name="page" value="${pi.startPage - 10}"/>
					<c:if test="${not empty hs}">
						<c:param name="scode" value="${hs.scode }" />
						<c:param name="sname" value="${hs.sname }" />
						<c:param name="price" value="${hs.price }" />
						<c:param name="price2" value="${hs.price2 }" />
					</c:if>
				</c:url>
				<a class="pg_page" href="${ prev }"><i class="fas fa-caret-left"></i></a>
			</c:if>
			<!-- 기본페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<strong class="pg_current">${ p }</strong>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:if test="${p ne 0}">
						<c:url var="pagination" value="${ loc }">
							<c:param name="page" value="${ p }"/>
							<c:if test="${not empty hs}">
								<c:param name="scode" value="${hs.scode }" />
								<c:param name="sname" value="${hs.sname }" />
								<c:param name="price" value="${hs.price }" />
								<c:param name="price2" value="${hs.price2 }" />
							</c:if>
						</c:url>
						<a class="pg_page" href="${ pagination }">${ p }</a>
					</c:if>
				</c:if>
			</c:forEach>
			<!--10개씩 다음 페이징  -->
			<c:if test="${ pi.currentPage > 1 and pi.maxPage > 10}">
				<c:url var="next" value="${ loc }">
					<c:param name="page" value="${pi.endPage + 1 }"/>
					<c:if test="${not empty hs}">
						<c:param name="scode" value="${hs.scode }" />
						<c:param name="sname" value="${hs.sname }" />
						<c:param name="price" value="${hs.price }" />
						<c:param name="price2" value="${hs.price2 }" />
					</c:if>
				</c:url>
				<a class="pg_page" href="${ next }"><i class="fas fa-caret-right"></i></a>
			</c:if>
			<!--맨 끝으로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="end" value="${ loc }">
					<c:param name="page" value="${ pi.maxPage }"/>
					<c:if test="${not empty hs}">
						<c:param name="scode" value="${hs.scode }" />
						<c:param name="sname" value="${hs.sname }" />
						<c:param name="price" value="${hs.price }" />
						<c:param name="price2" value="${hs.price2 }" />
					</c:if>
				</c:url> 
				<a class="pg_page" href="${ end }"><i class="fas fa-forward"></i></a>
			</c:if>	
		</div>
		<!-- 비품 추가 팝업창 -->
		<form action="" id="add-popup-form" class="popup-form" style="display: none;">
			<div class="popupContent">
				<h1>비품 추가 
					<i class="fas fa-times" aria-hidden="true"></i>
				</h1>
				<div class="content-form">
					<span>비품 정보</span>
					<div class="add-textform">
						<span class="add-title add-title2">비품코드</span>
						<input type="text" class="txtBox add-text" name="add_ccode">
						<label id="addScodeChk"></label>
						<input type="hidden" name="addScodeChk" value="0">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">비품이름</span>
						<input type="text" class="txtBox add-text" name="add_cname">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">비품가격</span>
						<input type="text" class="txtBox add-text" name="add_cmanager" onkeyup="numberWithCommas(this.value, this)">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">수량</span>
						<input type="text" class="txtBox add-text" name="add_cphone">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">비고</span>
						<input type="text" class="txtBox add-text" name="add_c_comment">
					</div>
					<div class="add-textform btn-form">
						<button type="button"><i class="fas fa-times" aria-hidden="true"></i> 취소</button>
						<button type="button" onclick="addClient();"><i class="fas fa-check" aria-hidden="true"></i> 추가</button>
					</div>
				</div>
			</div>
			<div class="popupLayer"></div>
		</form>
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/stock/supplyManager.js"></script>
</html>