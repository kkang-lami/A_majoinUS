<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolioContent</title>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">
         <h1>
        	포트폴리오 상세보기
        <small></small>
      </h1>
      </section>

<section class="content">

 <div class="row">
        
            <div class="box-header with-border">
              <h3 class="box-title">  ${portfolioContent.subject} </h3>
           	</div>
           	
           	<!-- /.box-header -->
            <div class="box-body">
               <dl class="dl-horizontal">
                <dt> 구현 기능</dt>
                <dd>${portfolioContent.tech_info}</dd>
                
                <dt>기간 </dt>
                <dd><fmt:parseDate value="${portfolioContent.start_d}" var="start" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	<fmt:formatDate value="${start}" pattern="yy/MM/dd"/> 
	~ 
	<fmt:parseDate value="${portfolioContent.end_d}" var="end" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	<fmt:formatDate value="${end}" pattern="yy/MM/dd"/></dd>
	
                <dt>화면 캡쳐 및 상세 설명</dt>
									<dd>
									<table>
										<c:forEach items="${portfolioContent_detail}"
											var="portfolioContent_detail">
											<tr><td><img src="<%=request.getContextPath() %>/aus/pofol_Img/${portfolioContent_detail.pd_img}" width="500" height="250"  /></td>
												<%-- onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.jpg';" --%>
												<td>${portfolioContent_detail.pd_content}</td>
											
										</c:forEach>
										</table>
									</dd>
									
				<dt>공개여부</dt>
                <dd> ${portfolioContent.p_private} </dd>
				
				<dt>첨부파일</dt>
                <dd> <a href="download?file_path=${portfolioContent.file_path}">${portfolioContent.file_path}</a>  </dd>
              </dl>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          </section>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      <!-- END TYPOGRAPHY -->
 <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />


</body>
</html>