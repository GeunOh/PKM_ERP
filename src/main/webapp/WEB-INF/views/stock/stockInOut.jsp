<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/stock/stockInOut.css">

<title>제품 입/출고현황</title>
</head>
<body>

	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>제품 입/출고현황</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Stock/searchStockInout">
					<div class="search-area">
						<span class="title">구분</span>
						<div class="selectBox">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all" value="all">
							<a href="#none" class="link-selected">전체</a>
							<ul>
								<li><a href="#" class="link-select" data-value="all">전체</a></li>
								<li><a href="#" class="link-select" data-value="IN">입고</a></li>
								<li><a href="#" class="link-select" data-value="OUT">출고</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">거래처명</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectClient" name="selectClient" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">상품명</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectProduct" name="selectProduct" data-value="all">
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
			<label id="addBtn">추가</label>
			<label id="downBtn" onclick="location.href='/Human/excelDown'"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- 테이블 -->
		<table id="stockInOutTable">
			<thead>
				<tr>
					<th>입출고일자</th>
					<th>구분</th>
					<th>거래처명</th>
					<th>상품명</th>
					<th>입고수량</th>
					<th>입고단가</th>
					<th>입고금액</th>
					<th>출고수량</th>
					<th>출고단가</th>
					<th>출고금액</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty slist}">
					<tr>
						<td colspan="11">내역이 존재하지않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty slist}">	
					<c:forEach items="${slist }" var="s">
						<tr>	
							<td><fmt:formatDate value="${s.INOUT_DATE }" pattern="yyyy-MM-dd"/></td>
							<c:if test="${s.INOUT_STATE eq 'IN' }">
								<td>입고</td>
								<td>${s.CNAME }</td>
								<td>${s.PNAME }</td>
								<td style="color:blue">${s.INCOUNT }</td>
								<td style="color:blue"><fmt:formatNumber value="${s.COST_PRICE }" type="currency" /></td>
								<td style="color:blue"><fmt:formatNumber value="${s.INTOTAL }" type="currency" /></td>
								<td></td>
								<td></td>
								<td></td>
								<td>${s.INOUT_COMMENT }</td>
							</c:if>
							<c:if test="${s.INOUT_STATE eq 'OUT' }">
								<td>출고</td>
								<td>${s.CNAME }</td>
								<td>${s.PNAME }</td>
								<td></td>
								<td></td>
								<td></td>
								<td style="color:red">${s.OUTCOUNT }</td>
								<td style="color:red"><fmt:formatNumber value="${s.SELLING_PRICE }" type="currency" /></td>
								<td style="color:red"><fmt:formatNumber value="${s.OUTTOTAL }" type="currency" /></td>
								<td>${s.INOUT_COMMENT }</td>
							</c:if>
						</tr>
					</c:forEach>
					<c:if test="${ fn:length(slist) < 10 }">
						<c:forEach begin="${fn:length(slist)}" end="9">
							<tr>
								<td>&nbsp;</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</c:if>
				</c:if>
			</tbody>
		</table>
		<!-- 테이블 -->
		<!-- 페이징 폼 -->
		<div id="pagingForm">
			<!-- 첫 페이지로 -->
			<c:if test="${pi.currentPage > 1}">
				<c:url var="start" value="${loc}">
					<c:param name="page" value="1"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectVal" value="${hs.selectVal}"/>
						<c:param name="selectClient" value="${hs.selectClient}"/>
						<c:param name="selectProduct" value="${hs.selectProduct}"/>
						<c:param name="selectDate" value="${hs.selectDate}"/>
						<c:if test="${hs.selectDate eq 'dateSelect' }">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ start }"><i class="fas fa-backward"></i></a>
			</c:if>
			
			<!-- 10개씩 전 페이징 -->
			<c:if test="${ pi.currentPage > 10 }">
				<c:url var="prev" value="${ loc }">
					<c:param name="page" value="${pi.startPage - 10}"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectVal" value="${hs.selectVal}"/>
						<c:param name="selectClient" value="${hs.selectClient}"/>
						<c:param name="selectProduct" value="${hs.selectProduct}"/>
						<c:param name="selectDate" value="${hs.selectDate}"/>
						<c:if test="${hs.selectDate eq 'dateSelect' }">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ prev }"><i class="fas fa-caret-left"></i></a>
			</c:if>
			
			<!-- 기본 페이지-->
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<strong class="pg_current">${ p }</strong>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="pagination" value="${loc}">
						<c:param name="page" value="${p}"/>
						<c:if test="${ not empty hs }">
							<c:param name="selectVal" value="${hs.selectVal}"/>
							<c:param name="selectClient" value="${hs.selectClient}"/>
							<c:param name="selectProduct" value="${hs.selectProduct}"/>
							<c:param name="selectDate" value="${hs.selectDate}"/>
							<c:if test="${hs.selectDate eq 'dateSelect' }">
								<c:param name="date" value="${hs.date}"/>
								<c:param name="date2" value="${hs.date2}"/>
							</c:if>
						</c:if>
					</c:url>
					<a class="pg_page" href="${pagination}">${p}</a>
				</c:if>
			</c:forEach>
			
			<!-- 10개 씩 다음 페이지로 -->
			<c:if test="${ pi.maxPage > 10 and pi.currentPage > 1 and pi.maxPage ne pi.endPage }">
				<c:url var="next" value="${loc }">
					<c:param name="page" value="${pi.endPage + 1}" />
					<c:if test="${ not empty hs }">
						<c:param name="selectVal" value="${hs.selectVal}"/>
						<c:param name="selectClient" value="${hs.selectClient}"/>
						<c:param name="selectProduct" value="${hs.selectProduct}"/>
						<c:param name="selectDate" value="${hs.selectDate}"/>
						<c:if test="${hs.selectDate eq 'dateSelect' }">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ next }"><i class="fas fa-caret-right"></i></a>
			</c:if>
			
			<!-- 마지막 페이지로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="end" value="${loc}">
					<c:param name="page" value="${pi.maxPage }" />
					<c:if test="${ not empty hs }">
						<c:param name="selectVal" value="${hs.selectVal}"/>
						<c:param name="selectClient" value="${hs.selectClient}"/>
						<c:param name="selectProduct" value="${hs.selectProduct}"/>
						<c:param name="selectDate" value="${hs.selectDate}"/>
						<c:if test="${hs.selectDate eq 'dateSelect' }">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ end }"><i class="fas fa-forward"></i></a>
			</c:if>
		</div>
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/stock/stockInOut.js"></script>
</body>
</html>