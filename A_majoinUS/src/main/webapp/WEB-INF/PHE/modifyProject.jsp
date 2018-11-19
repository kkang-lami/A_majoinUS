<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
           
	
<!DOCTYPE html>
<html>
<head>
<title>프로젝트 수정하기</title>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function chk1() {
	    var url="<%=cp%>/aus/countTicket";
	    var v = document.getElementById("end_d");
		var endD=v.value;
		
		//alert($("input:checkbox[id='unlimit']").is(":checked"));

		if ($("input:checkbox[id='unlimit']").is(":checked")== true) {
			$.ajax({
						type : "post",
						url : url,
						dataType : "json",
						success : function(args) {
							console.log("티켓개수" + args.ticket);

							if (args.ticket === 0) {
								alert("보유하고 있는 티켓이 없습니다.티켓을 먼저 구매하시고 이용해주세요");
								document.form.unlimit.checked = false;
							} else {
								var result = confirm("보유중인 티켓은 <" + args.ticket + "> 장입니다. 사용하시겠습니까?");
								if (result) {
									var v = document.getElementById("end_d");
									v.type = "hidden";
									v.value = "2099-12-31";
									document.getElementById("end").innerHTML = "무기한";

								} else {
									alert("티켓 사용을 취소합니다.")
									document.form.unlimit.checked = false;
								}
							}

						},
						error : function(e) {
							alert(e.responseText);
						}
					});

			// 체크박스 체크하면 에러

		} else {
			
			alert("티켓사용을 취소합니다.");
			document.form.end_d.disabled = false;
			var v = document.getElementById("end_d");
			var v2 = document.getElementById("end2");
			// 값 바꾸기
			v.value = v2.value;

			//출력
			document.getElementById("end").innerHTML = v2.value;
			
			//document.form.end_d.value = " ";
		}

	}
</script>


<script type="text/javascript">
	function writeFormCheck() {
		var today = new Date();
		
		if (!document.form.pj_name.value) {
			alert("제목을 입력해 주세요!");
			document.form.pj_name.focus();
			return false;
		}

		if (!document.form.mem_limit.value) {
			alert("프로젝트 멤버 수를 선택해 주세요!");
			document.form.mem_limit.focus();
			return false;
		}

		
		if (!document.form.pj_cate.value) {
			alert("관심 분야를 입력해 주세요!");
			document.form.pj_cate.focus();
			return false;
		}
		if (!document.form.pj_loc.value) {
			alert("선호 지역을 입력해 주세요!");
			document.form.pj_loc.focus();
			return false;
		}
		
		return true;
	}
</script>


</head>

<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">



				<h2>프로젝트 수정</h2>
			</section>

				<section class="content">
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="box box-info">

<form name="form" method="post" onSubmit="return writeFormCheck()">
<br>
<br>
<br>
	<table width="1000">
	<tr>
		<td>프로젝트명 : </td>
		<td><input type="text" name="pj_name" class="pj_name" id="pj_name" size="50"  value="${command1.pj_name}"/> </td> 
	</tr>
			
	<tr>
		<td><br>프로젝트소개 : </td>
		<td><br><br><textarea name="pj_info" rows=8 cols=50 style="resize: none;">${command1.pj_info}</textarea></td>
	</tr>
	<tr>
		<td> <br>총원: </td>
		<td>
			<br>
			<select name="mem_limit">
				<option value="" >인원 선택 </option>
				<c:set value="${command1.mem_limit}" var = "memLimit"/>

				<%
					int i;
					for(i=1; i<=20; i++){
				%>
				
				<c:set value="<%=i%>" var = "memLimit"/>
				 <c:if test="${command1.mem_limit == memLimit}"> 
					<option value="${command1.mem_limit}"  selected>${command1.mem_limit}명 </option>
					<%i++; %>
				</c:if>
				<option value="<%=i%>" ><%=i%>명 </option>
				
				<% } %>
			</select>
			
		</td>                                 
	</tr>
	<tr>
		<td> <br>기간 :</td>
		
		<td> <br>
			시작일 : <div id="start" name="start" value="${date.START_D}" style="display: inline-block;"> ${date.START_D}</div><input type="hidden" id="start_d" name="start_d" value="${date.START_D}"><br>
		 	<br>
		 	종료일 :  
		<c:choose>
			<c:when test="${date.END_D eq '2099-12-31'}">
				무기한 
				
				<input type="hidden" id="end_d" name="end_d" value="${date.END_D}"><br>
					
				<br>
    		</c:when>

			<c:otherwise>
				<div id="end" name="end"  style="display: inline-block;"> ${date.END_D}</div>
				<input type="hidden" id="end_d" name="end_d" value="${date.END_D}">
				<input type="hidden" id="end2" name="end2" value="${date.END_D}">
				<br><input type="checkbox" name="unlimit" id="unlimit" onClick="chk1();"> 무기한
				
			</c:otherwise>		
		</c:choose> 
		
		
			
	</tr>		
				
	<tr>
		<td> <br>관심분야 : </td>
		<td> <br><input type="text" name="pj_cate" size="10" value="${command2.pj_cate}"></td>
	</tr>
	<tr>
		<td> <br>선호지역 : </td>
		<td> <br><input type="text" name="pj_loc" size="10" value="${command3.pj_loc}"> </td>
	</table>
	<!-- 관심직종 -->
		<div class="form-group">
			<label for="job1" class="col-sm-2 control-label">관심분야</label>
			<div class="col-sm-10">
				<select id="job1" class="show-level2"></select> <select
					id="job12"></select>
				<button type="button" value="job" class="add_btn">추가</button>
			</div>
		</div>
		
		<!-- 선호지역 -->
		<div class="form-group">
			<label for="local1" class="col-sm-2 control-label">선호직역</label>
			<div class="col-sm-10">
				<select id="local1" class="show-level2"></select> <select
					id="local12"></select>
				<button type="button" value="local" class="add_btn">추가</button>
			</div>
		</div>
		
		<div title="넘겨질 job과 local" id="hidden" ></div>
		<hr>
		검색조건
		<div id="result" ></div>
	
	<br><br><br>
	<input type="submit" value="입력" class="btn btn-primary"><br><br><br>
		<c:if test="{sessionScope.id == userId}" />
	<input type="hidden" name="id" value="${sessionScope.id}"/>
</form>
</div></div></div>
			</section>
		</div>
	</div>
	

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />
   	<script src="<%=request.getContextPath()%>/resources/LSH/JS/category.js"></script>
	<script>
		$(document).ready(initPage);
		
		function initPage() {
			level1();
			show_search_tag();
		}
		
		function getPageNum(){
			var pageNum = $('.pagination .active').attr('id');
			return (pageNum === undefined)? 1 : pageNum;
		}
		
		function getContext(){
			var context = "<%=cp%>";
			return context;
		}

		function getSessionId(){
			var sessionid = '${sessionScope.userId}';
			return sessionid;
		}
		
		var global = {
			    i : 0
		};
		               
		function show_search_tag() {

			var html1 = "<div id='job_list' name='job_list' class='inline'>",
				html2 = "";
			
			<c:forEach var="item" items="${command2}">
				html1 += "<div  id="+global.i+"  style='display: inline-block;'>${item.pj_cate}<button id="+global.i+" class='del_btn'>x</button></div>";
				html2 += "<input type='hidden' id='"+global.i+"' name='job' value='${item.pj_cate}'> <input type='hidden' name='pjj_num' value='${item.pjj_num}'>"
				global.i++;
			</c:forEach>
				html1 += "</div><br><div id='local_list' class='inline'>";
			
				<c:forEach var="item" items="${command3}" >
					html1 += "<div id="+global.i+">${item.pj_loc}<button 'button' id="+global.i+" class='del_btn'>x</button></div>";
					html2 += "<input type='hidden' id='"+global.i+"' name='local' value='${item.pj_loc}'> <input type='hidden' name='pjl_num' value='${item.pjl_num}'>"
					global.i++;
				</c:forEach>
				html1 += "</div>";

				$('#result').append(html1);
				$('#hidden').append(html2);
		}
	</script>
   
</body>
</html>
 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
           
	
<!DOCTYPE html>
<html>
<head>
<title>프로젝트 수정하기</title>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<style type="text/css">  

 
select {
   width: 100px;  
    height: 30px;
    padding-left: 10px;
    font-size: 18px;  
    color: black;    
    border: 1px solid #338033;
    border-radius: 3px;
    -webkit-appearance: none;   
   -moz-appearance: none;     
   appearance: none;  
   background: url('select-arrow.png') no-repeat 95% 50%; 
   font: 300 18px/1.5 'Roboto', sans-serif;      
}  

select::-ms-expand {
   display: none;         
   border: 1px dashed #D0CBCB;  
   cursor: pointer;
}

select option:checked, 
select option:hover {    
    background: #2E2E2E;     
    color: #fff;  
    cursor: pointer;
}

select option:checked,
select option:hover { 
    box-shadow: 0 0 15px 100px #ff00ff inset;  
    color: #fff;
    cursor: pointer;
}
 
 
   
 input{
 
 background: none;
 color: #ccc;
 /* width: 150px;
 height: 30px; */
 border: 1px solid #338033;
 font-size: 18px;
 border-radius: 4px;
 transition: .6s;
 overflow: hidden;
 }
         
 
   input:hover{
background: #338033;
cursor: pointer;
color: white;
  
}
   
   
 input:hover:before {
transform: translateX(300px) skewX(-15deg);
opacity: .6;
transition:.7s;   
}
 
 input:hover:after {
transform: translateX(300px) skewX(-15deg);
opacity: 1;
transition:.7s;   
}  

 textarea{
 
 background: none;
 color: #ccc;
 border: 1px solid #338033;
 font-size: 18px;
 border-radius: 4px;
 transition: .6s;
 overflow: hidden;
 }    
         
   
textarea:hover{
background: #338033;
cursor: pointer;
color: white;
  
}  

select:hover{
background: #338033;
cursor: pointer;
color: white;
}
   
   
 textarea:hover:before {
transform: translateX(300px) skewX(-15deg);
opacity: .6;
transition:.7s;   
}
       
 textarea:hover:after {
transform: translateX(300px) skewX(-15deg);
opacity: 1;
transition:.7s;   
}   

    
  th{
  	text-align:center !important;
  }
  
  .add_btn{
   background: #338033;
   color:white;
     border-radius: 3px;
  }
  .del_btn{
     background: #338033;
   color:white;
     border-radius: 3px;
  }
  
 
  
  .submit_btn{
  	background: #338033;
   	color:white;
   	font-weight:bold;
   	width:60pt;
   	
   
  }
  
  span{
  	    margin-right: 8px;
  }
</style>  
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function chk1() {
	    var url="<%=cp%>/aus/countTicket";
	    var v = document.getElementById("end_d");
		var endD=v.value;
		
		//alert($("input:checkbox[id='unlimit']").is(":checked"));

		if ($("input:checkbox[id='unlimit']").is(":checked")== true) {
			$.ajax({
						type : "post",
						url : url,
						dataType : "json",
						success : function(args) {
							console.log("티켓개수" + args.ticket);

							if (args.ticket === 0) {
								alert("보유하고 있는 티켓이 없습니다.티켓을 먼저 구매하시고 이용해주세요");
								document.form.unlimit.checked = false;
							} else {
								var result = confirm("보유중인 티켓은 <" + args.ticket + "> 장입니다. 사용하시겠습니까?");
								if (result) {
									var v = document.getElementById("end_d");
									v.type = "hidden";
									v.value = "2099-12-31";
									document.getElementById("end").innerHTML = "무기한";

								} else {
									alert("티켓 사용을 취소합니다.")
									document.form.unlimit.checked = false;
								}
							}

						},
						error : function(e) {
							alert(e.responseText);
						}
					});

			// 체크박스 체크하면 에러

		} else {
			
			alert("티켓사용을 취소합니다.");
			document.form.end_d.disabled = false;
			var v = document.getElementById("end_d");
			var v2 = document.getElementById("end2");
			// 값 바꾸기
			v.value = v2.value;

			//출력
			document.getElementById("end").innerHTML = v2.value;
			
			//document.form.end_d.value = " ";
		}

	}
</script>


<script type="text/javascript">
	function writeFormCheck() {
		var today = new Date();
		
		if (!document.form.pj_name.value) {
			alert("제목을 입력해 주세요!");
			document.form.pj_name.focus();
			return false;
		}

		if (!document.form.mem_limit.value) {
			alert("프로젝트 멤버 수를 선택해 주세요!");
			document.form.mem_limit.focus();
			return false;
		}

		
		if (!document.form.pj_cate.value) {
			alert("관심 분야를 입력해 주세요!");
			document.form.pj_cate.focus();
			return false;
		}
		if (!document.form.pj_loc.value) {
			alert("선호 지역을 입력해 주세요!");
			document.form.pj_loc.focus();
			return false;
		}
		
		return true;
	}
</script>


</head>

<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">
				<h2>프로젝트 수정</h2>
			</section>

				<section class="content">
					 <div class="box box-success">   
            <div class="box-header with-border">
              <h3 class="box-title">&nbsp;Modify Project</h3>  
              <div class="box-tools pull-right">  
              </div>  
              <!-- /.box-tools -->  
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-controls">
              </div>
              <div class="table-responsive mailbox-messages">
              
<form name="form" method="post" onSubmit="return writeFormCheck()">

	<table class="table table-hover table-striped">
						<tr>
							<th>프로젝트명 </th>                               
							<td><input type="text" name="pj_name" class="pj_name"
								id="pj_name" size="50" value="${command1.pj_name}" />
								<br></td>
						</tr>
		
		<tr>
							<th> 프로젝트 소개 </th>
							<td><br><textarea name="pj_info" rows=8 cols=50 style="resize: none;"> ${command1.pj_info}</textarea></td>
						</tr>
						<tr>	
	<tr>
		<th>총원: </th>
		<td>
			<select name="mem_limit">
				<option value="" >인원 선택 </option>
				<c:set value="${command1.mem_limit}" var = "memLimit"/>

				<%
					int i;
					for(i=1; i<=20; i++){
				%>
				
				<c:set value="<%=i%>" var = "memLimit"/>
				 <c:if test="${command1.mem_limit == memLimit}"> 
					<option value="${command1.mem_limit}"  selected>${command1.mem_limit}명 </option>
					<%i++; %>
				</c:if>
				<option value="<%=i%>" ><%=i%>명 </option>
				
				<% } %>
			</select>
			
		</td>                                 
	</tr>
	<tr>
		<th>기간  </th>
		
		<td>
			시작일 : <div id="start" name="start"  style="display: inline-block;"> ${date.START_D}</div><%-- <input type="hidden" id="start_d" name="start_d" value="${date.START_D}"> --%><br>
		 	<br>
		 	종료일 :  
		<c:choose>
			<c:when test="${date.END_D eq '2099-12-31'}">
				무기한 
				
				<input type="hidden" id="end_d" name="end_d" value="${date.END_D}"><br>
					
				<br>
    		</c:when>

			<c:otherwise>
				<div id="end" name="end"  style="display: inline-block;"> ${date.END_D}</div>
				<input type="hidden" id="end_d" name="end_d" value="${date.END_D}">
				<input type="hidden" id="end2" name="end2" value="${date.END_D}">
				<br><input type="checkbox" name="unlimit" id="unlimit" onClick="chk1();"> 무기한
				
			</c:otherwise>		
		</c:choose> 
		
		
			
	</tr>	
	
	<tr>
							<th>관심 직종 </th>
							 <td><select id="job1" class="show-level2"></select>          
              						<select id="job12" ></select> 
              						<button type="button" value="job" class="add_btn"   > +job 추가</button>
							</td>
						</tr>	
				<tr>
							<th>선호 지역  </th>
							 <td><select id="local1" class="show-level2"></select> 
							 		<select id="local12"></select>
									<button type="button" value="local" class="add_btn"> + location 추가</button>
							</td>
						</tr>
						
						<tr>
         					<th> 검색조건   </th>
         					<td>
				            	<div title="넘겨질 job과 local" id="hidden"></div>
				               	<div id="result"></div>     
				         	</td>    
				      </tr> 

	</table>
	<!-- 관심직종 -->
		<!-- <div class="form-group">
			<label for="job1" class="col-sm-2 control-label">관심분야</label>
			<div class="col-sm-10">
				<select id="job1" class="show-level2"></select> <select
					id="job12"></select>
				<button type="button" value="job" class="add_btn">추가</button>
			</div>
		</div>
		
		선호지역
		<div class="form-group">
			<label for="local1" class="col-sm-2 control-label">선호직역</label>
			<div class="col-sm-10">
				<select id="local1" class="show-level2"></select> <select
					id="local12"></select>
				<button type="button" value="local" class="add_btn">추가</button>
			</div>
		</div>
		
		<div title="넘겨질 job과 local" id="hidden" ></div>
		<hr>
		검색조건
		<div id="result" ></div> -->
	
	<br><br><br><center>
	<input type="submit" value="입력" class="submit_btn"></center><br><br><br>
	<%-- 	<c:if test="{sessionScope.id == userId}" /> --%>
	<input type="hidden" name="id" value="${sessionScope.id}"/>
</form>
</div></div></div>
			</section>
		</div>
	</div>
	

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />
   	<script src="<%=request.getContextPath()%>/resources/LSH/JS/category.js"></script>
	<script>
		$(document).ready(initPage);
		
		function initPage() {
			level1();
			show_search_tag();
		}
		
		function getPageNum(){
			var pageNum = $('.pagination .active').attr('id');
			return (pageNum === undefined)? 1 : pageNum;
		}
		
		function getContext(){
			var context = "<%=cp%>";
			return context;
		}

		function getSessionId(){
			var sessionid = '${sessionScope.userId}';
			return sessionid;
		}
		
		var global = {
			    i : 0
		};
		               
		function show_search_tag() {

			var html1 = "<div id='job_list' name='job_list' class='inline'>",
				html2 = "";
			
			<c:forEach var="item" items="${command2}">
				html1 += "<div  id="+global.i+"  >${item.pj_cate}<button id="+global.i+" class='del_btn'>x</button></div>";
				html2 += "<input type='hidden' id='"+global.i+"' name='job' value='${item.pj_cate}'> <input type='hidden' name='pjj_num' value='${item.pjj_num}'>"
				global.i++;
			</c:forEach>
				html1 += "</div><br><div id='local_list' class='inline'>";
			
				<c:forEach var="item" items="${command3}" >
					html1 += "<div id="+global.i+">${item.pj_loc}<button 'button' id="+global.i+" class='del_btn'>x</button></div>";
					html2 += "<input type='hidden' id='"+global.i+"' name='local' value='${item.pj_loc}'> <input type='hidden' name='pjl_num' value='${item.pjl_num}'>"
					global.i++;
				</c:forEach>
				html1 += "</div>";

				$('#result').append(html1);
				$('#hidden').append(html2);
		}
	</script>
   
</body>
</html>

 