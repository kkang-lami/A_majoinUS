<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ page isELIgnored="false" %> --%>
<!DOCTYPE html>
<html>
<head>
<title>AMAJONINUS</title>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
        
          
#input_img, #attached_file {
    display: block;
    visibility: hidden;
    width: 0;
    height: 0;
}

#img_path{
	display: none;
}

img {
	max-width: auto;
	height: 155px;
	vertical-align: middle;
}

img:hover{
	opacity:0.5;
}

#imgtag{
	position:relative;
}   

#img_del{
  position:absolute;
  text-align:center;
  font-size:2.3em;
  color:red;
  user-select:none;
  opacity:0;
}

#img_del:hover{
	opacity:1.0;
}     
    
              
.add_img{
	position:absolute;
	left:50%; 
	transform:translateX(-50%);
	text-align:center;
	vertical-align:middle; 
	height: 155px; 
	overflow:hidden;

}     

</style>
</head>
<body>

<tiles:insertDefinition name="header" />
	
	<div class="wrapper">
		<div class="content-wrapper">
		
		
			<section class="content-header">
				<h4>포트폴리오 작성</h4><hr/>
				<div class="box box-danger">
					<div class="box-header with-border">     
						<form class="form-horizontal" method="post" enctype="multipart/form-data" action="edit_complet" name="edit_pf">
							<div class="box-body">
								<div class="form-group">
				                	<label for="subject" class="col-sm-1 control-label">제 목</label>
				                	<div class="col-sm-11">     
				                		<input type="text" class="form-control" id="subject" name="subject" placeholder="포르폴리오의 제목을 입력하세요" value="${portfolio.subject}">
				                	</div>
				                </div>
				                
								<div class="form-group">
				                	<label for="tech_info" class="col-sm-1 control-label">구현기능</label>
				                	<div class="col-sm-5">
				                		<input type="text" class="form-control" id="tech_info" name="tech_info" placeholder="구현한 기능을 입력해주세요" value="${portfolio.tech_info }">
				                	</div>
				                	<label for="project_date" class="col-sm-1 control-label">시작일</label>
				                	<div class="col-sm-2">
				                		<input type="date" class="form-control" id="start_d" name="start_d" value="${portfolio.start_d}"> 
				                	</div>
				                	<label for="project_date" class="col-sm-1 control-label">종료일</label>             
				                	<div class="col-sm-2">
										<input type="date" class="form-control" id="end_d" name="end_d" value="${portfolio.end_d}">
				                	</div>        
				                </div>
				                              
			                     <div class="form-group">
				                     <label for="blank" class="col-sm-1 control-label"></label>
				                 	<div class="col-sm-9">
					                 	<input type="text" class="form-control" id="file_path" name="file_path" value="${portfolio.file_path}" disabled>
				               	 	</div>
				               	 	<div class="col-sm-2">
				      	 	           	<input type="button" id="add_file" name="add_file" class="btn btn-block btn-primary" value="첨부파일">
				      	 	           	<input type="file" id="attached_file" name="attached_file" >
				               	 	</div>
				               	 </div>    
				               	     
				               	<c:set var="count" value="0" />            
				                <div id="portfolio">
				                	<c:forEach var="port_detail" items="${detail}">     	             
		                              <div class='form-group'>
			                              <div class='col-sm-4' id='imgtag'>
				                              <div class='add_img'>
				                         	     <img id='img_' src="<%=request.getContextPath()%>/aus/pofol_Img/${port_detail.pd_img}">
				                         	     <input type="hidden" name="oldlist[<c:out value="${count}" />].pd_img" value="${port_detail.pd_img}">
				                              </div>
				                              <div id='img_del' onclick='img_delete(this);'>
				                             	 <img id='deltag' src='<%=request.getContextPath()%>/resources/img/deltag.png' >
				                              </div>
			                              </div>
			                              <div class='col-sm-8'>
			                           		<textarea id='detail_' name='oldlist[<c:out value="${count}" />].pd_content' class='form-control' rows='7' placeholder='Enter ...' style='resize: none;' >${port_detail.pd_content}</textarea>
			                              </div>
			                               <input type="hidden" name="oldlist[<c:out value="${count}" />].pd_num" value="${port_detail.pd_num }">
		                              </div>
		                              <c:set var="count" value="${count+1}" />
		                        	</c:forEach>
                       			</div>     
                       			
                       			<div id="img_path">
                       				<%-- <input type='file' id='pd_img_0' name='portList[0].pd_img' accept='image/*'>
									<input type='file' id='pd_img_1' name='portList[1].pd_img' accept='image/*'>
									<input type='file' id='pd_img_2' name='portList[2].pd_img' accept='image/*'> --%>
                       			</div>     
                       			    
                       			<div class="form-group">
                       				<div class="col-sm-1">
										<input type=button id="photoplus" class="btn btn-block btn-default" value="사진 추가">
                       				</div>
                       				<div class="col-sm-5"></div>
                       				<label for="p_private" class="col-sm-2 control-label">공개여부</label>
                       				<div class="col-sm-2">
											<input type="checkbox" id="p_private" name="p_private">
									</div>
                       				<div class="col-sm-2">
                       					<input type="hidden" name="port_num" value="${port_num }">
										<button type="submit" class="btn btn-block btn-danger">작성완료</button>
									</div>
                       			</div>
							</div>
						</form>
					</div>
            	</div>
   
			</section>
		</div>
	</div>         
      
	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />

	
<script>

if('${portfolio.p_private}' == 'on'){
	$('#p_private').prop('checked',true);
}


var i = 0;
$('#photoplus').on('click',function(){
	$('#img_path').append("<input type='file' class='tag_add' id='pd_img_"+i+"' name='portList["+i+"].pd_img' accept='image/*'>");
	$('#pd_img_'+i).click();

});
               
$('#img_path').on("change",'.tag_add',function(){
    readURL(this);
});

function readURL(input) {
    if (input.files && input.files[0]) {
    	$('#portfolio').append("<div class='form-group'><div class='col-sm-4' id='imgtag'><div class='add_img' id='"+i+"'><img id='img_"+i+"'></div><div id='img_del' onclick='img_delete(this);'><img id='deltag' src='<%=request.getContextPath()%>/resources/img/deltag.png' ></div></div><div class='col-sm-8'><textarea id='detail_"+i+"' name='portList["+i+"].pd_content' class='form-control' rows='7' placeholder='Enter ...' style='resize: none;' ></textarea></div></div>"); 
   		 var reader = new FileReader();

    	 reader.onload = function (e) {
         	$('#img_'+i).attr('src', e.target.result);
         	i++;
         }
    	 reader.readAsDataURL(input.files[0]);
    }
}

function img_delete(obj){
	var detail = $(obj).parent().parent();
    detail.remove();
}

$('#add_file').on('click',function(){
	 $("#attached_file").click();
});
        
$("#attached_file").on('change',function(){
	var path = $('#attached_file').val();
	var text = document.getElementById('file_path');
	text.value=path;
});


</script>
</body>
</html>