<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
<h1>비밀번호 변경</h1>

<form action="mypage" method="post"id="member">
<table>
<tr>
    <td>아이디</td>
    <td><input name="id" value="${sessionScope.id}" readonly /></td>   
</tr>    
<tr>
    <td>현재 비밀번호</td>
    <td><input name="password" type="password" id="password" /></td>   
</tr>
<!-- <tr>
    <td>변경 비밀번호</td>
    <td><input type="password" name="changePw" /></td>   
</tr>
<tr>
    <td>변경 비밀번호 확인</td>
    <td><input type="password" name="check" /></td>  
</tr> -->
<tr>
    <td colspan="2">
    <input type="submit" value="확인" /></td>
    <td><div style="color:red;">${message}</div></td>
</tr>
</table>
</form>

</body>
</html>