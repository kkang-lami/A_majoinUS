<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<script>
$(document).nubind("click").click(function(e){e.preventDefault();
fn_login();
});   

function fn_login() {
	if($("#id").val().length < 1)
		{
		alert("아이디를 입력해주세요");
		}
	else if($("#password").val().length <1)
		{
		alert("비밀번호를 입력해주세요");
		}
	else
		{
		var comSumbmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/user/loginTry.do' />");
		comsubmit.submit();
		}
}
</script>
</head>
<body>
	<div>
		<form>
			<div class="form-group">
				<label for="email" class="sr-only sr-only-focusable">Id</label> <input
					type="email" class="form-control" id="Id" name="Id"
					placeholder="Id">
			</div>

			<div class="form-group">
				<label for="message" class="sr-only sr-only-focusable">Password</label>
				<input type="password" class="form-control" id="Password"
					name="Password" placeholder="Password">
			</div>
			<h3></h3>
			<div class="col-md-12 text-center">
				<div class="form-group">
					<input type="submit" class="btn btn-primary" id="submit"
						name="submit" value="Login">
				</div>
			</div>
			<h3></h3>
			<div class="col-md-12 text-center">
				Did you forget your <a href="/">ID</a> or <a href="/">password</a>?
			</div>
			<div class="col-md-12 text-center">
				Are you not a joinUs member yet? <a href="./JHR/regist.do">Join a Member</a>
			</div>
		</form>
	</div>
 
</body>
</html>