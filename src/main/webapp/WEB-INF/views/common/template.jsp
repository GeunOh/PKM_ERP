<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 템플릿 마크업 html 영역 --%>

<!-- header -->
<header id="header">
	<div class="header_wrap">
		<div class="logo_area">
			<h1>LOGO</h1>
		</div>
		<div class="menu_option">
			<ul>
				<li>
					<a>
						<i class="fas fa-bell" aria-hidden="true" title="알람"></i>
					</a>
				</li>
				<li>
					<img class="profile" alt="" src="http://placehold.it/35x35">
				</li>
				<li onclick="showMenu();">
					<span>Sanghoo Moon</span>
					<i class="fas fa-angle-down" aria-hidden="true"></i>
					<div id="dropdown-menu">
						<ul>
							<li><i class="fas fa-user-circle"></i>내 정보</li>
							<li><i class="fas fa-lock"></i>비밀번호변경</li>
							<li><i class="fas fa-bell"></i>알림설정</li>
							<li><i class="fas fa-cog"></i>환경설정</li>
							<li><i class="fas fa-power-off"></i>로그아웃</li>
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
	
</div>
<!-- // sideMenu -->
