<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>       
.starR1 {
	background:
		url('<%=request.getContextPath()%>/resources/img/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('<%=request.getContextPath()%>/resources/img/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
</style>
</head>
<body>
	세션 1 은 test.amajo@gmail.com !

	<form method=post action="dateTest">
		<input type="date" id="ed" name="ed"> <input type="button" onclick="change();" value="날짜 체인지!"> <input type="submit">
	</form>

	<div class="starRev">
		<input type="text" id=eval name=eval> 
		<span class="starR1 on" id="0.5">별1_왼쪽</span> <span class="starR2" id="1.0">별1_오른쪽</span>
		<span class="starR1" id="1.5">별2_왼쪽</span> <span class="starR2" id="2.0">별2_오른쪽</span> 
		<span class="starR1" id="2.5">별3_왼쪽</span> <span class="starR2" id="3.0">별3_오른쪽</span> 
		<span class="starR1" id="3.5">별4_왼쪽</span> <span class="starR2" id="4.0">별4_오른쪽</span> 
		<span class="starR1" id="4.5">별5_왼쪽</span> <span class="starR2" id="5.0">별5_오른쪽</span>
	</div>
	    
	<img src="<%=request.getContextPath()%>/aus/getImg/user3-128x128">
	<!--	프로젝트이름 / servlet-pattern / RequestMapping value / 파일명 -->
	
	<img src="<%=request.getContextPath()%>/aus/getImg/1541487038963_ico_review">
	
	
	
<script>        
	$('.starRev span').click(function() {
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		var eval = $(this).attr("id");
		var text = document.getElementById('eval');
		text.value=eval;
		return false;
	});
</script>

</body>
</html>