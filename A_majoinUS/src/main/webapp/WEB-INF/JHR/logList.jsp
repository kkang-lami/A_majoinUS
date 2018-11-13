<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>로그 목록</title>
</head>
<body>
<form:form method="get">
<form:errors path="from" element="div"/>
<form:errors path="to" element="div"/>
방문일: <form:input path="from" />
방문수: <form:input path="count" />
   
<input type="submit" value="조회" />
</form:form>
</body>
</html>