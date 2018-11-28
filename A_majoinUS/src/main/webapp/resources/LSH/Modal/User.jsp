<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<style>
	.profile_btn{
		margin-top: 20px;
	}
	.btn-primary{
		background-color: #00a7d0;
		border-color: #00a7d0;
	}
	.list-group{
		margin-bottom: 0px;
	}
	.profile-user-img{
    	height: 90px !important;
	}
</style>

<!-- 멤버상세 모달 -->
<div class="modal fade" id="modal_user">
	<div class="modal-dialog list-inline">
		<div class="modal-content">

			<!-- 멤버상세 헤더 -->
			<div class="modal-header ">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">회원 상세정보</h4>
			</div>

			<!-- 멤버상세 내용 -->
			<div class="modal-body">
			
				<!-- 사진&팔로우 -->
				<div class="box box-widget widget-user">
				
					<div class="widget-user-header bg-aqua-active">
						<h3 class="widget-user-username">이름</h3>
						<h5 class="widget-user-desc">아이디</h5>
					</div>
				          
					<div class="widget-user-image">
						<img class="profile-user-img img-responsive img-circle" src="" alt="회원 사진" onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.png';">
					</div>
				 
					<div class="box-footer">
						<div class="row">
						    <div class="col-sm-4 border-right">
						      <div class="description-block">
						        <h5 class="description-header project-count">--</h5>
						        <span class="description-text">프로젝트 경험</span>
						      </div>
						    </div>
						    
						    <div class="col-sm-4 border-right">
						      <div class="description-block">
						        <h5 class="description-header follower-count">--</h5>
						        <span class="description-text">FOLLOWERS</span>
						      </div>
						    </div>
						    
						    <div class="col-sm-4">
						      <div class="description-block">
						        <h5 class="description-header star-count">--</h5>
						        <span class="description-text">평점</span>
						      </div>
						    </div>
						</div>
						<div class="row profile_btn">
							<div class="col-sm-8 "><a href="#" id="follow_btn"><b>Follow</b></a></div>
							<div class="col-sm-4"><a href="#" id="issue_btn" data-toggle="popover" title="신고사유"><b>신고</b></a></div>
						</div>
					</div>
					
				</div>

				<!-- About Me Box -->
				<div class="box">
					<div class="box-header with-border bg-grey">
						<h3 class="box-title">About Me</h3>
					</div>
					<div class="box-body">
						<ul class="list-group">
							<li class="list-group-item"><b><i class="fa fa-book margin-r-5"></i>관심직군</b>
								<p class="profile-job text-muted">관심있는 직군이 없습니다</p></li>
							<li class="list-group-item"><b><i class="fa fa-map-marker margin-r-5"></i>선호지역</b>
								<p class="profile-local text-muted">선호하는 지역이 없습니다</p></li>
						</ul>
					</div>
					<div class="box-footer">
						<p class="profile-text text-muted">자기소개가 없습니다</p>
					</div>
				</div>

				<!-- 포트폴리오 Box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">
							<i class="fa fa-file-text-o margin-r-5"></i>포트폴리오
						</h3>
					</div>
					<div class="box-body">
						<table class="table table-hover text-center port_table">
							<tr>
								<th>프로젝트명</th>
								<th>프로젝트기간</th>
							</tr>
							<tr>
								<td colspan="2">등록된 프로젝트가 없습니다</td>
							</tr>
						</table>
					</div>
				</div>
   
				<!-- 후기 Box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">
							<i class="fa fa-pencil margin-r-5 "></i>후기
						</h3>
					</div>
					<div class="box-body">
						<table class="table table-hover text-center review_table">
							<tr>
								<td>등록된 후기가 없습니다</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>