<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<script>
	function Failed(){
		window.close();
	}
</script>
<title>Insert title here</title>
</head>
<tiles:insertDefinition name="header" />
<body onload="setTimeout(Failed(), 2)">
시도가 실패하였습니다. 메인으로 이동한 뒤 다시 시도해주세요.
</body>
<tiles:insertDefinition name="left" />
<tiles:insertDefinition name="footer" />
</html>
