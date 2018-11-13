<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<title>상세보기</title>
<style>
</style>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	//. = class, # = id 

    function checkForm(){
    	 var ticketform = document.forms['ticketform'];
    	 var mypoint = ${member.total_point};
 	    if( ticketform['ticket'].value.length < 1) {
 	        alert( '구입할 수량을 입력해 주세요. ');
 	        return false; 
 	    }    
 	   if( mypoint - 3000 < 0) {
	        alert( '티켓을 사기에 포인트가 충분하지 않습니다.');
	        return false;   
	    } 
    	    
    }
	


</script>
</head>
<tiles:insertDefinition name="header" />


 <div class="content-wrapper">
    <section class="content-header">
      <h1>  
         Charge Point/Buy Ticket
        <small>Buying something</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="indes.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Charge Point/Buy Ticket</li>
      </ol>
    </section>
    
    <section class="content">        
      <div class="callout callout-info">
      
        <h4><i class="fa fa-fw fa-quote-left" style="color:#373638"></i>Reminder!<i class="fa fa-fw fa-quote-right" style="color:#373638"></i></h4>
        
        
        Ticket only using for Project, Only the master has rights.
        <h4><a href="aus/qna">how to be a marster?</a></h4>
      </div>
    
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

              
             
   <!-- /.col -->
        <div class="col-md-5 text-center content-center" >  
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user" >
            <!-- Add the bg color to the header using any of the bg-* classes -->
             <div class="widget-user-header">
              <img onclick="location.href='Payment_write'" src="<%=request.getContextPath() %>/resources/dist/img/credit-card-851506_1920.jpg"
              style="cursor:pointer;" align="center" width="600" height="150">  
             
             
             <!-- onclick="location.href='aus/Payment_write'" -->
              <h3 class="widget-user-username">Buying Point</h3>
              <!-- <h5 class="widget-user-desc">Founder &amp; CEO</h5> -->
            </div>
            
            
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-4 border-right">
                  <div class="description-block">
                  <!-- footer -->
              <!--       <h5 class="description-header">3,200</h5>
                    <span class="description-text">SALES</span> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
 
        <!-- /.col -->
        <div class="col-md-5 text-center ">
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget  widget-user">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-black" id="ticket"
              align="center"
            style="background: url('<%=request.getContextPath() %>/resources/dist/img/admission-2974645_1920.jpg') center center cursor:pointer;" >
              <h3 class="widget-user-username">Buying Ticket</h3>
            </div>
            <div class="box-footer">
              <div class="row">
                 
                   <div class="row">
        <div class="col-xs-12">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Ticket for, use the vanish in time limit</h3>
            </div>
              <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
                start ticket
              </button>
            </div>      
          </div>
        </div>
    
        <div class="modal fade" id="modal-default">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Buying ticket</h4>
              </div>
              <div class="modal-body">
          
                <form name="ticketform" onsubmit="return checkForm();" action="buy_ticket" method="post">              
                <table class="table">  
                <tr>  
                <td>결제아이디</td>
                <td><input class="form-control" id="id" name="id" readonly="readonly" value="${member.id }"></td>
                </tr>    
                <tr>  
                <td>결제자</td>
                <td><input class="form-control" id="name" name="name" readonly="readonly" value="${member.name }"></td>
                </tr>
                <tr>  
                <td>결제항목</td>
                <td><input class="form-control" id="ticket_name" readonly="readonly" value="AMAJOINUS_ticket"></td>
                </tr>    
                <tr>
                <td>AMAJOINUS 무기한 티켓 가격</td>
                <td><input class="form-control" id="ticket_point" readonly="readonly" value="3000"></h6></td>
                </tr>  
                <tr>
                <td>결제가능 포인트</td>    
                <td><input class="form-control" id="ticket_im_point" name="ticket_im_point" readonly="readonly" value="${member.total_point}"></td>
                </tr>
                <tr>          
                <td>결제갯수</td>
                <td><input class="form-control"  type="number" id="ticket" name="ticket" placeholder="구매할 개수를 입력 해 주세요"
                 min="1" max="1"  style="color:#999">  
                  </td>    
                </tr>
                <tr><td>      
                <h6 class="text-center">잔액이 부족하다면 <a href="Payment_write">포인트 결제</a>를 먼저 해 주시기 바랍니다.</h6>
                </td></tr>
                <div class="box box-default">
                <div class="box-header with-border">
                <h4>This is to inform you that unlimited tickets are available only to the Master.
                I recommend that you be delegated a master, or create a project.</h4> 
                  </div>
                  </div>
             </table>
             
              <div class="modal-footer">
                <button type="button" class="btn btn-info pull-left" data-dismiss="modal">Cancel</button>
                <input type="submit" class="btn btn-success" id="submit" value="submit" >
                </div>
               <!--  버튼에 마지막 insert_ticket 이동 연결시켜주기 -->
              </form> 
              </div>
                
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
              
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.widget-user -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!--   <div class="box-footer">
     footer    
        </div> -->
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
</div>

    <!-- /.content -->
    
    
	</body>

<tiles:insertDefinition name="left" />
<tiles:insertDefinition name="footer" />



</html>