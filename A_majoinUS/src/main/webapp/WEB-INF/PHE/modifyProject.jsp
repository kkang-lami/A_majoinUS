<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
           
	
<!DOCTYPE html>
<html>
<head>
<title>프로젝트 수정하기</title>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function chk1() {
	    var url="<%=cp%>/aus/countTicket";
	    var v = document.getElementById("end_d");
		var endD=v.value;
		
		alert("endD : " +endD);
		//alert($("input:checkbox[id='unlimit']").is(":checked"));

		if ($("input:checkbox[id='unlimit']").is(":checked")== true) {
			$.ajax({
						type : "post",
						url : url,
						dataType : "json",
						success : function(args) {
							console.log("티켓개수" + args.ticket);

							if (args.ticket === 0) {
								alert("보유하고 있는 티켓이 없습니다.티켓을 먼저 구매하시고 이용해주세요");
								document.form.unlimit.checked = false;
							} else {
								var result = confirm("보유중인 티켓은 <" + args.ticket + "> 장입니다. 사용하시겠습니까?");
								if (result) {
									var v = document.getElementById("end_d");
									v.type = "hidden";
									v.value = "2099-12-31";
									document.getElementById("end").innerHTML = "무기한";

								} else {
									alert("티켓 사용을 취소합니다.")
									document.form.unlimit.checked = false;
								}
							}

						},
						error : function(e) {
							alert(e.responseText);
						}
					});

			// 체크박스 체크하면 에러

		} else {
			
			alert("티켓사용을 취소합니다.");
			document.form.end_d.disabled = false;
			var v = document.getElementById("end_d");
			var v2 = document.getElementById("end2");
			// 값 바꾸기
			v.value = v2.value;

			//출력
			document.getElementById("end").innerHTML = v2.value;
			
			//document.form.end_d.value = " ";
		}

	}
</script>


<script type="text/javascript">
	function writeFormCheck() {
		var today = new Date();
		
		if (!document.form.pj_name.value) {
			alert("제목을 입력해 주세요!");
			document.form.pj_name.focus();
			return false;
		}

		if (!document.form.mem_limit.value) {
			alert("프로젝트 멤버 수를 선택해 주세요!");
			document.form.mem_limit.focus();
			return false;
		}

		
		if (!document.form.pj_cate.value) {
			alert("관심 분야를 입력해 주세요!");
			document.form.pj_cate.focus();
			return false;
		}
		if (!document.form.pj_loc.value) {
			alert("선호 지역을 입력해 주세요!");
			document.form.pj_loc.focus();
			return false;
		}
		
		return true;
	}
</script>


</head>

<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">



				<h2>프로젝트 수정</h2>
			</section>

				<section class="content">
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="box box-info">

<form name="form" method="post" onSubmit="return writeFormCheck()">
<br>
<br>
<br>
	<table width="1000">
	<tr>
		<td>프로젝트명 : </td>
		<td><input type="text" name="pj_name" class="pj_name" id="pj_name" size="50"  value="${command1.pj_name}"/> </td> 
	</tr>
			
	<tr>
		<td><br>프로젝트소개 : </td>
		<td><br><br><textarea name="pj_info" rows=8 cols=50 style="resize: none;">${command1.pj_info}</textarea></td>
	</tr>
	<tr>
		<td> <br>총원: </td>
		<td>
			<br>
			<select name="mem_limit">
				<option value="" >인원 선택 </option>
				<c:set value="${command1.mem_limit}" var = "memLimit"/>

				<%
					int i;
					for(i=1; i<=20; i++){
				%>
				
				<c:if test="${command1.mem_limit}==<%=i %>"> 
					<option value="${command1.mem_limit}"  selected>${command1.mem_limit}명 </option>
					<%i++; %>
				</c:if>
				<option value="<%=i%>" ><%=i%>명 </option>
				
				<% } %>
			</select>
			
		</td>                                 
	</tr>
	<tr>
		<td> <br>기간 :</td>
		
		<td> <br>
			시작일 : <div id="start" name="start" value="${date.START_D}" style="display: inline-block;"> ${date.START_D}</div><%-- <input type="hidden" id="start_d" name="start_d" value="${date.START_D}"> --%><br>
		 	<br>
		 	종료일 :  
		<c:choose>
			<c:when test="${date.END_D eq '2099-12-31'}">
				무기한 
				
				<input type="hidden" id="end_d" name="end_d" value="${date.END_D}"><br>
					
				<br>
    		</c:when>

			<c:otherwise>
				<div id="end" name="end"  style="display: inline-block;"> ${date.END_D}</div>
				<input type="hidden" id="end_d" name="end_d" value="${date.END_D}">
				<input type="hidden" id="end2" name="end2" value="${date.END_D}">
				<br><input type="checkbox" name="unlimit" id="unlimit" onClick="chk1();"> 무기한
				
			</c:otherwise>		
		</c:choose> 
		
		
			
	</tr>		
				
	<tr>
		<td> <br>관심분야 : </td>
		<td> <br><input type="text" name="pj_cate" size="10" value="${command2.pj_cate}"></td>
	</tr>
	<tr>
		<td> <br>선호지역 : </td>
		<td> <br><input type="text" name="pj_loc" size="10" value="${command3.pj_loc}"> </td>
	</table>
	
	<br><br><br>
	<center><input type="submit" value="입력"></center><br><br><br>
	<%-- 	<c:if test="{sessionScope.id == userId}" /> --%>
	<input type="hidden" name="id" value="${sessionScope.id}"/>
</form>
</div></div></div>
			</section>
		</div>
	</div>
	

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />
</body>
</html>
