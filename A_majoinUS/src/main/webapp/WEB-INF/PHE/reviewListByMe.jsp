<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<% request.setCharacterEncoding("UTF-8");%>

<%-- <%
String id = request.getParameter("id");// request에서 id 파라미터를 가져온다
//String passwd = request.getParameter("passwd");// request에서 passwd 파라미터를 가져온다.

session.setAttribute("id", "aa"); // 세션에 "id" 이름으로 id 등록
session.setAttribute("target_id", "aa"); // 세션에 "id" 이름으로 id 등록
%> --%>



<!DOCTYPE html>
<html>
<head>
<title>내가 쓴 후기</title>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">


==================================================
<h2>내가 쓴 후기</h2>
<center>
<table width="500">
	<tr>
		<td> 평가 대상 </td>
		<td>프로젝트 이름</td>
		<td>후기 내용</td>
		<td>평점</td>
	</tr>
	<c:forEach items="${reviewListByMe}" var="reviewListByMe">
	<tr>
		<td>${reviewListByMe.name}</td>
		<td>${reviewListByMe.pj_name}</td>
		<td>${reviewListByMe.review_content}</td>
		<td>${reviewListByMe.score}</td>
		
	</tr>
	</c:forEach>
</table>
</center>
</section>
      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />
</body>
</html>