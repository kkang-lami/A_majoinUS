<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Controller에 session id만 연결하기 --%>
<!DOCTYPE html>
<html>
<head>
<title>AMAJOINUS</title>
<style>
#file {
    display: block;
    visibility: hidden;
    width: 0;
    height: 0;
}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="<%=request.getContextPath() %>/jquery.form.js"></script>
<script>
$(function(){
   $("#upload").click(function(){
       $("#file").click();
   });
   
   $("#file").on('change',function(){
      $("#check").click();
   });
   
    /* $("#check").click(function(){
           var form = $('form')[0];
           var formData = new FormData(form);
               $.ajax({
                  url: '${pageContext.request.contextPath}/aus/ProejctRoom/pr_fileboard',
                  processData: false,
                  contentType: false,
                  data: formData,
                  type: 'POST',
                  success: function(result){
                      alert("업로드 성공!!");
                  }

              });
           }); */
})
</script>
</head>
<body>

   <tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">
            <!-- 들어갈 내용 -->
            <h1>
        자료실
        <small>파일 업로드 및 다운로드 할 수 있습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Projectroom</a></li>
        <li class="active">Data Room</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Data Room</h3>
              <!--  -->
              <div class="box-tools pull-right" style="text-align: right;">  
          <form method="post" enctype="multipart/form-data" action="pr_fileboard">
            <input type="file" id="file" name="file"/><!--  onchange="form.submit()" -->
            <input type="hidden" name="pj_num" value="${pj_num }">
            <input type=button class="btn btn-primary" id="upload" name="upload" value="파일 등록" />
            <input type="submit" id=check name=check hidden/>
         </form>
         </div>
              <!--  -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>  
                <th>no.</th>  
            <th>파일명</th>
            <th>올린사람</th>
            <th>사이즈</th>
            <th>날짜</th>
            <th></th>
                </tr>  
                </thead>
                <c:set var="no" value="1" />
                <tbody>
                <c:forEach var="f_list" items="${f_list }">
               <tr>
                  <td><c:out value="${no}" /></td>
                  <td><a href="pr_fileboard/download?fb_num=${f_list.fb_num }"> ${f_list.filename }</a></td>
                  <td>${f_list.name }</td>
                  <td>${f_list.file_size }</td>
                  <td>${f_list.file_date }</td>
                  <td><a href="pr_fileboard/delete?fb_num=${f_list.fb_num }&pj_num=${f_list.pj_num}">X</a></td>
                  <c:set var="no" value="${no+1}" />
               </tr>
            </c:forEach>
                </tbody>
                
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
            
         </section>
      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="aside" />
   <tiles:insertDefinition name="footer" />


<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- ///////////////////////////////////////right side bar//////////////////////////////////////// -->
<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->

<%--  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><!-- <i class="fa fa-home"></i> --></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">My project menu</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="Main?pj_Num=${pj_num}">
            <i class="menu-icon fa fa-home bg-red"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Home</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="workboard?pj_num=${pj_num}">
            <i class="menu-icon fa fa-fw fa-newspaper-o bg-black"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Work Board</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="pr_fileboard?pj_num=${pj_num }">
            <i class="menu-icon fa fa-fw fa-database bg-yellow"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Data Room</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="chatting?pj_num=${pj_num}">
            <i class="menu-icon fa fa-fw fa-commenting bg-blue"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Chat Room</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="ProjectSchedule?pj_num=${pj_num}">
            <i class="menu-icon fa fa-fw fa-calendar-minus-o bg-purple"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Calendar</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="portfolio?pj_num=${pj_num }">
            <i class="menu-icon fa fa-fw fa-pencil-square bg-green"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Writing portfolio</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="EnR?pj_num=${pj_num }">
            <i class="menu-icon fa fa-fw fa-thumbs-o-up bg-red"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Evaluation and review</h4>
              </div>
            </a>
          </li>
        
        </ul>
        <!-- /.control-sidebar-menu -->
      </div>
      
      
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
<div class="control-sidebar-bg"></div>
 --%>



</body>
</html>
