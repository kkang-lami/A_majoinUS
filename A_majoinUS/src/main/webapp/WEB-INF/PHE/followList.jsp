<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구목록</title>
</head>
<body>
	<tiles:insertDefinition name="header" />
	<!-- 전체영역 -->
	<div class="wrapper">
		<!-- 콘텐츠 헤더 -->
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->

				<h1>
					Follow <small>내가 팔로우한 회원목록을 확인할 수 있습니다.</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">MyPage</a></li>
					<li class="active">My Friends</li>
				</ol>
			</section>
			<!-- content 시작! -->
			<section class="content">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
					
					<!-- 예쁘게 -->
					<div class="col-md-12">
					<div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title">Follow List</h3>

                  <div class="box-tools pull-right">
                    <span class="label label-danger">You have ${count} Friends</span>
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>
                    </button>
                  </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                
                  <ul class="users-list clearfix">
                  <c:forEach items="${followList}" var="followList">                  
                    <li>
                    	<img src="<%=request.getContextPath() %>/aus/userImg/${followList.u_img}" onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.png';" style="width:128px; height:128px; overflow:hidden;" />
						<a id="${followList.friend_id}" class="user_btn users-list-name" href="#" data-toggle='modal' data-target='#modal_user'>${followList.name}</a>
                      	<span class="users-list-date">${followList.friend_id}</span>
                      	<button id="${followList.friend_id}" class="btn btn-danger plus_btn" data-toggle="modal" data-target="#modal-join">프로젝트 초대</button>
                    </li>
                  </c:forEach>   
                  </ul>
                  <!-- /.users-list -->
                             

                </div>
                <!-- /.box-body -->
                <!-- <div class="box-footer text-center">
                  <a href="javascript:void(0)" class="uppercase">View All Users</a>
                </div> -->
                <!-- /.box-footer -->
              </div>
              </div>
              <!--/.box -->
					

					</div>
				</div>

			</section>
			
			<!-- 프로필 모달 -->
			<c:import url="${cp}/resources/LSH/Modal/User.jsp"/>
			
			<!-- 멤버초대 모달 -->
			<div class="modal fade" id="modal-join">
		      <div class="modal-dialog modal-sm">
		    	<div class="modal-content">
		            
		        	<div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title">멤버 초대창</h4>
		    		</div>
		              
		        	<div class="modal-body text-center">
						<select id="my_project"></select>
		                <p>프로젝트에 초대하시겠습니까?</p>
		           	</div>
		              
		           	<div class="modal-footer">
						<button type="button" class="send_btn btn btn-success pull-left" data-dismiss="modal">OK</button>
		                <button type="button" class="btn btn-default" data-dismiss="modal">CANCLE</button>
		      		</div>
		            
	            </div>
		      </div>
	        </div>
	        
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />         
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/User.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/issue.js"></script>
	
	<script>
		$(document).ready(initPage);
		
		function initPage() {
			$("#getUserModal").load(getContext()+"/resources/LSH/modal_profile.html");
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
		
		var global = {
			    i : 0,
			    receiver: ""
			};
	
	</script>

	<!-- 멤버초대 모달 -->
	<script>
	
	$('body').on('click','.plus_btn', function() {
		console.log("9.멤버초대");
		global.receiver = $(this).attr('id');
		get_myPro();	
	});

	$('.send_btn').on('click', function() {
		console.log("10.초대전송");
		if($('#my_project').attr('disabled') !== 'disabled'){
			joinUs();	
		}
	});
	
	function get_myPro(){
		var url="<%=cp%>/aus/show";
		
 		$.ajax({
			type:"post",
			url:url,
			data : { "id": '${sessionScope.id}'},
			dataType:"json",
			success:function(args){
				show_myPro(args.mine);
			},
			error:function(e){
				alert(e.responseText);
			}
		});
	}
	
	function show_myPro(list){
		var html = "",
			i = 0,
			len = list.length;
		if(len === 0){
				$('#my_project').attr('disabled', 'disabled');
				html += "<option>개설한 프로젝트가 없습니다</option>"
		}else{
			for(;i<len;i+=1){
				html += "<option value='"+list[i]['PJ_NUM']+"'>"+list[i]['PJ_NAME']+"</option>";
			}
		}
		$("#my_project").html(html);
	}
	
	function joinUs(){
		
		var pj_num = $("#my_project").val();
		var url="<%=cp%>/aus/insert_Message";
		var params = "receiver="+global.receiver+"&sender=${sessionScope.id}"+"&pj_num="+pj_num+"&a_type=초대";
		console.log(params);
		
 		$.ajax({
			type:"post",
			url:url,
			data : params,
			success:function(args){
				console.log("[*]메서지전송성공");
			},
			error:function(e){
				alert(e.responseText);
			}
		});
	}
	</script>
	
</body>
</html>