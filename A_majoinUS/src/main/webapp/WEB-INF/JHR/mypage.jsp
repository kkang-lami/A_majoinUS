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
</head>
<body>
<form name="form1" method="post" action="memberUpdate" id="member" class="editable" enctype="multipart/form-data">
<h1> 정보 수정</h1>
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
</form>

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