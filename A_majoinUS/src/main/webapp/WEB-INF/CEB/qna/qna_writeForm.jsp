<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<html>
<head>
<title>게시판</title>

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

<script>
	function writeSave(){
	
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

	/* $(function () {
	    // Replace the <textarea id="editor1"> with a CKEditor
	    // instance, using default configuration.
	    CKEDITOR.replace('q_content')
	    //bootstrap WYSIHTML5 - text editor
	    $('.textarea').wysihtml5()  
	  })
 */
	
  
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
        Q&A write
        <small>...</small>  
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Editors</li>
      </ol>
    </section>  
        <!-- /.col -->
        <div class="col-md-12">    
          <div class="box box-primary">
            <div class="box-header with-border">  
              <h3 class="box-title">Qna-writing</h3>  
              <div class="box-tools pull-right">
              </div>  
              <!-- /.box-tools -->  
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-controls">
              </div>
              <div class="table-responsive mailbox-messages">
                 <form:form commandName="qna" method="post" name="qna_writeform" >  
              <table class="table table-hover table-striped">
                  <tbody>
              <tr>    
		    <td >
		    	제 목&nbsp;&nbsp;&nbsp;<input type="text" name="q_subject"  width="100" placeholder="제목을 입력해주세요" required="required">
		    </td>
              </tr>
              <tr></tr>
              
              <tr><td>
              
                    <textarea id="q_content" name="q_content" rows="10" cols="80" required="required">
                                           
                    </textarea>
                    </td></tr>
                    
                    <tr>     
		   <td align="center">
				<input type="submit" value="글쓰기" onclick="return writeSave();"> 
<!-- 				<input type="reset" value="재작성"> -->
	     		<input type="button" value="글목록" onclick="document.location.href='qna'">
		   </td>  
		</tr>
                  </tbody>
                </table>  
              </form:form>  
                <!-- /.table -->
              </div>  
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <!-- <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                </button>
                
                /.btn-group
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button> -->
                <div class="pull-right">
                  Write_Qna/EunB
                  
                  <!-- /.btn-group -->
                </div>
                <!-- /.pull-right -->
              </div>
            </div>
          </div>  
          <!-- /. box -->
        </div>  
        <!-- /.col -->      
      </div>
      <!-- /.row -->

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</body>
</html>