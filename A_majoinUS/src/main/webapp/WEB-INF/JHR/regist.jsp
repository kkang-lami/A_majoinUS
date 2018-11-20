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
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">AmajoinUs Register!</h2>
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
<h3 class="display-4 border-bottom probootstrap-section-heading">Member register</h3>


  


 <section class="probootstrap_section bg-light" id="section-contact">
       <div class="container">  
        <div class="row justify-content-center mb-12">  
              
          <div class="col-md-10 justify-content-center probootstrap-animate">
            <form action="register" method="post" class="probootstrap-form probootstrap-form-box mb60" enctype="multipart/form-data" onsubmit="return fn_signUp();">
              <div class="row mb-3">
                <div class="col-md-6">
                <!-- 아이디 부분 -->
                  <div class="form-group">
                    <label for="fname" class="sr-only sr-only-focusable">Email/ID</label>
                    <input type="text" class="form-control" id="email" name="id" placeholder="Email/ID" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="lname" class="sr-only sr-only-focusable">인증키 </label>
                    <input type="text" class="form-control" id="idchake" name="lname" placeholder="인증은 필수입니다">
                  </div>
                </div>  
                <div class="col-md-2">
                  <div class="form-group">
                    <input type="button" id="mail" value="인증">   
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label for="password" class="sr-only sr-only-focusable">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="password">
              </div>
              
              <div class="form-group">
                <label for="name" class="sr-only sr-only-focusable">name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="name">
              </div>
              
              <div class="form-group">
                <label for="phone" class="sr-only sr-only-focusable">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="010-1234-1234">
              </div>
              
              <div class="form-group">
                <label for="birth" class="sr-only sr-only-focusable">birth</label>
                <input type="text" class="form-control" id="birth" name="birth"  placeholder="19950330">
              </div>
              
              <div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">자기소개</label>
                <textarea rows="20" class="form-control" id="message" name="profile"  ></textarea>
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
               <div id="result"></div> 
              
              <div class="form-group">
                <label for="photo" class="sr-only sr-only-focusable">profile_photo</label>
                <input type="file" name="file" accept="image/*">  
              </div> 
              
              
              
              <div class="form-group">
                <label for="agree" class="sr-only sr-only-focusable">약관동의</label>
                <textarea rows="20" class="form-control" id="agree" class="signUp-agree-textarea" name="message" readonly="readonly" >
제 1 장 총 칙

 
  
제 1 조 (목적)
이 약관은 AMAJOINUS(이하 "AUS"라 합니다)에서 제공하는 tim_join-service(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.

 

제 2 조 (약관의 효력 및 변경)
① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.

 

제 3 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.

 

제 2 장 서비스 이용계약

 

제 4 조 (이용계약의 성립)
① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.

 

제 5 조 (이용신청)
① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.

 

제 6 조 (이용신청의 승낙)
① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 사이트가 필요하다고 인정되는 경우
③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
나. 이용자 정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우

 

제 7 조 (이용자정보의 변경)
회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.

 

제 3 장 계약 당사자의 의무

 

제 8 조 (사이트의 의무)
① 사이트는 회원에게 각 호의 서비스를 제공합니다.
가. 신규서비스와 도메인 정보에 대한 뉴스레터 발송
나. 추가 도메인 등록시 개인정보 자동 입력
다. 도메인 등록, 관리를 위한 각종 부가서비스
② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.

 

제 9 조 (회원의 의무)
① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
가. 다른 회원의 ID를 부정하게 사용하는 행위
나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위
다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위
라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
마. 범죄와 결부된다고 객관적으로 판단되는 행위
바. 기타 관계법령에 위배되는 행위
② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.
③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.

 

제 4 장 서비스 제공 및 이용

 

제 10 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)
① 아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 사이트에 그 사실을 통보해야 합니다.

 

제 11 조 (서비스 제한 및 정지)
① 사이트는 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
② 사이트는 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지할 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.

 

제5장 계약사항의 변경, 해지

 

제 12 조 (정보의 변경)
회원이 주소, 비밀번호 등 고객정보를 변경하고자 하는 경우에는 홈페이지의 회원정보 변경 서비스를 이용하여 변경할 수 있습니다.

 

제 13 조 (계약사항의 해지)
회원은 서비스 이용계약을 해지할 수 있으며, 해지할 경우에는 본인이 직접 서비스를 통하거나 전화 또는 온라인 등으로 사이트에 해지신청을 하여야 합니다. 사이트는 해지신청이 접수된 당일부터 해당 회원의 서비스 이용을 제한합니다. 사이트는 회원이 다음 각 항의 1에 해당하여 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용고객에게 통지하여 소명할 기회를 주어야 합니다.
① 이용고객이 이용제한 규정을 위반하거나 그 이용제한 기간 내에 제한 사유를 해소하지 않는 경우
② 정보통신윤리위원회가 이용해지를 요구한 경우
③ 이용고객이 정당한 사유 없이 의견진술에 응하지 아니한 경우
④ 타인 명의로 신청을 하였거나 신청서 내용의 허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우
사이트는 상기 규정에 의하여 해지된 이용고객에 대해서는 별도로 정한 기간동안 가입을 제한할 수 있습니다.

 

제6장 손해배상

 

제 14 조 (면책조항)
① 사이트는 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
② 사이트는 회원의 귀책사유나 제3자의 고의로 인하여 서비스에 장애가 발생하거나 회원의 데이터가 훼손된 경우에 책임이 면제됩니다.
③ 사이트는 회원이 게시 또는 전송한 자료의 내용에 대해서는 책임이 면제됩니다.
④ 상표권이 있는 도메인의 경우, 이로 인해 발생할 수도 있는 손해나 배상에 대한 책임은 구매한 회원 당사자에게 있으며, 사이트는 이에 대한 일체의 책임을 지지 않습니다.

 

제 15 조 (관할법원)

 

서비스와 관련하여 사이트와 회원간에 분쟁이 발생할 경우 사이트의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.

 

[부칙]

 

(시행일) 이 약관은 2018년 09월부터 시행합니다.
</textarea>
<hr />    
<input type="checkbox" id="agree-checkbox">약관에 동의
              </div>
              
              <div class="form-group">
                <input type="submit" class="btn btn-primary" id="submit" name="signUpBtn" value="Sign up!">
              
              </div>
            </form>
         </div>
          </div>  
        </div>  
        </section>
      </div>
      </div>
      </div>
    </section>
    <!-- END section -->

<script src="<%=request.getContextPath()%>/resources/LSH/JS/category.js"></script>
<script>
var emailcode;      
$('#mail').on('click',function(){
	var id = document.getElementById('email').value;
      
	var url = "<%=request.getContextPath()%>/aus/sendMail";
	var param = "id="+id;
	 $.ajax({
		type:"post",
		url:url,
		data:param,
		dataType:"json",
		success:function(args){
			alert(args.string);	
			emailcode = args.emailcode;
		}
	});
});

function fn_signUp(){  
	if($("#idchake").val().length < 1){	
		alert("인증키를 입력해주세요");
		return false;
	}
	else if($("#password").val().length < 1){
		alert("패스워드를 입력해주세요.");
		return false;
	}
	else if($("#name").val().length < 1){
		alert("이름을 입력해주세요.");
		return false;
	}
	else if($("#phone").val().length < 1){
		alert("핸드폰 번호를 입력해 주세요.");
		return false;
	}
	else if($("#name").val().length < 1){	
		alert("이름을 입력해주세요.");
		return false;
	}
	else if($("#birth").val().length < 1){
		alert("생년월일을 입력해주세요.");
		return false;
	}
	else if ($("#agree-checkbox").prop("checked") == false){
		alert("약관에 동의해 주시기 바랍니다");	
		return false;
	}
	else{
		if($("#idchake").val() != emailcode){
			alert("인증키가 올바르지 않습니다.");
			return false;
		}
		if($("#idchake").val() == emailcode){
			alert("가입을 환영합니다");
			return true;
		}
	}
}

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
	var sessionid = '${sessionScope.id}';
	return sessionid;
}

var global = {
	    i : 0
};

function show_search_tag() {

	var html1 = "<div id='job_list'class='inline'>",
		html2 = "";

	<c:forEach var="item" items="${dto.job}">
		html1 += "<div id="+global.i+" style='display: inline-block;'>${item} ";
		html1 += "<button id="+global.i+" class='del_btn'>x</button></div>";

		html2 += "<input type='hidden' id='"+global.i+"' name='job' value='${item}'>"
		global.i++;
	</c:forEach>

		html1 += "</div><br><div id='local_list' class='inline'>";

	<c:forEach var="item" items="${dto.local}" >
		html1 += "<div id="+global.i+">${item} ";
		html1 += "<button id="+global.i+" class='del_btn'>x</button></div>";
		html2 += "<input type='hidden' id='"+global.i+"' name='local' value='${item}'>"
		global.i++;
	</c:forEach>

	html1 += "</div>";

	$('#result').append(html1);
	$('#hidden').append(html2);
}

	</script>

</body>
</html>
 --%>
 
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
        <!-- <div class="collapse navbar-collapse" id="probootstrap-menu">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="#">Register</a></li>
            <li class="nav-item"><a class="nav-link" href="#">find my id/pw</a></li>
            <li class="nav-item"><a class="nav-link" href="#">QnA</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Login</a></li>
            </ul>    
            </div>  -->   
        </div>    
        </nav>      
        
        
        <!-- 아래 헤딩 사진단 -->
        <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<%=request.getContextPath() %>/MainTemplate/images/bg_1.jpg');" data-stellar-background-ratio="0.5" id="section-home">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center text-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">AmajoinUs Register!</h2>
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
<h3 class="display-4 border-bottom probootstrap-section-heading">Member register</h3>


      


 <section class="probootstrap_section bg-light" id="section-contact">
       <div class="container">  
        <div class="row justify-content-center mb-12">  
              
          <div class="col-md-10 justify-content-center probootstrap-animate">
            <form action="register" method="post" class="probootstrap-form probootstrap-form-box mb60" enctype="multipart/form-data" onsubmit="return fn_signUp();">
              
                
                <div class="form-group naranhi">
				프로필 사진 : <img id="new_img" src="<%=request.getContextPath()%>/aus/userImg/${dto.u_img}" onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.png';" style="width:128px; height:128px; overflow:hidden;"><br>
				<input type="file" class="form-control" name="file" id="img_path" accept="image/*" style = "margin-top:10px; text-align: center;">  
				<br>        
				</div>
				  
				 <!-- 아이디 부분 -->
		<div class="row mb-3">
			<div class="col-md-6">
                <div class="form-group" >
                    <label for="fname" class="sr-only sr-only-focusable">Email/ID</label>
                    <input type="text" class="form-control" id="email" name="id" placeholder="Email/ID" required>
                </div>
            </div>
            <div class="col-md-4">  
                <div class="form-group"style="display:inline">
                    <label for="lname" class="sr-only sr-only-focusable">인증키 </label>
                    <input type="text" class="form-control" id="idchake" name="lname" placeholder="인증은 필수입니다">
                </div>
            </div>  
                <div class="col-md-2">
                  <div class="form-group">
                    <input type="button" id="mail" value="인증">   
                  </div>
                </div>
		</div>
              <div class="form-group">
                <label for="password" class="sr-only sr-only-focusable">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="password">
              </div>
              <div class="form-group">
                <label for="password" class="sr-only sr-only-focusable">Password confirm</label>          
                <input type="password" class="form-control" id="confirm" name="confirm" placeholder="password confirm"> 
                <p id="pwsame" style="color:red;"></p>
  
              </div>
              
              <div class="form-group">
                <label for="name" class="sr-only sr-only-focusable">name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="name">
              </div>
              
              <div class="form-group">
                <label for="phone" class="sr-only sr-only-focusable">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="010-1234-1234">
              </div>
              
              <div class="form-group">
                <label for="birth" class="sr-only sr-only-focusable">birth</label>
                <input type="text" class="form-control" id="birth" name="birth"  placeholder="19950330">
              </div>
              
              <div class="form-group">
                <label for="message" class="sr-only sr-only-focusable">자기소개</label>
                <textarea rows="20" class="form-control" id="message" name="profile"  ></textarea>
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
                <label for="agree" class="sr-only sr-only-focusable">약관동의</label>
                <textarea rows="20" class="form-control" id="agree" class="signUp-agree-textarea" name="message" readonly="readonly" >
제 1 장 총 칙

 
  
제 1 조 (목적)
이 약관은 AMAJOINUS(이하 "AUS"라 합니다)에서 제공하는 tim_join-service(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.

 

제 2 조 (약관의 효력 및 변경)
① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.

 

제 3 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.

 

제 2 장 서비스 이용계약

 

제 4 조 (이용계약의 성립)
① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.

 

제 5 조 (이용신청)
① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.

 

제 6 조 (이용신청의 승낙)
① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 사이트가 필요하다고 인정되는 경우
③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
나. 이용자 정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우

 

제 7 조 (이용자정보의 변경)
회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.

 

제 3 장 계약 당사자의 의무

 

제 8 조 (사이트의 의무)
① 사이트는 회원에게 각 호의 서비스를 제공합니다.
가. 신규서비스와 도메인 정보에 대한 뉴스레터 발송
나. 추가 도메인 등록시 개인정보 자동 입력
다. 도메인 등록, 관리를 위한 각종 부가서비스
② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.

 

제 9 조 (회원의 의무)
① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
가. 다른 회원의 ID를 부정하게 사용하는 행위
나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위
다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위
라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
마. 범죄와 결부된다고 객관적으로 판단되는 행위
바. 기타 관계법령에 위배되는 행위
② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.
③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.

 

제 4 장 서비스 제공 및 이용

 

제 10 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)
① 아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 사이트에 그 사실을 통보해야 합니다.

 

제 11 조 (서비스 제한 및 정지)
① 사이트는 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
② 사이트는 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지할 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.

 

제5장 계약사항의 변경, 해지

 

제 12 조 (정보의 변경)
회원이 주소, 비밀번호 등 고객정보를 변경하고자 하는 경우에는 홈페이지의 회원정보 변경 서비스를 이용하여 변경할 수 있습니다.

 

제 13 조 (계약사항의 해지)
회원은 서비스 이용계약을 해지할 수 있으며, 해지할 경우에는 본인이 직접 서비스를 통하거나 전화 또는 온라인 등으로 사이트에 해지신청을 하여야 합니다. 사이트는 해지신청이 접수된 당일부터 해당 회원의 서비스 이용을 제한합니다. 사이트는 회원이 다음 각 항의 1에 해당하여 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용고객에게 통지하여 소명할 기회를 주어야 합니다.
① 이용고객이 이용제한 규정을 위반하거나 그 이용제한 기간 내에 제한 사유를 해소하지 않는 경우
② 정보통신윤리위원회가 이용해지를 요구한 경우
③ 이용고객이 정당한 사유 없이 의견진술에 응하지 아니한 경우
④ 타인 명의로 신청을 하였거나 신청서 내용의 허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우
사이트는 상기 규정에 의하여 해지된 이용고객에 대해서는 별도로 정한 기간동안 가입을 제한할 수 있습니다.

 

제6장 손해배상

 

제 14 조 (면책조항)
① 사이트는 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
② 사이트는 회원의 귀책사유나 제3자의 고의로 인하여 서비스에 장애가 발생하거나 회원의 데이터가 훼손된 경우에 책임이 면제됩니다.
③ 사이트는 회원이 게시 또는 전송한 자료의 내용에 대해서는 책임이 면제됩니다.
④ 상표권이 있는 도메인의 경우, 이로 인해 발생할 수도 있는 손해나 배상에 대한 책임은 구매한 회원 당사자에게 있으며, 사이트는 이에 대한 일체의 책임을 지지 않습니다.

 

제 15 조 (관할법원)

 

서비스와 관련하여 사이트와 회원간에 분쟁이 발생할 경우 사이트의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.

 

[부칙]

 

(시행일) 이 약관은 2018년 09월부터 시행합니다.
</textarea>
<hr />    
<input type="checkbox" id="agree-checkbox">약관에 동의
              </div>
              
              <div class="form-group">
                <input type="submit" class="btn btn-primary" id="submit" name="signUpBtn" value="Sign up!">
              
              </div>
            </form>
         </div>
          </div>  
        </div>  
        </section>
      </div>
      </div>
      </div>
    </section>
    <!-- END section -->

<script src="<%=request.getContextPath()%>/resources/LSH/JS/category.js"></script>
<script>
var emailcode;      
$('#mail').on('click',function(){
	var id = document.getElementById('email').value;
      
	var url = "<%=request.getContextPath()%>/aus/sendMail";
	var param = "id="+id;
	 $.ajax({
		type:"post",
		url:url,
		data:param,
		dataType:"json",
		success:function(args){
			alert(args.string);	
			emailcode = args.emailcode;
		}
	});
});

function fn_signUp(){
	var pw = document.getElementById("password").value;
    var pwck = document.getElementById("confirm").value;

	if($("#idchake").val().length < 1){	
		alert("인증키를 입력해주세요");
		return false;
	}
	else if($("#password").val().length < 1){
		alert("패스워드를 입력해주세요.");
		return false;
	}

	else if($("#name").val().length < 1){
		alert("이름을 입력해주세요.");
		return false;
	}
	else if($("#phone").val().length < 1){
		alert("핸드폰 번호를 입력해 주세요.");
		return false;
	}
	else if($("#name").val().length < 1){	
		alert("이름을 입력해주세요.");
		return false;
	}
	else if($("#birth").val().length < 1){
		alert("생년월일을 입력해주세요.");
		return false;
	}
	else if ($("#agree-checkbox").prop("checked") == false){
		alert("약관에 동의해 주시기 바랍니다");	
		return false;
	}
	else if (pw != pwck) {
        alert('비밀번호가 일치하지 않습니다. 다시 입력해 주세요');
        return false;
    }
	else{
		if($("#idchake").val() != emailcode){
			alert("인증키가 올바르지 않습니다.");
			return false;
		}
		if($("#idchake").val() == emailcode){
			alert("가입을 환영합니다"); 
			return true; 
		}
	}         
}

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
	var sessionid = '${sessionScope.id}';
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
 