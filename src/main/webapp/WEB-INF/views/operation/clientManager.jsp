<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/operation/clientManager.css">

<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
<script src="https://uicdn.toast.com/tui.chart/latest/tui-chart-all.js"></script>
<title>거래처 관리</title>
</head>
<body>
	<jsp:include page="../common/template.jsp"></jsp:include>
	<!-- wrap -->
	<div id="wrap">
		<h1>거래처 관리</h1>
		<div id="leftBox">
			<!-- 검색 영역 -->
			<div id="Search-back">
				<div id="Serach-form">
					<form action="/Operation/searchClient">
						<div class="search-area">
							<span class="title">거래처명</span>
							<input type="text" class="txtBox wid_150" name="cname">
						</div>
						
						<div class="search-area">
							<span class="title">사업자등록번호</span>
							<input type="text" class="txtBox wid_150" name="ccode">
						</div>
						
						<br>
						
						<div class="search-area downSearch">
							<span class="title">담당자</span>
							<input type="text" class="txtBox wid_150" name="cmanager">
						</div>
						
						<div class="search-area downSearch">
							<span class="title">연락처</span>
							<input type="text" class="txtBox wid_150" name="cphone">
						</div>
						
						<div class="search-area">
							<span class="title">비고</span>
							<input type="text" class="txtBox wid_150" name="c_comment">
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
				<span>변경하실 행을 더블클릭 시 수정 또는 삭제하실수 있습니다</span>
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
					<c:if test="${empty clist }">
						<tr>
							<td colspan="5">거래처가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty clist }">
						<c:forEach items="${clist }" var="c">
							<tr>
								<td>${c.cname }</td>
								<td>${c.ccode }</td>
								<td>${c.cmanager }</td>
								<td>${c.cphone }</td>
								<td>${c.c_comment }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${!empty clist }">
						<c:if test="${fn:length(clist) < 10 }">
							<c:forEach	begin="${fn:length(clist)}" end="9"> 
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
			<!-- // 거래처 테이블 -->
			<!-- 페이징 -->
			<div id="pagingForm">
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="start" value="${ loc }">
						<c:param name="page" value="1"/>
						<c:if test="${not empty hs}">
							<c:param name="cname" value="${hs.cname}"/>
							<c:param name="ccode" value="${hs.ccode}"/>
							<c:param name="cmanager" value="${hs.cmanager}"/>
							<c:param name="cphone" value="${hs.cphone}"/>
							<c:param name="c_comment" value="${hs.c_comment}"/>
						</c:if>
					</c:url>
					<a class="pg_page" href="${ start }"><i class="fas fa-backward"></i></a>
				</c:if>
				<!--10개씩 전 페이징  -->
				<c:if test="${ pi.currentPage > 10 }">
					<c:url var="prev" value="${ loc }">
						<c:param name="page" value="${pi.startPage - 10}"/>
						<c:if test="${not empty hs}">
							<c:param name="cname" value="${hs.cname}"/>
							<c:param name="ccode" value="${hs.ccode}"/>
							<c:param name="cmanager" value="${hs.cmanager}"/>
							<c:param name="cphone" value="${hs.cphone}"/>
							<c:param name="c_comment" value="${hs.c_comment}"/>
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
									<c:param name="cname" value="${hs.cname}"/>
									<c:param name="ccode" value="${hs.ccode}"/>
									<c:param name="cmanager" value="${hs.cmanager}"/>
									<c:param name="cphone" value="${hs.cphone}"/>
									<c:param name="c_comment" value="${hs.c_comment}"/>
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
							<c:param name="cname" value="${hs.cname}"/>
							<c:param name="ccode" value="${hs.ccode}"/>
							<c:param name="cmanager" value="${hs.cmanager}"/>
							<c:param name="cphone" value="${hs.cphone}"/>
							<c:param name="c_comment" value="${hs.c_comment}"/>
						</c:if>
					</c:url>
					<a class="pg_page" href="${ next }"><i class="fas fa-caret-right"></i></a>
				</c:if>
				<!--맨 끝으로 -->
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="end" value="${ loc }">
						<c:param name="page" value="${ pi.maxPage }"/>
						<c:if test="${not empty hs}">
							<c:param name="cname" value="${hs.cname}"/>
							<c:param name="ccode" value="${hs.ccode}"/>
							<c:param name="cmanager" value="${hs.cmanager}"/>
							<c:param name="cphone" value="${hs.cphone}"/>
							<c:param name="c_comment" value="${hs.c_comment}"/>
						</c:if>
					</c:url> 
					<a class="pg_page" href="${ end }"><i class="fas fa-forward"></i></a>
				</c:if>	
			</div>
		</div>
		<div id="rightBox">
			<!-- 거래처 차트 -->
			<div class="clientChart" id="pieChart">
				<div id="chart-area"></div>
			</div>
			
			<div class="clientChart" id="columnChart">
				<div id="columnChart-area"></div>
			</div>
		</div>
		<!-- 거래처 추가 팝업창 -->
		<form action="/Operation/addClient" id="add-popup-form" class="popup-form" style="display: none;">
			<div class="popupContent">
				<h1>거래처 추가 
					<i class="fas fa-times" aria-hidden="true"></i>
				</h1>
				<div class="content-form">
					<span>거래처 정보</span>
					<div class="add-textform">
						<span class="add-title add-title2">사업자등록번호</span>
						<input type="text" class="txtBox add-text" name="add_ccode">
						<label id="addCcodeChk"></label>
						<input type="hidden" name="addCcodeChk" value="0">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">거래처명</span>
						<input type="text" class="txtBox add-text" name="add_cname">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">담당자</span>
						<input type="text" class="txtBox add-text" name="add_cmanager">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">연락처</span>
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
		<!-- 거래처 수정/삭제 -->
		<form action="/Operation/deleteClient" id="delete-popup-form" class="popup-form" style="display: none;">
			<div class="popupContent">
				<h1>거래처 수정/삭제 
					<i class="fas fa-times" aria-hidden="true"></i>
				</h1>
				<p>
					<span id="selectInfo"></span>이(가) 선택되었습니다.
				</p>
				<div class="btn-form">
					<button type="button" onclick="modifyForm()"><i class="fas fa-check" aria-hidden="true"></i> 수정</button>
					<button type="button" onclick="deleteClient();"><i class="fas fa-times" aria-hidden="true"></i> 삭제</button>
				</div>
				<input type="hidden" name="del_ccode">
			</div>
			<div class="popupLayer"></div>
		</form>
		<!-- 거래처 수정 -->
		<form action="/Operation/modifyClient" id="modify-popup-form" class="popup-form" style="display: none;">
			<div class="popupContent">
				<h1>거래처 수정
					<i class="fas fa-times" aria-hidden="true"></i>
				</h1>
				<div class="content-form">
					<span>거래처 정보</span>
					<div class="add-textform">
						<span class="add-title add-title2">사업자등록번호</span>
						<input type="text" class="txtBox add-text" name="modify_ccode">
						<label id="modifyCcodeChk"></label>
						<input type="hidden" name="modifyCcodeChk" value="allow">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">거래처명</span>
						<input type="text" class="txtBox add-text" name="modify_cname">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">담당자</span>
						<input type="text" class="txtBox add-text" name="modify_cmanager">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">연락처</span>
						<input type="text" class="txtBox add-text" name="modify_cphone">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">비고</span>
						<input type="text" class="txtBox add-text" name="modify_c_comment">
					</div>
					<div class="add-textform btn-form">
						<button type="button"><i class="fas fa-times" aria-hidden="true"></i> 취소</button>
						<button type="button" onclick="modifyClient()"><i class="fas fa-check" aria-hidden="true"></i> 수정</button>
					</div>
					<input type="hidden" name="beforeCcode">
				</div>
			</div>
			<div class="popupLayer"></div>
		</form>
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/operation/clientManager.js"></script>
</body>
</html>