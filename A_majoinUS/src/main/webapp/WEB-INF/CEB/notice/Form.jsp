<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<title>공지사항</title>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<style type="text/css">  


select {
    width: 100px;  
    height: 30px;  
    padding-left: 10px;
    font-size: 18px;  
    color: black;    
    border: 1px solid #338033;
    border-radius: 3px;
    -webkit-appearance: none;   
   -moz-appearance: none;     
   appearance: none;  
   background: url('select-arrow.png') no-repeat 95% 50%; 
   font: 300 18px/1.5 'Roboto', sans-serif;      
}  

select::-ms-expand {
   display: none;         
   border: 1px dashed #D0CBCB;  
   cursor: pointer;
}

select option:checked, 
select option:hover {    
    background: #2E2E2E;     
    color: #fff;  
    cursor: pointer;
}

select option:checked,
select option:hover { 
    box-shadow: 0 0 15px 100px #ff00ff inset;  
    color: #fff;
    cursor: pointer;
}
 
 
   
 input{
 
 background: none;
 color: #ccc;
 width: 150px;
 height: 30px;
 border: 1px solid #338033;
 font-size: 18px;
 border-radius: 4px;
 transition: .6s;
 overflow: hidden;
 }
   
 
	input:hover{
background: #338033;
cursor: pointer;
color: white;
  
}
	
	
 input:hover:before {
transform: translateX(300px) skewX(-15deg);
opacity: .6;
transition:.7s;	
}
 
 input:hover:after {
transform: translateX(300px) skewX(-15deg);
opacity: 1;
transition:.7s;	
}
    
</style>  

</head>
	
	
<body>
<tiles:insertDefinition name="header" />

 <div class="content-wrapper">
   <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Notice
        <small>...</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">supports</a></li>  
        <li class="active">Notice</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box --> 
      <div class="box box-success">
        <div class="box-header with-border">
          <h3 class="box-title"><i class="fa fa-fw fa-bullhorn"></i>Notice</h3>
  
	<br>
	<div align="right" class="search">
		<form >  
		    <select name="string" class="accordion">
		          <option value="subject">제목</option>
		          <option value="content">내용</option>
		    </select>
		         <input type="text" size="15" maxlength="50" name="search"/>&nbsp;
		         <input type="submit" value="검색" class="btn btn-success btn-sm"/>
		</form>    
	</div>  

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
          </div>  
        </div>  
        <div class="box-body">
<hr />
<p style="text-align:center;">NOTICE(ALL_CONTENTS : ${count })</p>        </div>
<p style=" left: 56%; margin-left: -200px;">         
            
               
            <div class="box-body">  
            <c:set var="no" value="1" />   
	        <c:if test="${count == 0}">    
              <table class="table table-bordered">
                <tr>  
                <th></th>
                  <th>NO</th>
                  <th>SUBJECT</th>
                  <th>WRITE_DATE</th>  
                  <th></th>
                </tr>
                <tr>
				<th>
					찾으시는 내용이 없습니다. 
				</th>
			</tr>
			</table>
			</c:if>
            <c:if test="${count > 0}">
            <table class="table table-bordered">
                <tr>
                 <th></th>
                  <th>NO </th>
                  <th>SUBJECT</th>  
                  <th>WRITE_DATE</th>  
                   <th></th>
                </tr>  
                <c:forEach var="notice" items="${noticeList}">  
            <%-- <c:out value="${no}" /> --%>
					<tr>
					<td></td>
					<td width="250">				
						${no}    
					</td> 
                    <td width="340">				
						<a href="content?num=${notice.notice_num }&pageNum=${currentPage}"  data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#modal-default">${notice.subject}</a>
					</td>   
					
					<td align="center" width="340">
						${notice.notice_date}
					</td> 
					<td></td>
					<c:set var="no" value="${no+1}" />
				</tr>
			</c:forEach>			
		</table>
	</c:if>     
	<br>
            </div>
            <!-- /.box-body -->
				<!-- 들어갈 내용 -->
				   
				
		<div class="modal fade" id="modal-default">
          <div class="modal-dialog">
            <div class="modal-content">
              </div>    
            </div>
          </div>  
				
				
				
	
	
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
		   	   		<a href="notice?pageNum=${startPage - 10 }">[이전]</a>
		   	   </c:if>
		   	   <c:if test="${search1 == 1 }">
		   	   		<a href="notice?pageNum=${startPage - 10 }&search=${search}&string=${string}">[이전]</a>
		   	   </c:if>	
		   </c:if>  
		
		   <c:forEach var="i" begin="${startPage}" end="${endPage}">
		   	   <c:if test="${search1 != 1 }">
		   	   		<a href="notice?pageNum=${i}">[${i}]</a>
		   	   </c:if>
		   	   <c:if test="${search1 == 1 }">
		   	   		<a href="notice?pageNum=${i}&search=${search}&string=${string}">[${i}]</a>
		   	   </c:if>				   	   
		   </c:forEach>     
		
		   <c:if test="${endPage < pageCount}">
		   	   <c:if test="${search1 != 1 }">
		   	   		<a href="notice?pageNum=${startPage + 10}">[다음]</a>
		   	   </c:if>
		   	   <c:if test="${search1 == 1 }">
		   	   		<a href="notice?pageNum=${startPage + 10 }&search=${search}&string=${string}">[이후]</a>
		   	   </c:if>
		   </c:if>
		</c:if>	
	</div>
	  
	  
	  
	 	<div class="box-footer">  
					<td>
					<p>
						<div class="btn-group"  style=" left: 53%; margin-left: -200px;" >
						<c:if test="${sessionScope.id eq 'amajoinus@gmail.com'}">
							<input type="button" value="글 쓰기" class="btn btn-success" onclick="document.location.href='<%=request.getContextPath() %>/aus/writeForm'">
							</c:if>
							<input type="button" value="글 목록" class="btn btn-success" onclick="document.location.href='notice'">
						
						</div>
						</p>  
					</td>          
				</div>      
			   
			 
			</section>  
		</div>
	
</body>

<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</html>