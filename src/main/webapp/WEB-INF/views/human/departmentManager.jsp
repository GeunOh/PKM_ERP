<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"/>
<title>부서관리</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<link href="resources/css/human/departmentManager.css" rel="styleSheet">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
	<jsp:include page="../common/template.jsp"/>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>부서 관리</h1>
		<div id="department-wrap">
			<!-- 조직도 -->
			<div id="organizationChart">
				<form>
					<ul>
						<li>
							<span>
								<i class="fas fa-sitemap"></i>
								조직도
							</span>
						</li>
						<li>
						<span>WORKSPACE Company</span>
						<ul id="branch-area">
							<%-- 존재하는 부서들 출력 --%>
							<c:forEach items="${deptList}" var="dept">
								<li><span>${dept.dname}</span></li>
							</c:forEach>
						</ul>
						</li>
					</ul>
					<div class="buttons">
						<button type="button" id="addBtn">등록</button>
						<button type="button" id="modifyBtn">수정</button>
						<button type="button" id="delBtn">삭제</button>
					</div>
				</form>
			</div>
			<!-- // 조직도  -->
			<!-- 조직정보 -->
			<div id="organizationInfo">
				<h3>조직정보</h3>
				<table>
					<tr>
						<th>회사명</th>
						<td class="dname">WORKSPACE COMPANY</td>
					</tr>
					<tr>
						<th>회사코드</th>
						<td class="dcode">C123123123</td>
					</tr>
					<tr>
						<th>회사대표</th>
						<td class="dboss">쿠크다스</td>
					</tr>
					<tr>
						<th>시작일</th>
						<td class="startDate">2020-11-11</td>
					</tr>
					<tr>
						<th>종료일</th>
						<td>2099-12-31</td>
					</tr>
					<tr>
						<th>회사소개</th>
						<td class="dcomment">좋은 회사입니다.</td>
					</tr>
				</table>
			</div>
			<!-- // 조직정보 -->
		</div>
		<!-- 부서 등록 수정 삭제 -->
		<!-- 부서등록 팝업 -->
		<form class="dept-popup-form" name="addFrm" id="addDept">
			<div class="popupContent">
				<h2>부서등록
					<i class="fas fa-times" aria-hidden="true"></i>
				</h2>
				<div class="content-form" style="margin-top:7%;">
					<span>부서 등록 정보</span>
					<span style="top: -23px; right: 0; font-size: 12px; text-align: right;">* 필수 정보 입력란입니다.</span>
					<div class="add-textform">
						<span class="add-title add-title2">부서코드</span>
						<input type="text" class="txtBox add-text" name="dcode" onkeyup="dcodeDupChk(event);">
						<label class="dcodeChk"></label>
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">부서명</span>
						<input type="text" class="txtBox add-text" name="dname">
					</div>
				</div>
				<div class="content-form">
					<span style="top: -23px; right: 0; font-size: 12px; text-align: right;">선택 사항입니다.</span>
					<div class="add-textform">
						<span class="add-title add-title2">부서장</span>
						<input type="text" class="txtBox add-text" name="eno">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">부서설명</span>
						<input type="text" class="txtBox add-text" name="eno">
					</div>
				</div>
				<div class="btn-form">
					<button type="button">
						<i class="fas fa-times" aria-hidden="true"></i> 취소
					</button>
					<button type="button" class="addBtn" onclick="dataChk()">
						<i class="fas fa-check" aria-hidden="true"></i> 신청
					</button>
				</div>
			</div>
			<div class="popupLayer"></div>
		</form>
		<!-- 부서 수정 -->
		<form class="dept-popup-form" name="modifyFrm" id="modifyDept">
			<div class="popupContent">
				<h2>부서 수정
					<i class="fas fa-times" aria-hidden="true"></i>
				</h2>
				<p>수정하실 부서를 선택해주세요.</p>
				<div class="deptList" id="delList">
					<table>
						<tr>
							<th>부서명</th>
						</tr>
						<c:forEach items="${deptList}" var="dept">
							<tr>
								<td>${dept.dname}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="deptInfo">
					<h3>조직 정보</h3>
					<table>
						<tr>
							<th>부서명</th>
							<td id="m_dname"></td>
						</tr>
						<tr>
							<th>부서코드</th>
							<td id="m_dcode">
							</td>
							
						</tr>
						<tr>
							<th>부서장</th>
							<td id="m_dboss"></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td id="m_startDate"></td>
						</tr>
						<tr>
							<th>부서소개</th>
							<td id="m_dcomment"></td>
						</tr>
					</table>
				</div>
				<div class="btn-form">
					<button type="button">
						<i class="fas fa-times" aria-hidden="true"></i> 취소
					</button>
					<button type="button" class="modifyBtn">
						<i class="fas fa-check" aria-hidden="true"></i> 수정
					</button>
					<input type="hidden" id="beforeDept" name="beforeDept">
				</div>
			</div>
			<div class="popupLayer"></div>
		</form>
		<form class="dept-popup-form" name="delFrm" id="delDept">
			<div class="popupContent">
				<h2>부서 삭제
					<i class="fas fa-times" aria-hidden="true"></i>
				</h2>
				<p>삭제하실 부서를 선택해주세요.</p>
				<div class="deptList" id="modifyList">
					<table>
						<tr>
							<th><input type="checkbox"></th>
							<th>부서명</th>
						</tr>
						<c:forEach items="${deptList}" var="dept">
							<tr>
								<td><input type="checkbox" id="${dept.dname}" name="dname" value="${dept.dname}"></td>
								<td><label for="${dept.dname}">${dept.dname}</label></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="deptInfo">
					<h3>조직 정보</h3>
					<table>
						<tr>
							<th>회사명</th>
							<td class="dname">WORKSPACE COMPANY</td>
						</tr>
						<tr>
							<th>회사코드</th>
							<td class="dcode">C123123123</td>
						</tr>
						<tr>
							<th>회사대표</th>
							<td class="dboss">쿠크다스</td>
						</tr>
						<tr>
							<th>시작일</th>
							<td class="startDate">2020-11-11</td>
						</tr>
						<tr>
							<th>회사소개</th>
							<td class="dcomment">좋은 회사입니다.</td>
						</tr>
					</table>
				</div>
				<div class="btn-form">
					<button type="button" class="cancleBtn">취소</button>
					<button type="button" id="deleteBtn">삭제</button>
					<input type="hidden" id="beforeDept" name="beforeDept">
				</div>
			</div>
			<div class="popupLayer"></div>
		</form>
		<!-- // 부서 등록 수정 삭제 -->
		<div class="notice_box">
            <ul>
	            <li>1. 부서를 변경/추가/삭제 하시려면 버튼을 클릭해주세요.</li>
                <li>2. 조직도의 부서명을 클릭하시면 조직 정보 및 해당 부서 사원목록을 확인할 수 있습니다.</li>
                <li>3. 부서 삭제 시 해당 부서에 사원이 있으면 해당 사원의 부서정보는 사라집니다.</li>
            </ul>
        </div>
		<!-- 사원목록 -->
		<div id="humanList">
			<h3>사원목록</h3>
			<div id="hListTableWrap">
				<table>
					<thead>
						<tr>
							<th>부서명</th>
							<th>직급코드</th>
							<th>직급명</th>
							<th>사원번호</th>
							<th>사원명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5" style="font-size: 16px;">해당하는 부서의 사원을 확인하시려면 부서를 선택해주세요.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- // 사원목록 -->
		<!-- 알림창 -->
		<div id="alertBox">
			<p></p>
		</div>
		<script type="text/javascript">
			var insert = "${insert}";
			var deleteDept = "${deleteDept}";
			var modify = "${modify}";
			
			if(insert!='') {
				$("#alertBox p").text(insert);
				$("#alertBox").fadeIn();
				setTimeout(function(){
					$("#alertBox").fadeOut();
					return;
				}, 3000);
			}
			
			if(deleteDept!=''){
				$("#alertBox p").text(deleteDept);
				$("#alertBox").fadeIn();
				setTimeout(function(){
					$("#alertBox").fadeOut();
					return;
				}, 3000);
			}
			
			if(modify!=''){
				$("#alertBox p").text(modify);
				$("#alertBox").fadeIn();
				setTimeout(function(){
					$("#alertBox").fadeOut();
					return;
				}, 3000);
			}
		</script>
		<!-- 알림창 -->
	</div>
	<!-- // wrap -->
<script type="text/javascript" src="resources/js/human/departmentManager.js"></script>
</body>
</html>