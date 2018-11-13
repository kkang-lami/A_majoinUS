<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<html>
<head>
<!-- 로그인, 로그아웃 -->

<c:choose>
 <%--    <c:when test="${dto.id == null}">
        <a href="./loginMain">로그인</a> |
    </c:when> --%>
    <c:when test="${dto.id == null}">
        ${sessionScope.name}님이 로그인중 입니다.
        <a href="./logout">로그아웃</a> |
        <a href="./mypage">정보 수정</a>
    </c:when>
    <c:otherwise>
    ${sessionScope.name}님이 로그인 중 입니다
    <a href="./loginMain">로그인</a> |
    </c:otherwise>
</c:choose> 

</head>
<body>
<!-- 로그인 상태 -->
<%-- <c:if test="${ !empty login_info }">

<a class="click" style="text-decoration:none !important; color: #66ff33;"
onclick="location= 'mypage?id=${login_info.id}'">
${login_info.id } [ ${ login_info.name}]</a>
<p  class="click" onclick="go_logout()" >로그아웃</p>

</c:if> --%>
   
<hr>
</body>
</html>
