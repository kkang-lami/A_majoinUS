<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("euc-kr");
	String name=request.getParameter("name");
%>
<html>
<head>
<title>Main</title>
<%@ include file="./header.jsp" %>
</head>
<body>

<a href="../LSH/SearchTeam">팀 검색</a>
<a href="../LSH/SearchUser">팀원 검색</a>
<br/>
<p> to do list</p>
<br />
<p>최근 알림</p>
<br />
<p>진행 중인 프로젝트</p>
</body>
</html>