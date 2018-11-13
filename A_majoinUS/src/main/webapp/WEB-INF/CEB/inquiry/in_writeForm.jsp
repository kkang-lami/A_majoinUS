<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<html>
<head>
<title>게시판</title>
<script>
	function writeSave(){
		
	   if(document.writeform.writer.value==""){
			  alert("작성자를 입력하십시요.");
			  document.writeform.writer.focus();
			  return false;
			}
	
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

	}   

</script>
</head>
<tiles:insertDefinition name="header" />
<body>
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
<div align="center">
	<b>글쓰기</b>
</div>
<br>
	<form:form commandName="inqury" method="post" name="writeform" >
	<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td align="right" colspan="2" >
				<a href="inquiry">글목록</a>
			</td>
		</tr>
		<tr>
			<td width="70"  align="center">이름</td>
			<td width="330">
				<input type="text" name="id" value="1@gmail.com" readonly><form:errors path="id" />
			</td>
		</tr>
		<tr>
			<td width="70" bgcolor="#f1bbba" align="center">제목</td>
			<td width="330">
				<input type="text" size="40" maxlength="50" name="i_subject"><form:errors path="subject" />			
			</td>
		</tr>
		<tr>
			<td width="70" bgcolor="#f1bbba" align="center">내용</td>
			<td width="330">
				<textarea name="i_content" rows="13" cols="40"></textarea><form:errors path="content" />
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2" >
				<input type="submit" value="글쓰기">
				<input type="reset" value="재작성">
				<input type="button" value="글목록" onclick="window.location='inquiry'">
			</td>
		</tr>
	</table>
</form:form>
			</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</body>
</html>