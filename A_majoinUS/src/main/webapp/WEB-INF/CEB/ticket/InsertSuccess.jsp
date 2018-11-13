<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<tiles:insertDefinition name="header" />
</head>
<title>AMAJOINUS</title>
<body>
<script type="text/javascript">
setTimeout(function(){
	location.href="<%=request.getContextPath() %>/aus/MyPoint";}, 7000);
</script>    

</head>    
<body>
  


 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        payment Ongoing
        <small>it all starts here</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">결제완료 페이지</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->  
      <div class="box">
        <div class="box-header with-border">
          

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>  
        <div class="box-body"><p>
        <img src="<%=request.getContextPath() %>/resources/dist/img/wating_loading.gif" style="left: 60%; margin-left: 500px; display: table; ">
          </p>    
                  
<h3 style=text-align:center;>잠시만 기다려 주세요 티켓 구매 진행 중 입니다. 새로고침 시도시 포인트가 재 삭감 될 수 있으니 유의하시기 바랍니다.</h3>         

        <div class="box-footer">
           
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
</div>
    </section>
    <!-- /.content -->
  </div>
        


<tiles:insertDefinition name="left" />
		<tiles:insertDefinition name="footer" />


</body>
</html>