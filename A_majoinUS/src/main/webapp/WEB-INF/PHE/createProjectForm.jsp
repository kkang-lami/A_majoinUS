<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<style>

</style>
<title>새로운 프로젝트 생성하기</title>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function chk1() {
	    var url="<%=cp%>/aus/countTicket";
		//alert(url);
		//alert($("input:checkbox[id='unlimit']").is(":checked"));

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
		alert("프로젝트의 기간은 수정할 수 없습니다.")

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
	<!-- 전체영역 -->
	<div class="wrapper">
		<!-- 콘텐츠 헤더 -->
		<div class="content-wrapper">
			<section class="content-header">
				<h2>새로운 프로젝트 생성</h2>
			</section>

				<section class="content">
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="box box-info">
				<form name="form" method="post" onSubmit="return writeFormCheck()">
				<br>
				<br>
				<br>
					<center>

					<table width="1000">
						<tr>
							<td>프로젝트명 :</td>                               
							<td><input type="text" name="pj_name" class="pj_name"
								id="pj_name" size="50" />
								<br></td>
						</tr>

						<tr>
							<td>프로젝트 소개  :</td>
							<td><br><textarea name="pj_info" rows=8 cols=50 style="resize: none;"></textarea></td>
						</tr>
						<tr>
							<td><br>총원:</td>
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
							<td><br>기간 :</td>
							<td><br>시작일 : <input type="date" id="start_d" name="start_d"><br>
								<br>종료일 : <input type="date" name="end_d" id="end_d">
								<div id="inHere" style="display: inline-block;"></div> <br>

								<br><input type="checkbox" name="unlimit" id="unlimit" onClick="chk1();">
								무기한<br>
							</td>

							</td>
						</tr>

						<tr>
							<td><br>관심분야 :</td>
							<td><br><input type="text" name="pj_cate" size="10"></td>
						</tr>
						<tr>
							<td><br>선호지역 :</td>
							<td><br><input type="text" name="pj_loc" size="10"></td>
					</table></center>

					<!-- 관심직종 -->
					<div class="form-group">
						<label for="job1" class="col-sm-2 control-label">관심분야</label>
						<div class="col-sm-10">
							<select id="job1" class="show-level2"></select> <select
								id="job12"></select>
							<button type="button" value="job" class="add_btn">추가</button>
						</div>
					</div>
					
					<!-- 선호지역 -->
					<div class="form-group">
						<label for="local1" class="col-sm-2 control-label">선호직역</label>
						<div class="col-sm-10">
							<select id="local1" class="show-level2"></select> <select
								id="local12"></select>
							<button type="button" value="local" class="add_btn">추가</button>
						</div>
					</div>
					
					<div title="넘겨질 job과 local" id="hidden" ></div>
					<hr>
					검색조건
					<div id="result" ></div>

					<center><br><br><input type="submit" value="입력" class="btn btn-primary" width="50px"/><br><br></center>
					<%-- 	<c:if test="{sessionScope.id == id}" /> --%>
					<input type="hidden" name="id" value="${sessionScope.id}" />
				</form>
			</div></div></div>
			</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
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
			var sessionid = '${sessionScope.id}';
			return sessionid;
		}
		
		var global = {
			    i : 0
		};
		               
		function show_search_tag() {

			var html1 = "<div id='job_list' class='inline'>",
				html2 = "";

			<c:forEach var="item" items="${command.job}">
				html1 += "<div class="gogo" id="+global.i+"  style='display: inline-block;'>${item}<button id="+global.i+" class='del_btn'>x</button></div>";
				html2 += "<input type='hidden' id='"+global.i+"' name='job' value='${item}'>"
				global.i++;
			</c:forEach>

				html1 += "</div><br><div id='local_list' class='inline'>";

			<c:forEach var="item" items="${command.local}" >
				html1 += "<div id="+global.i+">${item}<button 'button' id="+global.i+" class='del_btn'>x</button></div>";
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