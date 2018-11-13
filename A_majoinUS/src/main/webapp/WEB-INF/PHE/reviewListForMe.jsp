<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<title>나에 대한 후기</title>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">

<h2>나에 대한 후기</h2>

<table width="500">
	<tr>
		<td>프로젝트 이름</td>
		<td>후기 내용</td>
		<td>평점</td>
	</tr>
	<c:forEach items="${reviewListForMe}" var="reviewListForMe">
	
	<tr>
		<td>${reviewListForMe.pj_name}</td>
		<td>${reviewListForMe.review_content}</td>
		<td>${reviewListForMe.score}</td>
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