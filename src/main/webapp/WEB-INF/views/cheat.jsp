<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/cheat.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="url" charset="UTF-8"></script>
</head>
<body>
	<div class="container">
		<h3 class=" text-center">Messaging</h3>
		<div class="messaging">
			<div class="inbox_msg">
				<div class="mesgs">
					<div class="msg_history" id="scrollDiv" style="margin: 0 auto;">
					</div>
					<div class="type_msg" style="margin: 0 auto;">
						<div class="input_msg_write">
							<input type="text" class="write_msg" placeholder="Type a message" />
							<button class="msg_send_btn" type="button">
								<i class="fa fa-paper-plane-o" aria-hidden="true"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		var currentDate = new Date();
		var socket = new WebSocket("ws://192.168.60.18/message");	
		var isScrollUp = false;
		var chat = document.getElementById("scrollDiv");
		socket.onmessage = function(evt){
		var message = evt.data;
		var message2 = message.split(":")
			
		$("#scrollDiv").append(`<div class="incoming_msg_img">
								<img src="https://ptetutorials.com/images/user-profile.png"
									alt="sunil"></div>
					<div class="received_msg">
					<div class="received_withd_msg">
						`+message2[0]+`
						<p>`+message2[1]+`</p>
						<span class="time_date">`+currentDate.getHours()+`:`+currentDate.getMinutes()+`   |   `+(currentDate.getMonth()+1)+`월`+currentDate.getDate()+`일`+`</span>
					</div>
				</div>`);
			   if (!isScrollUp) {
		            $("#scrollDiv").animate({
		               scrollTop : chat.scrollHeight - chat.clientHeight
		            }, 100);
		         }

		}
		 $(".msg_send_btn").on("click",function(){
  			var msg = $(".write_msg").val();
  			$(".msg_history").append(`<div class="outgoing_msg">
  					<div class="sent_msg">
  					<p>`+msg+`</p>
  					<span class="time_date">`+currentDate.getHours()+`:`+currentDate.getMinutes()+`   |   `+(currentDate.getMonth()+1)+`월`+currentDate.getDate()+`일`+`</span>
  				</div>
  			</div>`);
  			$(".write_msg").val("");
  			socket.send(msg)
  			if (!isScrollUp) {
		            $(".msg_history").animate({
		               scrollTop : chat.scrollHeight - chat.clientHeight
		            }, 100);
		         };
  		})
		$(".write_msg").keydown(function(key) {
         if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
       		var msg = $(".write_msg").val();
     			$(".msg_history").append(`<div class="outgoing_msg">
     					<div class="sent_msg">
     					<p>`+msg+`</p>
     					<span class="time_date">`+currentDate.getHours()+`:`+currentDate.getMinutes()+`   |   `+(currentDate.getMonth()+1)+`월`+currentDate.getDate()+`일`+`</span>
     				</div>
     			</div>`);
     			$(".write_msg").val("");
     			socket.send(msg);
     			if (!isScrollUp) {
		            $(".msg_history").animate({
		               scrollTop : chat.scrollHeight - chat.clientHeight
		            }, 100);
		         }
         }
      });
		
	
	
	
	</script>
</body>
</html>