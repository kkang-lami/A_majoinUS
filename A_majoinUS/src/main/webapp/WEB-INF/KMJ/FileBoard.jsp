<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Controller에 session id만 연결하기 --%>
<!DOCTYPE html>
<html>
<head>
<title>AMAJOINUS</title>
<style>
#file {
    display: block;
    visibility: hidden;
    width: 0;
    height: 0;
}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="<%=request.getContextPath() %>/jquery.form.js"></script>
<script>
$(function(){
	$("#upload").click(function(){
	    $("#file").click();
	});
	
	$("#file").on('change',function(){
		$("#check").click();
	});
	
 	$("#check").click(function(){
	        var form = $('form')[0];
	        var formData = new FormData(form);
	            $.ajax({
	               url: '${pageContext.request.contextPath}/aus/pr_fileboard',
	               processData: false,
	               contentType: false,
	               data: formData,
	               type: 'POST',
	               success: function(result){
	                   alert("업로드 성공!!");
	               }

	           });
	        });
})
</script>
</head>
<body>

	<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
				
				자료실
				<hr />
				<div>
					<table border="1" align=center>
					<tr>
						<td colspan="6" align="right">
							<form method="post" enctype="multipart/form-data" action="pr_fileboard">
								<input type="file" id="file" name="file"/><!--  onchange="form.submit()" -->
								<input type="hidden" name="pj_num" value="${pj_num }">
								<input type=button id="upload" name="upload" value="파일 등록" />
								<input type="submit" id=check name=check hidden/>
							</form>
						</td>
					</tr>
					<c:set var="no" value="1" />              
					<tr align="center">
						<td width=5%>no.</td>
						<td width=55%>파일명</td>
						<td width=15%>올린사람</td>
						<td width=10%>사이즈</td>
						<td width=10%>날짜</td>
						<td width=5%></td>
					</tr>
					<c:forEach var="f_list" items="${f_list }">
					<tr align="center">
						<td><c:out value="${no}" /></td>
						<td><a href="pr_fileboard/download?fb_num=${f_list.fb_num }"> ${f_list.filename }</a></td>
						<td>${f_list.name }</td>
						<td>${f_list.file_size }</td>
						<td>${f_list.file_date }</td>
						<td><a href="pr_fileboard/delete?fb_num=${f_list.fb_num }&pj_num=${f_list.pj_num}">X</a></td>
						<c:set var="no" value="${no+1}" />
					</tr>
					</c:forEach>
					</table>     
				</div>
				
				
				
			</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />

</body>
</html>