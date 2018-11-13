<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<tiles:insertDefinition name="header" />
<title>AMAJOINUS</title>

</head>  

<body>
  <div class="content-wrapper">
   <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        My Point History
        <small>it all Points here</small>
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
      <div class="box box-success">
        <div class="box-header with-border">
          <h3 class="box-title"><i class="fa fa-fw fa-google-wallet"></i>Point</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>  
        <div class="box-body">
        <strong>
<h3 class="sub-header" style=text-align:center;> <i class="fa fa-fw fa-optin-monster"></i> happy to meet!! <i class="fa fa-fw fa-angle-left"></i>
 ${sessionScope.name } <i class="fa fa-fw fa-angle-right"></i> . currently you are point is  ${myPoint }point   !</h3>
</strong>  
<hr />
<p style="text-align:center;">포인트사용내역(결제시도 : ${count })&nbsp;&nbsp;&nbsp;&nbsp;현재 사용가능 티켓(개수 : ${count1 })</p>        </div>

<%-- <c:when test="${empty myPoint}"> --%>      
<p style=" left: 56%; margin-left: -200px;">         
            
               
            <div class="box-body">    
            <c:set var="no" value="1" /> 
	        <c:if test="${count == 0}">    
              <table class="table table-bordered">
                <tr>  
                  <th>번호</th>
                  <th>유저</th>
                  <th>업데이트일</th>
                  <th>유형</th>
                  <th>업데이트 포인트</th>
                  <th>총 포인트</th>
                </tr>
                <tr>     
					<td colspan="6" align=center>
						포인트 이용내역이 없습니다
					</td>
				</tr>
			</table>
			</c:if>
			
            <c:if test="${count > 0}">
            <table class="table table-bordered">
                <tr>
                  <th>번호</th>
                  <th>유저</th>  
                  <th>업데이트일</th>
                  <th>유형</th>
                  <th>업데이트 포인트</th>  
                  <th>총 포인트</th>
                </tr>
            
            <c:forEach var="point" items="${pointList}">  
            <%-- <c:out value="${no}" /> --%>
					
					<tr>
                    <td align="center" width="250"> 
						${no}  
					</td> 

					<td align="center" width="250"> 	  		
						${point.id}
					</td>
					<td align="center" width="250"> 
						${point.update_date}  
					</td>  
					<td align="center" width="250">    
						${point.type}  
					</td>      
					<td align="center" width="250">
						${point.update_point}  
					</td>          
					<td align="center" width="250">
						${point.after_point}       
					</td>
					<c:set var="no" value="${no+1}" />
				</tr>
				
			</c:forEach>			
		</table>
	</c:if>     
	<br>
            </div>
            <!-- /.box-body -->
				<!-- 들어갈 내용 -->
	
	
	<div align="center">
		<c:if test="${count > 0}">
		   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
		   <!-- pageCount:11 -->
		   <c:set var="pageBlock" value="${10}"/>
		   <!-- pageBlock:10 -->
		   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
		   <!-- result:0 -->
		   <c:set var="startPage" value="${result * 10 + 1}" />
		   <!-- startPage:1 -->
		   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
		   <!-- endPage:10 -->
		   <c:if test="${endPage > pageCount}">
		        <c:set var="endPage" value="${pageCount}"/>
		        <!-- endPage:10 -->
		   </c:if>
		         
		   <c:if test="${startPage > 10}">
		       <c:if test="${search1 != 1 }">
		   	   		<a href="MyPoint?pageNum=${startPage - 10 }">[이전]</a>
		   	   </c:if>
		   	   <c:if test="${search1 == 1 }">
		   	   		<a href="MyPoint?pageNum=${startPage - 10 }&search=${search}&string=${string}">[이전]</a>
		   	   </c:if>	
		   </c:if>  
		
		   <c:forEach var="i" begin="${startPage}" end="${endPage}">
		   	   <c:if test="${search1 != 1 }">
		   	   		<a href="MyPoint?pageNum=${i}">[${i}]</a>
		   	   </c:if>
		   	   <c:if test="${search1 == 1 }">
		   	   		<a href="MyPoint?pageNum=${i}&search=${search}&string=${string}">[${i}]</a>
		   	   </c:if>				   	   
		   </c:forEach>     
		
		   <c:if test="${endPage < pageCount}">
		   	   <c:if test="${search1 != 1 }">
		   	   		<a href="MyPoint?pageNum=${startPage + 10}">[다음]</a>
		   	   </c:if>
		   	   <c:if test="${search1 == 1 }">
		   	   		<a href="MyPoint?pageNum=${startPage + 10 }&search=${search}&string=${string}">[이후]</a>
		   	   </c:if>
		   </c:if>
		</c:if>	
	</div>
	  
	<br>
			 
			 	<div class="box-footer">
					<td>
					<p>
						<div class="btn-group"  style=" left: 56%; margin-left: -200px;" >
							<input type="button" value="포인트 충전하기" class="btn btn-success" onclick="document.location.href='<%=request.getContextPath() %>/aus/Payment_write'">
							<input type="button" value="티켓 사기" class="btn btn-success" onclick="document.location.href='<%=request.getContextPath() %>/aus/buying'">
						
						</div>
						</p>	
					</td>        
				</div>    
			   
			 
			</section>
		</div>
	

<!-- <박스 푸터> -->

			
    

<tiles:insertDefinition name="left" />
<tiles:insertDefinition name="footer" />

</body>
</html>
            