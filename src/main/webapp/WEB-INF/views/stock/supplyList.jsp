<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/stock/supplyList.css">
<title>비품 목록</title>
</head>
<body>

	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>비품 목록</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Stock/serachProduct">
					<div class="search-area">
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
					</div>
					
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
						<span class="title">상품명</span>
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
					
					<button id="searchBtn" class="buttons">검색</button>
				</form>
			</div>
		</div>
		<!-- // 검색 영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="addBtn">추가</label>
			<label id="downBtn" onclick="location.href='/Human/excelDown'"><i class="fas fa-download"></i>다운로드</label>
			<span>변경하실 행을 더블클릭 시 수정 또는 삭제하실수 있습니다</span>
		</div>
		<!-- 테이블 -->
		<table id="supplyListTable">
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
		<form action="/Stock/addSupply" id="add-popup-form" class="popup-form" style="display: none;">
			<div class="popupContent">
				<h1>비품 추가 
					<i class="fas fa-times" aria-hidden="true"></i>
				</h1>
				<div class="content-form">
					<span>비품 정보</span>
					<div class="add-textform">
						<span class="add-title add-title2">비품코드</span>
						<input type="text" class="txtBox add-text" name="add_scode">
						<label id="addScodeChk"></label>
						<input type="hidden" name="addScodeChk" value="0">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">비품이름</span>
						<input type="text" class="txtBox add-text" name="add_sname">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">비품가격</span>
						<input type="text" class="txtBox add-text" name="add_price" onkeyup="numberWithCommas(this.value, this)">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">비고</span>
						<input type="text" class="txtBox add-text" name="add_s_comment">
					</div>
					<div class="add-textform btn-form">
						<button type="button"><i class="fas fa-times" aria-hidden="true"></i> 취소</button>
						<button type="button" onclick="addSupply();"><i class="fas fa-check" aria-hidden="true"></i> 추가</button>
					</div>
				</div>
			</div>
			<div class="popupLayer"></div>
		</form>
		<!-- 비품 수정/삭제 -->
		<form action="/Stock/deleteSupply" id="delete-popup-form" class="popup-form" style="display: none;">
			<div class="popupContent">
				<h1>비품 수정/삭제 
					<i class="fas fa-times" aria-hidden="true"></i>
				</h1>
				<p>
					<span id="selectInfo"></span>이(가) 선택되었습니다.
				</p>
				<div class="btn-form">
					<button type="button" onclick="modifyForm()"><i class="fas fa-check" aria-hidden="true"></i> 수정</button>
					<button type="button" onclick="deleteSupply();"><i class="fas fa-times" aria-hidden="true"></i> 삭제</button>
				</div>
				<input type="hidden" name="del_scode">
			</div>
			<div class="popupLayer"></div>
		</form>
		<!-- 비품 수정 -->
		<form action="/Stock/modifySupply" id="modify-popup-form" class="popup-form" style="display: none;">
			<div class="popupContent">
				<h1>비품 수정
					<i class="fas fa-times" aria-hidden="true"></i>
				</h1>
				<div class="content-form">
					<span>비품 정보</span>
					<div class="add-textform">
						<span class="add-title add-title2">비품코드</span>
						<input type="text" class="txtBox add-text" name="modify_scode">
						<label id="modifyScodeChk"></label>
						<input type="hidden" name="modifyScodeChk" value="allow">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">비품이름</span>
						<input type="text" class="txtBox add-text" name="modify_sname">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">비품가격</span>
						<input type="text" class="txtBox add-text" name="modify_price" onkeyup="numberWithCommas(this.value, this)">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">비고</span>
						<input type="text" class="txtBox add-text" name="modify_s_comment">
					</div>
					<div class="add-textform btn-form">
						<button type="button"><i class="fas fa-times" aria-hidden="true"></i> 취소</button>
						<button type="button" onclick="modifySupply()"><i class="fas fa-check" aria-hidden="true"></i> 수정</button>
					</div>
					<input type="hidden" name="beforeScode">
				</div>
			</div>
			<div class="popupLayer"></div>
		</form>
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/stock/supplyList.js"></script>	
</body>
</html>