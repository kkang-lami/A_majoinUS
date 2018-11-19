<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>프로젝트 초대/참가 신청</title>
<%
   String cp = request.getContextPath();
   request.setCharacterEncoding("UTF-8");
%>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
   <tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">

            <h2>프로젝트 참가 신청</h2>
            
         </section>   
 <section class="content">
 <!--  -->
 <div class="row">
        <div class="col-md-12">
          <!-- The time line -->
          <ul class="timeline">
          <li class="time-label">  
                  <span class="bg-blue">
                    참가 신청  
                  </span>
            </li>
            <!-- timeline time label -->
 <c:forEach items="${projectApplyAlarm}" var="projectApplyAlarm">
            <li>
              <i class="fa fa-envelope bg-aqua"></i>    

              <div class="timeline-item">  
                <span class="time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;<c:set var="dd" value="${fn:substring(projectApplyAlarm.a_date,0,10)}" />${dd}</span>

                <h3 class="timeline-header"><a href="#" id="${projectApplyAlarm.sender}" class="user_btn" data-toggle='modal' data-target='#modal_user'>${projectApplyAlarm.name}</a> sent you an MSG</h3>
				
					
                <div class="timeline-body">
                   ${projectApplyAlarm.name}(${projectApplyAlarm.sender})님께서 회원님의 &lt;  
                   <a href="#" class="review_btn" data-toggle="modal"  id="${projectApplyAlarm.pj_num}"  data-target="#modal_Team"> ${projectApplyAlarm.pj_name} </a> &gt;프로젝트에  
      ${projectApplyAlarm.a_type} 신청을 하셨습니다.
         
                </div>
                
                <div class="timeline-footer">
                <form>  
                  <input type="button" class="btn btn-danger btn-xs" id="${projectApplyAlarm.pj_num}" name="${projectApplyAlarm.sender}" onclick="surak2(this)" value="수락">
                  <input type="button" class="btn btn-primary btn-xs" id="${projectApplyAlarm.pj_num}" name="${projectApplyAlarm.sender}" onclick = "refuse2(this)" value="거절">
                </form>
                </div>
                
              </div>
            </li>
             </c:forEach>
             
             <c:if test="${empty projectApplyAlarm}">
         <li>
              <i class="fa fa-bell-slash-o bg-yellow"></i>
              <div class="timeline-item">
                <h3 class="timeline-header">알람 내역이 존재하지 않습니다.</h3>
              </div>
            </li> 
</c:if>
             
 <!--  -->
          <li class="time-label">
                  <span class="bg-green">
                    초대 제안
                  </span>
            </li>
<c:forEach items="${projectProposalAlarm}" var="projectProposalAlarm">
   
         <li>
              <i class="fa fa-comments bg-yellow"></i>
  
              <div class="timeline-item">   
                <span class="time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;<c:set var="dd1" value="${fn:substring(projectProposalAlarm.a_date,0,10)}" />${dd1}</span>

                <h3 class="timeline-header"><a href="#" id="${projectProposalAlarm.sender}" class="user_btn" data-toggle='modal' data-target='#modal_user'>${projectProposalAlarm.name}</a> commented on your post</h3>

                <div class="timeline-body">
                  ${projectProposalAlarm.name}(${projectProposalAlarm.sender})님께서 회원님께 &lt;   
                  <a href="#" class="review_btn" id="${projectProposalAlarm.pj_num}" data-toggle="modal" data-target="#modal_Team">${projectProposalAlarm.pj_name} </a>
                  &gt;프로젝트에 ${projectProposalAlarm.a_type} 하셨습니다.
                </div>
                <div class="timeline-footer">
                  <!-- <a class="btn btn-warning btn-flat btn-xs">View comment</a> -->  
                  <form>  
                  <input type="button" class="btn btn-danger btn-xs" id="${projectProposalAlarm.pj_num}" onclick="surak(this) "   value="수락">
                  <input type="button" class="btn btn-primary btn-xs" id="${projectProposalAlarm.pj_num}"  onclick = "refuse(this) " value="거절" > 
             </form>
                </div>
              </div>
            </li>
</c:forEach>

<c:if test="${empty projectProposalAlarm}">
         <li>
              <i class="fa fa-bell-slash-o bg-yellow"></i>
              <div class="timeline-item">
                <h3 class="timeline-header">알람 내역이 존재하지 않습니다.</h3>
              </div>
            </li> 
</c:if>
<li>
              <i class="fa fa-clock-o bg-gray"></i>
            </li>
            </ul>
            </div>
            </div>

         </section>
        
        <!-- 프로젝트 초대 모달 -->
		<c:import url="${cp}/resources/LSH/Modal/Wanna_Project.jsp"/>

		<!-- 프로젝트룸 모달 -->
        <c:import url="${cp}/resources/LSH/Modal/Team.jsp" />
        
        <!-- 프로필 모달 -->
		<c:import url="${cp}/resources/LSH/Modal/User.jsp"/>

      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />

	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Team.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Wanna_Project.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/User.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/issue.js"></script>
	

<script>
   var global = {
          i : 0,
          origin_d : "",
          receiver : "",
          pj_num: 0
   };
   
   function getContext(){
      var context = "<%=cp%>";
      return context;
   }

   function getSessionId() {
      var sessionid = '${sessionScope.id}';
      return sessionid;
   }
   
	$('body').on('click','.user_btn', function() {
		console.log("12.[유저 프로필]");
		remove_data();
		profile($(this).attr('id'));
	});
</script>
   
<script>
function refuse2(obj){
    var pj_num = $(obj).attr('id');
    var sender = $(obj).attr('name');
    
    var url="<%=cp%>/aus/removeFromAlarm_apply";
    var params = "pj_num="+pj_num+"&sender="+sender;
      $.ajax({
       type:"post",
       url:url,
       data: params,
       dataType: "json",
       success:function(args){
         if(args.remove === "removeApply"){
            alert("멤버 신청을 거절했습니다.");
            var detail = $(obj).parents('li');
             detail.remove(); 
         }
         else{
            alert("거절이 불가능합니다.");
         }
         
       },
       error:function(e){
          alert(e.responseText);
       }
    });
      
 };
 

 function refuse(obj){
     var url="<%=cp%>/aus/removeFromAlarm_invitation";
     var pj_num = $(obj).attr('id');
     var params = "pj_num="+pj_num;
       $.ajax({
        type:"post",
        url:url,
        data: params,
        dataType: "json",
        success:function(args){
         if(args.remove === "removeIvite"){
            alert("멤버 신청을 거절했습니다.");
            var detail = $(obj).parents('li');
             detail.remove(); 
         }
         else{
            alert("거절이 불가능합니다.");
         }
          
        },
        error:function(e){
           alert(e.responseText);
        }
     });
       
  };

function surak(obj){
    var url="<%=cp%>/aus/proposalAccept";
    var pj_num = $(obj).attr('id');
    var params = "pj_num="+pj_num;
      $.ajax({
       type:"post",
       url:url,
       data: params,
       dataType: "text",
       success:function(args){
         if(args === "register"){
            alert("멤버 등록이 완료되었습니다.");
            var detail = $(obj).parents('li');
             detail.remove(); 
         }
         else if(args === "already"){
            alert("이미 참여중입니다.");
            var detail = $(obj).parents('li');
             detail.remove(); 
         }
         else{
            alert("인원이 꽉 찬 프로젝트입니다.");
         //location.reload();
         }
       },
       error:function(e){
          alert(e.responseText);
       }
    });
      
 };
    
 function surak2(obj){
       var pj_num = $(obj).attr('id');
       var sender = $(obj).attr('name');
       
       var url="<%=cp%>/aus/acceptMember";
       var params = "pj_num="+pj_num+"&sender="+sender;
         $.ajax({
          type:"post",
          url:url,
          data: params,
          dataType: "text",
          success:function(args){
            if(args === "register"){
               alert("멤버 등록이 완료되었습니다.");
               var detail = $(obj).parents('li');
                detail.remove(); 
            }
            else if(args === "already"){
               alert("이미 참여중인 회원입니다.");
                var detail = $(obj).parents('li');
                 detail.remove(); 
            }
            else{
               alert("인원이 꽉 찬 프로젝트입니다.");
            //location.reload();
            }  
          },
          error:function(e){
             alert(e.responseText);
          }
       });
         
    };

</script>
</body>
</html>