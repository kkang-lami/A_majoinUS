<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>일정 등록하기</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/JEJ/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/JEJ/css/material.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/JEJ/css/bootstrap-material-datetimepicker.css" />
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/resources/JEJ/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/resources/JEJ/js/material.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/resources/JEJ/js/moment-with-locales.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/resources/JEJ/js/bootstrap-material-datetimepicker.js"></script>

		<style>
			body 
			{
				font-family: 'Roboto', sans-serif;
			}
			h2 
			{
				padding: 0 20px 10px 20px;
				font-size: 20px;
				font-weight: 400;
			}
			.form-control-wrapper 
			{
				margin: 10px 20px;
			}
			code 
			{
				padding: 10px;
				background: #eee!important;
				display: block;
				color: #000;
			}
			code > p 
			{
				font-weight: bold;
				color: #000;
				font-size: 1.5em;
			}
			@media(max-width: 300px)
			{
				.well { margin : 0}
			}
		</style>


		<script type="text/javascript">
		$(document).ready(function()
		{
			$('#date-end').bootstrapMaterialDatePicker
			({
				weekStart: 0, format: 'YYYY-MM-DD',
				time : false
			});
			$('#date-start').bootstrapMaterialDatePicker
			({
				weekStart: 0, format: 'YYYY-MM-DD',
				time : false
				
			}).on('change', function(e, date)
			{
				$('#date-end').bootstrapMaterialDatePicker('setMinDate', date);
			});

			$('#min-date').bootstrapMaterialDatePicker({ format : 'YYYY-MM-DD', minDate : new Date() });

			$.material.init()
			
			
			// 폼에 대한 submit 이벤트 처리 --> 입력값 여부 검사를 수행한다.
	        $("#form1").bind("submit", function() {
	            /** 입력여부 검사 */
	            if (!$("#date-start").val()) {
	                alert("시작일을 입력하세요.");
	                $("#date-start").focus();
	                return false;
	            }
	            
	            if (!$("#date-end").val()) {
	                alert("종료일을 입력하세요.");
	                $("#date-end").focus();
	                return false;
	            }
	            
	            if (!$("#content").val()) {
	                alert("내용을 입력하세요.");
	                $("#content").focus();
	                return false;
	            }

	            var url = "<%=request.getContextPath() %>/aus/ProejctRoom/AddSchedule"; 
	            //수정하시오.
    
	            var ajax = $.post(url, $(this).serialize(), function(data) {

	            }).success(function(){
	                alert("성공");
	                opener.parent.location.reload();
	                self.close();  
	            }).fail(function() {
	                alert("실패");
	                opener.parent.location.reload();
	                self.close();
	            }).always(function() {
	                $("#login .loader").hide();
	            });
	            return false;
	        });
			
			
		});
		</script>
		
	</head>    
	<body>
<br /><br />
	
		<div class="container well">
		<h3>일정 등록하기</h3>
		<div class="row">
		<form id="form1" action="SubmitSchedule">
		<!--  -->
		
<!-- 		<div class="container well">
			<div class="row">
				<div class="col-md-6">
					<h2>Date Picker</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-control-wrapper">
						<input type="text" id="date" class="form-control floating-label" placeholder="Date">
					</div>
				</div>

			</div>
		</div> -->
		
		<!--  -->
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12">
							<div class="form-control-wrapper">
								<input type="text" name="s_start" id="date-start" class="form-control floating-label" placeholder="Start Date">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-control-wrapper">
								<input type="text" name="s_end" id="date-end" class="form-control floating-label" placeholder="End Date">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-control-wrapper">
								<input type="text" name="s_content" id="content" class="form-control floating-label" placeholder="일정 내용">
							</div>
						</div>
					</div>
					<!-- <input type="hidden" name="check" value="no" /> -->
					<div style="text-align: center;">
					<div>
					<!-- pj_num 실험용 --><input type="hidden" name="pj_num" value="${pj_num}" />
					<input type="submit" class="form-control" value="등록하기" /></div>
					</div>
					<!--  -->					
				</div>

		</form>
		</div>
		</div>


	</body>
</html>
