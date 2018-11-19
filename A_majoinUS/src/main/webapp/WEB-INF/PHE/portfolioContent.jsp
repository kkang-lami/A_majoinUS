<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
												onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.jpg';"
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
</html> --%>

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
<style type="text/css">
td {padding:15px !important;}
table{
border-spacing:0 10px;
border-collapse:separate;	
padding:15px;
}
</style>
<script>
//이미지 클릭시 원본 크기로 팝업 보기
function doImgPop(img){ 
 img1= new Image(); 
 img1.src=(img); 
 imgControll(img); 
} 
  
function imgControll(img){ 
 if((img1.width!=0)&&(img1.height!=0)){ 
    viewImage(img); 
  } 
  else{ 
     controller="imgControll('"+img+"')"; 
     intervalID=setTimeout(controller,20); 
  } 
}

function viewImage(img){ 
 W=img1.width; 
 H=img1.height; 
 O="width="+W+",height="+H+",scrollbars=yes"; 
 imgWin=window.open("","",O); 
 imgWin.document.write("<html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head>");
 imgWin.document.write("<body topmargin=0 leftmargin=0>");
 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
 imgWin.document.close();
}
</script>
</head>
<body>
<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<h2>
					포트폴리오 상세보기 <small> 완료된 프로젝트의 포트폴리오 입니다. </small>
				</h2>
				<hr>
				<div class="box box-danger">
					<div class="box-header with-border">
						
							<%-- <div class="box-body">
				                	<label for="subject" class="col-sm-1 control-label">제 목</label>
				                		${portfolioContent.subject}
				                
								<div class="form-group"  width=841 height=50>
				                	<label for="tech_info" class="col-sm-1 control-label">구현기능</label>
				                	<div class="col-sm-5">
				                		${portfolioContent.tech_info}
				                	</div>
				                	<label for="project_date" class="col-sm-1 control-label">시작일</label>
				                	<div class="col-sm-2">
				                		<fmt:parseDate value="${portfolioContent.start_d}" var="start" pattern="yyyy-MM-dd HH:mm:ss.S"/>
										<fmt:formatDate value="${start}" pattern="yy/MM/dd"/> 

				                	</div>
				                	<label for="project_date" class="col-sm-1 control-label">종료일</label>             
				                	<div class="col-sm-2">
										<fmt:parseDate value="${portfolioContent.end_d}" var="end" pattern="yyyy-MM-dd HH:mm:ss.S"/>
										<fmt:formatDate value="${end}" pattern="yy/MM/dd"/> 
				                	</div>  
				                	
										<c:forEach items="${portfolioContent_detail}"var="portfolioContent_detail">
									
											<div class="col-sm-4" id="imgtag">
													<img
														src="<%=request.getContextPath() %>/aus/pofol_Img/${portfolioContent_detail.pd_img}" />
												<div class="col-sm-8">
													<textarea class="form-control" rows="7"
														style="resize: none;">
	                              				${portfolioContent_detail.pd_content}
	                              			</textarea>
												</div>
											</div>
									</c:forEach>       
									</div>
				                </div> --%>

							<div class="box-body">
								<dl class="dl-horizontal">
									<dt>구현 기능</dt>
									<dd>${portfolioContent.tech_info}</dd>
									<br/>

									<dt>기간</dt>
									<dd>
										<fmt:parseDate value="${portfolioContent.start_d}" var="start"
											pattern="yyyy-MM-dd HH:mm:ss.S" />
										<fmt:formatDate value="${start}" pattern="yy/MM/dd" />
										~
										<fmt:parseDate value="${portfolioContent.end_d}" var="end"
											pattern="yyyy-MM-dd HH:mm:ss.S" />
										<fmt:formatDate value="${end}" pattern="yy/MM/dd" />
									</dd>
									<br/>

									<dt>화면 캡쳐 및 상세 설명</dt>
									<dd>
										<table>
											<c:forEach items="${portfolioContent_detail}"
												var="portfolioContent_detail">
												<tr>
													<td><br>
													<img
														src="<%=request.getContextPath() %>/aus/pofol_Img/${portfolioContent_detail.pd_img}"
														width="500" height="250" onclick="doImgPop('<%=request.getContextPath() %>/aus/pofol_Img/${portfolioContent_detail.pd_img}')"/></td>
													<%-- onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.jpg';" --%>
													<td width="500" height="250">${portfolioContent_detail.pd_content}</td>
											</c:forEach>
										</table>
									</dd>
									<br/>

									<dt>공개여부</dt>
									<dd>${portfolioContent.p_private}</dd>
									<br/>

									<dt>첨부파일</dt>
									<dd>
										<a href="download?file_path=${portfolioContent.file_path}">${portfolioContent.file_path}</a>
									</dd>
									<br/>
									
								</dl>
							</div>


							<%--  <c:forEach items="${portfolioContent_detail}"var="portfolioContent_detail">
									<div id="portfolio">
										<div class="form-group">
											<div class="col-sm-4" id="imgtag">
												<div class="add_img" id="0">
													<img
														src="<%=request.getContextPath() %>/aus/pofol_Img/${portfolioContent_detail.pd_img}" />
												</div>
												<div class="col-sm-8">
													<textarea class="form-control" rows="7"
														style="resize: none;">
	                              				${portfolioContent_detail.pd_content}
	                              			</textarea>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>     --%>
					</div>
				</div>
			</section>
		</div>

	</div>


	<tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />



</body>
</html>