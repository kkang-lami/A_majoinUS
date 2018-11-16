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
 <style>
    /* FROM HTTP://WWW.GETBOOTSTRAP.COM
     * Glyphicons
     *
     * Special styles for displaying the icons and their classes in the docs.
     */

    .bs-glyphicons {
      padding-left: 0;
      padding-bottom: 1px;
      margin-bottom: 20px;
      list-style: none;
      overflow: hidden;
    }

    .bs-glyphicons li {
      float: left;
      width: 25%;
      height: 115px;
      padding: 10px;
      margin: 0 -1px -1px 0;
      font-size: 12px;
      line-height: 1.4;
      text-align: center;
      border: 1px solid #ddd;
    }

    .bs-glyphicons .glyphicon {
      margin-top: 5px;
      margin-bottom: 10px;
      font-size: 24px;
    }

    .bs-glyphicons .glyphicon-class {
      display: block;
      text-align: center;
      word-wrap: break-word; /* Help out IE10+ with class names */
    }

    .bs-glyphicons li:hover {
      background-color: rgba(86, 61, 124, .1);
    }

    @media (min-width: 768px) {
      .bs-glyphicons li {
        width: 12.5%;
      }
    }
  </style>

</head>
<tiles:insertDefinition name="header" />
<body>      

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Charge Point/Buy Ticket
        <small>Buying something</small>
      </h1>
       <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Charge Point/Buy Ticket</a></li>  
      </ol>
    </section>
    
    
     <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#fa-icons" data-toggle="tab">Charge Point</a></li>
              <li><a href="#BuyTicket" data-toggle="tab">Buy Ticket</a></li>  
              <li><a href="#accm" data-toggle="tab">AUS Point-accumulate</a></li>
            </ul>  
            <div class="tab-content">
              <!-- Font Awesome Icons -->
              <!-- 처음 패널 -->
              <div class="tab-pane active" id="fa-icons">
                <section id="itPoint">
                  <h4 class="page-header">Must be read it.</h4>
                  <div class="alert alert-info">
                    <ul class="margin-bottom-none padding-left-lg">
                      <li>Point only using the buying ticket,</li>
                      <li>Ticket only using for Project, Only the master has rights.
                      </li>
                      <li> <a href="qna">how to be a marster?</a></li>
                    </ul>  
                    </div>  
                    <div class="Info">
                    <table style="width: 100%; border: 1px; solid; #D8D8D8">
                    <tr><td>
                    </td></tr>
                    </table>  
                  </div>  
                  <div class="row fontawesome-icon-list">
                    </div>
                </section>

                <section id="Point고지 ">
                  <h4 class="page-header">Point-Charge</h4>
                   
                      
                     
                <ul> <li> AMAJOINUS 포인트 충전은 AMAJOINUS 회원이 일정한 대가를 지불하고 AMAJOINUS 이 제공하는 무기한 티켓을 구매하는데 
  사용 가능한 AMAJOINUS 충전포인트를 구매하는 것 을 말합니다.</li>  
<li>※ 충전은 본인인증을 마친 AMAJOINUS 회원만 가능하여, 1원당 1포인트가 충전됩니다.</li>
<li>※ 결제수단은 오직 포인트로만 가능하고 마스터만이 티켓을 사용할 수 있으니, 확인 후 충전하시기 바랍니다.</li>
- AMAJOINUS Point : card
<li>※ 포인트 충전 시 충전 수수료는 부과되지 않으며, 따라서 현금영수증은 발행 해 드리지 않습니다. </li>
해당 카드사에 문의 하시기 바랍니다. 
(ex. 신청금액 1,000 원 = 총 1,000원 결제 → AMAJOINUS POINT 1,000 포인트 충전)
<li>무기한 신청된 프로젝트는 날짜에 구애받지 않으며 티켓은 사라지게 됩니다. 확인은 MyPoint history에서 확인 해 주시기 바랍니다.</li>  
</ul>
                </section>
                
                 <input type="button" value="Payment" class="btn btn-warning pull-center" 
      class="btn btn-primary"  style=" left: 52%; margin-left: 700px;" onclick="document.location.href='<%=request.getContextPath() %>/aus/Payment_write'" >  
            
           
              </div>  
                  
               <!-- 두번째 패널 -->
              <!-- glyphicons-->
              <div class="tab-pane" id="BuyTicket">
                 <section id="Point고지 ">
                  <h4 class="page-header">how to use ticket?</h4>
                <ul class="bs-glyphicons">
                      <li>     
                     <span style="color: #585858">  
                    <i class="fa fa-fw fa-edit fa-5x  fa-pull-left"></i>
                      </span> 
                    <span class="glyphicon-class">Register AMAJOINUS</span>
                  </li>
                  <span style="color: #585858">  
                    <i class="fa fa-fw fa-angle-right fa-5x  fa-pull-left"></i>
                      </span>     
                  <li>      
                       <span style="color: #585858">  
                    <i class="fa fa-fw fa-credit-card fa-5x  fa-pull-left"></i>
                      </span> 
                    <span class="glyphicon-class">Payment Point</span>   
                  </li>  
                  <span style="color: #585858">  
                    <i class="fa fa-fw fa-angle-right fa-5x  fa-pull-left"></i>
                      </span> 
                  <li>  
                   <span style="color: #585858">  
                    <i class="fa fa-fw fa-ticket fa-5x  fa-pull-left"></i>
                      </span> 
                    <span class="glyphicon-class">Buying Ticket</span>  
                  
                  </li>
                  <span style="color: #585858">  
                    <i class="fa fa-fw fa-angle-right fa-5x  fa-pull-left"></i>
                      </span> 
                  <li>
                  <span style="color: #585858" >      
                    <i class="fa fa-fw  fa-child fa-5x  fa-pull-left"></i>
                      </span>   
                    <span class="glyphicon-class">Using Project</span>
                        
                  </li>
                </ul>
                </section>
                <section id="ticket고지 ">  
                  <h4 class="page-header">Ticket-Using</h4>
                       
                <ul> <li> AMAJOINUS 티켓 사용은 AMAJOINUS 회원이 Point를 지불하고 구매한 AMAJOINUS 이 제공하는 무기한 티켓 을 말합니다.</li>  
<li>※ 티켓은 구매하는데에는 제한이 없으나, Project의 master 만이 사용할 수 있기에 신중한 확인 부탁드립니다.</li>
<li>※ Project를 생성하거나 재 편집하는데에 어려움이 있다면 Support menu를 참고하시기 바랍니다.</li>
<ul>- AMAJOINUS notice : 공지사항</ul>
<ul>- AMAJOINUS F&Q : 자주 묻는 질문</ul>  
<ul>- AMAJOINUS talk to us : 1:1 문의</ul>
<li>※ 티켓 구매 혹은 사용시 수수료는 부과되지 않으며, 따라서 현금영수증은 발행 해 드리지 않습니다. </li>
<li>무기한 신청된 프로젝트는 날짜에 구애받지 않으며 티켓은 사라지게 됩니다. 확인은 MyPoint history에서 확인 해 주시기 바랍니다.</li>
<li>티켓의 구매가격은 3000원 입니다. 그 이하라면 구매 되지 않으니 참고바랍니다.</li> 
<li>Ticket은 환불되지 않으며, 사이트 탈퇴시 supports-talk to us 에 문의 바랍니다.</li>  
</ul>
                </section>
                
               
             <button type="button" class="btn btn-warning pull-center" style=" left: 52%; margin-left: 700px;" data-toggle="modal" data-target="#modal-default">
                start buying ticket
              </button>  
              
              
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
          
              </div>    
              <!-- /#ion-icons -->  
              
              <div class="tab-pane" id="accm">    
               <section id="accm point">
                  <h4 class="page-header">How to Earning Miles?</h4>
                  <ul> <li> AMAJOINUS Project 를 마치고 나면 모두를 평가할 수 있는 Evaluation이 나타나게 됩니다. 한 project를 마치고 모든 팀원을 평가하면 10point가 적립됩니다.</li>  
<li>※ 바로 ticket에 적용할 수 있는 가용 miles이며, 따라서 기간내에 project의 모든 Evaluation을 완료해주시기 바랍니다.</li>
<li>※ 다음의 경우에는 member block이 되거나 계정이 삭제될 수 있으니 주의하시기 바랍니다. </li>
<ul>- 계정이 취소되는 사례 : 부정적인 취득이나 해킹을 통한 point update</ul>
<ul>- "" :   error를 발견하였으나 부정취득을 한 사례</ul>  
<ul>- member block : point만을 취득하기 위해 pjoject를 다량 생성 또는 무작위 참가</ul>
해당 사례를 보았을 시 에 사진과 함께 제보해주시는 분께 AMJOINUS Point 를 30000point 증정됨을 알려드립니다.
<li>무기한 신청된 프로젝트는 날짜에 구애받지 않으며 티켓은 사라지게 됩니다. 티켓은 다른 project에서 재사용 되지 않습니다.</li>  
</ul>  
</section>
                   
          </div>
              

            </div>
            <!-- /.tab-content -->


                    
                  </div>  
                  </div>  
                  </div>
                  
                </section>
                
          <!-- /.nav-tabs-custom -->
        </div>
        
        <!-- /.col -->
        
   </body>

<tiles:insertDefinition name="left" />
<tiles:insertDefinition name="footer" />



</html>