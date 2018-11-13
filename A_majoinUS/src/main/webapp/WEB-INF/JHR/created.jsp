<%@ page contentType="text/html; charset=UTF-8"%>
 <%@ page isELIgnored = "false" %>
<html>
<head>
<title>계정 생성</title>
</head>
<body>
	계정 생성됨
	<ul>
		<li>아이디: ${command.id}</li>
		<li>이름: ${command.name}</li>
		<li>우편번호: ${command.address.zipcode}</li>
		<li>주소: ${command.address.address1} ${command.address.address2}</li>
	</ul>
</body>
</html>