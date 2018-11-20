<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

      <meta http-equiv="Content-Type" content="texxt/html; charset=utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

      <title>A_majoinUs &mdash; by Enubi</title>
      <meta name="description" content="Free Bootstrap 4 Theme by ProBootstrap.com">
      <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
      
    
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/select2.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/helpers.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/style.css">
          
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/bootstrap.min.js"></script>  
    <script src="<%=request.getContextPath() %>/MainTemplate/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.easing.1.3.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/select2.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/main.js"></script>
   


  
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function(){
   $("#btnUpdate").click(function(){
      alert("수정하시겠습니까?");
      
   });
});

$(document).ready(function(){   
   $('.editable .field').focus(function() {
      $(this).addClass('focused');
   }).blur(function(){
      $(this).removeClass('focused');
   });
});

</script>    
<style type="text/css">    


select {  
    width: 150px;    
    height: 30px;    
    padding-left: 10px;  
    font-size: 15px;    
    color: black;    
    border: 1px solid #338033;
    border-radius: 3px;
    -webkit-appearance: none;   
   -moz-appearance: none;     
   appearance: none;  
   background: url('select-arrow.png') no-repeat 95% 50%; 
   font: 300 18px/1.5 'Roboto', sans-serif;      
}  

select::-ms-expand {
   display: none;         
   border: 1px dashed #D0CBCB;  
   cursor: pointer;
}

select option:checked, 
select option:hover {    
    background: #2E2E2E;     
    color: #fff;  
    cursor: pointer;
}

select option:checked,
select option:hover { 
    box-shadow: 0 0 15px 100px #ff00ff inset;  
    color: #fff;
    cursor: pointer;
}

button{
/* position : absolute; */
top:50%;
left:50%;    
transform: translate(-50%,-50%);
  
}

button{

background:none;
color: black;  
width: 50px;            
height:30px;
border: 1px solid #338033;
font-size: 18px;
border-radius: 4px;
transition:.6s;
overflow: hidden;

}

button:before {
content: '';
display: block;
position: absolute;
background: rgba(255,255,255,.5);'\
left: 0;
top: 0;  
opacity: .5s;
filter:blur(30px);
transform:translateX(-130px) skweX(-15deg);
}
button:after {
content: '';
display: block;
position: absolute;
background: rgba(255,255,255,.5);'\
left: 30px;
top: 0;  
opacity: 0;
filter:blur(30px);
transform:translateX(-130px) scaleX(-15deg);

}

button:hover {
   background: #338033;
   cursor: pointer;
   
}
button:hover:before {
   transform:translateX(300px) skewX(-15deg);
   opacity: .6s;
   transition: .7s;
}

button:hover:after {
   transform:translateX(300px) skewX(-15deg);
   opacity: 1;
   transition: .7s;
}  

</style>  
  
</head>

<body>
  
    <!-- 맨위 로고 단 -->
    <nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
      <div class="container">
      <!-- 위 메뉴 하이퍼 링크 -->
        <a class="navbar-brand" href="#">A_majoinUs</a>
        <button class="navbar-toggler"  type="button" data-toggle="collapse" data-target="#probootstrap-menu" 
        aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
          <span><i class="ion-navicon"></i></span>  
        </button>
   
      </div>    
    </nav>      
        
        
        <!-- 아래 헤딩 사진단 -->
   <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<%=request.getContextPath() %>/MainTemplate/images/bg_1.jpg');" data-stellar-background-ratio="0.5" id="section-home">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center text-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">AmajoinUs Modifying Check password!</h2>
            <p class="lead mb-5 probootstrap-animate ">      
              </p>    
          </div> 
        </div>
      </div>
      
    </section>
  


<!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^상위섹션 건들지마삼^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ -->

<section class="probootstrap_section" id="section-feature-testimonial">
<div class="container">
<div class="row justify-content-center mb-5">
<div class="col-md-12 text-center mb-5 probootstrap-animate">
<h3 class="display-4 border-bottom probootstrap-section-heading">check password</h3>

<section class="probootstrap_section bg-light" id="section-contact">
       <div class="container">  
        <div class="row justify-content-center mb-12">  
         <div class="col-md-10 justify-content-center probootstrap-animate">
<div>

<form action="mypage" method="post" class="probootstrap-form probootstrap-form-box mb60" >
<div class="form-group" >

      아이디 : <input type="text" name="id" class="form-control" id="id" placeholder="${sessionScope.id}" readonly><br>
      비밀번호 : <input type="password" name="password" id="password" class="form-control" placeholder="현재 비밀번호" required><br>
      <input type="submit" id="Pw" class="btn btn-primary" value="확인">
      <div style="color:red;">${message}</div>
   <br>
   <br>
  
</div>  
</form>
</div>
</div>
</div>
</div>
</section>

<h1>  회원 정보 수정 확인 </h1>

<form action="mypage" method="post"id="member">
<table>
<tr>
    <td>아이디</td>
    <td><input name="id" value="${sessionScope.id}" readonly /></td>   
</tr>    
<tr>
    <td>비밀번호 확인 </td>
    <td><input name="password" type="password" id="password" /></td>   
</tr>

<tr>
    <td colspan="2">
    <input type="submit" value="확인" /></td>
    <td><div style="color:red;">${message}</div></td>
</tr>
</table>
</form>

</body>
</html> --%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

      <meta http-equiv="Content-Type" content="texxt/html; charset=utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
      <title>A_majoinUs &mdash; by Enubi</title>
      <meta name="description" content="Free Bootstrap 4 Theme by ProBootstrap.com">
      <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
      
    
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/select2.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/helpers.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/style.css">
          
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/bootstrap.min.js"></script>  
    <script src="<%=request.getContextPath() %>/MainTemplate/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.easing.1.3.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/select2.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/main.js"></script>
   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경</title>

<style type="text/css">    


select {  
    width: 150px;    
    height: 30px;    
    padding-left: 10px;  
    font-size: 15px;    
    color: black;    
    border: 1px solid #338033;
    border-radius: 3px;
    -webkit-appearance: none;   
   -moz-appearance: none;     
   appearance: none;  
   background: url('select-arrow.png') no-repeat 95% 50%; 
   font: 300 18px/1.5 'Roboto', sans-serif;      
}  

select::-ms-expand {
   display: none;         
   border: 1px dashed #D0CBCB;  
   cursor: pointer;
}

select option:checked, 
select option:hover {    
    background: #2E2E2E;     
    color: #fff;  
    cursor: pointer;
}

select option:checked,
select option:hover { 
    box-shadow: 0 0 15px 100px #ff00ff inset;  
    color: #fff;
    cursor: pointer;
}

button{
/* position : absolute; */
top:50%;
left:50%;    
transform: translate(-50%,-50%);
  
}

button{

background:none;
color: black;  
width: 50px;            
height:30px;
border: 1px solid #338033;
font-size: 18px;
border-radius: 4px;
transition:.6s;
overflow: hidden;

}

button:before {
content: '';
display: block;
position: absolute;
background: rgba(255,255,255,.5);'\
left: 0;
top: 0;  
opacity: .5s;
filter:blur(30px);
transform:translateX(-130px) skweX(-15deg);
}
button:after {
content: '';
display: block;
position: absolute;
background: rgba(255,255,255,.5);'\
left: 30px;
top: 0;  
opacity: 0;
filter:blur(30px);
transform:translateX(-130px) scaleX(-15deg);

}

button:hover {  
	background: #338033;
	cursor: pointer;
	
}
button:hover:before {
	transform:translateX(300px) skewX(-15deg);
	opacity: .6s;
	transition: .7s;
}

button:hover:after {
	transform:translateX(300px) skewX(-15deg);
	opacity: 1;
	transition: .7s;
}  

</style>  
  

</head>
<body>


 <nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
      <div class="container">
      <!-- 위 메뉴 하이퍼 링크 -->
        <a class="navbar-brand" href="#">A_majoinUs</a>
        <button class="navbar-toggler"  type="button" data-toggle="collapse" data-target="#probootstrap-menu" 
        aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
          <span><i class="ion-navicon"></i></span>  
        </button>
        <div class="collapse navbar-collapse" id="probootstrap-menu">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="#">Register</a></li>
            <li class="nav-item"><a class="nav-link" href="#">find my id/pw</a></li>
            <li class="nav-item"><a class="nav-link" href="#">QnA</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Login</a></li>
            </ul>    
            </div>    
        </div>    
        </nav>      
        
        
        <!-- 아래 헤딩 사진단 -->
        <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<%=request.getContextPath() %>/MainTemplate/images/bg_1.jpg');" data-stellar-background-ratio="0.5" id="section-home">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center text-center">  
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">AmajoinUs Change-Passwd!</h2>
            <p class="lead mb-5 probootstrap-animate ">      
              </p>    
          </div> 
        </div>
      </div>
    </section>

<!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^상위섹션 건들지마삼^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ -->



<section class="probootstrap_section" id="section-feature-testimonial">
<div class="container">
<div class="row justify-content-center mb-5">
<div class="col-md-12 text-center mb-5 probootstrap-animate">  
<h3 class="display-4 border-bottom probootstrap-section-heading">Confirm password</h3>

<section class="probootstrap_section bg-light" id="section-contact">
       <div class="container">  
        <div class="row justify-content-center mb-12">  
         <div class="col-md-10 justify-content-center probootstrap-animate">
<div>

<form action="mypage" method="post"id="member">
<div class="form-group" >
        
  ID :<input name="id" type="text" id="id" class="form-control" value="${sessionScope.id}" readonly/><br>   
  Current Password :<input name="password" type="password" id="password" class="form-control" placeholder="required Password" required/>   
                
    <br>    
    <input type="submit" value="확인" class="btn btn-primary"/>
    <div style="color:red;">${message}</div>  
    
</div>
</form>
</div>
</div>
</div>
</div>
</section>
  
  
  
 </div>
      </div>
      </div>
    </section>

</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

      <meta http-equiv="Content-Type" content="texxt/html; charset=utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

      <title>A_majoinUs &mdash; by Enubi</title>
      <meta name="description" content="Free Bootstrap 4 Theme by ProBootstrap.com">
      <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
      
    
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/select2.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/helpers.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/MainTemplate/css/style.css">
          
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/bootstrap.min.js"></script>  
    <script src="<%=request.getContextPath() %>/MainTemplate/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.easing.1.3.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/select2.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/main.js"></script>
   


  
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function(){
   $("#btnUpdate").click(function(){
      alert("수정하시겠습니까?");
      
   });
});

$(document).ready(function(){   
   $('.editable .field').focus(function() {
      $(this).addClass('focused');
   }).blur(function(){
      $(this).removeClass('focused');
   });
});

</script>    
<style type="text/css">    


select {  
    width: 150px;    
    height: 30px;    
    padding-left: 10px;  
    font-size: 15px;    
    color: black;    
    border: 1px solid #338033;
    border-radius: 3px;
    -webkit-appearance: none;   
   -moz-appearance: none;     
   appearance: none;  
   background: url('select-arrow.png') no-repeat 95% 50%; 
   font: 300 18px/1.5 'Roboto', sans-serif;      
}  

select::-ms-expand {
   display: none;         
   border: 1px dashed #D0CBCB;  
   cursor: pointer;
}

select option:checked, 
select option:hover {    
    background: #2E2E2E;     
    color: #fff;  
    cursor: pointer;
}

select option:checked,
select option:hover { 
    box-shadow: 0 0 15px 100px #ff00ff inset;  
    color: #fff;
    cursor: pointer;
}

button{
/* position : absolute; */
top:50%;
left:50%;    
transform: translate(-50%,-50%);
  
}

button{

background:none;
color: black;  
width: 50px;            
height:30px;
border: 1px solid #338033;
font-size: 18px;
border-radius: 4px;
transition:.6s;
overflow: hidden;

}

button:before {
content: '';
display: block;
position: absolute;
background: rgba(255,255,255,.5);'\
left: 0;
top: 0;  
opacity: .5s;
filter:blur(30px);
transform:translateX(-130px) skweX(-15deg);
}
button:after {
content: '';
display: block;
position: absolute;
background: rgba(255,255,255,.5);'\
left: 30px;
top: 0;  
opacity: 0;
filter:blur(30px);
transform:translateX(-130px) scaleX(-15deg);

}

button:hover {
   background: #338033;
   cursor: pointer;
   
}
button:hover:before {
   transform:translateX(300px) skewX(-15deg);
   opacity: .6s;
   transition: .7s;
}

button:hover:after {
   transform:translateX(300px) skewX(-15deg);
   opacity: 1;
   transition: .7s;
}  

</style>  
  
</head>

<body>
  
    <!-- 맨위 로고 단 -->
    <nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
      <div class="container">
      <!-- 위 메뉴 하이퍼 링크 -->
        <a class="navbar-brand" href="<%=request.getContextPath() %>/aus/main">A_majoinUs</a>
        <button class="navbar-toggler"  type="button" data-toggle="collapse" data-target="#probootstrap-menu" 
        aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
          <span><i class="ion-navicon"></i></span>  
        </button>
   
      </div>    
    </nav>      
        
        
        <!-- 아래 헤딩 사진단 -->
   <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<%=request.getContextPath() %>/MainTemplate/images/bg_1.jpg');" data-stellar-background-ratio="0.5" id="section-home">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center text-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">AmajoinUs Modifying Check password!</h2>
            <p class="lead mb-5 probootstrap-animate ">      
              </p>    
          </div> 
        </div>
      </div>
      
    </section>
  


<!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^상위섹션 건들지마삼^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ -->

<section class="probootstrap_section" id="section-feature-testimonial">
<div class="container">
<div class="row justify-content-center mb-5">
<div class="col-md-12 text-center mb-5 probootstrap-animate">
<h3 class="display-4 border-bottom probootstrap-section-heading">check password</h3>

<section class="probootstrap_section bg-light" id="section-contact">
       <div class="container">  
        <div class="row justify-content-center mb-12">  
         <div class="col-md-10 justify-content-center probootstrap-animate">
<div>

<form action="mypage" method="post" class="probootstrap-form probootstrap-form-box mb60" >
<div class="form-group" >

      아이디 : <input type="text" name="name" class="form-control" id="name" placeholder="${sessionScope.id}" readonly><br>
      비밀번호 : <input type="password" name="password" id="password" class="form-control" placeholder="현재 비밀번호" required><br>
      <input type="submit" id="Pw" class="btn btn-primary" value="확인">
      <div style="color:red;">${message}</div>
   <br>
   <br>
  
</div>  
</form>
</div>
</div>
</div>
</div>
</section>

<%-- <h1>  회원 정보 수정 확인 </h1>

<form action="mypage" method="post"id="member">
<table>
<tr>
    <td>아이디</td>
    <td><input name="id" value="${sessionScope.id}" readonly /></td>   
</tr>    
<tr>
    <td>비밀번호 확인 </td>
    <td><input name="password" type="password" id="password" /></td>   
</tr>

<tr>
    <td colspan="2">
    <input type="submit" value="확인" /></td>
    <td><div style="color:red;">${message}</div></td>
</tr>
</table>
</form> --%>

</body>
</html>
