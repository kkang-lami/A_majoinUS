<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<html>
<head>
<style type="text/css">  

 
select {
    width: 150px;  
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
 width: 150px;
 height: 30px;
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

button{
/* position : absolute; */
top:50%;
left:50%;    
transform: translate(-50%,-50%);
  
}            

button{

background:none;
color: black;  
width: 50px;            
height:30px;
border: 1px solid #338033;
font-size: 18px;
border-radius: 4px;
transition:.6s;
overflow: hidden;

}

button:before {
content: '';
display: block;
background: rgba(255,255,255,.5);'\
left: 0;
top: 0;  
opacity: .5s;
filter:blur(30px);
transform:translateX(-130px) skweX(-15deg);
}

button:after {
content: '';
display: block;
background: rgba(255,255,255,.5);'\
left: 30px;  
top: 0;  
opacity: 0;
filter:blur(30px);
transform:translateX(-130px) scaleX(-15deg);

}
      
button:hover {
   background: #338033;
   cursor: pointer;
   
}
button:hover:before {
   transform:translateX(300px) skewX(-15deg);
   opacity: .6s;
   transition: .7s;
}

button:hover:after {
   transform:translateX(300px) skewX(-15deg);
   opacity: 1;
   transition: .7s;
} 
    
    
</style>  
<title>새로운 프로젝트 생성하기</title>
<%
   String cp = request.getContextPath();
   request.setCharacterEncoding("UTF-8");
%>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
   function chk1() {
       var url="<%=cp%>/aus/countTicket";
      //alert(url);
      //alert($("input:checkbox[id='unlimit']").is(":checked"));

      if ($("input:checkbox[id='unlimit']").is(":checked")==true) {
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
                           document.getElementById("inHere").innerHTML = "무기한";

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
         var today = new Date()
         document.form.end_d.disabled = false;
         var v = document.getElementById("end_d");
         v.type = "date";
         v.value = today;

         document.getElementById("inHere").innerHTML = "";
         //document.form.end_d.value = " ";
      }

   }

   function writeFormCheck() {
      var start_d = new Date(document.form.start_d.value);
      var end_d = new Date(document.form.end_d.value);
      var today = new Date();
         
      if (!document.form.pj_name.value) {
         alert("제목을 입력해 주세요!");
         document.form.pj_name.focus();
         return false;
      }

      else if (!document.form.mem_limit.value) {
         alert("프로젝트 멤버 수를 선택해 주세요!");
         document.form.mem_limit.focus();
         return false;
      }
      else if (!document.form.start_d.value || !document.form.end_d.value) {
         alert("프로젝트 기간을 입력해 주세요!");
         document.form.start_d.focus();
         return false;
      }
      else if (start_d<today) {
         alert("프로젝트의 시작일이 오늘보다 이전일 수 없습니다. 오늘 이후의 날짜를 선택해주세요");
         document.form.start_d.focus();
         return false;
      }
      else if (start_d>end_d) {
         alert("시작일이 종료일보다 앞설 수 없습니다");
         document.form.start_d.focus();
         return false;
      }
      else{
         alert("프로젝트의 기간은 수정할 수 없습니다.")
         return true;
      }
   }
       
</script>

</head>

<body>

   <tiles:insertDefinition name="header" />
     
   <div class="content-wrapper">
         <!-- <section class="content-header">
            <h3>Create a new project</h3>
             <ol class="breadcrumb">  
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Project 관리</a></li>  
        <li class="active">Create Project</li>
      </ol>       
         </section>    -->      
    
            
          
        <!-- /.col -->
        <div class="col-md-12">      
          <div class="box box-success">   
            <div class="box-header with-border">
              <h3 class="box-title">&nbsp;Create Project</h3>  
              <div class="box-tools pull-right">  
              </div>  
              <!-- /.box-tools -->  
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-controls">
              </div>
              <div class="table-responsive mailbox-messages">
              
              
               <form name="form" method="post" onsubmit="return writeFormCheck();">
   <table class="table table-hover table-striped">
    
      <tr>
         <td>프로젝트 명 :
         <input type="text" name="pj_name" class="pj_name"id="pj_name" >
         </td>    
      </tr> 
      <tr>
         <td>프로젝트 소개 :
            <textarea name="pj_info" rows="5" cols="30"></textarea>
         </td>    
      </tr>         
      <tr>
         <td>총 인원 :  
            <select name="mem_limit">
                           <option value="" selected>인원 선택</option>
                           <%
                              int i;
                              for (i = 1; i <= 20; i++) {
                           %>
                           <option value="<%=i%>"><%=i%>명
                           </option>
                           <%
                              }
                           %>
                     </select>
         </td>
      </tr>
      
      <tr>
      <td><p>기간 :</p>            
      <p>시작일 : <input type="date" id="start_d" name="start_d"></p>
      <p>종료일 : <input type="date" name="end_d" id="end_d"></p>    
      <p>       
      <div id="inHere" style="display: inline-block;"></div>   
      무기한  :
       <input type="checkbox" name="unlimit" id="unlimit" onClick="chk1();">
      </td>            
      </tr> 
      
      <tr>
         <td>liked_area :
           <select id="local1" class="show-level2"></select>
              <select id="local12" ></select>
              <p><button type="button" value="local" class="add_btn" style=" left: 52%; margin-left: 430px;" >area 추가</button></p>
             </td>                  
      </tr>                           
            
      <tr>
         <td>interest_job :        
           <select id="job1" class="show-level2"></select>          
              <select id="job12" ></select>          
              <p><button type="button" value="job" class="add_btn"  style=" left: 52%; margin-left: 450px;" >job 추가</button></p> 
         </td>                 
      </tr>            
            
      <tr>
         <td> 검색조건   :
            <div title="넘겨질 job과 local" id="hidden"></div>
               <div id="result"></div>     
         </td>    
      </tr> 
      <tr>    
         <td align="center">
            <input type="submit" value="입력" class="btn btn-primary" width="50px"/>
                  <c:if test="{sessionScope.id == id}" />
            <input type="hidden" name="id" value="${sessionScope.id}" />
         </td>  
      </tr>
        
      
      </tbody>
   </table>  
</form>
              </div>  
            </div>
            <div class="box-footer no-padding">
              <div class="mailbox-controls">
                <div class="pull-right">  
                  Inquiry/EunB
                </div>
              </div>
            </div>
          </div>  
        </div>    
      </div>
   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />
   </body>
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
         var sessionid = '${sessionScope.id}';
         return sessionid;
      }
      
      var global = {
             i : 0
      };
                     
      function show_search_tag() {

         var html1 = "<div id='job_list' name='job_list' class='inline'>",
            html2 = "";

         <c:forEach var="item" items="${command.job}">
            html1 += "<div class="gogo" id="+global.i+"  style='display: inline-block;'>${item}<button id="+global.i+" class='del_btn'>x</button></div>";
            html2 += "<input type='hidden' id='"+global.i+"' name='job' value='${item}'>"
            global.i++;
         </c:forEach>

            html1 += "</div><br><div id='local_list' class='inline'>";

         <c:forEach var="item" items="${command.local}" >
            html1 += "<div id="+global.i+">${item}<button 'button' id="+global.i+" class='del_btn'>x</button></div>";
            html2 += "<input type='hidden' id='"+global.i+"' name='local' value='${item}'>"
            global.i++;
         </c:forEach>

            html1 += "</div>";

            $('#result').append(html1);
            $('#hidden').append(html2);
      }
   </script>

</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
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
<title>새로운 프로젝트 생성하기</title>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
   function chk1() {
       var url="<%=cp%>/aus/countTicket";
      //alert(url);
      //alert($("input:checkbox[id='unlimit']").is(":checked"));

      if ($("input:checkbox[id='unlimit']").is(":checked")==true) {
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
                           document.getElementById("inHere").innerHTML = "무기한";

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


      } else {
         var today = new Date()
         document.form.end_d.disabled = false;
         var v = document.getElementById("end_d");
         v.type = "date";
         v.value = today;

         document.getElementById("inHere").innerHTML = "";
         //document.form.end_d.value = " ";
      }

   }

   function writeFormCheck() {
      var start_d = new Date(document.form.start_d.value);
      var end_d = new Date(document.form.end_d.value);
      var today = new Date();
      
      
      var limitD = new Date(document.form.start_d.value);
      limitD=limitD.setMonth(limitD.getMonth() + 3);
   
   if(limitD <end_d){
      alert("프로젝트의 최장 기간은 3개월입니다. 3개월 이상은 티켓을 구입해주세요.")
      return false;
   }
      
      if (!document.form.pj_name.value) {
         alert("제목을 입력해 주세요!");
         document.form.pj_name.focus();
         return false;
      }

      else if (!document.form.mem_limit.value) {
         alert("프로젝트 멤버 수를 선택해 주세요!");
         document.form.mem_limit.focus();
         return false;
      }
      else if (!document.form.start_d.value || !document.form.end_d.value) {
         alert("프로젝트 기간을 입력해 주세요!");
         document.form.start_d.focus();
         return false;
      }
      else if (start_d<today) {
         alert("프로젝트의 시작일이 오늘보다 이전일 수 없습니다. 오늘 이후의 날짜를 선택해주세요");
         document.form.start_d.focus();
         return false;
      }
      else if (start_d>end_d) {
         alert("시작일이 종료일보다 앞설 수 없습니다");
         document.form.start_d.focus();
         return false;
      }
      else{
        var  dateResult = confirm("프로젝트의 기간은 수정할 수 없습니다. 기간을 신중하게 결정해주세요. ")
        if(dateResult)
        	return true;
        else
         return false;
      }
   }
       
</script>

</head>

<body>

	<tiles:insertDefinition name="header" />
	<!-- 전체영역 -->
	<div class="wrapper">
		<!-- 콘텐츠 헤더 -->
		<div class="content-wrapper">
			<section class="content-header">
				<h2>새로운 프로젝트 생성</h2>
			</section>

				<section class="content">
          <div class="box box-success">   
            <div class="box-header with-border">
              <h3 class="box-title">&nbsp;Create Project</h3>  
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
								id="pj_name" size="50" />
								<br></td>
						</tr>

						<tr>
							<th> 프로젝트 소개 </th>
							<td><br><textarea name="pj_info" rows=8 cols=50 style="resize: none;"></textarea></td>
						</tr>
						<tr>
							<th>총원</th>
							<td><select name="mem_limit">
									<option value="" selected>인원 선택</option>
									<%
										int i;
										for (i = 1; i <= 20; i++) {
									%>
									<option value="<%=i%>"><%=i%>명
									</option>
									<%
										}
									%>
							</select></td>
						</tr>
						<tr>
							<th>기간</th>
							<td><br>시작일 : <input type="date" id="start_d" name="start_d"><br>
								<br>종료일 : <input type="date" name="end_d" id="end_d">
								<div id="inHere" style="display: inline-block;"></div> <br>

								<br><input type="checkbox" name="unlimit" id="unlimit" onClick="chk1();">
								무기한<br>
							</td>
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
				<!--		<div class="form-group">
						<label for="job1" class="col-sm-2 control-label">관심분야</label>
						<div class="col-sm-10">
							<select id="job1" class="show-level2"></select> <select
								id="job12"></select>
							<button type="button" value="job" class="add_btn">추가</button>
						</div>
					</div> -->
					
					<!-- 선호지역 -->
					<!-- <div class="form-group">
						<label for="local1" class="col-sm-2 control-label">선호직역</label>
						<div class="col-sm-10">
							<select id="local1" class="show-level2"></select> <select
								id="local12"></select>
							<button type="button" value="local" class="add_btn">추가</button>
						</div>
					</div> -->
					
					<!-- <div title="넘겨질 job과 local" id="hidden" ></div>
					<hr>
					검색조건
					<div id="result" ></div> -->

						<c:if test="{sessionScope.id == userId}" />
					<input type="hidden" name="id" value="${sessionScope.id}" />
					<center><br><br><input type="submit" value="입력" class="submit_btn" /><br><br></center>
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
			var sessionid = '${sessionScope.id}';
			return sessionid;
		}
		
		var global = {
			    i : 0
		};
		               
		function show_search_tag() {

			var html1 = "<div id='job_list' name='job_list' class='inline'>",
				html2 = "";

			<c:forEach var="item" items="${command.job}">
				html1 += "<div class="gogo" id="+global.i+"  style='display: inline-block;'>${item}<button id="+global.i+" class='del_btn'>x</button></div>";
				html2 += "<input type='hidden' id='"+global.i+"' name='job' value='${item}'>"
				global.i++;
			</c:forEach>

				html1 += "</div><br><div id='local_list' class='inline'>";

			<c:forEach var="item" items="${command.local}" >
				html1 += "<div id="+global.i+">${item}<button 'button' id="+global.i+" class='del_btn'>x</button></div>";
				html2 += "<input type='hidden' id='"+global.i+"' name='local' value='${item}'>"
				global.i++;
			</c:forEach>

				html1 += "</div>";

				$('#result').append(html1);
				$('#hidden').append(html2);
		}
	</script>
</body>
</html> 
