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
<title>회원 가입</title>        
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
 $(document).ready(function() {
	$("#signUpBtn").unbind("click").click(function(e) {
		e.preventDefault();
		fn_signUp();
	});
});
function fn_signUp(){
	if ($("#agree_checkbox").prop("checked") == false)
		{
		alert("약관에 동의해 주시기 바랍니다");
		}
	else if($("idchake").val().length < 1)
		{
		alert("인증키를 입력해주세요")
		}
	else if($("name").val().length < 1)
		{
		alert("이름을 입력해주세요.")
		}
	else if($("phone").val().length < 1)
		{
		alert("핸드폰 번호를 입력해 주세요.")
		}
}

	 
	 <%-- function sendMail(){
			String id = document.getElementById('id').value;
			var url = "<%=request.getContextPath()%>/aus/JHR/sendMail";
			var param = "id="+id;
			$.ajax({
				type:"post",
				url:url,
				data:param,
				success:function(args){
									
				}
			});
			
			
			
		} --%>
</script>
</head>

<body>

<h1>회원가입</h1>
<form action="register" method ="post" enctype="multipart/form-data" >

<table class="regist-list">

<tr>
<td colspan="3" class="signUp-agree">약관동의</td>
</tr>
<tr>
<td colspan="3" class="signUp-agree-textarea">
<textarea cols="100" rows="20" readonly="readonly">들어가야 할 내용 쓰는 곳
</textarea></td>
</tr>
<tr>
<td colspan="3" class="signUp-agree-checkbox">
<input type="checkbox" id="argree-checkbox">약관에 동의</td>
</tr>

<tr>
<td> 이메일 :</td>
<td><input type="text" id="email" name="id" required/>
<input type="button" id="mail" value="인증">
</td></tr>    
        
<tr>
<td> 이메일 인증번호 :</td>
<td><input type="text" placeholder="이메일 인증 필수" ></td></tr>

<tr>
<td> 비밀번호 : </td>
<td><input type="text" name="password" ></td></tr>
      
<tr>
<td> 이름 : </td>
<td><input type="text" name="name" ></td></tr>

<tr>
<td> 핸드폰 번호 : </td>
<td><input type="text" name="phone" placeholder="예:010-1234-1234"></td>
</tr>

<tr>
<td>생년월일 :</td>
<td><input type="date" name="birth" size="10" placeholder="예:19990505"></td>
</tr>



<tr>
<td>자기소개</td></tr>
<tr>
<td colspan="3" class="self-introduction-textarea">
<textarea cols="100" rows="8" name="profile"></textarea>
</td>
</tr>

 
<tr>
<td>프로필 사진</td>
</tr>
<tr>
<td><input type="file" name="file" accept="image/*"></td></tr>

<tr>
<td>선호 지역: </td>
<td>
<select id="local1" class="show-level2"></select>
<select id="local12" ></select>
<button type="button" value="local" class="add_btn">추가</button>
</td>
</tr>
<tr>
<td>관심 분야 : </td>
<td>
<select id="job1" class="show-level2"></select>
<select id="job12" ></select>
<button type="button" value="job" class="add_btn">추가</button>
</td>
</tr>

<tr>
<td>
<div title="넘겨질 job과 local" id="hidden"></div>
검색조건
<div id="result">
</div>
</td>
</tr>

<tr>
<td><input type="submit" name="signUpBtn" value="회원가입" /></td>
<td>
<input type="reset" value="취소" onclick="history.go(-1)" /><!-- //a href="./loginMain" -->
</td></tr>


</table>
</form>

<script src="<%=request.getContextPath()%>/resources/LSH/category.js"></script>
<script>
            
$('#mail').on('click',function(){
	var id = document.getElementById('email').value;
        
	var url = "<%=request.getContextPath()%>/aus/JHR/sendMail";
	var param = "id="+id;
	 $.ajax({
		type:"post",
		url:url,
		data:param,
		success:function(args){
			alert('이메일 인증 번호를 보냈습니다.');	
		}
	});
});

	var global = {
		    i : 0
		};
	
	$(document).ready(initPage);
	
	function initPage() {
		level1();
		show();								// 파일불러올때 사용! -- 기존에 있는 카테고리 입력값 버튼생성
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
</html>
