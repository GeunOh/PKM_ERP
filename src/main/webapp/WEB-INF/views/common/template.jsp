<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 템플릿 마크업 html 영역 --%>

<!-- header -->
<header id="header">
	<div class="header_wrap">
		<div class="logo_area">
			<h1>WORKSPACE</h1>
		</div>
		<div class="menu_option">
			<ul>
				<li>
					<a>
						<i class="fas fa-bell" aria-hidden="true" title="알람"></i>
					</a>
				</li>
				<li>
					<c:if test="${loginUser.renameFileName eq null}"><img class="profile" src="resources/images/default-profile.jpg"></c:if> 
					<c:if test="${loginUser.renameFileName ne null}"><img class="profile" src="resources/Profile-images/${loginUser.renameFileName }"></c:if> 
					
				</li>
				<li onclick="showMenu();">
					<span>${loginUser.name}님</span>
					<i class="fas fa-angle-down" aria-hidden="true"></i>
					<div id="dropdown-menu">
						<ul>
							<li onclick="location.href='/Human/myInfo'"><i class="fas fa-user-circle"></i>내 정보</li>
							<li><i class="fas fa-lock"></i>비밀번호변경</li>
							<c:if test="${loginUser.adminyn eq 'Y' }">
								<li onclick="location.href='/quickMenu'"><i class="fas fa-cog"></i>관리자모드</li>
							</c:if>
							<li onclick="location.href='/Logout'"><i class="fas fa-power-off"></i>로그아웃</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
</header>
<!-- // header  -->

<!-- sideMenu -->
<div id="sideMenu">
	<ul id="mainMenu">
		<li>
			<span>인사관리</span>
			<ul id="human" class="subMenu">
				<li>
					<a href="/Human/humanManager"><span id="humanManager">기본인사관리</span></a>
				</li>
				<li>
					<a href="/Human/positionManager"><span id="positionManager">직급관리</span></a>
				</li>
				<li>
					<a href="/Human/departmentManager"><span id="departmentManager">부서관리</span></a>
				</li>
				<li>
					<a href="/Human/salaryManager"><span id="salaryManager">급여관리</span></a>
				</li>
				<li>
					<a href="/Human/workInOutManager"><span id="workInOutManager">근태관리</span></a>
				</li>
				<li>
					<a href="/Human/vacationManager"><span id="vacationManager">휴가관리</span></a>
				</li>
			</ul>
		</li>
		<li>
			<span>재고관리</span>
			<ul id="stock" class="subMenu">
				<li>
					<a href="/Stock/productList"><span id="productList">제품 목록</span></a>
				</li>
				<li>
					<a href="/Stock/productManager"><span id="productManager">제품 재고관리</span></a>
				</li>
				<li>
					<a href="/Stock/stockInOut"><span id="stockInOut">제품 입/출고현황</span></a>
				</li>
				<li>
					<a href="/Stock/supplyList"><span id="supplyList">비품 목록</span></a>
				</li>
				<li>
					<a href="/Stock/supplyManager"><span id="supplyManager">비품 재고관리</span></a>
				</li>
				<li>
					<a href="/Stock/applicationList"><span id="applicationList">비품 신청현황</span></a>
				</li>
			</ul>
		</li>
		<li>	
			<span>운영/매출관리</span>
			<ul id="operation" class="subMenu">
				<li>
					<a href="/Operation/clientManager"><span id="clientManager">거래처 관리</span></a>
				</li>
				<li>	
					<span>매출관리</span>
				</li>
			</ul>
		</li>
	</ul>
</div>
<!-- // sideMenu -->
<!-- 비밀번호 변경 팝업 -->
<div id="changePwdPopUp" class="popup-form" style="display: none;">
	<div id="changePwdContent" class="popupContent">
		<h1>비밀번호 변경</h1>
		<p>현재 비밀번호와 변경하실 비밀번호를 입력해주세요.</p>
		<form>
			<div class="change-area">
				<label for="now_pwd">현재 비밀번호&nbsp;</label>
				<input type="password" name="now_pwd" id="now_pwd">
			</div>
			<div class="change-area">
				<label for="new_pwd">변경하실 비밀번호&nbsp;</label>
				<input type="password" name="new_pwd" id="new_pwd">
			</div>
			<div class="change-area">
				<label for="re_pwd">비밀번호 확인&nbsp;</label>
				<input type="password" name="re_pwd" id="re_pwd">
			</div>
			<div class="btn-form">
				<button type="button"><i class="fas fa-times"></i> 취소</button>
				<button type="button" onclick="changePwd();"><i class="fas fa-check"></i> 확인</button>
			</div>
		</form>
	</div>
	<div class="popupLayer"></div>
</div>
<!-- 비밀번호 변경 팝업 -->


