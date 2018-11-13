<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.9.0.js"></script>

	<script>
	$(document).ready(function(){
		$("#login_submit").click(function(){
			var id = $("#id").val();
			var password = $("#password").val();
			if(id == ""){
				alert("아이디를 입력하세요");
				$("#id").focus();
				return;
			}
			if(password == ""){
				alert("비밀번호를 입력하세요");
				$("#password").focus();
				return;
			}
		});
	});    
	$(function(){
		$("#findMain_btn").click(function(){
			location.href='./findMain';
		});
	})
	</script>
</head>
<body>

<div>
	<form action="loginCheck" id="loginForm" method="post"  >

	<div class="form-group">
                <label for="email" class="sr-only sr-only-focusable">Id</label>
                <input type="email" class="form-control" id="id" name="id" placeholder="Id">
              </div>
              
              <div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
              </div>
             
             <h3></h3>
             <div class="col-md-12 text-center">
              <div class="form-group">
                <button type="submit" class="btn btn-primary" id="login_submit"  >로그인</button>
               
                <c:if test = "${msg == 'failure'}"> 
                <div style="color:red">
            		    아이디 또는 비밀번호가 일치 하지 않습니다
                </div>     
                </c:if>
                <c:if test="${msg == 'logout'}">
                <div style="color:red">
              		  로그아웃 되었습니다.
                </div>
                </c:if>
              </div>
              </div>
              
              <h3></h3> 
              <div class="col-md-12 text-center">
              Did you forget your <a href="./findMain">ID</a> or <a href="./findMain" >password</a>?
             </div>
             <div class="col-md-12 text-center">
              Are you not a joinUs member yet? <a href="./regist">Join a Member</a> 
             </div>
           
            </form>
          </div>

</body>
</html>