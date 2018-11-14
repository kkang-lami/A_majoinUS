<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<title>프로젝트 초대/참가 신청</title>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!-- autocomplete from jQuery Ui -->
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	
    
<script>
function chk(s){
	alert(s);
}

function surak(obj){
    var url="<%=cp%>/aus/proposalAccept";
    var pj_num = $(obj).attr('id');
    var params = "pj_num="+pj_num;
      $.ajax({
       type:"post",
       url:url,
       data: params,
       dataType: "text",
       success:function(args){
			if(args === "register"){
				alert("멤버 등록이 완료되었습니다.");
				var detail = $(obj).parent().parent();
			    detail.remove(); 
			}
			else if(args === "already"){
				alert("이미 참여중입니다.");
				var detail = $(obj).parent().parent();
		    	detail.remove(); 
			}
			else{
				alert("인원이 꽉 찬 프로젝트입니다.");
			//location.reload();
			}
       },
       error:function(e){
          alert(e.responseText);
       }
    });
      
 };
 
 function surak2(obj){
	 	var pj_num = $(obj).attr('id');
	 	var sender = $(obj).attr('class');
	 	
	    var url="<%=cp%>/aus/acceptMember";
	    var params = "pj_num="+pj_num+"&sender="+sender;
	      $.ajax({
	       type:"post",
	       url:url,
	       data: params,
	       dataType: "text",
	       success:function(args){
				if(args === "register"){
					alert("멤버 등록이 완료되었습니다.");
					var detail = $(obj).parent().parent();
				    detail.remove(); 
				}
				else if(args === "already"){
					alert("이미 참여중인 회원입니다.");
					 var detail = $(obj).parent().parent();
				     detail.remove(); 
				}
				else{
					alert("인원이 꽉 찬 프로젝트입니다.");
				//location.reload();
				}  
	       },
	       error:function(e){
	          alert(e.responseText);
	       }
	    });
	      
	 };

</script>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">

<h2>프로젝트 참가 신청</h2>

<form>
<table width="800">
	
	<c:forEach items="${projectApplyAlarm}" var="projectApplyAlarm">
	<tr id="${projectApplyAlarm.pj_num}">
		<td>${projectApplyAlarm.sender}님께서 회원님의 &lt; <a href="#" id="modalbutton" class="Team_btn" data-toggle="modal" data-target="#modal_Team"> ${projectApplyAlarm.pj_name} </a> &gt;프로젝트에  
		${projectApplyAlarm.a_type} 신청을 하셨습니다.
			<input type="hidden" id="pj_num" name="pj_num" value="${projectApplyAlarm.pj_num}" />
			<input type="hidden" id="sender" name="sender" value="${projectApplyAlarm.sender}" />
 			
 			<input type="button" id="${projectApplyAlarm.pj_num}" class="${projectApplyAlarm.sender}" onclick = "surak2(this)" value="수락"> 
 			<button onclick = "refuse2('${projectApplyAlarm.pj_num}','${projectApplyAlarm.sender}')">거절</button>
 			
		</td>
	</tr>
	</c:forEach>
</table>
</form>



<h2>프로젝트 초대제안 알림</h2>

<form><!--  action="proposalAccept"> -->
<table width="800">
	
	<c:forEach items="${projectProposalAlarm}" var="projectProposalAlarm">
	
	<tr id="${projectProposalAlarm.pj_num}">
		<td>${projectProposalAlarm.name} (${projectProposalAlarm.sender})님께서 회원님께  &lt; <a href ="#" id="modalbutton" class="Team_btn" data-toggle="modal" data-target="#modal_Team"> ${projectProposalAlarm.pj_name} </a> &gt;프로젝트에  
		${projectProposalAlarm.a_type} 하셨습니다.</td>
		<td>
			<input type="hidden" name="pj_num"  id="pj_num" value="${projectProposalAlarm.pj_num}" />
			
			<input type="button" id="${projectProposalAlarm.pj_num}"  onclick = "surak(this) " value="수락" > 
			<button onclick = "refuse('${projectProposalAlarm.pj_num}') "> 거절(NotYet) </button>
		</td>
	</tr>
	</c:forEach>
	
</table>
</form>


</section>

		<!-- 프로젝트룸 모달 -->
       	<c:import url="${cp}/resources/LSH/Modal/Team.jsp"/>
       	
      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />
   

	<script>
		var global = {
			    i : 0,
			    origin_d : "",
			    receiver : "",
			    pj_num: 0
		};
		
		function getContext(){
			var context = "<%=cp%>";
			return context;
		}
    
		function getSessionId(){    
			var sessionid = '${sessionScope.id}';
			return sessionid;
		}         
		
    	</script>
	   
  	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Team.js"></script>
	<script>
		function chk(s){
			alert(s);
		}
	</script>

</body>
</html>