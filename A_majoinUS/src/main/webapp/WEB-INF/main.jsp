<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<html lang="en">
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

   </head>
   <body>
  

    <nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
      <div class="container">
      <!-- 위 메뉴 하이퍼 링크 -->
        <a class="navbar-brand" href="<%=request.getContextPath() %>/aus/main">A_majoinUs</a>
        <button class="navbar-toggler"  type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
          <span><i class="ion-navicon"></i></span>
        </button>
        
        <!-- 밑 소메뉴 만들기 버튼 -->
<!--         <div class="collapse navbar-collapse" id="probootstrap-menu">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="city-guides.html">City Guides</a></li>
            <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
            <li class="nav-item"><a class="nav-link" href="travel.html">Travel With Us</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
          </ul>  
        </div>
       --></div>
    </nav>
    <!-- END nav -->
    

    <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<%=request.getContextPath() %>/MainTemplate/images/bg_1.jpg');" data-stellar-background-ratio="0.5"  id="section-home">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Start your project, simpler and new!</h2>
            <p class="lead mb-5 probootstrap-animate">
              

            </p>
             <!--  <a href="onepage.html" role="button" class="btn btn-primary p-3 mr-3 pl-5 pr-5 text-uppercase d-lg-inline d-md-inline d-sm-block d-block mb-3">See OnePage Verion</a>  -->
            </p>
          </div> 
          
         <div class="col-md-6  probootstrap-animate">
            <form method="post" class="probootstrap-form probootstrap-form-box mb40" action="loginCheck">
           <h3>create you are project and team </h3>
           <h5 class="display-4 border-bottom probootstrap-section-heading"></h5>
           <h3></h3>
           
              <div class="form-group">
                <label for="email" class="sr-only sr-only-focusable">Id</label>
                <input type="email" class="form-control" id="Id" name="id" placeholder="Id">
              </div>
              
              <div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">Password</label>
                <input type="password" class="form-control" id="Password" name="password" placeholder="Password">
              </div>
             
             <h6 style="color:red;" align="center">${msg}</h6>
             <div class="col-md-12 text-center">
              <div class="form-group">
                <input type="submit" class="btn btn-primary" id="login_submit" name="submit" value="Login">
       
              </div> 
              </div>
              
              <h3></h3> 
              <div class="col-md-12 text-center">
              Did you forget your <a href="findMain">ID</a> or <a href="findMain">password</a>?
             </div>
             <div class="col-md-12 text-center">
              Are you not a joinUs member yet? <a href="regist">Join a Member</a> 
             </div>
           
            </form>
          </div>
           
           
    </section>
    <!-- END section -->
    

    <section class="probootstrap_section" id="section-feature-testimonial">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-12 text-center mb-5 probootstrap-animate">
            <h2 class="display-4 border-bottom probootstrap-section-heading">Why we Love A_majoinUs</h2>
            <blockquote class="">
              <p class="lead mb-4"><em> Our project is not just because it's simple and easy, but it's in
                 meetings with a lot of people.
                Starting the project should be very simple and not complicated, 
                and our A_majoinUs worked harder to get the person 
                we wanted to meet faster and more accurately.
                Don't worry anymore, join me now and complete your own project!</em></p>
               
              <p class="probootstrap-author">
                <a href="https://probootstrap.com/" target="_blank">
                  <img src="<%=request.getContextPath() %>/MainTemplate/images/person_1.jpg" alt="Free Template by ProBootstrap.com" class="rounded-circle">
                 <!-- 사진 수정 해야함  -->
                  <span class="probootstrap-name">EunBi Cho</span>
                  <span class="probootstrap-title">CSS manager and project in charge of pretty</span>
                </a>
              </p>
            </blockquote>
          </div>
        </div>
        
      </div>
    </section>
    <!-- END section -->


    <section class="probootstrap_section" id="section-city-guides">
      <div class="container">
        <div class="row text-center mb-5 probootstrap-animate">
          <div class="col-md-12">
            <h2 class="display-4 border-bottom probootstrap-section-heading">Other Services at A_majoinUs</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
            <a href="#" class="probootstrap-thumbnail">
              <img src="<%=request.getContextPath() %>/MainTemplate/images/img_1.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <div class="probootstrap-text">
                <h3>Create Project</h3>
              </div>
            </a>
          </div>
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
            <a href="#" class="probootstrap-thumbnail">
              <img src="<%=request.getContextPath() %>/MainTemplate/images/img_2.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <h3>Find Project</h3>
            </a>
          </div>
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
            <a href="#" class="probootstrap-thumbnail">
              <img src="<%=request.getContextPath() %>/MainTemplate/images/img_3.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <h3>Support for cooperative tools</h3>
            </a>
          </div>
          <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
            <a href="#" class="probootstrap-thumbnail">
              <img src="<%=request.getContextPath() %>/MainTemplate/images/img_4.jpg" alt="Free Template by ProBootstrap.com" class="img-fluid">
              <h3>Upload Portfolio</h3>
            </a>
          </div>
        </div>
      </div>
    </section>
    
  


    <section class="probootstrap_section bg-light">
      <div class="container">
        <div class="row text-center mb-5 probootstrap-animate">
          <div class="col-md-12">
            <h2 class="display-4 border-bottom probootstrap-section-heading">News</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">

            <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
              <div class="probootstrap-media-image" style="background-image: url(<%=request.getContextPath() %>/MainTemplate/images/img_1.jpg)">
              </div>
              <div class="media-body">
                <span class="text-uppercase">January 1st 2018</span>
                <h5 class="mb-3">01. Payment Options</h5>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                <p><a href="#">Read More</a></p>
              </div>
            </div>

            <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
              <div class="probootstrap-media-image" style="background-image: url(<%=request.getContextPath() %>/MainTemplate/images/img_2.jpg)">
              </div>
              <div class="media-body">
                <span class="text-uppercase">January 1st 2018</span>
                <h5 class="mb-3">02. Customer Service</h5>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                <p><a href="#">Read More</a></p>
              </div>
            </div>

          </div>
          <div class="col-md-6">
            
            <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
              <div class="probootstrap-media-image" style="background-image: url(<%=request.getContextPath() %>/MainTemplate/images/img_4.jpg)">
              </div>
              <div class="media-body">
                <span class="text-uppercase">January 1st 2018</span>
                <h5 class="mb-3">03. Customer Service</h5>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                <p><a href="#">Read More</a></p>
              </div>
            </div>

            <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
              <div class="probootstrap-media-image" style="background-image: url(<%=request.getContextPath() %>/MainTemplate/images/img_5.jpg)">
              </div>
              <div class="media-body">
                <span class="text-uppercase">January 1st 2018</span>
                <h5 class="mb-3">04. Customer Service</h5>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                <p><a href="#">Read More</a></p>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>
    <!-- END section -->
    
    
     <footer class="probootstrap_section probootstrap-border-top">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-3">
            <h3 class="probootstrap_font-18 mb-3"><span class="text-uppercase"><span class="ion-paper-airplane"></span>error in Login?</span></h3>
            <ul class="list-unstyled">
              <li><a href="#" >If you have any questions in the environment or main area where login is not attempted, please click here.</a></li>
                
                   <a href="/" target="_blank" role="button" class="forgatbutton">More infomation here</a> 
            </ul>
          </div>
          </div>
        </div>
    
    
    <footer class="probootstrap_section probootstrap-border-top">
        <div class="row pt-5">
          <div class="col-md-12 text-center">
            <p class="probootstrap_font-14">&copy; 2018. All Rights Reserved. <br> Designed &amp; Project by EunB
             <a href="http://www.iei.or.kr" target="_blank">Where we learn</a><small>
              Group of 5-team members 강민지 박현은 이성희 장혜린 조은비 진은주</small></p>
          
            <p class="probootstrap_font-14">Demo Images: <a href="https://unsplash.com/" target="_blank">Unsplash</a></p>
          </div>
        </div>
      </div>
    </footer>
  
    
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/bootstrap-datepicker.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.easing.1.3.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/select2.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/main.js"></script>
  <script>
  var msg = "${msg}";
  if(msg == "REGISTERED"){
	  alert("회원가입이 완료 되었습니다. 로그인 해주세요.");
  }else if (msg == "FAILURE"){
	  alert("아이디와 비밀번호를 확인해 주세요.");
  }
  
  </script>
  
   </body>
</html> --%>

<%@ page contentType="text/html; charset=UTF-8"%>
<html lang="en">
   <head>
   <style type="text/css">
   .parent{
  width: 100%;
  height: 100%;
  border: 1px solid #aaa;
  overflow: hidden;  
}    
.child{
  height: 100%;
  margin-right: -80px; /* maximum width of scrollbar */
  padding-right: 50px; /* maximum width of scrollbar */
  overflow-y: scroll;          
}    
   </style>
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

   </head>
   
   <body>
  
<div class="parent">    
  <div class="child">

    <nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
      <div class="container">
      <!-- 위 메뉴 하이퍼 링크 -->
        <a class="navbar-brand" href="<%=request.getContextPath() %>/aus/main">A_majoinUs</a>    
        <button class="navbar-toggler"  type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
          <span><i class="ion-navicon"></i></span>
        </button>  
        

       </div>
    </nav>  
    <!-- END nav -->
    

    <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<%=request.getContextPath() %>/MainTemplate/images/bg_1.jpg');" data-stellar-background-ratio="0.5"  id="section-home">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Start your project, simpler and new!</h2>
            <p class="lead mb-5 probootstrap-animate">
              
                             
          </div>
          <div class="col-md-6 text-center probootstrap-animate">
            <form method="post" class="probootstrap-form probootstrap-form-box mb50" action="loginCheck">
           <h3>create you are project and team </h3>
           <h5 class="display-4 border-bottom probootstrap-section-heading"></h5>
           <h3></h3>
           
              <div class="form-group">
                <label for="email" class="sr-only sr-only-focusable">Id</label>
                <input type="email" class="form-control" id="Id" name="id" placeholder="Id">
              </div>
              
              <div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">Password</label>
                <input type="password" class="form-control" id="Password" name="password" placeholder="Password">
              </div>  
                    
             <h6 style="color:red;" align="center">${msg}</h6>
             <div class="col-md-14 text-center">
              <div class="form-group">
                <input type="submit" class="btn btn-primary" id="login_submit" name="submit" value="Login">
       
              </div> 
              </div>
                
              <h3></h3> 
              <div class="col-md-12 text-center">
              Did you forget your <a href="findMain">ID</a> or <a href="findMain">password</a>?
             </div>
             <div class="col-md-12 text-center">
              Are you not a joinUs member yet? <a href="regist">Join a Member</a> 
             </div>  
            </form>
            <br><br>          
          </div>      
          
                 
             </div>    
          </div>            
       
           
             
    </section>
   </div>
   </div>  
    <!-- END section -->
    
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/bootstrap-datepicker.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/jquery.easing.1.3.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/select2.min.js"></script>
    <script src="<%=request.getContextPath() %>/MainTemplate/js/main.js"></script>
  <script>
  var msg = "${msg}";
  if(msg == "REGISTERED"){
     alert("회원가입이 완료 되었습니다. 로그인 해주세요.");
  }else if (msg == "FAILURE"){
     alert("아이디와 비밀번호를 확인해 주세요.");
  }
  
  </script>
  
   </body>
</html>