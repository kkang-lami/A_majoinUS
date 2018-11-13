<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<html>
<head>
<title>글삭제</title>
</head>
  
<body>
<tiles:insertDefinition name="header" />
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
 <form name="modify" action="qna_delete" method="post" >
 <table width="400" border="1" cellspacing="0" cellpadding="0" align="center"> 
   <tr height="30">
		<td>
		<input type="hidden" name="num" value="${num }" >
		<input type="submit"  value="삭제" id= "delete">
		
		<%-- 
	 	<c:if test="${!empty sessionScope.id}">
			<c:if test="${sessionScope.id eq 'amajoinus@gmail.com'}"> 
				<input type="button" value="수정" onclick="doAction(0)">
				<input type="button" value="삭제" onclick="doAction(1)">
		 	</c:if>  
		</c:if> 
	    --%>
	    
	   <input type="button" value="글목록"
			onclick="document.location.href='qna'"></td>
	   
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