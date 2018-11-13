<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<title>상세보기</title>
</head>
<tiles:insertDefinition name="header" />

<br>
<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
<form>

	<table width="500" border="1" cellspacing="0" cellpadding="0" align="center"> 
	  <tr height="30">
	    <td align="center" width="125">글번호</td>
	    <td align="center" width="125" align="center">${inquiry.i_num}</td>
	  </tr>
	  
 	  <tr height="30">
	    <td align="center" width="125" >작성일</td>
	    <td align="center" width="125" align="center">${inquiry.i_date}</td>
	  </tr>
	  
	 <tr height="30">
	    <td align="center" width="125" >상태</td>
	    <td align="center" width="125" align="center">${inquiry.i_state}</td>
	  </tr> 
	  
	  <tr height="30">
	    <td align="center" width="125" >글제목</td>
	    <td align="center" width="375" align="center" colspan="3">${inquiry.i_subject}</td>
	  </tr>
	  
	  <tr height="200">
	    <td align="center" width="125" >글내용</td>
	    <td align="left" width="375" colspan="3">${inquiry.i_content}</td>
	  </tr>
	 

	 
	 
 	  <tr height="30">     
	    <td colspan="4"  align="right" >
	    
	    
	 <%--   <c:if test="${!empty sessionScope.id}">
			<c:if test="${sessionScope.id eq 'amajoinus@gmail.com'}"> --%>
	  <input type="button" value="글수정"
  	       onclick="document.location.href='in_update?num=${inquiry.i_num}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	 <%--    </c:if>  
	   </c:if>    --%>  
	     
	       <input type="button" value="글목록"
	       onclick="history.back()">
	       
	    </td>
	  </tr> 
	</table>   
</form> 
			</section>
		</div>
	</div>
	</body>
<tiles:insertDefinition name="left" />
<tiles:insertDefinition name="footer" />


</html>