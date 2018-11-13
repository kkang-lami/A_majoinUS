<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<tiles:insertDefinition name="header" />
<title>AmajoinUs</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

</head>
<body>
	
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Blank page
        <small>it all starts here</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Blank page</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Title</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
          
          
          
          
<form name="dto" method="post" action="Payment_write">
<table border="1" cellpadding="0" cellspacing="1">
	<tr height="40">
		<td><label for="point" class="col-md-4 col-xs-4">&nbsp;&nbsp;결제이름</label></td>
		<td><input type="text" name="p_name" id="p_name" value="포인트" class="col-md-8 col-xs-8" readonly/></td>
	</tr>
	<tr height="40">
		<td><label for="pg">&nbsp;&nbsp;지원 PG사</label></td>
		<td align="center">
			<select name="pg" id="pg">
				<option value="kakao">카카오페이</option>
				<option value="html5_inicis" selected>KG이니시스(웹표준결제)</option>
				<option value="inicis">KG이니시스(기존모듈)</option>
				<option value="uplus">LG유플러스</option>
				<option value="nice">나이스정보통신</option>
				<option value="jtnet">JTNet</option>
				<option value="danal">다날-휴대폰소액결제전용</option>
				<option value="paypal">페이팔-ExpressCheckout</option>
            </select>
		</td>
	</tr>
	<tr height="40">
		<td width="200"><label for="pay_method">&nbsp;&nbsp;결제수단</label></td>
		<td align="center"><select name="pay_method" id="pay_method" class="col-md-8 col-xs-8">
		<option value="card">신용카드</option></select>
		</td>
	</tr>
	<tr height="40">  
		<td><label for="pay_price" class="col-md-4 col-xs-4">&nbsp;&nbsp;금액</label></td>
		<td><input type="number" min="10" max="30000" name="pay_price" id="pay_price" class="col-md-8 col-xs-8" placeholder="100원은 100포인트 입니다" /></td>
	</tr>  
	
	<tr height="40">
		<td><label for="id" class="col-md-4 col-xs-4">&nbsp;&nbsp;이메일주소</label></td>
		<td><input type="text" name="id" value="${member.id }"  class="col-md-8 col-xs-8" readonly/></td>
	</tr>
	<tr height="40">
		<td><label for="name" class="col-md-4 col-xs-4">&nbsp;&nbsp;성함</label></td>
		<td><input type="text" name="name" value="${member.name }"  class="col-md-8 col-xs-8" readonly/></td>
	</tr>
	<tr height="40">
		<td><label for="phone" class="col-md-4 col-xs-4">&nbsp;&nbsp;전화번호</label></td>
		<td><input type="text" name="phone" value="${member.phone }"  class="col-md-8 col-xs-8" readonly/></td>

	        
<tr height="40">
		<td colspan="2" align="center"><input type="submit" value="포인트 결제하기" ></td>
	
    
	</tr>
</table>
</form>
            
          
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
         <h5>불러오신 정보와 다르시다면 회원 정보 수정에서 수정 후 결제를 진행해주세요</h5>
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	
	
	
	
<!-- 결제 폼 시작 -->

		<tiles:insertDefinition name="left" />
		<tiles:insertDefinition name="footer" />
	
<!-- 결제폼 끝 -->
<br>
</body>
</html>