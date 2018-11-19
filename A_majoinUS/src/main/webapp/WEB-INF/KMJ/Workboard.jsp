<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ page isELIgnored="false" %> --%>
<%
	String cp = request.getContextPath(); //컨텍스트 루트 설정(프로젝트명이 변경되어도 사용할 수 있게끔 한것)
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<title>AMAJONINUS</title>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>

var commentNum = 1;

function view() {
	var aa = document.getElementById('worklist');
	var bb = document.getElementById('workwrite');
	var cc = document.getElementById('viewchange');
	var dd = document.getElementById('memberwork');
	var ee = document.getElementById('detail');
	var ff = document.getElementById('editwork');
 
	if(aa.style.display == "none" && bb.style.display == "block"){
		aa.style.display = "block";
		bb.style.display = "none";
		dd.style.display = "none";
		
		ff.style.display = "none";
		$("#wd tr").each(function(){
			$("#wd tr:eq(0)").remove();
		});
		ee.style.display = "none";
		
		$("#memberworkboard tr").each(function(){
			$("#memberworkboard tr:eq(1)").remove();
		});
		
		$("#editform tr").each(function(){
			$("#editform tr:eq(0)").remove();
		});
		
		if($("#commentlist").length>0){
			$("#commentlist").remove();
		}
		
		commentNum = 1;
		
		cc.value="업무추가";
	}
	else if((aa.style.display == "block" && bb.style.display == "none") || (aa.style.display == "none" && bb.style.display == "none")){
		aa.style.display = "none";
		bb.style.display = "block";
		dd.style.display = "none";
		ee.style.display = "none";
		ff.style.display = "none";
		
		$("#wd tr").each(function(){
			$("#wd tr:eq(0)").remove();
		});
		
		ee.style.display = "none";
		
		$("#memberworkboard tr").each(function(){
			$("#memberworkboard tr:eq(1)").remove();
		});
		
		$("#editform tr").each(function(){
			$("#editform tr:eq(0)").remove();
		});
		
		if($("#commentlist").length>0){
			$("#commentlist").remove();
		}
		cc.value="전체업무리스트";
	}
}


function memberwork(get_id){
	var id = $(get_id).attr("id");
	var pj_num = $(get_id).attr("class");
	
	var pj_num = $("#pj_num").val();

	$("#wd tr").each(function(){
		$("#wd tr:eq(0)").remove();
	});
	
	$("#memberworkboard tr").each(function(){
		$("#memberworkboard tr:eq(1)").remove();
	});
	
	$("#work h4").remove();
	
	if($("#commentlist").length>0){
		$("#commentlist").remove();
	}
	
	var aa = document.getElementById('worklist');
	var bb = document.getElementById('workwrite');
	var cc = document.getElementById('viewchange');
	var dd = document.getElementById('memberwork');
	var ee = document.getElementById('detail');
	var ff = document.getElementById('editwork');
	
	aa.style.display = "none";
	bb.style.display = "none";
	dd.style.display = "block";
	ee.style.display = "none";
	ff.style.display = "none";
	
	cc.value="업무추가";
	
	commentNum = 1
	
	$("#editform tr").each(function(){
		$("#editform tr:eq(0)").remove();
	});
	
	var url = "<%=cp %>/aus/ProejctRoom/workboard/memberwork";
	var params="id="+id+"&pj_num="+pj_num;
	
	$.ajax({
		type:"post",
		url:url,
		data:params,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType:"json",
		success:function(args){
			$("#memberworkboard").before("<h4>"+args.data[0].name+"의 업무 리스트</h4>");
			for(var idx=0;idx<args.data.length;idx++){
				var area = args.data[idx];
				$("#memberworkboard").append("<tr><td>1</td><td><a href='#' id='"+area['pw_num']+"' class='workdetail' onclick='javascript:workdetail(this)'>"+area['w_subject']+"</a></td><td>"+area['w_date']+"</td><td>"+area['state']+"</td></tr>");
			}
		}
	});
}       

var i;
function workdetail(worknum){
	var num = $(worknum).attr("id");
	var aa = document.getElementById('worklist');
	var bb = document.getElementById('workwrite');
	var cc = document.getElementById('viewchange');
	var dd = document.getElementById('memberwork');
	var ee = document.getElementById('detail');
	var ff = document.getElementById('editwork');
	aa.style.display = "none";
	bb.style.display = "none";
	dd.style.display = "none";
	ee.style.display = "block";
	ff.style.display = "none";
	
	cc.value="업무추가";
	
	var url = "<%=cp %>/aus/ProejctRoom/workboard/workdetail";
	var params="pw_num="+num;
	$.ajax({
		type:"post",
		url:url,
		data:params,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType:"json",
		success:function(args){
			i = args.detail;
			commentNum += args.count;
       
			if((${sessionScope.id eq master})||('${sessionScope.id}' == args.detail.id)){
				$("#wd").append("<tr><td width=40%>"+args.detail.name+"의 업무</td><td width=30%>기한 : "+args.detail.w_date+"</td><td width=30%><input type='button' id='complet' class='complet' value='완료' onclick='javascript:statecomplet("+args.detail.pw_num+","+args.detail.pj_num+")'></td></tr>");
			}else{
				$("#wd").append("<tr><td width=40%>"+args.detail.name+"의 업무</td><td width=30%>기한 : "+args.detail.w_date+"</td><td width=30%></td>");
			}
			$("#wd").append("<tr><td colspan=3>"+args.detail.w_subject+"</td></tr>");      
			$("#wd").append("<tr><td colspan=3>"+args.detail.w_content+"</td></tr>");
			if((${sessionScope.id eq master} && ${sessionScope.Dday eq 'FALSE'})){
				$("#wd").append("<tr><td colspan=3><input type='button' value='수정' id='edit' name='edit' onclick='javascript:workedit();' ><input type='button' id='delete' name='delete' value='삭제' onclick='javascript:deletework("+args.detail.pw_num+","+args.detail.pj_num+")'></td></tr>");
			}else{
				$("#wd").append("<tr><td colspan=3></td></tr>");
			}
			       
			$("#wd").append("<tr><td colspan=3><hr/></td></tr>");
			$("#wd").append("<tr><td colspan=3>${sessionScope.name} : <input type='text' id='comment' name='comment' placeholder='댓글을 입력해주세요' size=100 onkeypress='if(event.keyCode==13) {javascript:writecomment("+args.detail.pw_num+");}'> <input type='button' id='enter' name='enter' value='입력' onclick='javascript:writecomment("+args.detail.pw_num+");'></td></tr>");
			$("#wd").append("<tr><td colspan=3><hr/></td></tr>");
			
			$("#wd").after("<div class='commentlist' id='commentlist'></div>");			
			$("#commentlist").append("<table id='commentdetail'>");
			for(var idx=0;idx<args.comment.length;idx++){
				var area = args.comment[idx];
				var compareID = args.comment[idx].id;
        		if('${sessionScope.id}' == args.comment[idx].id){
        			$("#commentdetail").append("<tr><td width=20%>"+area['name']+"</td><td width=5%> : </td><td width=50%>"+area['wc_content']+"</td><td width=15%>"+area['pw_date'] + "</td><td width=10%><input type='button' id='delcomment' name='delcomment' value='삭제' class='"+area['wc_num']+"' onclick='javascript:deletecomment(this)'></td></tr>");
        		}
        		else{
        			$("#commentdetail").append("<tr><td width=20%>"+area['name']+"</td><td width=5%> : </td><td width=50%>"+area['wc_content']+"</td><td width=15%>"+area['pw_date'] + "</td><td width=10%></td></tr>");
        		}
			}        
			if (args.detail.state == '완료'){
				$('#complet').attr('disabled',true);
				$('#edit').attr('disabled',true);
				$('#delete').attr('disabled',true);
			}      
		}                     
	});                     
}
                   
function statecomplet(pw_num,pj_num){
	location.href="workboard/completstate?pw_num="+pw_num+"&pj_num="+pj_num;
}     
         
function workedit(){
	var aa = document.getElementById('worklist');
	var bb = document.getElementById('workwrite');
	var cc = document.getElementById('viewchange');
	var dd = document.getElementById('memberwork');
	var ee = document.getElementById('detail');
	var ff = document.getElementById('editwork');
	
	aa.style.display = "none";
	bb.style.display = "none";
	dd.style.display = "none";
	ee.style.display = "none";
	ff.style.display = "block";
	
	cc.value="업무추가";
	
	
	$("#editform").before(i.name+"의 업무 수정 ");
	$("#editform").append("<tr><td><input type=text id=w_subject name=w_subject value='"+i.w_subject+"' size=100 required='required'></td></tr>");
	$("#editform").append("<tr><td><textarea id=w_content name=w_content rows=20 cols=100 required='required'>"+i.w_content+"</textarea></td></tr>");
	$("#editform").append("<tr><td><input type=date id=w_date name=w_date value='"+i.w_date+"' required='required'></td></tr>");
	$("#editform").append("<tr><td><input type=hidden id=pj_num name=pj_num value='"+i.pj_num+"'><input type=hidden id=pw_num name=pw_num value='"+i.pw_num+"'><input type=submit value='수정 완료'></td></tr>");
	$("#editform").append("<tr><td><input type=button id=cancel name=cancel value='취소' onclick='javascript:canceledit();'></td></tr>");
	
} 

function canceledit(){
	var ee = document.getElementById('detail');
	var ff = document.getElementById('editwork');
	
	ee.style.display = "block";
	ff.style.display = "none";
	
	$("#editform tr").each(function(){
		$("#editform tr:eq(0)").remove();
	});
}
          
function deletework(pw_num,pj_num){
	
	location.href="workboard/deletework?pw_num="+pw_num+"&pj_num="+pj_num;	
	
}
      
function writecomment(pw_num){
	
	var comment = document.getElementById('comment');
	
	if(comment.value!=''){
		var url = "<%=cp %>/aus/ProejctRoom/workboard/writecomment";   
		var params="pw_num="+pw_num+"&comment="+comment.value+"&count="+commentNum;
		
		$.ajax({
			type:"post",
			url:url,
			data:params,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType:"json",
			success:function(args){
				$("#commentdetail").append("<tr><td>"+args.newWC.name+"</td><td> : </td><td>"+args.newWC.wc_content+"</td><td>"+args.newWC.pw_date + "</td><td><input type='button' id='delcomment' name='delcomment' value='삭제' class='"+args.newWC.wc_num+"' onclick='javascript:deletecomment(this)'></td></tr>");
				commentNum++;
				comment.value="";
			}
		});  
	}else{
		alert('내용을 입력해주세요');
	}
	
}

function deletecomment(obj){
	
	var wc_num = $(obj).attr("class");
	
	var url = "<%=cp %>/aus/ProejctRoom/workboard/delcomment";   
	var params="wc_num="+wc_num;
	
	$.ajax({
		type:"post",
		url:url,
		data:params,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(){
		    var tr = $(obj).parent().parent();
		    tr.remove();
			commentNum--;
		}
	});
}         

</script>
<style>
.memlist {
	width: 25%;
	height:100%;
	float: left;
	border: 1px solid black;
	margin-right: 20px;
	margin-left: 20px;
}        

.workboard {
/* 	width: 60%;
	margin: 20px;
	float: left;     */
}        
    
</style>                      
</head>
<body>      
	<tiles:insertDefinition name="header" />
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
            <!-- 들어갈 내용 -->
            <h1>    
        업무 게시판
        <small>팀원들의 업무를 등록 및 설명, 진행도를 확인할 수 있습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Projectroom</a></li>
        <li class="active">Workboard</li>
      </ol>
    </section>                
    <section class="content" style="height:auto; overflow:auto;">              
				<!-- <div class="work"> -->
					<div class="col-md-3">              
						<c:if test="${sessionScope.Dday eq 'FALSE'}"> 
						<input type="button" class="btn btn-block btn-primary" id=viewchange value="업무추가" style="float:right;" ><!-- onclick="javascript:view();"> -->
						</c:if>
						<hr/>                
						<c:forEach var="mem" items="${mwc}">     
							<div id="${mem.id}" class="${pj_num} box box-widget widget-user-2">    
								<div class="widget-user-header bg-gray" style="height:50px;">
              						<h5 class="widget-user-desc">${mem.name} (${mem.id})</h5>
								<%-- <a href="#" id="${mem.id}" class="${pj_num}" onclick="return false;"> --%> 
							<%-- 	${mem.name }<br>    
								진행중인 업무 : ${mem.ongoing} (지연 : ${mem.delay})<br>
								완료된 업무 : ${mem.complet}<br> --%>
								<!-- </a>   -->      
								</div>
								     
								<div class="box-footer no-padding">    
				            		<ul class="nav nav-stacked">
				                		<li><a href="#" onclick="return false;">진행중인 업무 <span class="pull-right badge bg-blue">${mem.ongoing}</span></a></li>
				                		<li><a href="#" onclick="return false;">지연된 업무 <span class="pull-right badge bg-yellow">${mem.delay}</span></a></li>
				                		<li><a href="#" onclick="return false;">완료된 업무 <span class="pull-right badge bg-green">${mem.complet}</span></a></li>
				              		</ul>
				            	</div>
								
								
								
							</div>
						</c:forEach>                               
					</div>              
                       
					<div class="workboard col-md-9">
					<div class="box box-primary">    
						<div id=worklist style="display:block;">
							<br>                   
							<h4 style=" padding-left: 10px;"> 전체 업무리스트</h4>
							<br>    
							<div id="work" class="box-body ">
								<table id="workboard" class="table table-condensed">
									<tr>      
										<td align="center" width=5%>no.</td>
										<td align="center" width=50%>제목</td>
			  							<td align="center" width=30%>기한</td>
										<td align="center" width=15%>진척도</td>
									</tr>
									<c:set value="1" var="no" />
									<c:forEach var="list" items="${board }">
										<tr>              
											<td align="center"><c:out value="${no}"/></td>
											<td align="center"><a href="#" id="${list.pw_num }" class="workdetail" onclick="return false;">${list.w_subject }</a></td>
											<td align="center">${list.w_date }</td>
											<td align="center">${list.state }</td>
										</tr>      
										<c:set value="${no+1}" var="no" />
									</c:forEach>
								</table>
							</div>
						</div>
    
						<div id=workwrite style="display:none;">
							<form method=post action='workboard/Writework' name=workboardDTO>
						
								<table border=1 align=center id='writeform'>
									<tr>
										<td>
										업무 담당자 : 
										<select name=id required="required">
												<option value="">이름</option>
												<c:forEach var="ml" items="${pmdto}">
													<option value="${ml.id }">${ml.name }</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											<input type=text id=w_subject name=w_subject placeholder='제목을 입력하세요' size=100 required="required">
										</td>
									</tr>
									<tr>
										<td><textarea id=w_content name=w_content rows=20 cols=100 placeholder='내용을 입력하세요' required="required"></textarea></td>
									</tr>
									<tr>
										<td><input type=date id=w_date name=w_date required="required"></td>
									</tr>
										<input type=hidden id=pj_num name=pj_num value="${pj_num }">
									<tr>
										<td><input type=submit value='업무 등록'></td>
									</tr>
								</table>
							</form>
						</div>
						
						<div id=memberwork style="display:none;">
							<div id="work">
								<table border=1 align=center id="memberworkboard">
									<tr>
										<td width=5%>no.</td>
										<td width=50%>제목</td>
										<td width=30%>기한</td>
										<td width=15%>진척도</td>
									</tr>
								</table>
							</div>
						</div>
						
						<div id=detail style="display:none;">
							<div id="w_detail">
								<table id="wd" >
									
								</table>
							</div>
						</div>
						
						<div id=editwork style="display:none;">
							<form method=post action='workboard/editwork' name=editwork>
								<table border=1 align=center id='editform'>
									
								</table>
							</form>
						</div>
					</div>
					</div>    
				<!-- </div> -->
			</section>
		</div>       
	</div>         

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="aside" />
	<tiles:insertDefinition name="footer" />        

<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- ///////////////////////////////////////right side bar//////////////////////////////////////// -->
<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->

<%--  <!-- Control Sidebar -->
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





<script>
$('.${pj_num}').on('click',function(){
	memberwork(this);
});

$('.workdetail').on('click',function(){
	workdetail(this);
});

$('#viewchange').on('click',function(){
	if(${sessionScope.id eq master}){
		view();
	}else{
		alert('프로젝트의 팀장만 등록할 수 있습니다.');
		return false;
	}
});      

</script>
  

</body>
</html>