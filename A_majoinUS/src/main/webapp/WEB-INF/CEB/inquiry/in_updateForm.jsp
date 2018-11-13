<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<html>
<head>
<title>관리자 업데이트</title>

<script>
function writeSave(){

/* 
 	if(document.writeform.subject.value==""){
	  alert("제목을 입력하십시요.");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.content.value==""){
	  alert("내용을 입력하십시요.");
	  document.writeform.content.focus();
	  return false;
	} 

}   */ 
		

</script>
</head>

<body>
	<tiles:insertDefinition name="header" />
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
<div align="center">
	<b>글수정</b>  
</div>
<br>
<form method="post" name="writeform" action="in_update" onsubmit="return writeSave()">
	<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td width="70"  align="center">이름</td>
			<td width="330">
				<input type="text" name="id" value="1@gmail.com" readonly>
			</td>  
		</tr>           
		
		
		<tr>
	    <td align="center" width="125" align="center"  >글번호</td>
	    <td><input type="text" name="i_num" value="${inquiry.i_num}" readonly="readonly"></td>
		  </tr>
		  
		  <tr>
	    <td align="center" width="125" align="center"  >글 상태</td>
	    <td><input type="text" name="i_state" value="${inquiry.i_state}" readonly="readonly"></td>
	    </tr>
		<tr>
		    <td width="70"   align="center" >제 목</td>
		    <td align="left" width="330">
		    	<input type="text" size="40" maxlength="50" name="i_subject" value="RE : ${inquiry.i_subject}" >
		    </td>
		</tr>
		<tr>
		    <td width="70"   align="center" >내 용</td>
		    <td align="left" width="330">
		    	<textarea name="i_content" rows="13" cols="40">${inquiry.i_content} 

RE :</textarea>
			</td>
		</tr>  

		<tr>     
		   <td colspan=2  align="center">
				<input type="submit" value="글수정" > 
				<input type="reset" value="재작성">
	     		<input type="button" value="글목록" onclick="document.location.href='inquiry'">
		   </td>
		</tr>
	</table>
</form>

		
			</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</body>
</html>