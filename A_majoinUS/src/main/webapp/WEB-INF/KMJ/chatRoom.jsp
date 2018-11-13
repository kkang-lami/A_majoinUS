<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%
	String cp = request.getContextPath(); //컨텍스트 루트 설정(프로젝트명이 변경되어도 사용할 수 있게끔 한것)
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>AMAJONINUS</title>
</head>
<script src="https://code.jquery.com/jquery-1.9.0.js"></script>
<script src="<%=request.getContextPath() %>/sockjs.min.js"></script>
<body>

<tiles:insertDefinition name="header" />
	
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
				<div id="chatlist">
					<h4> 채팅방 </h4>
					<hr/>				
					<br><br>        
					<div align=center>                   
						<textarea id="data" name="data" rows="20" cols="200" style="resize: none;" readonly>
------------------------------------지난 대화 내용------------------------------------
<c:forEach var="content" items="${chatdata}">${content.name } : ${content.chat_content } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${content.chat_date}
</c:forEach>
------------------------------------${today}------------------------------------
</textarea><br>      
					                                   
					<input type="text" id="message" size=187/>
					<input type="button" id="sendBtn" value=" 보내기 " />
					</div>
				</div>
			</section>
		</div>
	</div>    

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />

</body>

<script type="text/javascript">
	var textarea = document.getElementById("data");

	$(document).ready(function() {

		$("#sendBtn").click(function() {
			sendMessage();
			$('#message').val('');
		});

		$("#message").keydown(function(key) {
			if (key.keyCode == 13) {// 엔터
				sendMessage();
				$('#message').val('');
			}
		});
	});
    
	let sock = new SockJS("/AMAJOINUS/aus/chat");
	sock.onmessage = onMessage;
	sock.onclose = onClose;       

	function addZeros(num, digit) { // 자릿수 맞춰주기
		  var zero = '';
		  num = num.toString();
		  if (num.length < digit) {
		    for (i = 0; i < digit - num.length; i++) {
		      zero += '0';
		    }
		  }
		  return zero + num;  
	}

	function sendMessage() {	//메세지 보냄
		var currentDate = new Date();
		var currentHours = addZeros(currentDate.getHours(),2); 
		var currentMinute = addZeros(currentDate.getMinutes() ,2);
		
		var time = "\t ["+ currentHours +":"+ currentMinute + "]" ;// 현재 시간
		
		var data = '${sessionScope.id}'+" : "+$("#message").val() + time;
		
		var url = "<%=cp %>/aus/chatting/chatDB";
		var params="pj_num="+${pj_num}+"&data="+data;
		
		$.ajax({        
			type:"post",
			url:url,     
			data:params,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(args){
			}
		});   
		
		sock.send('${pj_num}'+"/"+'${sessionScope.id}'+" : "+$("#message").val() + time);
	}
      
	function onMessage(msg) {	//메세지 받음
		var data = msg.data;
		var receive_pj_num = data.substring(0,data.indexOf('/'));
		
		if(receive_pj_num == '${pj_num}'){
		
			var content = data.substring(data.indexOf('/')+1,data.length);
			var url = "<%=cp %>/aus/chatting/searchName";
			var params="pj_num="+${pj_num}+"&data="+content;
			var name = '';      
		
			$.ajax({        
				type:"post",
				url:url,     
				data:params,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType:"json",
				success:function(args){
					if(args.name != null){
						name = args.name;
						var content = data.substring(data.indexOf(' :'),data.length);
						textarea.value += name + content + "\n";
					}       
				}
			});
			textarea.scrollTop = textarea.scrollHeight;
		}
	}  
           
	function onClose(evt) {		//서버랑 연결 끊김
		textarea.value += "서버와 연결 끊김";
	}
</script>
</html> 