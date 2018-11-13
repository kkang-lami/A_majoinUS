<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>프로젝트룸 관리</title>
</head>
<body>
	<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
				<h1>
        프로젝트 관리
        <small>전체 프로젝트를 조회합니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">MyPage</a></li>
        <li class="active">Project Manage</li>
      </ol>
    </section>
<!-- content 시작! -->


<!-- Main content -->
    <section class="content">

				<form>
					<select name="string">
						<option value="pj_name">프로젝트이름</option>
						<option value="id">팀장ID</option>
					</select> <input type="text" name="search" />
					<input type="submit" value="검색하기" />
				</form>
				<br />

				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">Projectroom</h3>
						

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="table-responsive">
							<table class="table no-margin">
								<tr>
									<%-- <th>${count}</th> --%>
									
									<th align="center">프로젝트명</th>
									<th align="center">팀장</th>
									<th align="center">등록일</th>
									<th align="center">프로젝트 기간</th>
								</tr>


							<c:forEach var="project" items="${projectroomList}">
								<tr>
									<td>
									<%-- <a href="content.do?num=${project.pj_num}&pageNum=${currentPage}"> </a>--%>
									<%-- <a href="#" id="${item.id}" class="user_btn" data-toggle='modal' data-target='#modal_user'>${item.name}</a> --%>
									<a id="${project.pj_num}" class="user_btn" data-toggle="modal" data-target="#modal_user">${project.pj_name}</a>
									</td>
									<td>${project.id}</td>
									<td><c:set var="reg" value="${fn:substring(project.regdate,0,10)}" />${reg}</td>
								<td><c:set var="start" value="${fn:substring(project.start_d,0,10)}" />
									<c:set var="end" value="${fn:substring(project.end_d,0,10)}" />
										${start} ~ ${end}</td>
							</tr>
							</c:forEach>
						</table>
				</div>
					<!-- /.table-responsive -->
			</div>
				<!-- /.box-body -->
					<div class="box-footer clearfix">
					<form>
					<input type="hidden" name="string" value="pj_name" />
					<input type="hidden" name="search" />
					<input type="submit" class="btn btn-sm btn-info btn-flat pull-left" value="전체 프로젝트 목록 조회" /></form>
			
			<a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a>
					</div>
					<!-- /.box-footer -->
				
				<!-- /.box -->


				<br>
				<div align="center">
					<c:if test="${count > 0}">
						<c:set var="pageCount"
							value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
						<!-- pageCount:11 -->
						<c:set var="pageBlock" value="${10}" />
						<!-- pageBlock:10 -->
						<fmt:parseNumber var="result" value="${currentPage / 10}"
							integerOnly="true" />
						<!-- result:0 -->
						<c:set var="startPage" value="${result * 10 + 1}" />
						<!-- startPage:1 -->
						<c:set var="endPage" value="${startPage + pageBlock-1}" />
						<!-- endPage:10 -->
						<c:if test="${endPage > pageCount}">
							<c:set var="endPage" value="${pageCount}" />
							<!-- endPage:10 -->
						</c:if>

						<c:if test="${startPage > 10}">
							<c:if test="${search1 != 1 }">
								<a href="ProjectManage?pageNum=${startPage - 10 }">[이전]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a
									href="ProjectManage?pageNum=${startPage - 10 }&search=${search}&string=${string}">[이전]</a>
							</c:if>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${search1 != 1 }">
								<a href="ProjectManage?pageNum=${i}">[${i}]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a
									href="ProjectManage?pageNum=${i}&search=${search}&string=${string}">[${i}]</a>
							</c:if>
						</c:forEach>

						<c:if test="${endPage < pageCount}">
							<c:if test="${search1 != 1 }">
								<a href="ProjectManage?pageNum=${startPage + 10}">[다음]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a
									href="ProjectManage?pageNum=${startPage + 10 }&search=${search}&string=${string}">[이후]</a>
							</c:if>
						</c:if>
					</c:if>
				</div>
</div>
			</section>
		</div>
	</div>
	
	<div class="modal fade" id="modal_Team">
	          <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	            
	            	<!-- 멤버상세 헤더 -->
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                  <span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title">프로젝트 상세정보</h4>
		            </div>
		        	
		        	<!-- 멤버상세 내용 -->
		           	<div class="modal-body">

						<!-- Profile Image -->
						
						<div class="box box-body box-primary">
							<h3 class="team-name"></h3>
							
						<div class="modal-body">
							<ul class="list-group">
								 <li class="list-group-item">
					               <b><i class="fa fa-book margin-r-5"></i>프로젝트 기간</b> 
					               <p class="team-date text-muted"></p>
					             </li>
					             <li class="list-group-item">
					               <b><i class="fa fa-book margin-r-5"></i>관심직군</b> 
					               <p class="team-job text-muted"></p>
					             </li>
					             <li class="list-group-item">
					               <b><i class="fa fa-map-marker margin-r-5"></i>선호지역</b>
					               <p class="team-local text-muted"></p>
					             </li>
					             <li class="list-group-item">
					               <b><i class="fa fa-map-marker margin-r-5"></i>모집인원</b>
					               <p class="team-memnum text-muted"></p>
					             </li>
					             <li class="list-group-item">
					               <b><i class="fa fa-map-marker margin-r-5"></i>프로젝트 소개</b>
					               <p class="team-text text-muted"></p>
					             </li>
				          	</ul>
				        </div>

						<div class="modal-footer">
							<div class="col-md-8 ">
								<a id="join_btn" data-toggle="modal" href="#modal-join"><b>프로젝트 신청</b></a>
							</div>
							<div class="col-md-4">
								<a href="#" id="Teamissue_btn" data-toggle="popover" title="신고사유"><b>신고</b></a>
							</div>
			      		</div>
			        </div>
	            
	            </div>
	          </div>
	        </div>
        	
        <!-- /모달창 -->
		
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />

<script src="<%=request.getContextPath()%>/resources/JEJ/Team_modal.js"></script>	
<script>
	function projectRoom(pj_num){
		var url="<%=cp%>/aus/LSH/Team/profile";
		$.ajax({
			type:"post",
			url:url,
			data:{"pj_num": pj_num},
			dataType:"json",
			success:function(args){
				load_projectRoom(args.x);
			},
			error:function(e){
				alert(e.responseText);
			}
		});
	}
		
	function load_projectRoom(data){
		global.receiver = data.ID;
		global.pj_num = data.PJ_NUM;
		
		$('.team-name').html("&ensp;"+data.PJ_NAME);
		$('.team-date').html(data.START_D+" ~ "+data.END_D);
		$('.team-memnum').html(data.MEM_LIMIT+"명");

		if(data.JOB){
			$('.team-job').html(data.JOB);
		}
		
		if(data.LOCAL){
			$('.team-local').html(data.LOCAL);
		}
		
		if(data.PJ_INFO){
			$('.team-text').html(data.PJ_INFO);
		}
		
		if('${sessionScope.userId}'.indexOf(data.ID) !== -1){
			$('#join_btn').attr('class','btn btn-default btn-block disabled');
			$('#join_btn').html('<span class="text-muted">본인이 개설한 프로젝트는 신청할 수 없습니다</span>');
			$('#Teamissue_btn').attr('class','btn btn-default btn-block disabled');
		}else{
			$('#join_btn').html('<b>프로젝트 참가</b>');
		}
	}
		
	function remove_Teamdata(){
		global.pj_num = 0;
		global.receiver = "";
		$('.team-job').html('관심있는 직군이 없습니다');
		$('.team-local').html('선호하는 지역이 없습니다');
		$('.team-text').html('프로젝트의 소개가 없습니다');
		$('#join_btn').attr('class','btn btn-primary btn-block');
		$('#Teamissue_btn').attr('class','btn btn-danger btn-block');
	}
	
	$('#modal_Team').on('hide.bs.modal', function (e) {
		console.log("팝오버제거");
		$("[data-toggle=popover]").popover('hide');
	})
	</script>
</body>
</html>