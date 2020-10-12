<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag_user.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/myInfo/productWork.css">
<title>제품목록 및 입/출고</title>
</head>
<body>

	<jsp:include page="../common/template_user.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>제품목록 및 입/출고</h1>
		<div id="leftBox">
			<!-- 검색 영역 -->
			<div id="Search-back">
				<div id="Serach-form">
					<form action="/MyInfo/serachMyProduct">
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
				<label id="addBtn">추가</label>
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
		<!-- 제품 입출고 등록 팝업창 -->
		<form action="/MyInfo/addProductInOut" class="popup-form" id="product-InOut-add">
			<div class="popupContent">
				<h2>제품 입출고 등록
				<i class="fas fa-times" aria-hidden="true"></i>
				</h2>
				<div class="content-form">
					<span>제품 입출고 정보</span>
					<span style="top: -23px; right: 0; font-size: 12px; text-align: right;">* 필수 정보 입력란입니다.</span>
					<div class="add-form">
						<span class="add-title">구분</span>
						<div class="selectBox" style="height: 19px; line-height: 19px; vertical-align: middle; border-radius: 3px;">
							<input type="hidden" name="status" value="">
							<a href="#none" class="link-selected" style="line-height: 0;">선택</a>
							<ul style="max-height: 120px; overflow-y: scroll;">
								<li><a href="#" class="link-select" value="IN">입고</a></li>
								<li><a href="#" class="link-select" value="OUT">출고</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle" aria-hidden="true"></i>
						</div>
					</div>
					<div class="add-form">
						<span class="add-title">사업자등록번호</span>
						<input type="text" class="txtBox" name="ccode" onkeyup="ccodeChk();" required style="border-radius: 3px;">
						<label id="ccodeChk"></label>
					</div>
					<div class="add-form">
						<span class="add-title">제품코드</span>
						<input type="text" class="txtBox" name="pcode" onkeyup="pcodeChk();" required style="border-radius: 3px;">
						<label id="pcodeChk"></label>
					</div>
					<div class="add-form">
						<span class="add-title">수량</span>
						<input type="number" class="txtBox" name="count" required style="border-radius: 3px;">
					</div>
					<div class="add-form">
						<span class="add-title">비고</span>
						<input type="text" class="txtBox" name="comment" style="border-radius: 3px;">
					</div>
				</div>
				<div class="content-form add-btn-form">
					<button type="button">
						<i class="fas fa-times" aria-hidden="true"></i> 취소
					</button>
					<button type="button" onclick="dataChk()">
						<i class="fas fa-check" aria-hidden="true"></i> 등록
					</button>
				</div>
			</div>
			<div class="popupLayer"></div>
		</form>
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/myInfo/productWork.js"></script>
</body>
</html>