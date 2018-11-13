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
<title>Insert title here</title>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">

<%
session.setAttribute("Target_ID","aa");
%>
<input type="hidden" name="target_id" id="target_id" value="aa">
<input type="hidden" name="id" id="id" value="aa">

<%-- <c:if test="${sessionScope.id eq 'aa'}"> --%>
<h2>나에 대한 후기</h2>
<table>
	<c:forEach items="${reviewListForMe}" var="reviewListForMe">
	<tr>
		<td>${reviewListForMe.review_content}</td>
	</tr>
	</c:forEach>
</table>
<table>
	<c:forEach items="${reviewListWithName}" var="reviewListWithName">
	<tr>
		<td>${reviewListWithName.pj_name}</td>
		<td>${reviewListWithName.review_content}</td>
	</tr>
	</c:forEach>
</table>

==================================================
<h2>내가 쓴 후기</h2>
<table>
	<c:forEach items="${reviewListByMe}" var="reviewListByMe">
		<tr>
		<tr>
			<td>${reviewListByMe.review_content}</td>
		</tr>
	</c:forEach>
</table>
<%-- </c:if> --%>
</section>
      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />
</body>
</html>