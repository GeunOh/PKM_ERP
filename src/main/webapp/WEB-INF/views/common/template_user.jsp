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
							<li><i class="fas fa-bell"></i>알림설정</li>
							<li><i class="fas fa-cog"></i>환경설정</li>
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
			<ul id="human" class="subMenu">
				<li>
					<a href=""><span id="">내 정보</span></a>
				</li>
				<li>
					<a href="/MyInfo/notice"><span id="">공지사항</span></a>
				</li>
				<li>
					<a href=""><span id="">사원검색</span></a>
				</li>
				<li>
					<a href=""><span id="">근태현황</span></a>
				</li>
				<li>
					<a href=""><span id="">휴가사용현황</span></a>
				</li>
				<li>
					<a href=""><span id="">업무관리(제품목록)</span></a>
				</li>
				<li>
					<a href=""><span id="">비품신청</span></a>
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

<!-- 쪽지 버튼  -->
<div id="message_icon">
	<i class="fas fa-envelope-open"></i>
	<span></span>
</div>
<div class="Alramdiv" style="display: none;">메시지 도착!</div>

<!-- 쪽지 팝업창 -->
<div id="message_popup">
	<div class="msg_top">
		<div class="msg_sub_top"></div>
		<div class="msg_sub_text">
			<div class="msg_title">WORKSPACE</div>
			<span>WORKSPACE 간의 사내 메신저입니다.<br></span>
			<i class="fas fa-times"></i>
		</div>
		<div class="msg_form">
			<!-- 수신/발신함 -->
			<div class="msg_box">
				<div class="msg_box_top">
					<h1 id="receiver_text">수신 쪽지함</h1>
					<h1 id="send_text" style="margin-left: 10px;">발신 쪽지함</h1>
					<h1 id="write_text"><i class="fas fa-paper-plane"></i>작성하기</h1>
				</div>
				<div class="msg_receiver">
				</div>
				<div class="msg_send">
				</div>
			</div>
			
			<!-- 작성하기  -->
			<form class="msg_write">
				<div class="msg_wrtie_top">
					<i class="fas fa-chevron-left"></i>
					<h1>작성하기</h1>
					<i class="fas fa-times"></i>
				</div>
				<div class="msg_write_txtForm"><span>제목</span><input type="text" id="msg_title"></div>
				<div class="msg_write_txtForm"><span>받는 사람</span><input type="text" id="msg_reciever">
					<input type="hidden" id="find_human" value="">
					<ul style="max-height: 120px; overflow-y: scroll;">
						<li><a class='none_link' data-value='N'>검색 결과 없음</a></li>
					</ul>
					<i class="fas fa-angle-down searchHuman"></i>
					<div class="option">- 쪽지를 보낼 사람의 이름을 입력해주세요. </div>
				</div>
				<div class="msg_write_txtForm msg_write_txtForm2">
					<textarea rows="22"></textarea>
				</div>
				<div class="msg_btnForm">
					<button type="button" id="write_send_btn">보내기</button>
					<button type="button" id="write_cancel_btn">취소</button>
				</div>
			</form>
			
			<!-- 쪽지(수신) 상세보기  -->
			<form class="msg_reciever_detail">
				<div class="msg_wrtie_top">
					<i class="fas fa-chevron-left"></i>
					<h1>쪽지 상세보기</h1>
					<i class="fas fa-times"></i>
				</div>
				<div class="msg_write_txtForm"><span>제목</span><input type="text" id="msg_reciever_title" readonly></div>
				<div class="msg_write_txtForm"><span>보낸 사람</span><input type="text" id="msg_reciever_name" readonly>
					<input type="hidden" id="msg_reciever_writer" value="">
					<input type="hidden" id="msg_reciever_mno" value="">
				</div>
				<div class="msg_write_txtForm msg_write_txtForm2">
					<textarea rows="22" id="msg_reciever_content" readonly></textarea>
				</div>
				<div class="msg_btnForm">
					<button type="button" id="reciever_send_btn">답장하기</button>
					<button type="button" id="reciever_delete_btn">삭제</button>
				</div>
			</form>
			
			<!-- 쪽지(발신) 상세보기  -->
			<form class="msg_send_detail">
				<div class="msg_wrtie_top">
					<i class="fas fa-chevron-left"></i>
					<h1>쪽지 상세보기</h1>
					<i class="fas fa-times"></i>
				</div>
				<div class="msg_write_txtForm"><span>제목</span><input type="text" id="msg_send_title" readonly></div>
				<div class="msg_write_txtForm"><span>받는 사람</span><input type="text" id="msg_send_name" readonly>
					<input type="hidden" id="msg_send_mno" value="">
					<input type="hidden" id="msg_send_writer" value="">
				</div>
				<div class="msg_write_txtForm msg_write_txtForm2">
					<textarea rows="22" id="msg_send_content" readonly></textarea>
				</div>
				<div class="msg_btnForm">
					<button type="button" id="send_send_btn">재발송</button>
					<button type="button" id="send_delete_btn">삭제</button>
				</div>
			</form>
		</div>
	</div>
	<!-- 알림팝업  -->
	<div class="msg_alertForm">
		<span class="msg_alert">메시지를 보냈습니다.</span>
	</div>
</div>
<script>
	var socket = null;
	//실시간 알람
	function connect(){
		var ws = new WebSocket("ws://"+location.host+"/msg");
		socket = ws;
		ws.onopen = function(){
			console.log("연결됨")
		}
		ws.onmessage = function(e){
			console.log(e.data);
			if(e.data=='도착'){
				$('.Alramdiv').fadeIn();
				setTimeout(function(){
					$('.Alramdiv').fadeOut();
				}, 5000);
				NoReadMsg();
				SendMsg();
			}
			
		}
		ws.onclose = function(e){
			console.log("끊어짐")
		}
	}

	$('#msg_reciever').on("keyup",function(){
		
		var mem = $(this).val();
		
		$.ajax({
			url:'/MyInfo/MsgFindMember',
			data:{mem:mem},
			success:function(data){
				$ul = $('.msg_write_txtForm ul');
				$ul.html('');
				if(data.length>0){
					if(data.length == 1) $ul.css('bottom','-38px');
					if(data.length == 2) $ul.css('bottom','-75px');
					if(data.length >= 3) $ul.css('bottom','-121px');
					for(var i in data){
						$li = $("<li><a href='#' class='link-select' data-value='"+ data[i].eno +"'>"+data[i].dname+" "+data[i].rname+" "+data[i].name+"</a></li>");		
						$ul.append($li);
					}
				}else{
					$ul.css('bottom','-38px');
					$li = $("<li><a class='none_link' data-value='N'>검색 결과 없음</a></li>");		
					$ul.append($li);
				}
				$('.searchHuman').addClass('rotate-searchAngle');
				$ul.show();
			}
		})
		
	})
	
	//클릭시 데이터 옮기기
	$(document).on('click', '.link-select', function(){
		var eno = $(this).attr('data-value');
		var name = $(this).text();
		
		$('#find_human').val(eno);
		$('.msg_write_txtForm ul').hide();
		$('#msg_reciever').val(name);
		$('.searchHuman').removeClass('rotate-searchAngle');
		
	})
	//검색결과없음 클릭시
	$(document).on('click', '.none_link', function(){
		$('.msg_write_txtForm ul').hide();
		$('.searchHuman').removeClass('rotate-searchAngle');
	})
	//화살표 누를시
	$(document).on('click', '.searchHuman', function(){
		$('.msg_write_txtForm ul').toggle();
		$(this).toggleClass('rotate-searchAngle');
	})
	//보내기버튼
	$(document).on('click', '#write_send_btn', function(){
		var writer = '${loginUser.eno}';
		var title = $('#msg_title').val();
		var reciever = $('#find_human').val();
		var content = $('.msg_write_txtForm2 textarea').val();
		
		$.ajax({
			url:'/MyInfo/MsgSend',
			data:{
				title:title,
				writer:writer,
				reciever:reciever,
				content:content
			},
			success:function(data){
				
				if(data=='true') {
					$('.msg_write').fadeOut();
					$('.msg_alert').text(" 쪽지를 보냈습니다.");
					$('#msg_title').val('');
					$('#msg_reciever').val('');
					$('.msg_write_txtForm2 textarea').val('');
					
					$('.msg_alert').fadeIn();
					setTimeout(function(){
						$('.msg_alert').fadeOut();
					}, 3000);
					socket.send(reciever);
					
					SendMsg();
				}
			}
			
		})
	})
	//취소
	$(document).on('click', '#write_cancel_btn', function(){
		$('.msg_write').fadeOut();
		$('#msg_title').val('');
		$('#msg_reciever').val('');
		$('.msg_write_txtForm2 textarea').val('');
		$('.msg_write_txtForm ul').html('');
	})
	//쪽지 수신함
	function RecieverMsg(){
		var user = '${loginUser.eno}';
		$.ajax({
			url: '/MyInfo/RecieverMsg',
			data: {user:user},
			success: function(data){
				$msgForm = $('.msg_receiver');
				$msgForm.html('');
				
				if(data.length>0){
					console.log(data)
					for(var i in data){
						$RecieverMsg = $("<div class='reciever_msg'>");
						$MsgNum = $("<input type='hidden' value="+data[i].mno+">");
						$profile = $("<div class='msg_img_form'><img src='resources/Profile-images/"+data[i].profile+"'></div>");
						$RecieverForm = $("<div class='msg_reciever_form'>");
						$date = $("<span>"+data[i].createDate+"</span>");
						$writer = $("<div class='msg_reciever_human'>"+data[i].dname+ " "+ data[i].rname + " " + data[i].name +"</div>");
						$bcontent = $("<div class='msg_reciever_human2'>"+data[i].bcontent+"</div>");
						if(data[i].mread=='N'){
							$read = $("<div class='msg_send_human3 check'>확인</div>");
						}else{
							$read = $("<div class='msg_send_human3 noCheck'>미확인</div>");
						}
						$RecieverForm.append($MsgNum);
						$RecieverForm.append($writer);
						$RecieverForm.append($bcontent);
						$RecieverForm.append($date);
						$RecieverForm.append($read);
						$RecieverMsg.append($profile);
						$RecieverMsg.append($RecieverForm);
						$msgForm.append($RecieverMsg);
					}
				}else{
					$empty = $("<div class='empty_msg'>수신된 쪽지가 없습니다.</div>");		
					$msgForm.append($empty);
				}
			}
		})
	}
	//쪽지 발신함
	function SendMsg(){
		var user = '${loginUser.eno}';
		$.ajax({
			url: '/MyInfo/SendMsg',
			data: {user:user},
			success: function(data){
				$msgForm = $('.msg_send');
				$msgForm.html('');
				
				if(data.length>0){
					for(var i in data){
						$SendMsg = $("<div class='send_msg'>");
						$MsgNum = $("<input type='hidden' value='"+data[i].mno+"'>");
						$SendForm = $("<div class='msg_send_form'>");
						$date = $("<span>"+data[i].createDate+"</span>");
						$writer = $("<div class='msg_send_human'>"+data[i].dname+ " "+ data[i].rname + " " + data[i].name +"</div>");
						$bcontent = $("<div class='msg_send_human2'>"+data[i].bcontent+"</div>");
						if(data[i].mread=='N'){
							$read = $("<div class='msg_send_human3 check'>확인</div>");
						}else{
							$read = $("<div class='msg_send_human3 noCheck'>미확인</div>");
						}
						
						$SendForm.append($MsgNum);
						$SendForm.append($date);
						$SendForm.append($writer);
						$SendForm.append($bcontent);
						$SendForm.append($read);
						$SendMsg.append($SendForm);
						$msgForm.append($SendMsg);
					}
				}else{
					$empty = $("<div class='empty_msg'>발신된 쪽지가 없습니다.</div>");		
					$msgForm.append($empty);
				}
			}
		})
	}
	
	//안읽은 메시지 개수
	function NoReadMsg(){
		var user = '${loginUser.eno}';
		$.ajax({
			url: '/MyInfo/NoReadMsg',
			data: {user:user},
			success: function(data){
				if(data == 0){
					$('#message_icon span').hide();
				}else{
					$('#message_icon span').show();
					$('#message_icon span').text(data);
				}
			}
		})
	}
	
	//쪽지(수신) 상세보기
	$(document).on('click', '.reciever_msg', function(){
		$('.msg_reciever_detail').fadeIn();
		var mno = $(this).find('input[type=hidden]').val();
		var writer = $(this).find('.msg_reciever_human').text();
		$.ajax({
			url: '/MyInfo/recieverDetail',
			data: {mno:mno},
			success:function(data){
				$('#msg_reciever_mno').val(data.mno);
				$('#msg_reciever_writer').val(data.writer);
				$('#msg_reciever_title').val(data.title);
				$('#msg_reciever_name').val(writer);
				$('#msg_reciever_content').val(data.bcontent);
				
				NoReadMsg();
			}
		})
	})
	//쪽지(수신) 뒤로가기
	$(document).on('click', '.msg_reciever_detail .fa-chevron-left', function(){
		$('.msg_reciever_detail').fadeOut();
	})
	//쪽지(수신) x표시
	$(document).on('click', '.msg_reciever_detail .fa-times', function(){
		$('.msg_reciever_detail').fadeOut();
		$('#message_popup').fadeOut();
	})
	//쪽지(수신) 답장하기
	$(document).on('click', '.msg_reciever_detail #reciever_send_btn', function(){
		$('.msg_reciever_detail').fadeOut();
		var eno = $('#msg_reciever_writer').val();
		var sender = $('#msg_reciever_name').val();
		
		$('.msg_write').fadeIn();
		$('#msg_reciever').val(sender);
		$('#find_human').val(eno);
		
		
		
	})
	
	//쪽지(발신) 상세보기
	$(document).on('click', '.send_msg', function(){
		$('.msg_send_detail').fadeIn();
		var mno = $(this).find('input[type=hidden]').val();
		var writer = $(this).find('.msg_send_human').text();
		$.ajax({
			url: '/MyInfo/sendDetail',
			data: {mno:mno},
			success:function(data){
				$('#msg_send_mno').val(data.mno);
				$('#msg_send_writer').val(data.reciever);
				$('#msg_send_title').val(data.title);
				$('#msg_send_name').val(writer);
				$('#msg_send_content').val(data.bcontent);
			}
		})
	})
	//쪽지(발신) 뒤로가기
	$(document).on('click', '.msg_send_detail .fa-chevron-left', function(){
		$('.msg_send_detail').fadeOut();
	})
	//쪽지(발신) x표시
	$(document).on('click', '.msg_send_detail .fa-times', function(){
		$('.msg_send_detail').fadeOut();
		$('#message_popup').fadeOut();
	})
	//쪽지(발신) 재전송
	$(document).on('click', '.msg_send_detail #send_send_btn', function(){
		var mno = $('#msg_send_mno').val();
		$('.msg_send_detail').fadeOut();
		
		$.ajax({
			url: '/MyInfo/sendResend',
			data:{mno:mno},
			success:function(data){
				
				$('.msg_alert').fadeIn();
				setTimeout(function(){
					$('.msg_alert').fadeOut();
				}, 3000);
				socket.send(reciever);
			}
		})
	})
	
</script>
