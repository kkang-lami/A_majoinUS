<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script src="<%=request.getContextPath() %>/resources/bower_components/bower_components/ckeditor/ckeditor.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="<%=request.getContextPath() %>/resources/bower_components/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<html>
<head>  

<style type="text/css">

  input{
 
 background: none;
 color: #ccc;
 width: 150px;
 height: 30px;
 border: 1px solid #FBFAFA;
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
 
  textarea{
 
 background: none;
 color: #ccc;
 width: 1000px;
 height: 400px;      
 border: 1px solid #D8D8D8;
 font-size: 18px;          
 border-radius: 4px;      
 transition: .6s;
 overflow: hidden;  
 }    
    
 
textarea:hover{
background: #E6E6E6;
cursor: pointer;    
color: white;
  
}
	  
	
 textarea:hover:before {
transform: translateX(300px) skewX(-15deg);
opacity: .6;
transition:.7s;	
}
 
 textarea:hover:after {
transform: translateX(300px) skewX(-15deg);
opacity: 1;    
transition:.7s;	
}
 
 
   
</style>


<title>게시판</title>

<script>
	function writeSave(){
		
	   if(document.writeform.writer.value==""){
			  alert("작성자를 입력하십시요.");
			  document.writeform.writer.focus();
			  return false;
			}
	
		if(document.writeform.subject.value==""){
		  alert("제목을 입력하십시요.");
		  document.writeform.subject.focus();
		  return false;
		}
		
		if(document.writeform.content.value==""){
		  alert("내용을 입력하십시요.");
		  document.writeform.content.focus();
		  return false;
		}

	}   
   



</script>
<%-- <script src="<%=request.getContextPath() %>/resources/bower_components/ckeditor/ckeditor.js"></script> --%>
</head>
<tiles:insertDefinition name="header" />
<body>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->  
    <section class="content-header">
      <h1>
        Inquiry write
        <small>...</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Editors</li>
      </ol>
    </section>  
        <div class="col-md-12">    
          <div class="box box-primary">   
            <div class="box-header with-border">
              <h3 class="box-title">Inquiry-Writing</h3>  
              <div class="box-tools pull-right">
              </div>  
            </div>
            <div class="box-body no-padding">
              <div class="mailbox-controls">
              </div>
              <div class="table-responsive mailbox-messages">
               	<form:form commandName="inqury" method="post" name="writeform">
	<table class="table table-hover table-striped">
	 
		<tr>
			<td>이름
			<input type="text" name="id" value="${sessionScope.name}" readonly><form:errors path="id" />
			</td>  
		</tr>
		<tr>
			<td>제목      
				<input type="text"  maxlength="100" name="i_subject" size="100" required="required"><form:errors path="subject" />			
			</td>
		</tr>
		<tr>
			<td>
				<textarea class="textarea" name="i_content" rows="10" cols="80" required="required"></textarea><form:errors path="content" />
			</td>
		</tr>
		<tr>  
			<td align="center">
				<input type="submit" value="글쓰기" onclick="return writeSave();">
				<!-- <input type="reset" value="재작성"> -->
				<input type="button" value="글목록" onclick="window.location='inquiry_user'">
			</td>
		</tr>
		</tbody>
	</table>
</form:form>
              </div>  
            </div>
            <div class="box-footer no-padding">
              <div class="mailbox-controls">
                <div class="pull-right">
                  Inquiry/EunB
                  
                </div>
              </div>
            </div>
          </div>  
        </div>    
      </div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</body>
</html>