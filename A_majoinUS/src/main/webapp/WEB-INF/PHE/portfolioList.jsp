<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
 

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 포트폴리오</title>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">

<h2>나의 포트폴리오 </h2>
<script>
function chk(s){
	alert(s);
}
</script>
<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>포트폴리오 제목  </td>
		<td>프로젝트 기간 </td>
		
	<tr>
	<c:forEach items="${portfolioList}" var="portfolioList">
	<tr>
		<td><a href="portfolioContent?port_num=${portfolioList.port_num}">${portfolioList.subject}</a></td>
		<td>
			<fmt:parseDate value="${portfolioList.start_d}" var="start" pattern="yyyy-MM-dd HH:mm:ss.S"/>
			<fmt:formatDate value="${start}" pattern="yyyy/MM/dd"/> ~ 
			<fmt:parseDate value="${portfolioList.end_d}" var="end" pattern="yyyy-MM-dd HH:mm:ss.S"/>
			<fmt:formatDate value="${end}" pattern="yyyy/MM/dd"/>
		
		</td>
		<td><input type="button" value="수정하기" onclick = "location.href='portfolio/edit?port_num=${portfolioList.port_num}' "></td>
	</tr>
	</c:forEach>    
</table>
		
 </section>
      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />
</body>
</html>
