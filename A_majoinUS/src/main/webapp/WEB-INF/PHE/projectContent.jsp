<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<title>상세 글 보기</title>
</head>
<body>
<br><center>
<input type ="hidden" name="pj_num" value="${list.pj_num}">


<table  width=600 height=300>

<tr><td>프로젝트 이름 </td> <td> ${list.pj_name}<br> </td></tr>
<tr><td> 프로젝트 소개 </td> <td> ${list.pj_info}<br></td></tr>
<tr><td> 총원 </td> <td> ${list.mem_limit}<br></td></tr>
<tr><td> 기간</td> 
<td>
	<fmt:parseDate value="${list.start_d}" var="start" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	<fmt:formatDate value="${start}" pattern="yy/MM/dd"/> 
	~ 
	<fmt:parseDate value="${list.end_d}" var="end" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	<fmt:formatDate value="${end}" pattern="yy/MM/dd"/>
<br></td></tr>
<tr>
<td>관심분야</td>
<td>${list2.pj_cate}</td>
<td>모집지역</td>
<td>${list3.pj_loc}</td>
</tr>


<%-- <tr><td> 프로젝트 관심분야 </td> <td> ${list.pj_info}<br></td></tr>
<tr><td> 모집지역 </td> <td> ${list.pj_info}<br></td></tr> --%>

</table>
<br/>
<input type="hidden" name="pj_num" value="${list.pj_num}">
<a href ="projectList"> 목록으로 </a> 
<a href ="modifyProject?pj_num=${list.pj_num}"> 수정하기</a> 
<a href ="projectDelete?pj_num=${list.pj_num}"> 삭제하기</a> 

</center>

</body>
</html>