<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<tiles:insertDefinition name="header" />
<title>AMAJOINUS</title>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	                 
  	
var IMP = window.IMP;
IMP.init('imp10827131');
IMP.request_pay({  
    pg : 'inicis',
    pay_method : 'card',   
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '${payment.p_name}',
    amount : '${payment.pay_price}',
    buyer_email : '${payment.id}',
    buyer_name :  '${payment.name}',
    buyer_tel : '${payment.phone}',
    m_redirect_url : 'InsertSuccess.jsp'
    
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        alert(msg); 
        setTimeout(location.href="<%=request.getContextPath() %>/aus/Insert_Impuid?imp_uid="+rsp.imp_uid+"&pay_price="+${payment.pay_price}+"&pay_no="+${pay_no}, 0);
                           
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;   
        setTimeout(location.href="<%=request.getContextPath() %>/aus/Fail")  
    }  
}); 

</script>


<tiles:insertDefinition name="left" />
		<tiles:insertDefinition name="footer" />
	
</body>
</html>
