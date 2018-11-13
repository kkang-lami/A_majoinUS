<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolioContent</title>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">

<table  width=600  height=300>

<tr><td>포트폴리오 제목 </td> <td> ${portfolioContent.subject} <br> </td></tr>
<tr><td>구현 기능 </td> <td> ${portfolioContent.tech_info} <br></td></tr>
<tr><td> 기간</td> 
<td>
	<fmt:parseDate value="${portfolioContent.start_d}" var="start" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	<fmt:formatDate value="${start}" pattern="yy/MM/dd"/> 
	~ 
	<fmt:parseDate value="${portfolioContent.end_d}" var="end" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	<fmt:formatDate value="${end}" pattern="yy/MM/dd"/>
<br></td></tr>
<c:forEach items="${portfolioContent_detail}" var="portfolioContent_detail">
<tr>
	<td>주요 코드 및 화면 캡처 </td>
	<td><img src="${portfolioContent_detail.pd_img}" /></td>
</tr>
<tr>
	<td>description</td>
	<td>${portfolioContent_detail.pd_content}</td>
</tr>
</c:forEach>
<tr>
	<td>공개여부 </td>
	<td>${portfolioContent.p_private} </td>
</tr>
<tr>
	<td>첨부파일  </td>

	<td><a href="download?file_path=${portfolioContent.file_path}">${portfolioContent.file_path}</a> </td>
</tr>


</table> 
</section>
      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />
</body>
</html>