<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/stock/productManager.css">
<title>제품 재고관리</title>
</head>
<body>

	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>제품 재고관리</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Stock/searchProductManager">
					<div class="search-area">
						<span class="title">제품코드</span>
						<input type="text" class="txtBox" name="pcode">
					</div>
					
					<div class="search-area">
						<span class="title">제품명</span>
						<input type="text" class="txtBox" name="pname">
					</div>
					
					<div class="search-area">
						<span class="title">수량</span>
						<input type="number" class="txtBox wid_55" name="pcount">
					</div>
					
					<br>
					
					<div class="search-area downSearch" style="height: 31px;">
						<span class="title">제품가격</span>
						<input type="text" id="price" name="price" class="txtBox wid_150" onkeyup="numberWithCommas(this.value, this)"> 
						<label>~</label>
						<input type="text" id="price2" name="price2" class="txtBox rightDate wid_150" onkeyup="numberWithCommas(this.value, this)">
					</div>
					
					<div class="search-area">
						<span class="title">비고</span>
						<input type="text" class="txtBox" name="p_comment">
					</div>
					<button id="searchBtn">검색</button>
				</form>
			</div>
		</div>
		<!-- // 검색 영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="downBtn" onclick="location.href='/Human/excelDown'"><i class="fas fa-download"></i>다운로드</label>
			<span>변경하실 행을 더블클릭 시 수정 또는 삭제하실수 있습니다</span>
		</div>
		<!-- 테이블 -->
		<table id="productManagerTable">
			<thead>
				<tr>
					<th>제품코드</th>
					<th>제품이름</th>
					<th>원가</th>
					<th>판매가</th>
					<th>수량</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty plist }">
					<tr>
						<td colspan="6">제품이 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty plist }">
					<c:forEach items="${plist }" var="p">
						<tr>
							<td>${p.pcode }</td>
							<td>${p.pname }</td>
							<td><fmt:formatNumber value="${p.cost_price }" type="currency" /></td>
							<td><fmt:formatNumber value="${p.selling_price }" type="currency" /></td>
							<td>${p.pcount }</td>
							<td>${p.p_comment }</td>
						</tr>
					</c:forEach>
					<c:if test="${fn:length(plist) < 10 }">
						<c:forEach begin="1" end="${10 - fn:length(plist) }">
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</c:forEach>
					</c:if>
				</c:if>
				
			</tbody>
		</table>
		<!-- 테이블 -->
		<!-- 페이징 -->
		<div id="pagingForm">
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="start" value="${ loc }">
					<c:param name="page" value="1"/>
					<c:if test="${not empty hs}">
						<c:param name="pcode" value="${hs.pcode }" />
						<c:param name="pname" value="${hs.pname }" />
						<c:param name="pcount" value="${hs.pcount }" />
						<c:param name="price" value="${hs.price }" />
						<c:param name="price2" value="${hs.price2 }" />
						<c:param name="p_comment" value="${hs.p_comment }" />
					</c:if>
				</c:url>
				<a class="pg_page" href="${ start }"><i class="fas fa-backward"></i></a>
			</c:if>
			<!--10개씩 전 페이징  -->
			<c:if test="${ pi.currentPage > 10 }">
				<c:url var="prev" value="${ loc }">
					<c:param name="page" value="${pi.startPage - 10}"/>
					<c:if test="${not empty hs}">
						<c:param name="pcode" value="${hs.pcode }" />
						<c:param name="pname" value="${hs.pname }" />
						<c:param name="pcount" value="${hs.pcount }" />
						<c:param name="price" value="${hs.price }" />
						<c:param name="price2" value="${hs.price2 }" />
						<c:param name="p_comment" value="${hs.p_comment }" />
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
								<c:param name="pcode" value="${hs.pcode }" />
								<c:param name="pname" value="${hs.pname }" />
								<c:param name="pcount" value="${hs.pcount }" />
								<c:param name="price" value="${hs.price }" />
								<c:param name="price2" value="${hs.price2 }" />
								<c:param name="p_comment" value="${hs.p_comment }" />
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
						<c:param name="pcode" value="${hs.pcode }" />
						<c:param name="pname" value="${hs.pname }" />
						<c:param name="pcount" value="${hs.pcount }" />
						<c:param name="price" value="${hs.price }" />
						<c:param name="price2" value="${hs.price2 }" />
						<c:param name="p_comment" value="${hs.p_comment }" />
					</c:if>
				</c:url>
				<a class="pg_page" href="${ next }"><i class="fas fa-caret-right"></i></a>
			</c:if>
			<!--맨 끝으로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="end" value="${ loc }">
					<c:param name="page" value="${ pi.maxPage }"/>
					<c:if test="${not empty hs}">
						<c:param name="pcode" value="${hs.pcode }" />
						<c:param name="pname" value="${hs.pname }" />
						<c:param name="pcount" value="${hs.pcount }" />
						<c:param name="price" value="${hs.price }" />
						<c:param name="price2" value="${hs.price2 }" />
						<c:param name="p_comment" value="${hs.p_comment }" />
					</c:if>
				</c:url> 
				<a class="pg_page" href="${ end }"><i class="fas fa-forward"></i></a>
			</c:if>	
		</div>
		<!-- 제품 재고 수정 -->
		<form action="/Stock/modifyProductCount" id="modify-popup-form" class="popup-form" style="display: none;">
			<div class="popupContent">
				<h1>제품 재고 수정 
					<i class="fas fa-times" aria-hidden="true"></i>
				</h1>
				<p>
					<span id="selectInfo"></span>이(가) 선택되었습니다. 수량 : <input type="number" name="modify_pcount">
				</p>
				<div class="btn-form">
					<button type="button" onclick="modifyForm()"><i class="fas fa-check" aria-hidden="true"></i> 수정</button>
					<button type="button"><i class="fas fa-times" aria-hidden="true"></i> 취소</button>
				</div>
				<input type="hidden" name="modify_pcode">
			</div>
			<div class="popupLayer"></div>
		</form>
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/stock/productManager.js"></script>
</body>
</html>