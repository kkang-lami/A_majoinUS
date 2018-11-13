<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>email 인증</title>
</head>
<body>
 <script>
 function check(){
	 var form = document.authenform;
	 var authNum = ${authNum};
	 
	 if(!form.authnum.value){
		 alert("인증번호를 입력하세요");
		 return false;
	 }
	 if(form.authnum.value != authNum){
		 alert("틀린 인증번호 입니다. 인증번호를 다시 입력해주세요");
		 form.authnum.value="";
		 return false;
	 }
	 if(form.authnum.value==authNum){
		 alert("인증완료");
		 opener.document.userinput.mailCheck.value="인증완료";
		 self.close();
	 }
 }
 
 </script>
<h5>인증 번호 7자리를 입력하세요</h5>
<div class="container">
<form method="post" name="authenform" onSubmit="return check();">
<input type="text" name="authnum"><br  />
<input type="submit" class="btn" value="Submit">
</form>
</div>


</body>
</html>