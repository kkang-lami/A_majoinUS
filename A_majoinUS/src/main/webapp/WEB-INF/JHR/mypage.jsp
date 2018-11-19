<%-- 
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("euc-kr");
%>
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
   

<title>정보 수정</title>




<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
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
/* /* $(document).ready(function(){
	var textareaVal = $("textarea[name="Profile"]").text();
	console.log(textareaVal);
	  $("textarea[name=Profile]").text("값을 변경합니다.");

 */ 
 $('input:textbox').val();
 $('input:textbox').val("new text message");
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
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Modify member information!</h2>
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
<h3 class="display-4 border-bottom probootstrap-section-heading">Modify info</h3>
  

<section class="probootstrap_section bg-light" id="section-contact">
       <div class="container">  
        <div class="row justify-content-center mb-12">  
              
          <div class="col-md-10 justify-content-center probootstrap-animate">
           




<form name="form1" method="post" action="memberUpdate" id="member" class="probootstrap-form probootstrap-form-box mb60" enctype="multipart/form-data">
<fieldset>  
  
<div class="form-group">
<label for="id" class="sr-only sr-only-focusable">ID</label>
<input type="text" class="form-control"name="id" value="${dto.id}" readonly="readonly">
</div>

<div class="form-group">
<label for="passwd" class="sr-only sr-only-focusable">Password</label>
<input class="form-control"name="password" type="password">
</div>

<div class="form-group">
<label for="name" class="sr-only sr-only-focusable">Name</label>
<input type="text" class="form-control" value="${dto.name}"readonly="readonly">
</div>

<div class="form-group">
<label for="id" class="sr-only sr-only-focusable">Phone-number</label>
<input type="text" class="form-control" name="phone" value="${dto.phone}">
</div>

<div class="form-group">
<label for="birth" class="sr-only sr-only-focusable">birth</label>
<input type="date" class="form-control" name="birth" value="${dto.birth}" >
</div>

<div class="form-group">
<img src="<%=request.getContextPath()%>/aus/userImg/${dto.u_img}">
<input type="file" class="form-control" name="file" accept="image/*" >
</div>





<div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">liked_area</label>  
                <select id="local1" class="show-level2"></select>
                <select id="local12" ></select> 
              </div>  
              <div class="button_moum1" style=" left: 52%; margin-left: 50px;">     
                <button type="button" value="local" class="add_btn" >area추가</button>
                </div>                                                               
                                             
                        
              <div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">관심분야</label>  
                <select id="job1" class="show-level2"></select>
                <select id="job12" ></select>  
              </div>          
              <div class="button_moum1" style=" left: 52%; margin-left: 50px;">     
                <button type="button" value="job" class="add_btn" >분야 추가</button>
                </div> 
                      
              <div title="넘겨질 job과 local" id="hidden"></div>
                           < 검색조건  >   
                <input name="job" value="${dto.job}" /> 
               <div id="result"></div> 
               
               <div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">자기소개</label>
                <textarea rows="20" class="form-control" id="message" name="profile"  >${dto.profile}</textarea>
              </div>
              

<input type="button" value="회원 탈퇴" class="btn btn-danger" onclick="location.href='secession'" >
<input type="submit" class="btn btn-primary" onclick="go_submit()" value="수정" >
<input type="button" class="btn btn-warning" onclick="history.go(-1)" value="뒤로가기">
</fieldset>  
</form>
      
 </div>
          </div>  
        </div>  
        </section>


 </div>
      </div>
      </div>
    </section>

<script src="<%=request.getContextPath()%>/resources/LSH/JS/category.js"></script>
<script>

var global = {
	    i : 0
	};

$(document).ready(initPage);

function initPage() {
	level1();
	show_search_tag();							// 파일불러올때 사용! -- 기존에 있는 카테고리 입력값 버튼생성
}

function getContext(){
	var context = "<%=cp%>";
	return context;
}

function show() {

	var html1 = "<div id='job_list'>",
		html2 = "";

	<c:forEach var="item" items="${command.job}">
		html1 += "<div id="+global.i+">${item} ";
		html1 += "<button id="+global.i+" class='del_btn'>x</button></div>";

		html2 += "<input type='hidden' id='"+global.i+"' name='job' value='${item}'>"
		global.i++;
	</c:forEach>

		html1 += "</div><br><div id='local_list'>";

	<c:forEach var="item" items="${command.local}" >
		html1 += "<div id="+global.i+">${item} ";
		html1 += "<button 'button' id="+global.i+" class='del_btn'>x</button></div>";
		html2 += "<input type='hidden' id='"+global.i+"' name='local' value='${item}'>"
		global.i++;
	</c:forEach>

	html1 += "</div>";

	$('#result').append(html1);
	$('#hidden').append(html2);
}

	</script>	
	
</body>
</html> --%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("euc-kr");
%>
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
<title>정보 수정</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
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
/* /* $(document).ready(function(){
	var textareaVal = $("textarea[name="Profile"]").text();
	console.log(textareaVal);
	  $("textarea[name=Profile]").text("값을 변경합니다.");

 */ 
 $('input:textbox').val();
 $('input:textbox').val("new text message");
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

/* button{  

background:none;
color: black;  
width: 30px;            
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
  background: white;  
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
}   */

.naranhi{
	vertical-align: middle;         
}
.add_btn{
 background:white;
 color:black;
 border-radius: 3px;  
 border: 1px solid #338033;  
 font-size: 18px;         
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
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Modify member information!</h2>
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
<h3 class="display-4 border-bottom probootstrap-section-heading">Modify info</h3>
  

<section class="probootstrap_section bg-light" id="section-contact">
       <div class="container">  
        <div class="row justify-content-center mb-12">  
              
          <div class="col-md-10 justify-content-center probootstrap-animate">
        


<form name="form1" method="post" action="memberUpdate" id="member" class="probootstrap-form probootstrap-form-box mb60" enctype="multipart/form-data">
<fieldset>

<div class="form-group naranhi">
프로필 사진 : <img id="new_img" src="<%=request.getContextPath()%>/aus/userImg/${dto.u_img}" onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.png';" style="width:128px; height:128px; overflow:hidden;"><br>
<input type="file" class="form-control" name="file" id="img_path" accept="image/*" style = "margin-top:10px; text-align: center;">  
<br>        
</div>

<div class="form-group">
<label for="id" class="sr-only sr-only-focusable">ID</label>
<input type="text" class="form-control"name="id" value="${dto.id}" readonly="readonly">
</div>

<div class="form-group">
<label for="passwd" class="sr-only sr-only-focusable">Password</label>
<input class="form-control"name="password" type="password">
</div>

<div class="form-group">
<label for="name" class="sr-only sr-only-focusable">Name</label>
<input type="text" class="form-control" value="${dto.name}"readonly="readonly">
</div>

<div class="form-group">
<label for="id" class="sr-only sr-only-focusable">Phone-number</label>
<input type="text" class="form-control" name="phone" value="${dto.phone}">
</div>

<div class="form-group">
<label for="birth" class="sr-only sr-only-focusable">birth</label>
<input type="date" class="form-control" name="birth" value="${dto.birth}" >
</div>
    
<div class="form-group" style="display:inline">
       <label for="message" class="">선호 지역 </label>  
       <select id="local1" class="show-level2"></select>
       <select id="local12" ></select> 
    </div>        
    <div class="button_moum1 btn-default btn-sm" style="display:inline" >     
       <input type="button" class="add_btn" value="local" >
	</div>    
 <br>     
             
<div class="form-group" style="display:inline">  
       <label for="message" class="">관심 분야 </label>    
       <select id="job1" class="show-level2"></select>
       <select id="job12" ></select>  
     </div>          
     <div class="button_moum1 btn-default btn-sm" style="display:inline">     
       <input type="button"  class="add_btn btn-default" value="job">
</div> 
<br>    
<div class="" title="넘겨질 job과 local" id="hidden" >
    
검색조건
<div id="result" style="margin:10px">
</div>   
</div>  


<div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">자기소개</label>
                <textarea rows="20" class="form-control" id="message" name="profile"  >${dto.profile}</textarea>
              </div>
              
              
      <input type="button" value="회원 탈퇴" class="btn btn-danger" onclick="location.href='secession'" >
<input type="submit" class="btn btn-primary" onclick="go_submit()" value="수정" >
<input type="button" class="btn btn-warning" onclick="history.go(-1)" value="뒤로가기">
</fieldset>  
</form>
      
 </div>
          </div>  
        </div>  
        </section>


 </div>
      </div>
      </div>
    </section>        



<%-- <h1> 정보 수정</h1>
<input type="button" value="회원 탈퇴" onclick="location.href='secession'" >
<fieldset>

<div>
<label> 아이디:</label>
<input name="id" value="${dto.id}" readonly="readonly" />
<br />
<label> 비밀번호:</label>
<input name="password" type="password" class="field" value="" />
<br  />
<label> 이름:</label>
<input name="name" class="field" value="${dto.name}"readonly="readonly" />
<br />
<label> 생년 월 일:</label>
<input type="date" name="birth" class="field "value="${dto.birth}" />
<br />
<label> 핸드폰 번호:</label>
<input name="phone" class="field" value="${dto.phone}" />
</div>

<div>
<label>프로필 사진</label>
<img src="<%=request.getContextPath()%>/aus/userImg/${dto.u_img}">
<input type="file" name="file" accept="image/*"/>
</div>

<div>
<label> 선호 지역:</label>
<select id="local1" class="show-level2"></select>
<select id="local12" ></select>
<button type="button" value="local" class="add_btn">추가</button>
</div>
<div>
<label> 관심 분야:</label>
<select id="job1" class="show-level2"></select>
<select id="job12" ></select>
<button type="button" value="job" class="add_btn">추가</button>
</div>

<div title="넘겨질 job과 local" id="hidden"></div>

검색조건
<div id="result" >
</div>

<div>
<label>자기 소개</label>
<textarea cols="100" rows="8" name="profile">${dto.profile}</textarea>
</div>

<input type="submit" onclick="go_submit()" value="수정" >
<input type="button" class="btn btn-danger" onclick="history.go(-1)" value="뒤로가기">
</fieldset>
</form> --%>

<script src="<%=request.getContextPath()%>/resources/LSH/JS/category.js"></script>
<script>
$(document).ready(initPage);

function initPage() {
	level1();
	show_search_tag();
}

function getPageNum(){
	var pageNum = $('.pagination .active').attr('id');
	return (pageNum === undefined)? 1 : pageNum;
}

function getContext(){
	var context = "<%=cp%>";
	return context;
}

function getSessionId(){
	var sessionid = '${sessionScope.userId}';
	return sessionid;
}

var global = {
	    i : 0
};

function show_search_tag() {

	var html1 = "<div id='job_list'class='inline'>",
		html2 = "";

	<c:forEach var="item" items="${dto.job}">
		html1 += "<span id="+global.i+" style='display: inline-block;'>${item}<span id="+global.i+" class='del_btn'><i class='fa fa-fw fa-times-circle'></i></span></span>";
		html2 += "<input type='hidden' id='"+global.i+"' name='job' value='${item}'>"
		global.i++;
	</c:forEach>
       
		html1 += "</div><br><div id='local_list' class='inline'>";

	<c:forEach var="item" items="${dto.local}" >
		html1 += "<span id="+global.i+">${item}<span id="+global.i+" class='del_btn'><i class='fa fa-fw fa-times-circle'></i></span></span>";
		html2 += "<input type='hidden' id='"+global.i+"' name='local' value='${item}'>"
		global.i++;
	</c:forEach>

	html1 += "</div>";

	$('#result').append(html1);
	$('#hidden').append(html2);
}

$('#img_path').on("change",function(){
    readURL(this);
});

function readURL(input) {
    if (input.files && input.files[0]) {
   		 var reader = new FileReader();

    	 reader.onload = function (e) {
         	$('#new_img').attr('src', e.target.result);
         	i++;
         }
    	 reader.readAsDataURL(input.files[0]);
    }
}



	</script>	
</body>
</html>

<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("euc-kr");
%>
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
   

<title>정보 수정</title>




<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
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
/* /* $(document).ready(function(){
	var textareaVal = $("textarea[name="Profile"]").text();
	console.log(textareaVal);
	  $("textarea[name=Profile]").text("값을 변경합니다.");

 */ 
 $('input:textbox').val();
 $('input:textbox').val("new text message");
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
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Modify member information!</h2>
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
<h3 class="display-4 border-bottom probootstrap-section-heading">Modify info</h3>
  

<section class="probootstrap_section bg-light" id="section-contact">
       <div class="container">  
        <div class="row justify-content-center mb-12">  
              
          <div class="col-md-10 justify-content-center probootstrap-animate">
           




<form name="form1" method="post" action="memberUpdate" id="member" class="probootstrap-form probootstrap-form-box mb60" enctype="multipart/form-data">
<fieldset>  
  
<div class="form-group">
<label for="id" class="sr-only sr-only-focusable">ID</label>
<input type="text" class="form-control"name="id" value="${dto.id}" readonly="readonly">
</div>

<div class="form-group">
<label for="passwd" class="sr-only sr-only-focusable">Password</label>
<input class="form-control"name="password" type="password">
</div>

<div class="form-group">
<label for="name" class="sr-only sr-only-focusable">Name</label>
<input type="text" class="form-control" value="${dto.name}"readonly="readonly">
</div>

<div class="form-group">
<label for="id" class="sr-only sr-only-focusable">Phone-number</label>
<input type="text" class="form-control" name="phone" value="${dto.phone}">
</div>

<div class="form-group">
<label for="birth" class="sr-only sr-only-focusable">birth</label>
<input type="date" class="form-control" name="birth" value="${dto.birth}" >
</div>

<div class="form-group">
<img src="<%=request.getContextPath()%>/aus/userImg/${dto.u_img}">
<input type="file" class="form-control" name="file" accept="image/*" >
</div>





<div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">liked_area</label>  
                <select id="local1" class="show-level2"></select>
                <select id="local12" ></select> 
              </div>  
              <div class="button_moum1" style=" left: 52%; margin-left: 50px;">     
                <button type="button" value="local" class="add_btn" >area추가</button>
                </div>                                                               
                                             
                        
              <div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">관심분야</label>  
                <select id="job1" class="show-level2"></select>
                <select id="job12" ></select>  
              </div>          
              <div class="button_moum1" style=" left: 52%; margin-left: 50px;">     
                <button type="button" value="job" class="add_btn" >분야 추가</button>
                </div> 
                      
              <div title="넘겨질 job과 local" id="hidden"></div>
                           < 검색조건  >   
                <input name="job" value="${dto.job}" /> 
               <div id="result"></div> 
               
               <div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">자기소개</label>
                <textarea rows="20" class="form-control" id="message" name="profile"  >${dto.profile}</textarea>
              </div>
              

<input type="button" value="회원 탈퇴" class="btn btn-danger" onclick="location.href='secession'" >
<input type="submit" class="btn btn-primary" onclick="go_submit()" value="수정" >
<input type="button" class="btn btn-warning" onclick="history.go(-1)" value="뒤로가기">
</fieldset>  
</form>
      
 </div>
          </div>  
        </div>  
        </section>


 </div>
      </div>
      </div>
    </section>

<script src="<%=request.getContextPath()%>/resources/LSH/JS/category.js"></script>
<script>

var global = {
	    i : 0
	};

$(document).ready(initPage);

function initPage() {
	level1();
	show_search_tag();							// 파일불러올때 사용! -- 기존에 있는 카테고리 입력값 버튼생성
}

function getContext(){
	var context = "<%=cp%>";
	return context;
}

function show() {

	var html1 = "<div id='job_list'>",
		html2 = "";

	<c:forEach var="item" items="${command.job}">
		html1 += "<div id="+global.i+">${item} ";
		html1 += "<button id="+global.i+" class='del_btn'>x</button></div>";

		html2 += "<input type='hidden' id='"+global.i+"' name='job' value='${item}'>"
		global.i++;
	</c:forEach>

		html1 += "</div><br><div id='local_list'>";

	<c:forEach var="item" items="${command.local}" >
		html1 += "<div id="+global.i+">${item} ";
		html1 += "<button 'button' id="+global.i+" class='del_btn'>x</button></div>";
		html2 += "<input type='hidden' id='"+global.i+"' name='local' value='${item}'>"
		global.i++;
	</c:forEach>

	html1 += "</div>";

	$('#result').append(html1);
	$('#hidden').append(html2);
}

	</script>	
	
</body>
</html> --%>