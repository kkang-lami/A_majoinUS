<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<title>새로운 프로젝트 생성하기</title>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function chk1() {
	    var url="<%=cp%>/aus/PHE/countTicket";
		alert(url);
		alert($("input:checkbox[id='unlimit']").is(":checked"));

		if ($("input:checkbox[id='unlimit']").is(":checked")==true) {
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
									document.getElementById("inHere").innerHTML = "무기한";

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
			var today = new Date()
			document.form.end_d.disabled = false;
			var v = document.getElementById("end_d");
			v.type = "date";
			v.value = today;

			document.getElementById("inHere").innerHTML = "";
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

		if (!document.form.start_d.value || !document.form.end_d.value) {
			alert("프로젝트 기간을 입력해 주세요!");
			document.form.start_d.focus();
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
		if (document.form.start_d.value >= document.form.end_d.value) {
			alert("시작일이 종료일보다 앞설 수 없습니다");
			document.form.start_d.focus();
			return false;
		}
		if (document.form.start_d.value < today) {
			alert("프로젝트의 시작일이 오늘보다 이전일 수 없습니다. 오늘 이후의 날짜를 선택해주세요");
			document.form.start_d.focus();
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


				<h2>새로운 프로젝트 생성</h2>


				<form name="form" method="post" onSubmit="return writeFormCheck()">

					<table width="1000">
						<tr>
							<td>프로젝트명 :</td>
							<td><input type="text" name="pj_name" class="pj_name"
								id="pj_name" size="50" /></td>
						</tr>

						<tr>
							<td>프로젝트소개 :</td>
							<td><textarea name="pj_info" rows=5 cols=20></textarea></td>
						</tr>
						<tr>
							<td>총원:</td>
							<td><select name="mem_limit">
									<option value="" selected>인원 선택</option>
									<%
										int i;
										for (i = 1; i <= 20; i++) {
									%>
									<option value="<%=i%>"><%=i%>명
									</option>
									<%
										}
									%>
							</select></td>
						</tr>
						<tr>
							<td>기간 :</td>
							<td>시작일 : <input type="date" id="start_d" name="start_d"><br>
								종료일 : <input type="date" name="end_d" id="end_d">
								<div id="inHere" style="display: inline-block;"></div> <br>

								<input type="checkbox" name="unlimit" id="unlimit" onClick="chk1();">
								무기한<br>
							</td>

							</td>
						</tr>

						<tr>
							<td>관심분야 :</td>
							<td><input type="text" name="pj_cate" size="10"></td>
						</tr>
						<tr>
							<td>선호지역 :</td>
							<td><input type="text" name="pj_loc" size="10"></td>
					</table>

					<input type="submit" value="입력">
					<%-- 	<c:if test="{sessionScope.id == userId}" /> --%>
					<input type="hidden" name="id" value="${sessionScope.userId}" />
				</form>

			</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</body>
</html>