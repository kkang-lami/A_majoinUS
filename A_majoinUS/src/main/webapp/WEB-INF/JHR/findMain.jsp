<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
   

</head>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
$(document).on('click','#findId',function(){
	var name = $('#name').val();
 	var tel = $('#phone').val();
 	var postData ="name="+name+'&phone='+tel;

	$.ajax({
        url:'./findId',
        type:'POST',
        data: postData,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : "json",
        success:function(data){
        	 /* var idLists = data.id;
        	var idLength = idLists.length
        	var idfind = idLists.substring(1, idLength-1)  */
        	alert(data.id);
   	 		 $("#idList").append("<h1>"+"회원님의 정보로 등록된 이메일은 : "+data.id+" 입니다.</h1>")

        },    
        error: function (XMLHttpRequest, textStatus, errorThrown){

        	alert('입력한 정보가 맞지 않습니다.' );
        }
    });    
});      

</script>

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
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">AmajoinUs Find My Id/Password!</h2>
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
<h3 class="display-4 border-bottom probootstrap-section-heading">Find Id/Password</h3>

<section class="probootstrap_section bg-light" id="section-contact">
       <div class="container">  
        <div class="row justify-content-center mb-12">  
         <div class="col-md-10 justify-content-center probootstrap-animate">
<div>

<form action="findId" class="probootstrap-form probootstrap-form-box mb60" >
<div class="form-group" >
	<h1>Find My Id</h1>

		이름 : <input type="text" name="name" class="form-control" id="name" placeholder="required name" required><br>
		핸드폰 번호 : <input type="text" name="phone" id="phone" class="form-control" placeholder="required phone-number" required><br>

		<input type="button" id="findId" class="btn btn-primary" value="아이디찾기">
	<br>
	<br>
  
</div>  
</form>
</div>
</div>
</div>
</div>
</section>


<section class="probootstrap_section bg-light" id="section-contact">
       <div class="container">  
        <div class="row justify-content-center mb-12">  
              
         <div class="col-md-10 justify-content-center probootstrap-animate">


<form class="probootstrap-form probootstrap-form-box mb60">
<div class="form-group" >
<h1>Find My Password</h1>
	
	
		이름 : <input type="text" name="name" id="pw_name" class="form-control" placeholder="required name"><br>
		아이디(이메일) : <input type="text" name="id" id="pw_id"class="form-control" placeholder="required your ID or Email"><br>

         <input type="button" id="sendmail" class="btn btn-primary" value="이메일전송">
        
</div>
</form>
</div>
</div>
</div>
</section>

</div>

<input type="button" id="뒤로가기"  value="뒤로가기" class="btn btn-primary" onclick="history.go(-1)">
</div>

</div>
</section>

<%-- 
<div>

<form cation="findId">
<div class="" id="">
	<h1>아이디 찾기</h1>

		이름 : <input type="text" name="name" id="name" required><br>
		핸드폰 번호 : <input type="text" name="phone" id="phone" required><br>

		<input type="button" id="findId" value="아이디찾기">
	<br>
	<br>

</div>
</form>

<div class="" id="">
<h1>비밀번호 찾기</h1>
	
	
		이름 : <input type="text" name="name" id="pw_name"><br>
		아이디(이메일) : <input type="text" name="id" id="pw_id"placeholder="email"><br>

         <input type="button" id="sendmail" class="btn join" value="이메일전송">
        

</div>
<input type="button" id="뒤로가기"  value="뒤로가기" onclick="history.go(-1)">
</div> --%>
<script>    
$('#sendmail').on('click',function(){
	var name = $('#pw_name').val();
 	var id = $('#pw_id').val();    
 	
	var url = "<%=request.getContextPath()%>/aus/findMail";
	var param = "id="+id+"&name="+name;
	 $.ajax({
		type:"post",
		url:url,    
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data:param,
		dataType:"text",
		success:function(args){
			if(args === 'success'){
				alert('이메일로 임시 비밀번호를 전송하였습니다.');
			}else{
				alert('일치하는 정보가 없습니다.');
			}
			
		}
	});
});
</script>


 </body>
</html>