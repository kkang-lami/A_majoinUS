<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<html>
<head>
<title>수정폼</title>

<script>
function writeSave(){


/* 	if(document.writeform.subject.value==""){
	  alert("제목을 입력하십시요.");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.content.value==""){
	  alert("내용을 입력하십시요.");
	  document.writeform.content.focus();
	  return false;
	} */

}   
		

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
<form method="post" name="writeform" action="update" onsubmit="return writeSave()">
	<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr>
		 <td align="center" width="125" bgcolor="#f1bbba">글번호</td>
	    <td align="center" width="125" align="center"  ></td>
	    <td><input type="text" name="notice_num" value="${notice.notice_num}" readonly="readonly"></td>
		  </tr>
		<tr>
		    <td width="70"  bgcolor="#f1bbba" align="center" >제 목</td>
		    <td align="left" width="330">
		    	<input type="text" size="40" maxlength="50" name="subject" value="${notice.subject}">
		    </td>
		</tr>
		  
		<tr>
		    <td width="70"  bgcolor="#f1bbba" align="center" >내 용</td>
		    <td align="left" width="330">
		    	<textarea name="content" rows="13" cols="40">${notice.content}</textarea>
			</td>
		</tr>
		  
		  
		<tr>     
		   <td colspan=2 bgcolor="#f1bbba" align="center">
				<input type="submit" value="글수정" > 
				<input type="reset" value="재작성">
	     		<input type="button" value="글목록" onclick="document.location.href='notice'">
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