<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	%>
<!DOCTYPE html>
<html>
<head>
<title>신고 관리</title>
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	
</head>
<body>
<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
<h1>
        신고 관리
        <small>회원들로부터 접수된 신고 내역입니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">MyPage</a></li>
        <li class="active">Issue Manage</li>
      </ol>
    </section>
<!-- content 시작! -->


<!-- Main content -->
    <section class="content">

<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">회원 신고</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin" id="result_table_user">
                  <thead>
                  <tr>
	<th>문제회원</th>
	<th>신고자</th>
	<th>신고사유</th>
	<th>신고일시</th>
                  </tr>
                  </thead>
                  <tbody>
     <c:forEach items="${memberIssue}" var="member" >
<tr>     
	<td><input type="hidden" value="${member.pj_num}">
	<a href="#" id="${member.issue_id}" class="user_btn" data-toggle="modal" data-target="#modal_user">${member.issue_id}</a></td>
	<td><a href="#" id="${member.id}" class="user_btn" data-toggle="modal" data-target="#modal_user">${member.id}</a></td>
	<td>${member.is_content}</td>
	<td><c:set var="day_m" value="${fn:substring(member.is_date,0,10)}" />
	${day_m}</td>
</tr>
</c:forEach>             

                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
             <!--  <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>
              <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a>
            -->
            <!-- /.box-footer -->
          
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
								<a href="issue_admin?pageNum=${startPage - 10 }">[이전]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a
									href="issue_admin?pageNum=${startPage - 10 }&search=${search}&string=${string}">[이전]</a>
							</c:if>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${search1 != 1 }">
								<a href="issue_admin?pageNum=${i}">[${i}]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a
									href="issue_admin?pageNum=${i}&search=${search}&string=${string}">[${i}]</a>
							</c:if>
						</c:forEach>

						<c:if test="${endPage < pageCount}">
							<c:if test="${search1 != 1 }">
								<a href="issue_admin?pageNum=${startPage + 10}">[다음]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a
									href="issue_admin?pageNum=${startPage + 10 }&search=${search}&string=${string}">[이후]</a>
							</c:if>
						</c:if>
					</c:if>
				</div>
          
          <!--  --> </div>
          </div>
          <!-- /.box -->



<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">프로젝트 신고</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin" id="result_table_project">
                  <thead>
                  <tr>
	<th>문제 프로젝트</th>
	<th>프로젝트 팀장</th>
	<th>신고자</th>
	<th>신고사유</th>
	<th>신고일시</th>
                  </tr>
                  </thead>
                  <tbody>
   


<c:forEach items="${projectIssue}" var="project" >
<tr id="${project.pj_num}">
	<td><a href="#" id="modalbutton" class="Team_btn" data-toggle="modal" data-target="#modal_Team">${project.pj_name}</a></td>
		
	<td><a href="#" id="${project.issue_id}" class="user_btn" data-toggle="modal" data-target="#modal_user">${project.issue_id}</a></td>
	<td><a href="#" id="${project.id}" class="user_btn" data-toggle="modal" data-target="#modal_user">${project.id}</a></td>
	<td>${project.is_content}</td>
	<td><c:set var="day" value="${fn:substring(project.is_date,0,10)}" />
	${day}</td>
</tr>
</c:forEach>         

                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
             <!--  <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>
              <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a>
             -->     
            <!-- /.box-footer -->
            
            <div align="center">
					<c:if test="${count1 > 0}">
						<c:set var="pageCount1"
							value="${count1 / pageSize1 + ( count1 % pageSize1 == 0 ? 0 : 1)}" />
						<!-- pageCount:11 -->
						<c:set var="pageBlock1" value="${10}" />
						<!-- pageBlock:10 -->
						<fmt:parseNumber var="result1" value="${currentPage1 / 10}"
							integerOnly="true" />
						<!-- result:0 -->
						<c:set var="startPage1" value="${result1 * 10 + 1}" />
						<!-- startPage:1 -->
						<c:set var="endPage1" value="${startPage1 + pageBlock-1}" />
						<!-- endPage:10 -->
						<c:if test="${endPage1 > pageCount1}">
							<c:set var="endPage1" value="${pageCount1}" />
							<!-- endPage:10 -->
						</c:if>

						<c:if test="${startPage1 > 10}">
							<c:if test="${search2 != 1 }">
								<a href="issue_admin?pageNum2=${startPage1 - 10 }">[이전]</a>
							</c:if>
							<c:if test="${search2 == 1 }">
								<a
									href="issue_admin?pageNum2=${startPage1 - 10 }&search=${search}&string=${string}">[이전]</a>
							</c:if>
						</c:if>

						<c:forEach var="i" begin="${startPage1}" end="${endPage1}">
							<c:if test="${search2 != 1 }">
								<a href="issue_admin?pageNum2=${i}">[${i}]</a>
							</c:if>
							<c:if test="${search2 == 1 }">
								<a href="issue_admin?pageNum2=${i}&search=${search}&string=${string}">[${i}]</a>
							</c:if>
						</c:forEach>

						<c:if test="${endPage1 < pageCount1}">
							<c:if test="${search2 != 1 }">
								<a href="issue_admin?pageNum2=${startPage1 + 10}">[다음]</a>
							</c:if>
							<c:if test="${search2 == 1 }">
								<a href="issue_admin?pageNum2=${startPage1 + 10 }&search=${search}&string=${string}">[이후]</a>
							</c:if>
						</c:if>
					</c:if>
				</div>
            
            </div>
          </div>

</section>
		</div>
	</div>
	
	<c:import url="${cp}/resources/LSH/Modal/Team.jsp"/>
    <c:import url="${cp}/resources/LSH/Modal/User.jsp"/>   	
	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
	
<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
<script src="<%=request.getContextPath()%>/resources/LSH/profile_modal.js"></script>
<script src="<%=request.getContextPath()%>/resources/LSH/JS/Team.js"></script>
<script>  

 /*  $('body').on('click','.user_btn', function() {
	console.log("[유저 프로필]");
	remove_data();
  	profile($(this).text());		// 유저 아이디 입력;
 	}); */
	
  $(document).ready(initPage);
	
	function initPage() {
		$('#modal_Team .modal-footer').remove();
		$('.profile_btn').remove(); 
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
		    origin_d : "",
		    receiver : "",
		    pj_num: 0
	};
	
	$('body').on('click','.user_btn', function() {
	 		profile($(this).attr('id'));
	 		remove_data();
	});
	 	
	
</script>	
</body>
</html>