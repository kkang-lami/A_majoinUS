<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<title>프로젝트 초대/참가 신청</title>
<script>
function chk(s){
	alert(s);
}
</script>
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
	
	<tr>
		<td>${projectApplyAlarm.sender}님께서 회원님의 &lt; <a href ="projectContent?pj_num=${projectApplyAlarm.pj_num}"> ${projectApplyAlarm.pj_name} </a> &gt;프로젝트에  
		${projectApplyAlarm.a_type} 신청을 하셨습니다.
			<input type="hidden" name="pj_num" value="${projectApplyAlarm.pj_num}" />
			<input type="hidden" name="sender" value="${projectApplyAlarm.sender}" />
			<input type="hidden" name="a_type" value="${projectApplyAlarm.a_type}" />
			
 			<!--<button type="submit">수락 </button> action 지정해주기 -->
			<%-- <button onclick="location.href='accetpMember?pj_num=${projectApplyAlarm.pj_num}'" > 수락!!!</button>--%> 			
 			
 			<a href='accetpMember?pj_num=${projectApplyAlarm.pj_num}&sender=${projectApplyAlarm.sender}&a_type=${projectApplyAlarm.a_type}'" > 수락!!!</a>
 			<!-- 저어의 역량 부족으로 버트으로 수락 버튼은 쓰루,, -->
 			<button onclick = "chk('${projectApplyAlarm.pj_num}') ">pj_Num</button>
 			<button onclick = "chk('${projectApplyAlarm.sender}') ">sender</button>
		</td>
	</tr>
	</c:forEach>
</table>
</form>

<h2>프로젝트 초대제안 알림</h2>
<form action="proposalAccept">
<table width="800">
	
	<c:forEach items="${projectProposalAlarm}" var="projectProposalAlarm">
	
	<tr>
		<td>${projectProposalAlarm.sender}님께서 회원님께  &lt; <a href ="projectContent?pj_num=${projectProposalAlarm.pj_num}"> ${projectProposalAlarm.pj_name} </a> &gt;프로젝트에  
		${projectProposalAlarm.a_type} 하셨습니다.</td>
		<td>
			<input type="hidden" name="pj_num" value="${projectProposalAlarm.pj_num}" />
			<input type="hidden" name="receiver" value="aa" />
			<!-- sessionScope.id -->
			
			<a href='proposalAccept?pj_num=${projectProposalAlarm.pj_num}&receiver=aa@gmail.com'" > 수락!!!</a>
		</td>
	</tr>
	</c:forEach>
</table>
</form>
</section>
      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />
</body>
</html>