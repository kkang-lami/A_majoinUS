<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>프로젝트 초대/참가 신청</title>
<style>
/* #mdal_b, #mdal_b2{
	display:none;
}
 */
</style>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">

<h2>프로젝트 참가 신청</h2>
<form >
<table width="800">
	
	<c:forEach items="${projectApplyAlarm}" var="projectApplyAlarm">
	
	<tr id="${projectApplyAlarm.pj_num}">
		<td>${projectApplyAlarm.sender}님께서 회원님의 &lt; <a href="#" id="modalbutton" class="Team_btn" data-toggle="modal" data-target="#modal_Team"> ${projectApplyAlarm.pj_name} </a> &gt;프로젝트에  
		${projectApplyAlarm.a_type} 신청을 하셨습니다.	 
 			<a href='accetpMember?pj_num=${projectApplyAlarm.pj_num}&sender=${projectApplyAlarm.sender}&a_type=${projectApplyAlarm.a_type}' > 수락!!!</a>
		</td>    
	</tr>
	</c:forEach>    
</table>
</form>

<h2>프로젝트 초대제안 알림</h2>    
<form action="proposalAccept">
<table width="800">    
	
	<c:forEach items="${projectProposalAlarm}" var="projectProposalAlarm">
	
	<tr id="${projectProposalAlarm.pj_num}">    
		<td>${projectProposalAlarm.sender}님께서 회원님께  &lt; <a href ="#" id="modalbutton" class="Team_btn" data-toggle="modal" data-target="#modal_Team"> ${projectProposalAlarm.pj_name} </a> &gt;프로젝트에  
		${projectProposalAlarm.a_type} 하셨습니다.
		</td>
		<td>
			<a href='proposalAccept?pj_num=${projectProposalAlarm.pj_num}&receiver=${projectProposalAlarm.receiver}' > 수락!!!</a>
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