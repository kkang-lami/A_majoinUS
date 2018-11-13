<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
%>
<html>
<head>
<title>Main</title>
</head>
<body>
	<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">


				${sessionScope.name}님이 로그인중 입니다. <a href="logout">로그아웃</a> | <a href="mypage">정보 수정</a> <br> 
				<a href="../LSH/SearchTeam">팀 검색</a> <a href="../LSH/SearchUser">팀원 검색</a> <br />
				<p>to do list</p>
				<br />
				<p>최근 알림</p>
				<br />
				<p>진행 중인 프로젝트</p>








			</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</body>
</html>