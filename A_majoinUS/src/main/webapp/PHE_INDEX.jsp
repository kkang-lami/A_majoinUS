<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h2>Hello World!</h2>
<c:set var="userId" value="aa@gmail.com" scope="session"/>

<a href="aus/PHE/createProjectForm">Create Project </a><br><br>
<a href="aus/PHE/projectList">Project List </a><br><br>
<a href="aus/PHE/reviewListForMe">reviewListForMe</a><br><br>
<a href="aus/PHE/reviewListByMe">reviewListByMe</a><br><br>
<a href="aus/PHE/followList">followList</a><br><br>
<a href="aus/PHE/portfolioList">portfolioList</a><br><br>
<a href="aus/PHE/projectAlarm">projectAlarm</a><br><br>
</body>
</html>               