<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<div id="leftBox">
			<!-- 검색 영역 -->
			<div id="Search-back">
				<div id="Serach-form">
					<form action="/Stock/serachProduct">
						<div class="search-area">
							<span class="title">거래처명</span>
							<div class="selectBox wid_150">
								<input type="hidden" id="selectClient" name="selectClient" value="all">
								<a href="#none" class="link-selected wid_170">전체</a>
								<ul class="wid_170">
								</ul>
								<i class="fas fa-angle-down searchAngle"></i>
							</div>
						</div>
						
						<div class="search-area">
							<span class="title">제품명</span>
							<div class="selectBox wid_150">
								<input type="hidden" id="selectProduct" name="selectProduct" value="all">
								<a href="#none" class="link-selected wid_170">전체</a>
								<ul class="wid_170">
								</ul>
								<i class="fas fa-angle-down searchAngle"></i>
							</div>
						</div>
						
						<button id="searchBtn" class="buttons">검색</button>
					</form>
				</div>
			</div>
			<!-- // 검색 영역 -->
			<!-- 추가 외 버튼 -->
			<div id="btnForm">
				<label id="downBtn" onclick="location.href='/Human/excelDown'"><i class="fas fa-download"></i>다운로드</label>
			</div>
			<!-- 거래처 테이블 -->
			<div id="clientTableWrap">
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
						<c:forEach items="${clist}" var="c">
							<tr>
								<td>${c.cname}</td>
								<td>${c.ccode}</td>
								<td>${c.cmanager}</td>
								<td>${c.cphone}</td>
								<td>${c.c_comment}</td>
							</tr>
						</c:forEach>
						<c:if test="${empty clist}">
							<tr>
								<td colspan="5">거래처가 존재하지않습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty clist}">
							<c:if test="${ fn:length(clist) < 10 }">
								<c:forEach begin="${fn:length(clist)}" end="9">
									<tr>
										<td>&nbsp;</td>
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
			</div>
			<!-- // 거래처 테이블 -->
			<!-- 제품정보 -->
			<div id="info-back">
				<div id="info-form">
					<form name="infoForm">
						<div class="info-area">
							<span class="title">제품코드</span>
							<input type="text" class="txtBox wid_163" name="pcode" autocomplete="off">
						</div>
						<div class="info-area">
							<span class="title">제품명</span>
							<input type="text" class="txtBox" name="pname" autocomplete="off">
						</div>
						<div class="info-area">
							<span class="title">거래처</span>
							<input type="text" class="txtBox wid_175" name="ccode" autocomplete="off">
						</div>
						
						<br>
						
						<div class="info-area downSearch">
							<span class="title">원가</span>
							<input type="text" class="txtBox" name="cost_price" autocomplete="off">
						</div>
						<div class="info-area">
							<span class="title">판매가</span>
							<input type="text" class="txtBox" name="selling_price" autocomplete="off">
						</div>
						<div class="info-area">
							<span class="title">비고</span>
							<input type="text" class="txtBox" name="p_comment" autocomplete="off">
						</div>
						<input type="hidden" name="beforePcode">
						<i class="fas fa-exchange-alt"></i>
						<button type="button" id="saveBtn" class="buttons">추가</button>
						<button type="button" id="deleteBtn" class="buttons" disabled>삭제</button>
					</form>
				</div>
			</div>
			<!-- // 제품 정보 -->
		</div>
		<div id="rightBox">
			<!-- 제품목록 테이블 -->
			<div id="productTableWrap">
				<table id="productListTable" class="tables">
					<thead> 
						<tr>
							<th>제품코드</th>
							<th>제품이름</th>
							<th>원가</th>
							<th>판매가</th>
							<th>거래처</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${plist}" var="p">
							<tr>
								<td>${p.pcode}</td>
								<td>${p.pname}</td>
								<td><fmt:formatNumber value="${p.cost_price }" type="currency" /></td>
								<td><fmt:formatNumber value="${p.selling_price }" type="currency" /></td>
								<c:if test="${p.ccode eq null}">
									<td>-</td>
								</c:if>
								<c:if test="${p.ccode ne null}">
									<td>${p.cname}</td>
								</c:if>
								<td>${p.p_comment}</td>
							</tr>
						</c:forEach>
						<c:if test="${empty plist}">
							<tr>
								<td colspan="6">제품이 존재하지않습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty plist}">
							<c:if test="${ fn:length(plist) < 10 }">
								<c:forEach begin="${fn:length(plist)}" end="${9}">
									<tr>
										<td>&nbsp;</td>
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
			</div>
			<!-- // 제품목록 테이블 -->
		</div>
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/stock/productList.js"></script>
</body>
</html>