<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PKM_ERP</title>
<link href="resources/css/index.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<h1>
		<img src="resources/images/ERP_LOGO.png" style="height:50%; width:50%;"/> 
	</h1>
	
	<p class="type_text"></p>
	
	<div id="indexBtn" class="center">
		<button id="visual-btn" onclick="location.href='/LoginForm'">Continue</button>
	</div>

	<div class="video-background">
		<div class="video-foreground">
			<div id="muteYouTubeVideoPlayer"></div>
		</div>
	</div>
	
	<div class="video-film"></div>
	
	
	<script async src="https://www.youtube.com/iframe_api"></script>
	<script type="text/javascript">
		var player;
		
		function onYouTubePlayerAPIReady(){
			player = new YT.Player('muteYouTubeVideoPlayer', {
				videoId : 'iGpuQ0ioPrM',
				playerVars : {
					autoplay : 1, 		// Auto-play the video on load // 자동 재생 (유)
					controls : 0, 		// Show pause/play buttons in player // 컨트롤러의 유무 (무)
					rel : 0,			// 해당 영상이 종료된 후 관련 동영상 표시할지
					start : 105,
					end : 301,
					showinfo : 0, 		// Hide the video title // 재생 영상에 대한 정보 유무
					modestbranding : 1, // Hide the Youtube Logo
					loop : 1, 			// Run the video in a loop // 반복 재생에 대한 여부
					playlist : 'iGpuQ0ioPrM',
					fs : 0, 			// Hide the full screen button
					cc_load_policy : 0, // Hide closed captions
					iv_load_policy : 3, // Hide the Video Annotations
					autohide : 1		// Hide video controls when playing
				},
				events:{
					onReady:function(e){
						e.target.mute();
					}
				}
			});
		}
	</script>
	
	<script type="text/javascript" src="resources/js/typeit.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var str1 = [" 이 사이트는 3인 프로젝트로", "인사, 재고, 매출 등을", " 관리하는 ERP 사이트입니다."];
			var str2 = [" 이용하시려면<br>_ 위에 있는\"Continue\"<br>_ 버튼을 클릭해주세요!<br>"];
			
			$('.type_text').typeIt({
				strings:str1,
				html:true,
				autoStart:true,
				loop:true,
				typeSpeed:100
			})
			.tiPause(1500)
			.tiDelete(130)
			.tiType(str2)
			.tiPause(1700)
			.tiDelete(130)
			.tiEmpty(); 
		});
	</script>
</body>
</html>