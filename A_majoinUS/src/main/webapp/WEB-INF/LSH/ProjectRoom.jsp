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
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
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
						<span class="info-box-icon bg-aqua" style="height: 97px;"><i class="ion-ios-chatbubble-outline"></i></span>
						<div class="info-box-content">
					    	<span class="info-box-text">프로젝트 진행도</span>
					    	<span class="info-box-number">${list[0].percent}<small>%</small></span>
					    	<div class="progress active" style="height: 10px;background-color: #38333317;">
					    		<div class="progress-bar progress-bar-red progress-bar-striped" style="width: ${list[0].percent}%;background-color: #dd4b39;"></div>
					    	</div> 
					    	<c:choose>
							  <c:when test="${list[0].d_day eq '9999'}">
							     <span class="progress-description">프로젝트 종료까지 &infin;일 남았습니다<small> (${list[0].END_D})</small></span>		
							  </c:when>
							  <c:otherwise>
							     <span class="progress-description">프로젝트 종료까지 ${list[0].d_day}일 남았습니다<small> (${list[0].END_D})</small></span>
							  </c:otherwise>
							</c:choose> 
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
							<img src="<%=request.getContextPath() %>/aus/userImg/${item.U_IMG}" alt="User Image"  onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.png';" style="width:128px; height:128px; overflow:hidden;">
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
							<img src="<%=request.getContextPath() %>/aus/userImg/${item.U_IMG}" alt="User Image"  onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.png';" style="width:128px; height:128px; overflow:hidden;">
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
								<select multiple class="form-control" style="height: 164px;">
								<c:forEach var="item" items="${list}" begin="1">
					           	<c:if test="${item.BLACKLIST eq 'NO'}">
					           	<option value="${item.PJM_NUM}">${item.MEM_ID}(${item.NAME})</option>
								</c:if>
								<c:if test="${item.BLACKLIST ne 'NO'}">
								<option value="${item.PJM_NUM}" class="ban">${item.MEM_ID}(${item.NAME})</option>
								</c:if>
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

		</section>

		    <!-- 체크 모달 -->
			<c:import url="${cp}/resources/LSH/Modal/RoomCheck.jsp"/>

		    <!-- 모달 경고  -->
			<c:import url="${cp}/resources/LSH/Modal/RoomWarn.jsp"/>

			<!-- 프로필 모달 -->
			<c:import url="${cp}/resources/LSH/Modal/User.jsp"/>
	</div>		
	<!-- /content-wrapper -->
	<tiles:insertDefinition name="aside" />
	<tiles:insertDefinition name="footer" />
	
</div>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/User.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/issue.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Transfer_Kick.js"></script>
	
	<!-- 기본 이벤트 -->
	<script>
		$(document).ready(initPage);
		
		function initPage() {
			$('.user_btn:first').prepend('<small class="badge bg-red">Leader</small>');
			$('.users-list .ban').attr('data-toggle','');
		}
	 
		function getContext(){
			var context = "<%=cp%>";
			return context;
		}
	
		function getSessionId(){
			var sessionid = '${sessionScope.id}';
			return sessionid;
		}
		
		var global = {
			    i : 0,
			    receiver: "",
			    pj_num: 0
			};
		
		$('body').on('click','.user_btn', function() {
			remove_data();
			if($(this).attr('class').indexOf('ban') > -1){
				alert("차단된 회원입니다");
			}else{
				profile($(this).attr('id'));		
			}
		});

	</script>
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

</style>
</html>