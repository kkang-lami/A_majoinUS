<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<tiles:insertDefinition name="header" />
<title>AmajoinUs</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<style type="text/css">
select {
    width: 250px;    
    height: 30px;      
    padding-left: 10px;  
    font-size: 10px;      
    color: black;    
    border: 1px solid #338033;
    border-radius: 3px;
    -webkit-appearance: none;   
   -moz-appearance: none;     
   appearance: none;    
   background: url('select-arrow.png') no-repeat 95% 50%; 
   font: 300 14px/1.5 'Roboto', sans-serif;        
}      

select::-ms-expand {
   display: none;         
   border: 1px dashed #D0CBCB;  
   cursor: pointer;
   font-size: 10px;
}

select option:checked, 
select option:hover {    
    background: #2E2E2E;     
    color: #fff;  
    cursor: pointer;  
    font-size: 10px;
}

select option:checked,
select option:hover { 
    box-shadow: 0 0 15px 100px #ff00ff inset;  
    color: #fff;
    cursor: pointer;  
    font-size: 10px;
}
 
 
</style>
</head>
  
<body>      
  <div class="content-wrapper">
   <!-- Content Header (Page header) -->  
    <section class="content-header">
      <h1>
        Payment-Point
        <small>Buying Point</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">payment</a></li>  
        <li class="active">Point</li>  
      </ol>  
    </section>
    
    <hr />    
    <section class="content">    
    <div class="col-md-12">  
    <div class="box box-success">  
            <div class="box-header with-border">
              <h3 class="box-title">Input Payment Info</h3>
            </div>
            <div class="box-body">  
            
            
            
            <form name="dto" method="post" action="Payment_write">
             <div class="input-group">  
                <span class="input-group-addon">Goods name</span>
                 <input type="text" name="p_name" id="p_name" value="포인트" class="form-control"  readonly/>
              </div>      
              <br>

              <div class="input-group">
                <span class="input-group-addon">Payment method</span>  
                <select name="pay_method" id="pay_method" >
               <option value="card" selected>신용카드</option></select>
              </div>    
              <br>     
                
              <div class="input-group">
                <span class="input-group-addon">지원PG사</span>
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
              </div>  
              <br>     
              
              <p class="margin">금액은 최소10원 단위부터 입력 가능합니다. <code>ex> 100 won</code></p>
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-fw fa-won"></i></span>
                <input type="number" min="10" max="30000" name="pay_price" id="pay_price"class="form-control" />
              </div>
              <br>  
              
              <h4>My Register Info</h4>  
              
              <div class="input-group">
                <span class="input-group-addon">Email/Id</span>
                <input type="text" name="id" value="${member.id }" class="form-control"  readonly/>
              </div>
              <br>  
                
              <div class="input-group">
                <span class="input-group-addon">name</span>
                <input type="text" name="name" value="${member.name }" class="form-control"  readonly/>
                
              </div>  
              <br> 
              
              <div class="input-group">  
                <span class="input-group-addon">phone_number</span>
                <input type="text" name="phone" value="${member.phone }" class="form-control"  readonly/>
              </div>
              <br>     
                    <input type="submit" class="btn btn-success" id="submit" style=" margin-left: 760px;"value="포인트 결제하기">    
                                    
                    </form>            
              </div>
              <div class="box-footer">
         <h5>불러오신 정보와 다르시다면 <code><a href="aus/">회원 정보 수정</a></code>에서 수정 후 결제를 진행해주세요</h5>
        </div>  
              <!-- /input-group -->
            </div>
            
            <!-- /.box-body -->
          </div>  
          </section>
          <!-- /.box -->  
</div>    

 
</body>
<tiles:insertDefinition name="left" />
      <tiles:insertDefinition name="footer" />
</html>