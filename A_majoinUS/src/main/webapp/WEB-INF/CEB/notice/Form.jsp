<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<title>글목록 보여주기</title>
<style type="text/css">


select {
    width: 100px;  
    height: 30px;
    padding-left: 10px;
    font-size: 18px;  
    color: black;  
    border: 1px dashed #D0CBCB;
    border-radius: 3px;
    -webkit-appearance: none; /* 화살표 없애기 for chrome*/
   -moz-appearance: none;     /* 화살표 없애기 for firefox*/
   appearance: none;  /* 화살표 없애기 공통*/
   background: url('select-arrow.png') no-repeat 95% 50%; /* 화살표 아이콘 추가 */ 
   font: 300 18px/1.5 'Roboto', sans-serif;      
}  
select::-ms-expand {
   display: none;      /* 화살표 없애기 for IE10, 11*/      
}

select option:checked, 
select option:hover {    
    background: #2E2E2E;   
    color: #fff;
}
/* check, hover 스타일 설정 FireFox */
select option:checked,
select option:hover { 
    box-shadow: 0 0 15px 100px #ff00ff inset;  
    color: #fff;
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
          	<!--   
	  <div class="input-group margin">
                <div class="input-group-btn">
                  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Action
                    <span class="fa fa-caret-down"></span></button>
                  <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                  </ul>  
                </div>
                /btn-group
                <input type="text" class="form-control">
              </div>
	  
	   -->
	  
	  
	  
	  
	<br>
	<br>
	<div align="center">
		<form >
		    <select name="string">
		          <option value="subject">제목</option>
		          <option value="content">내용</option>
		    </select>
		         <input type="text" size="15" maxlength="50" name="search"/>&nbsp;
		         <input type="submit" value="검색"/>
		</form>
	</div>  
		

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
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
						${notice.notice_num}
					</td> 
                    <td width="340">				
						<a href="content?num=${notice.notice_num }&pageNum=${currentPage}">${notice.subject}</a>
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
						<div class="btn-group"  style=" left: 56%; margin-left: -200px;" >
							<input type="button" value="글 쓰기" class="btn btn-success" onclick="document.location.href='/AMAJOINUS/aus/writeForm'">
							<input type="button" value="글 목록" class="btn btn-success" onclick="document.location.href='notice'">
						
						</div>
						</p><!-- <a href="writeForm">글쓰기</a> -->
					</td>          
				</div>      
			   
			 
			</section>
		</div>
	
	
	
</body>

<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</html>