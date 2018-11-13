<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<head>
<tiles:insertDefinition name="header" />
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<script type="text/javascript">
	setTimeout(function(){
		location.href="<%=request.getContextPath() %>/resources/CEB/myPagePoint";
	}, 3000)
	//메인 경로를 넣어 주세용
</script>
</head>
<body>


<p align="center"><h3>결제가 완료되었습니다 자동으로 메인페이지로 이동합니다.<br/>
 즐거운 직구 되세요!.</h3></p>
 <div>
		<tiles:insertDefinition name="left" />
		<tiles:insertDefinition name="footer" />
	</div>
	
</body>
</html>