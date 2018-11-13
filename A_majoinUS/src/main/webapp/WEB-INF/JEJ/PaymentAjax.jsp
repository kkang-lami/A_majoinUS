<%-- <%@ page contentType="text/html; charset=UTF-8"%> --%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.time.LocalDate" %>
<c:set var="now_year" value="<%= LocalDate.now().getYear()%>" />

<!DOCTYPE html>
<html>
<head>
<title>결제 내역</title>

<style>
.hihi {
	height: 34px;
}
</style>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	function eunju(){
	

         $(".sdd").each(function() {
            $(this).remove();
         });
	
		var year = $("#d_yy").val();
		var month = $("#d_mm").val();		
		$.ajax({
			url:"PaymentAjax",
			method:"post",
			data:{d_mm:month, d_yy:year},
			dataType:"json",
			success:function(args){
				//var reg_date = args.data[0].reg_date;
				//var reg = "<c:set var='reg' value='${fn:substring("+reg_date+",0,10)}' />'";
								
				if(args.data.length>0){
	            for (var idx = 0; idx < args.data.length; idx++) {  
	            	var reg123 = args.data[idx].reg_date;
	            	var substrValue = reg123.substr(0,10);
	            		            	
	               	$("#ej").append("<tr class='sdd'>");
                	$("#ej .sdd:eq("+idx+")").append("<td>"+args.data[idx].id+"</td>");
                	$("#ej .sdd:eq("+idx+")").append("<td>"+args.data[idx].p_name+"</td>");
                	$("#ej .sdd:eq("+idx+")").append("<td>"+args.data[idx].pay_price+"원</td>");
                	//var reg1 = 자르기함수(args.data[idx].reg_date,0,19);
                	
                	$("#ej .sdd:eq("+idx+")").append("<td>"+substrValue+"</td>");
                	/* $("#ej .sdd:eq("+idx+")").append("<td>"+reg+"</td>"); */
                	//$("#ej .sdd:eq("+idx+")").append("<td><c:set var='reg' value='${fn:substring("+args.data[idx].reg_date+",0,10)}' />"+
           		 
                	
                
	             }
				}
				else{
					$("#ej").append("<tr class='sdd'>");
                	$(".sdd").append("<td colspan='4' align='center'>"+"결제 내역이 존재하지 않습니다."+"</td>");
				}
			},
			fail:function(){
				alert("실패");
			},
	        error : function(e) {
	            alert(e.responseText);
	         }
		});
		
	}
	
</script>
</head>
<body>
<tiles:insertDefinition name="header" />
<div class="wrapper">
	<div class="content-wrapper">
		<section class="content-header">
			<!-- 들어갈 내용 -->	
		<h1>
        결제 내역
        <small>회원들의 전체 결제 내역을 확인합니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">MyPage</a></li>
        <li class="active">Payment List</li>
      </ol>
    </section>
<!-- content 시작! -->


<!-- Main content -->
    <section class="content">
		<div class="col-md-10"> <!-- style="text-align:center" -->
		<form action="./PaymentAjax">
		<select name="d_yy" id="d_yy" required>
			<option selected value="${d_yy}" hidden>${d_yy+2000}</option>
			<c:forEach var="i" begin="0" end="${now_year-2005}">
				<option value="${now_year-i-2000}">${now_year-i}</option>
			</c:forEach>
		</select>년도
		
		<select name="d_mm" id="d_mm" required onchange="eunju()">
			<option selected value="${d_mm}" hidden>${d_mm}</option>
			<c:forEach var="i" begin="1" end="12" step="1">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select>월
			<!-- <input type="submit" value="조회" /> -->
		</form>
		
		
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">${d_yy+2000}년 ${d_mm}월 결제 내역</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">

                <table class="table no-margin">
                  <thead>
                  <tr>

	<th>결제회원ID</th>
	<th>결제아이템</th>
	<th>결제금액</th>
	<th>결제일자</th>
                  </tr>
                  </thead>
                  <tbody id="ej">

	 <c:forEach items="${paylist}" var="pay">
	<tr class="sdd">
		<td>${pay.id}</td>
		<td>${pay.p_name}</td>
		<td>${pay.pay_price}원</td>
		<td><c:set var="reg" value="${fn:substring(pay.reg_date,0,10)}" />
		 ${reg}
		</td>
	</tr>
	</c:forEach> 
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <!-- <div class="box-footer clearfix">
              <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>
              <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a>
            </div> -->
            <!-- /.box-footer -->
          </div>


</div>
		<!--  -->
		</section>
	</div>
</div>
<tiles:insertDefinition name="left" />
<tiles:insertDefinition name="footer" />
</body>
</html>