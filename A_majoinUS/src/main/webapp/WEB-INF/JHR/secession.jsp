<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>탈퇴 화면 - 비밀번호 입력</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        /* function checkValue(){
            if(!document.deleteform.pwd.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        } */
     $(document).ready(function(){
            $("#btnDelete").click(function(){
                // 확인 대화상자 
                if(confirm("삭제하시겠습니까?")){
                  //  document.deleteform.action = "secessionpro";
                    document.deleteform.submit();
                }
            });
        });
    </script>
</head>
<body>
    <br><br>
    <b><font size="6" color="gray">회원탈퇴</font></b>
    <br><br><br>
 <!-- 탈퇴처리-->
    <form name="deleteform" method="post" action="secessionpro">
        <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="pwd" maxlength="50"></td>
            </tr>
        </table>
        <br> 
        <input type="button" value="취소" onclick="location.href='mypage'">
        <input type="button" value="탈퇴" id="btnDelete"/> 
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
<title>탈퇴 화면 - 비밀번호 입력</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        /* function checkValue(){
            if(!document.deleteform.pwd.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        } */
     $(document).ready(function(){
            $("#btnDelete").click(function(){
                // 확인 대화상자 
                if(confirm("삭제하시겠습니까?")){
                  //  document.deleteform.action = "secessionpro";
                    document.deleteform.submit();
                }
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
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Close my account!</h2>
            <p class="lead mb-5 probootstrap-animate ">      
              </p>      
          </div> 
        </div>
      </div>
    </section>
    
    
    <section class="probootstrap_section" id="section-feature-testimonial">
<div class="container">
<div class="row justify-content-center mb-5">
<div class="col-md-12 text-center mb-5 probootstrap-animate">
<h3 class="display-4 border-bottom probootstrap-section-heading">I hope to see you again</h3>
    
    
    <section class="probootstrap_section bg-light" id="section-contact">
       <div class="container">  
        <div class="row justify-content-center mb-12">  
            
    
    <form name="deleteform" method="post" action="secessionpro">  


<div class="form-group">    비밀번호     
                <label for="passwd" class="sr-only sr-only-focusable">Passwd</label>
                <input type="password" rows="20" class="form-control"  name="pwd"  placeholder="Don't go,,">
              </div>            
        <br> 
        <input type="button" value="취소"  class="btn btn-danger" onclick="location.href='mypage'">
        <input type="button" value="탈퇴"  class="btn btn-danger" id="btnDelete"/> 
    </form>
    
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
 
<script type="text/javascript">
        // 비밀번호 미입력시 경고창
        /* function checkValue(){
            if(!document.deleteform.pwd.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        } */
     $(document).ready(function(){
            $("#btnDelete").click(function(){
                // 확인 대화상자 
                if(confirm("삭제하시겠습니까?")){
                  //  document.deleteform.action = "secessionpro";
                    document.deleteform.submit();
                }
            });
        });
</script>
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
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">AmajoinUs membership withdrawal Check password!</h2>
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
  
<form name="deleteform" action="secessionpro" method="post" class="probootstrap-form probootstrap-form-box mb60" >
<div class="form-group" >

		비밀번호 : <input type="password" name="pwd" class="form-control" placeholder= "비밀번호" required><br>

		<input type="button" value="탈퇴" id="btnDelete" class="btn btn-primary">
		<input type="button" value="취소" onclick="history.go(-1)" class="btn btn-primary">
	<br>
	<br>
  
</div>  
</form>
</div>
</div>
</div>
</div>
</section>

<!-- <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        /* function checkValue(){
            if(!document.deleteform.pwd.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        } */
     $(document).ready(function(){
            $("#btnDelete").click(function(){
                // 확인 대화상자 
                if(confirm("삭제하시겠습니까?")){
                  //  document.deleteform.action = "secessionpro";
                    document.deleteform.submit();
                }
            });
        });
    </script>
</head>
<body>
    <br><br>
    <b><font size="6" color="gray">회원탈퇴</font></b>
    <br><br><br>
 탈퇴처리
    <form name="deleteform" method="post" action="secessionpro">
        <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="pwd" maxlength="50"></td>
            </tr>
        </table>
        <br> 
        <input type="button" value="취소" onclick="location.href='mypage'">
        <input type="button" value="탈퇴" id="btnDelete"/> 
    </form> -->
</body>
</html>