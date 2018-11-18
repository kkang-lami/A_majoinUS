<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ page isELIgnored="false" %> --%>
<!DOCTYPE html>
<html>
<head>
<title>AMAJONINUS</title>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>      
.starR1 {
	background:
		url('<%=request.getContextPath()%>/resources/img/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('<%=request.getContextPath()%>/resources/img/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
      
.eval{
	display:none;
}
        
#img_size{
	width:80px;
	height:80px;
  	overflow:hidden;
}

</style>
</head>
<body>
                
	<tiles:insertDefinition name="header" />
      
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
				<div class="box box-warning">
					<div class="box-header with-border">
						<h3 class="box-title">평가 및 후기</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<form method="post" action="EnR/EnRInsert" name="Review_Eval">
							<div align=center>
								<table>
									<c:set var="no" value="0" />
										<c:forEach var="memberlist" items="${memberList}">
											<tr>	
												<td rowspan=2>
													<div id="img_size">								              
														<img class="img-circle" src="<%=request.getContextPath()%>/aus/userImg/${memberlist.u_img}" style="width:80px; height:80px;" onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.png';">
													</div>
												</td>        
												<td align=center>              
													<h4>${memberlist.name}</h4>
													<input type="hidden" id="id_${sessionScope.id}" name="reviewList[<c:out value="${no}" />].id" value="${sessionScope.id}">
													<input type="hidden" id="target_id_${memberlist.name}" name="reviewList[<c:out value="${no}" />].target_id" value="${memberlist.id}">
												</td>
												<td rowspan=2>      
													<textarea rows="4" cols="100" id="${memberlist.name }_review_content" name="reviewList[<c:out value="${no}" />].review_content" style="resize: none;" placeholder="각 팀원들에 대한 평가란입니다. 당사자와 다른 사람들이 열람할 수 있으니 신중히 작성해주세요." required="required"></textarea>
												</td>
											</tr>
											<tr>
												<td>
													<div class="starRev" id="${memberlist.name}_starRev">
														<input type="text" class="eval" id="${memberlist.name}_eval" name="reviewList[<c:out value="${no}" />].score" value="0.5"> 
														<span class="starR1 on" id="0.5" >별1_왼쪽</span> <span class="starR2" id="1.0">별1_오른쪽</span>
														<span class="starR1" id="1.5">별2_왼쪽</span> <span class="starR2" id="2.0">별2_오른쪽</span> 
														<span class="starR1" id="2.5">별3_왼쪽</span> <span class="starR2" id="3.0">별3_오른쪽</span> 
														<span class="starR1" id="3.5">별4_왼쪽</span> <span class="starR2" id="4.0">별4_오른쪽</span> 
														<span class="starR1" id="4.5">별5_왼쪽</span> <span class="starR2" id="5.0">별5_오른쪽</span>
													</div>
												</td>
											</tr>
											<input type="hidden" name="reviewList[<c:out value="${no}" />].review_num" value="${count+no}">
											<input type="hidden" id="${memberlist.name}_pj_num" name="reviewList[<c:out value="${no}" />].pj_num" value="${memberlist.pj_num}">
											<c:set var="no" value="${no+1}" />
										</c:forEach>
		      							                     
									<tr>        
									<td colspan=3>
										<br>      
										<textarea rows="5" cols="150" id="ra_content" name="ra_content" style="resize: none;" placeholder="관리자에게 따로 남길 말이 있다면 적어주세요.(선택)"></textarea>
										<input type="hidden" id="pj_num" name="pj_num" value="${pj_num}">
									</td>
									</tr>
									<tr>      
										<td colspan=3 align="center"><br>당신의 소중한 리뷰를 남겨주시면 포인트를 드립니다!</td>
									</tr>
									<tr>
										<td colspan=3 align="right"><br><input type="submit" class="btn btn-block btn-warning" value="작성완료"></td>
									</tr>
								</table>        
								</div>
						</form>
						<br>
						      
					</div>
				</div>


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
	              
	              
	              
	                            
<script>        
	$('.starRev span').click(function() {
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
	
		var eval = $(this).attr("id");
		var parent_id = $(this).parent().attr('id');
		var eval_id = $("#"+parent_id+" input[type=text]").attr('id');
		var text = document.getElementById(eval_id);
		text.value=eval;
		
		return false;
	});
</script>
</body>
</html>