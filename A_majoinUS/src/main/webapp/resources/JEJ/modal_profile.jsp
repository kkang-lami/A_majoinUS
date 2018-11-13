<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>				
<meta charset="utf-8">
<style>
.img-circle {
	height: 100px;
}
</style>
</head>
<body>
<!-- 멤버상세 모달 -->
<div class="modal fade" id="modal_user">
   <div class="modal-dialog list-inline">
      <div class="modal-content">

         <!-- 멤버상세 헤더 -->
         <div class="modal-header ">
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title">회원 상세정보</h4>
         </div>

         <!-- 멤버상세 내용 -->
         <div class="modal-body">      

            <!-- Profile Image -->
            <div class="box box-body box-primary">
               <img class="profile-user-img img-responsive img-circle" src="" alt="회원 사진"
                onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.jpg';" />
                <!-- 디폴트 이미지 경로로 바꿔줘잉~~! (성희가 쓴 것임) -->               
                
               <!-- <img src="main_img.png" onError="this.onerror=null;this.src='/images/missing.png';" /> -->
               <h3 class="profile-username text-center">      
                  이름<small>(아이디)</small>    
               </h3>        
               <p class="profile-star text-muted text-center">별점</p>

               <ul class="list-group">  
                  <li class="list-group-item"><b><i
                        class="fa fa-book margin-r-5"></i>관심직군</b>
                     <p class="profile-job text-muted">관심있는 직군이 없습니다</p></li>
                  <li class="list-group-item"><b><i
                        class="fa fa-map-marker margin-r-5"></i>선호지역</b>
                     <p class="profile-local text-muted">선호하는 지역이 없습니다</p></li>
               </ul>

              <!--  <div class="col-md-8 ">
                  <a href="#" id="follow_btn"><b>Follow</b></a>
               </div>
               <div class="col-md-4">
                  <a href="#" id="issue_btn" data-toggle="popover" title="신고사유"><b>신고</b></a>
               </div> -->
            </div>

            <!-- About Me Box -->
            <div class="box">
               <div class="box-header with-border">
                  <h3 class="box-title">About Me</h3>
               </div>
               <div class="box-body">
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

</body>
</html>