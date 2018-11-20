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
	var i = 1;
	$.ajax({
		type:"post",
		url:url,
		data:params,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType:"json",
		success:function(args){         
			$("#memberworkboard").before("<h4 style='display:padding-left:10px;'>"+args.data[0].name+"의 업무 리스트</h4>");
			for(var idx=0;idx<args.data.length;idx++){
				var area = args.data[idx];
				var html1 = "<tr><td align='center'>"+i+"</td><td align='center'><a href='#' id='"+area['pw_num']+"' class='workdetail' onclick='javascript:workdetail(this)'>"+area['w_subject']+"</a></td><td align='center'>"+area['w_date']+"</td><td align='center'>"+area['state']+"</td></tr>"; 
				$("#memberworkboard").append(html1);
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
       		var html1 ="";
			var html2 = "";      
			      
			if((${sessionScope.id eq master})||('${sessionScope.id}' == args.detail.id)){    
				html1 += "<tr><td><div class='col-md-6' style='float:left;'><h3>"+args.detail.name+"의 업무</h3></div><div class='col-md-4'><h5>기한 : "+args.detail.w_date+"</h5></div><div class='col-md-2'><input type='button' id='complet' class='complet btn btn-block btn-primary' value='완료' onclick='javascript:statecomplet("+args.detail.pw_num+","+args.detail.pj_num+")'></div></td></tr>";
			}else{    
				html1 += "<tr><td><div class='col-md-6' style='float:left;'><h3>"+args.detail.name+"의 업무</h3></div><div class='col-md-4'><h5>기한 : "+args.detail.w_date+"</h5></div><div class='col-md-2'></div></td></tr>";
			}      
			html1 += "<tr><td><div class='col-md-12' style='float:left;'><h4>"+args.detail.w_subject+"</h4></div></td></tr><tr><td><div class='col-md-12' style='float:left;'><h5>"+args.detail.w_content+"</h5></div></td></tr>";
			
			    
			if((${sessionScope.id eq master} && ${sessionScope.Dday eq 'FALSE'})){
				html1 += "<tr><td colspan=3><div class='col-md-2' style='float:right;'><input type='button' value='수정' id='edit' name='edit' class='btn btn-block btn-warning' onclick='javascript:workedit();' ></div><div class='col-md-2' style='float:right;'><input type='button' id='delete' name='delete' value='삭제' class='btn btn-block btn-default' onclick='javascript:deletework("+args.detail.pw_num+","+args.detail.pj_num+")'></div></td></tr>";
			}else{
				html1 += "<tr><td colspan=3></td></tr>";
			}
			                  
			html1 += "<tr><td colspan=3><hr/></td></tr>";                    
			html1 += "<tr><td colspan=3><div class='form-group'><label for='comment' class='col-sm-12'>${sessionScope.name}</label><div class='col-sm-11'><input type='text' id='comment' name='comment' class='form-control' placeholder='댓글을 입력해주세요' size=100 onkeypress='if(event.keyCode==13) {javascript:writecomment("+args.detail.pw_num+");}'></div><div class='col-sm-1'><input type='button' id='enter' name='enter' class='btn btn-block btn-success' value='입력' onclick='javascript:writecomment("+args.detail.pw_num+");'></div></td></tr>";
			html1 += "<tr><td colspan=3><hr/></td></tr>";
			      
			$("#wd").append(html1);
			               
			$("#wd").after("<div class='commentlist' id='commentlist'></div>");			
			$("#commentlist").append("<table id='commentdetail' class='table table-condensed'>");
			for(var idx=0;idx<args.comment.length;idx++){
				var area = args.comment[idx];
				var compareID = args.comment[idx].id;                     
        		if('${sessionScope.id}' == args.comment[idx].id){      
        			html2 += "<tr><td class='"+area['wc_num']+"'><div class='col-md-2' align='center'>"+area['name']+"</div><div class='col-md-1'> : </div><div class='col-md-5'>"+area['wc_content']+"</div><div class='col-md-2'>"+area['pw_date'] + "</div><div class='col-md-2'><input type='button' id='delcomment' name='delcomment' class='btn btn-block btn-default' value='삭제' class='"+area['wc_num']+"' onclick='javascript:deletecomment(this)'></div></td></tr>";
        		}
        		else{
        			html2 += "<tr><td class='"+area['wc_num']+"'><div class='col-md-2' align='center'>"+area['name']+"</div><div class='col-md-1'> : </div><div class='col-md-5'>"+area['wc_content']+"</div><div class='col-md-2'>"+area['pw_date'] + "</div><div class='col-md-2'></div></td></tr>";
        		}
			}
			$("#commentdetail").append(html2);
			
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
	
	       
	var html1 = "<tr><td><div class='col-md-2'><label>업무 담당자</label>";
	html1 += "<select class='form-control' name=id required='required' disabled><option value=''>"+i.name+"</option></select></div><div class='col-md-10'><label>업무 제목</label>";
	html1 += "<input type=text class='form-control' id=w_subject name=w_subject placeholder='제목을 입력하세요' value='"+i.w_subject+"'size=100 required='required'></div></td></tr>";
	html1 += "<tr><td><div class='col-md-12'><br><textarea id=w_content name=w_content class='form-control' rows=20 cols=180 placeholder='내용을 입력하세요' required='required' style='resize: none;'>"+i.w_content+"</textarea></div></td></tr><tr><td>";
	html1 += "<input type=hidden id=pj_num name=pj_num value='"+i.pj_num+"'><input type=hidden id=pw_num name=pw_num value='"+i.pw_num+"'><div class='input-group date col-md-2' style='padding-left: 20px; float: left;'><div class='input-group-addon'>";
	html1 += "D-day : <i class='fa fa-calendar'></i> <input type=date id=w_date name=w_date value='"+i.w_date+"' required='required'></div></div>";    
	html1 += "<div class='col-md-2' style='float: right; padding-top: 2px;'><input type=submit class='btn btn-block btn-danger' value='수정 완료'></div><div class='col-md-2' style='float: right; padding-top: 2px;'><input type=button id=cancel name=cancel class='btn btn-block btn-default' value='취소' onclick='javascript:canceledit();'></div></td></tr></table></div>";
	$("#editform").append(html1);     

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
				      
				$("#commentdetail").append("<tr><td class='"+args.newWC.wc_num+"'><div class='col-md-2' align='center'>"+args.newWC.name+"</div><div class='col-md-1'> : </div><div class='col-md-5'>"+args.newWC.wc_content+"</div><div class='col-md-2'>"+args.newWC.pw_date+ "</div><div class='col-md-2'><input type='button' id='delcomment' name='delcomment' class='btn btn-block btn-default' value='삭제' onclick='javascript:deletecomment(this)'></div></td></tr>");
				commentNum++;
				comment.value="";
			}
		});  
	}else{
		alert('내용을 입력해주세요');
	}        
	
}      
    
function deletecomment(obj){
	
	var wc_num = $(obj).parent().parent().attr("class");       
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
					<div class="col-md-3">              
						<c:if test="${sessionScope.Dday eq 'FALSE'}"> 
						<input type="button" class="btn btn-block btn-primary" id=viewchange value="업무추가" style="float:right;" ><!-- onclick="javascript:view();"> -->
						</c:if>
						<c:if test="${sessionScope.Dday eq 'TRUE'}"> 
						<input type="button" class="btn btn-block btn-primary" id=viewchange value="업무추가" style="float:right;" disabled="disabled">
						</c:if>
						<hr/>                
						<c:forEach var="mem" items="${mwc}">     
							<div id="${mem.id}" class="${pj_num} box box-widget widget-user-2">    
								<div class="widget-user-header bg-gray" style="height:50px;">
              						<h5 class="widget-user-desc">${mem.name} (${mem.id})</h5>
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
									<div class="form-group">
									<br>         
										<table id='writeform'>
											<tr>      
												<td>	
													<div class="col-md-2">
														<label>업무 담당자</label> 
														<select class="form-control" name=id required="required">
																<option value="">이름</option>
																<c:forEach var="ml" items="${pmdto}">
																	<option value="${ml.id }">${ml.name }</option>
																</c:forEach>
														</select>
													</div>     
													<div class="col-md-10">
														<label>업무 제목</label> 
														<input type=text class="form-control" id=w_subject name=w_subject placeholder='제목을 입력하세요' size=100 required="required">
													</div>
												</td>
											</tr>
											<tr>
												<td>    
												<div class="col-md-12"><br>    
												<textarea id=w_content name=w_content class="form-control" rows=20 cols=180 placeholder='내용을 입력하세요' required="required" style="resize: none;"></textarea>
												</div>
												</td>
											</tr>
											<tr>                
												<td>   
												<input type=hidden id=pj_num name=pj_num value="${pj_num }">         
												<div class="input-group date col-md-2" style="padding-left: 20px; float: left;">         
													<div class="input-group-addon">
														D-day : <i class="fa fa-calendar"></i> <input type=date id=w_date name=w_date required="required">
													</div>	
												</div>
												<div class="col-md-2" style="float: right; padding-top: 2px;">
												<input type=submit class="btn btn-block btn-danger" value='업무 등록'>
												</div>
												</td>
											</tr>
										</table>
									</div>
								</form>
							</div>
							
							<div id="memberwork" style="display:none;">
								<div id="work" class="box-body" class="memberwork_div">
								<br>
									<table id="memberworkboard" class="table table-condensed">
										<tr>
											<td align="center" width=5%>no.</td>
											<td align="center" width=50%>제목</td>
											<td align="center" width=30%>기한</td>
											<td align="center" width=15%>진척도</td>
										</tr>
									</table>
								</div>
							</div>
							    
							<div id=detail style="display:none;">
								<div id="w_detail" class="box box-body">
									<table id="wd" class="table table-condensed">
										
									</table>
								</div>
							</div>
							
							<div id=editwork style="display:none;">
								<form method=post action='workboard/editwork' name=editwork>
									<table id='editform'>
									
									
										
									</table>
								</form>
							</div>
						</div>
					</div>    
			</section>
		</div>       
	</div>         

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="aside" />
	<tiles:insertDefinition name="footer" />        

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