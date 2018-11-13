<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h2>Hello World!</h2>
<c:set var="userId" value="admin@gmail.com" scope="session"/>
<c:set var="pj_num" value="500" scope="session"/>
<%-- <%
	response.sendRedirect("aus/JEJ/ProjectManage");
%>  --%>

<a href="aus/JEJ/review_admin">평가 관리</a><br />
<a href="aus/JEJ/issue_admin">신고 관리</a><br />
<a href="aus/JEJ/ProjectManage">프로젝트룸 관리</a><br />
<a href="aus/JEJ/MemberManage">회원 관리</a><br />
<a href="aus/JEJ/CategoryManage">카테고리 관리</a><br />
<a href="aus/JEJ/PaymentList">결제 내역</a><br /> 
<!-- <a href="aus/JEJ/StatsManage">통계(모리스 버전)</a><br /> -->
<!-- <a href="aus/JEJ/StatsTest">통계 인라인 버전 테스트</a> <br />-->
<a href="aus/JEJ/StaticManage">통계</a><br />
<a href="aus/JEJ/ExcelDownload">엑셀다운로드</a><br />
<a href="aus/JEJ/PaymentAjax">결제내역ajax</a><br />
<a href="aus/JEJ/AddSchedule">스케줄등록</a><br />
<a href="aus/JEJ/ProjectSchedule">스케줄러</a>

</body>
</html>