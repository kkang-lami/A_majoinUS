<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>카테고리 수정</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="jquery-2.1.4.js" type="text/javascript"></script>
<script language="JavaScript">

function categoryPro() {
	//var check = confirm("변경 내역을 저장하시겠습니까?");
	if(confirm("변경 내역을 저장하시겠습니까?")) {
		//window.location.href = "./updatepro?cate_num="+formName.cate_num.value;
		alert("변경되었습니다.");
		opener.parent.location.reload();
		return true;
		//self.close();
		//opener.parent.location.reload();
	}else{
		return false;
	}
}
</script>
<style>
.jenny {
	text-align: center;
}
</style>

</head>
<body>
<div class="container">
  <h3>카테고리 수정하기</h3>
  
  <form name="no" action="./updatepro" onsubmit="return categoryPro();"> <!--  action="updatepro" --> 
  <c:forEach items="${category}" var="category" >
  	<%-- <h4>${category.c_name}</h4>  --%>

	<%-- <button type="button" class="btn btn-info">${category.c_name}</button> --%>
	<h5><button type="button" class="btn btn-primary btn-sm">${category.c_name}</button></h5>
		
    <div class="form-group">
      <label for="category_1">1차:</label>
      <input type="hidden" name="c_1_past" value="${category.c_1_name}" />
      <input type="text" class="form-control" id="category_1" name="c_1_name" value="${category.c_1_name}" required="required">
      
    </div>
    <div class="form-group">
      <label for="category_2">2차:</label>
      <input type="hidden" name="c_2_past" value="${category.c_2_name}" />
      <input type="text" class="form-control" id="category_2" name="c_2_name" value="${category.c_2_name}" required="required">
    </div>
    	<input type="hidden" name="cate_num" value="${cate_num}" />
    	<input type="hidden" name="cate_1_num" value="${category.cate_1_num}" />
    	<input type="hidden" name="c_2_num" value="${category.c_2_num}" />
    <div class="jenny">
    <button type="submit" class="btn btn-default">수정하기</button>
    </div>
	</c:forEach>
  </form>
</div>

</body>
</html>