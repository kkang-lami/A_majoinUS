<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>아이디 찾기</title>
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
</div>
<script>    
$('#sendmail').on('click',function(){
	var name = $('#pw_name').val();
 	var id = $('#pw_id').val();    
 	
	var url = "<%=request.getContextPath()%>/aus/findMail";
	var param = "id="+id+"&name="+name;
	 $.ajax({
		type:"post",
		url:url,
		data:param,
		success:function(args){
			alert('이메일로 임시 비밀번호를 보냈습니다.');	
		}
	});
});
</script>


 </body>
</html>