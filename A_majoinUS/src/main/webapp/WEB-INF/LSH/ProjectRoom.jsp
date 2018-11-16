<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>프로젝트룸</title>
</head>
<body>
<div class="wrapper">
	<tiles:insertDefinition name="header" />
	<tiles:insertDefinition name="left" />

	<!-- 전체영역 -->
	<div class="content-wrapper">
	
		<!-- 콘텐츠 헤더 -->
		<section class="content-header">
			<h1>${list[0].PJ_NAME}</h1>
		</section>		
	
		<!-- 콘텐츠 -->
		<section class="content">
		
			<!-- 진행도 -->
			<div class="row">
			  <div class="col-md-12 col-sm-12 col-xs-12">
					<div class="info-box">
						<span class="info-box-icon bg-aqua"><i class="ion-ios-chatbubble-outline"></i></span>
						<div class="info-box-content">
					    	<span class="info-box-text">프로젝트 진행도</span>
					    	<span class="info-box-number">${list[0].percent}<small>%</small></span>
					    	<div class="progress"><div class="progress-bar" style="width: ${list[0].percent}%"></div></div> 
					 		<span class="progress-description">프로젝트 종료까지 ${list[0].d_day}일 남았습니다<small> (${list[0].END_D})</small></span>
					  	</div>
					</div>
			  </div>
			</div>
	
			<!-- 맴버 목록 -->
			<div class="row">
			 <div class="col-md-12 col-sm-12 col-xs-12">
			  <div class="box box-info">
				  
				    <!-- 멤버목록 헤더 -->
				    <div class="box-header with-border">
				    	<h3 class="box-title">프로젝트 멤버</h3>
				    	<div class="box-tools pull-right">
				    		<c:if test="${sessionScope.id eq list[0].LEADER and list[0].d_day >= 0}">
				    			<a href="#" data-toggle='modal' data-target='#modal-leader'>
				    			<span class="label label-danger"><i class="fa fa-fw fa-cog"></i>멤버 관리</span>
				    			</a>
							</c:if>
				    		<span class="label label-info">${fn:length(list)} Members</span>
				    	</div>
				    </div>
				    
				    <!-- 프로필 -->
				    <div class="box-body no-padding">
					    <ul class="users-list clearfix">
						<c:forEach var="item" items="${list}" begin="0" end="3" step="1">
						<li>
							<img src="<%=request.getContextPath() %>/aus/userImg/${item.U_IMG}" alt="User Image" onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.png';" style="width: 128px; height:128px; overflow:hidden;">
							<c:if test="${item.BLACKLIST eq 'NO'}">
							<a id="${item.MEM_ID}" class="user_btn users-list-name" href="#" data-toggle='modal' data-target='#modal_user'>${item.NAME}</a>
							</c:if>
							<c:if test="${item.BLACKLIST ne 'NO'}">
							<a id="${item.MEM_ID}" class="user_btn users-list-name ban" href="#" data-toggle='modal' data-target='#modal_user' >
								<i class="fa fa-fw fa-ban"></i>${item.NAME}</a>
							</c:if>
							<span class="users-list-date">${item.MEM_ID}</span>
						</li>
						</c:forEach>
					    </ul>
					    
					    <div class="collapse" id="collapse">
					    <ul class="users-list clearfix">
						<c:forEach var="item" items="${list}" begin="4" step="1">
						<li>
							<img src="<%=request.getContextPath() %>/aus/userImg/${item.u_img}" alt="User Image" onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.png';">
							<c:if test="${item.BLACKLIST eq 'NO'}">
							<a id="${item.MEM_ID}" class="user_btn users-list-name" href="#" data-toggle='modal' data-target='#modal_user'>${item.NAME}</a>
							</c:if>
							<c:if test="${item.BLACKLIST ne 'NO'}">
							<a id="${item.MEM_ID}" class="user_btn users-list-name ban" href="#" data-toggle='modal' data-target='#modal_user' >
								<i class="fa fa-fw fa-ban"></i>${item.NAME}</a>
							
							</c:if>
							<span class="users-list-date">${item.MEM_ID}</span>
						</li>
						</c:forEach>
					    </ul>
					    </div>
				    </div>
				    
				    <!-- 모든 프로필 보기 -->		          
				    <div class="box-footer text-center">
				        <a data-toggle="collapse" href="#collapse" aria-expanded="false" aria-controls="collapseExample">View All Users</a>
				    </div>
				    
			  </div>
			 </div>
		    </div>

			<!-- 업무 상황표 -->
			<div class="row">
			 <div class="col-md-12 col-sm-12 col-xs-12">
	          <div class="box box-info">
	          
				<div class="box-header with-border"><h3 class="box-title">업무 상황표</h3></div>
				
				
				<div class="box-body">
				  <div class="table-responsive">
				  
				    <table class="table no-margin">
				      <thead>
				      <tr>
				        <th>팀원</th>
				        <th>담당업무</th>
				        <th>진행</th>
				        <th>지연</th>
				        <th>완료</th>
				      </tr>
				      </thead>
				      <tbody>
				      	<c:forEach var="item" items="${list}">
					      <tr>
					        <td>${item.NAME}</td>
					        <td>${item.total}</td>
					        <td>${item.ONGOING}</td>
					        <td>${item.DELAY}</td>
					        <td>${item.COMPLETE}</td>
					      </tr>
						</c:forEach>
				      </tbody>
				    </table>
				    
				  </div>
				</div>
	            
	          </div>
	         </div>
			</div>
	
			<!-- 프로필 모달 -->
			<div id="getUserModal"></div>
			
			<!-- 멤버 관리 모달 -->
			<div class="modal fade" id="modal-leader">
			 <div class="modal-dialog list-inline">
			   <div class="modal-content">
			            
		        	<div class="modal-header red">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title">멤버 관리</h4>
		    		</div>
			              
		        	<div class="modal-body">
		        	
						<!-- About Me Box -->
						<div class="box box-info">
							<div class="box-header with-border"><strong>멤버 목록</strong><small>(${fn:length(list)-1})</small></div>

							<div class="box-body">
								<select multiple="" class="form-control" style="height: 164px;">
								<c:forEach var="item" items="${list}" begin="1">
					           	<option>${item.MEM_ID}(${item.NAME})</option>
								</c:forEach>
								</select>
								
								<hr>
				              	<div class="col-md-6">
				              		<button type="button" id="transfer" class="l_check_btn btn btn-info btn-block"><b>팀장 위임</b></button>
				              	</div>
								<div class="col-md-6">
									<button type="button" id="kick" class="l_check_btn btn btn-danger btn-block"><b>멤버 추방</b></button>
								</div>
							</div>
						</div>
						
					</div>
			  </div>
	         </div>
		    </div>

		    <!-- 체크 모달 -->
			<div class="modal fade check_modal" id="modal-check">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title"></h4>
			</div>

			<div class="modal-body text-center"></div>

			<div class="modal-footer">
				<a href="#" class="send_btn btn btn-danger pull-left" id="${list[0].PJ_NUM}">OK</a> <a
					href="#" class=" btn btn-default" data-dismiss="modal">CANCLE</a>
			</div>
		</div>
	</div>
</div>

		    <!-- 모달 경고  -->
			<div class="modal fade check_modal" id="modal-warn">
		     <div class="modal-dialog modal-sm">
		    	<div class="modal-content">
		            
		        	<div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title"></h4>
		    		</div>
		              
		        	<div class="modal-body text-center">
						<p>멤버를 선택하세요</p>
						<hr>
						<button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
		           	</div>
	            </div>
		     </div>
	        </div>
		    
		</section>
	</div>		
	<!-- /content-wrapper -->
</div>
<!-- /wrapper -->

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
<script src="<%=request.getContextPath()%>/resources/LSH/profile_modal.js"></script>
<script>

	$(document).ready(initPage);
	
	function initPage() {
		$("#getUserModal").load(getContext()+"/resources/LSH/modal_profile.html");
		$('.user_btn:first').prepend('<small class="badge bg-red">Leader</small>');
		$('.ban').attr('data-toggle','');
	}
 
	function getContext(){
		var context = "<%=cp%>";
		return context;
	}

	function getSessionId(){
		var sessionid = '${sessionScope.id}';
		return sessionid;
	}
	
	$('body').on('click','.user_btn', function() {
		remove_data();
		if($(this).attr('class').indexOf('ban') > -1){
			alert("차단된 회원입니다");
		}else{
			profile($(this).attr('id'));		// 유저 아이디 입력;
		}
	});

</script>


<!-- 플젝초대 모달 -->
<script>
$('.l_check_btn').on('click',function(){
    var pj_num = $('#modal-check .send_btn').attr('id');
    var str = $('#modal-leader option:selected').text();
    var pjm_num = $('#modal-leader option:selected').val();
    
    if(str === ""){
    	$('#modal-warn').modal('show');
    }else if($('#modal-leader option:selected').attr('class') === "ban"){
    	$('#modal-ban').modal('show');
    }else{
       var arr = str.split('(');
       var id = arr[0];
       var name = arr[1].split(')')[0];
 
       if($(this).attr('id') === "transfer"){
          
       $('#modal-check .modal-title').html('팀장 위임');
       $('#modal-check .modal-body').html('<p>\''+name+'\' 님을 팀장으로 위임 하시겠습니까?</p>');
       $('#modal-check .send_btn').attr('href',getContext()+"/aus/ProejctRoom/transfer?pj_Num="+pj_num+"&id="+id);
       $('#modal-check').modal('show');
          
       }else{
          
       $('#modal-check .modal-title').html('멤버 추방');
       $('#modal-check .modal-body').html('<p class="text-red">\''+name+'\' 님이 작성한 글은 <br/>복구할 수 없습니다</p><p>멤버를 추방 하시겠습니까?</p>');
       $('#modal-check .send_btn').attr('href',getContext()+"/aus/ProejctRoom/kick?pj_Num="+pj_num+"&pjm_num="+pjm_num);
       $('#modal-check').modal('show');
          
       }
    }
});
</script>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- ///////////////////////////////////////right side bar//////////////////////////////////////// -->
<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->

 <!-- Control Sidebar -->
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


</body>
<style>
	.leadermenu{
	    float: right;
	    background: transparent;
	    margin-top: 0;
	    margin-bottom: 3px;
	    padding: 5px 5px;
	    position: absolute;
	    top: 15px;
	    right: 10px;
	    border-radius: 2px;
	}
	.leadermenu>li{
		display: inline-block;
	}
	.progress-bar {
		background: "#f37d7d";
		
	}
	
/* 	.red{
		background-color: #dd4b39;
	} */
</style>
</html>