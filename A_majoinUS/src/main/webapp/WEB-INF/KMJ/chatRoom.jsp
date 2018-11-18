<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%
	String cp = request.getContextPath(); //컨텍스트 루트 설정(프로젝트명이 변경되어도 사용할 수 있게끔 한것)
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>AMAJONINUS</title>
</head>
<script src="https://code.jquery.com/jquery-1.9.0.js"></script>
<script src="<%=request.getContextPath() %>/sockjs.min.js"></script>
<body>

<tiles:insertDefinition name="header" />



<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Project-chat room      
        <small>...</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Editors</li>
      </ol>
    </section>    
    <br>       
  
<section class="content">
	<div class="col-md-12">  
<div class="box box-success">
            <div class="box-header">
              <i class="fa fa-comments-o"></i>

              <h3 class="box-title">Chat</h3>

              <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
              </div>  
            </div>     
            <div class="box-body chat" id="chat-box">        
					<div align=center>                     
						<textarea id="data" name="data" rows="20" cols="180" style="resize: none;" readonly>
------------------------------------지난 대화 내용------------------------------------
<c:forEach var="content" items="${chatdata}">${content.name } : ${content.chat_content } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${content.chat_date}
</c:forEach>
------------------------------------${today}------------------------------------
</textarea><hr />                  
					      <div class="input-group">       
					       <c:if test="${sessionScope.Dday eq 'FALSE'}">                          
					<input type="text" id="message" size=165 placeholder="Type message..."/>
					<input type="button" id="sendBtn" value=" 보내기 "  class="btn btn-success"/>
					</c:if>
					</div>  
					</div>        
					  
				</div>
		</div>        
	</div>   
	 </section>  

		</div>
	</div>    

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="aside" />
	<tiles:insertDefinition name="footer" />

<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- ///////////////////////////////////////right side bar//////////////////////////////////////// -->
<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->
<%-- 
 <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><!-- <i class="fa fa-home"></i> --></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">My project menu</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="Main?pj_Num=${pj_num}">
            <i class="menu-icon fa fa-home bg-red"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Home</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="workboard?pj_num=${pj_num}">
            <i class="menu-icon fa fa-fw fa-newspaper-o bg-black"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Work Board</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="pr_fileboard?pj_num=${pj_num }">
            <i class="menu-icon fa fa-fw fa-database bg-yellow"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Data Room</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="chatting?pj_num=${pj_num}">
            <i class="menu-icon fa fa-fw fa-commenting bg-blue"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Chat Room</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="ProjectSchedule?pj_num=${pj_num}">
            <i class="menu-icon fa fa-fw fa-calendar-minus-o bg-purple"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Calendar</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="portfolio?pj_num=${pj_num }">
            <i class="menu-icon fa fa-fw fa-pencil-square bg-green"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Writing portfolio</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="EnR?pj_num=${pj_num }">
            <i class="menu-icon fa fa-fw fa-thumbs-o-up bg-red"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Evaluation and review</h4>
              </div>
            </a>
          </li>
        
        </ul>
        <!-- /.control-sidebar-menu -->
      </div>
      
      
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
<div class="control-sidebar-bg"></div>
 --%>




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
    
	let sock = new SockJS("/A_majoinUS/aus/chat");
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
		
		var url = "<%=cp %>/aus/ProejctRoom/chatting/chatDB";
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
			var url = "<%=cp %>/aus/ProejctRoom/chatting/searchName";
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