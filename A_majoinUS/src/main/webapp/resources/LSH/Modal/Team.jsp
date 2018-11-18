<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- 프로젝트룸 모달 -->
<div class="modal fade" id="modal_Team">
 <div class="modal-dialog modal-lg">
  <div class="modal-content">
   
   	<!-- 프로젝트룸 헤더 -->
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">프로젝트 상세정보</h4>
    </div>
	
	<!-- 프로젝트룸 내용 -->
   	<div class="modal-body">
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
				<div class="col-md-8 "><a id="join_btn" data-toggle="modal" href="#modal-join"><b>프로젝트 신청</b></a></div>
				<div class="col-md-4"><a href="#" id="Teamissue_btn" data-toggle="popover" title="신고사유"><b>신고</b></a></div>
		   	</div>
    	</div>
    </div>
  
  </div>
 </div>
</div>