<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<th>거래처</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${plist}" var="p">
					<tr>
						<td>${p.pcode}</td>
						<td>${p.pname}</td>
						<td>${p.cost_price}</td>
						<td>${p.selling_price}</td>
						<c:if test="${p.ccode eq null}">
							<td>-</td>
						</c:if>
						<c:if test="${p.ccode ne null}">
							<td>${p.ccode}</td>
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
		<!-- // 제품목록 테이블 -->
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
					<button type="button" id="saveBtn" class="buttons">추가</button>
					<button type="button" id="deleteBtn" class="buttons" disabled>삭제</button>
				</form>
			</div>
		</div>
		<!-- // 제품 정보 -->
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/stock/productList.js"></script>
</body>
</html>