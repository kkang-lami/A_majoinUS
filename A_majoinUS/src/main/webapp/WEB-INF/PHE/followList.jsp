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
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
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
                      	<button id="${followList.friend_id}" class="btn btn-danger plus_btnF" data-toggle="modal" data-target="#modal-join">프로젝트 초대</button>
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
			<c:import url="${cp}/resources/LSH/Modal/Wanna_User.jsp"/>
	        
		</div>
	</div>

	
	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/User.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/issue.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Wanna_User.js"></script>
	
	<script>
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
	</script>
	<!-- 유저 모달  -->
	<script>
	$('body').on('click','.user_btn', function() {
		console.log("8.[유저 프로필]"+$(this).attr('id'));
		remove_data();
		profile($(this).attr('id'));
	});
	</script>

	
</body>
</html>