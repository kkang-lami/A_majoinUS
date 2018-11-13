<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%--<%@ page isELIgnored="false" %> --%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<tiles:insertDefinition name="header" />
	
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<div>
				
					<h1>이미 작성을 완료하였습니다.</h1>
				
				
				</div>
			</section>
		</div>
	</div>    

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
			
</body>
</html>