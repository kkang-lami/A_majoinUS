<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>회원 관리</title>

  <%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	%>

<style>
#select_box_12 {
	height : 22px;
}

.box-tools {
	display : block;
}

#he {
	display : inline-block;
}

#input-group-sm {
	display : inline-block;
}

</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

</head>
<body>
<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
<h1>
        회원 관리
        <small>회원 목록과 블랙리스트를 확인할 수 있습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">MyPage</a></li>
        <li class="active">Member Manage</li>
      </ol>
    </section>
<!-- content 시작! -->


<!-- Main content -->
    <section class="content">
    <div class="input-group input-group-sm">
	<form>
	<!-- <span class="input-group-btn"> -->
		<select name="string">
			<option value="name">회원이름</option>
			<option value="id">회원ID</option>
		</select> <input type="text" name="search" id="select_box_12"/>
		
		<input type="submit" class="btn btn-info btn-flat btn-xs" value="검색하기" />
	
	
	
<!-- 	<div class="box-tools">
	<div id="he" style="display: inline;">
	<select name="string" style="display: inline;">
			<option value="name">회원이름</option>
			<option value="id">회원ID</option>
		</select> &nbsp;
	</div>
                <div class="input-group input-group-sm" style="width: 150px;display:inline;">
					<select name="string">
						<option value="name">회원이름</option>
						<option value="id">회원ID</option>
					</select>
					<input type="text" name="search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div> -->


	</div>
	</form>
	
	
	
	
	
	
	
<br />				
<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">회원 관리</h3>
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
							<table class="table no-margin" id="result_table">
								<tr>					
									<th align="center">아이디</th>
									<th align="center">이름</th>
									<th align="center">전화번호</th>
									<th align="center">별점</th>
									<th align="center">블랙리스트에 추가</th>
								</tr>

							<c:forEach var="member" items="${memberList}">
							<tr id="${member.id}">
								<td>
								<a class="user_btn" data-toggle="modal" data-target="#modal_user">${member.id}</a>
								</td>
								<td>${member.name}</td>
								<td>${member.phone}</td>
								<td>${member.eval}</td>
								<td>
									<form>
									<input type="hidden" name="id" value="${member.id}" />
									<button type="button"  class="btn btn-default btn-flat btn-sm" onclick="blacklistMember(this.form)">추가 ▼</button>									
									</form>
								</td>
							</tr>
							</c:forEach>
						</table>
				</div>
					<!-- /.table-responsive -->
			</div>
<div class="box-footer clearfix">
					<form>
					<input type="hidden" name="string" value="name" />
					<input type="hidden" name="search" />
					<input type="submit" class="btn btn-sm btn-info btn-flat pull-left" value="전체 회원 목록 조회" /></form>
			
			<a href="ExcelDownload" class="btn btn-sm btn-default btn-flat pull-right">엑셀로 다운받기</a>
					</div>

				<!-- </div> -->
				<!-- /.box -->


				<br>
				<div align="center">
					<c:if test="${count > 0}">
						<c:set var="pageCount"
							value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
						<!-- pageCount:11 -->
						<c:set var="pageBlock" value="${10}" />
						<!-- pageBlock:10 -->
						<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
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
								<a href="MemberManage?pageNum=${startPage - 10 }">[이전]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a
									href="MemberManage?pageNum=${startPage - 10 }&search=${search}&string=${string}">[이전]</a>
							</c:if>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${search1 != 1 }">
								<a href="MemberManage?pageNum=${i}">[${i}]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a
									href="MemberManage?pageNum=${i}&search=${search}&string=${string}">[${i}]</a>
							</c:if>
						</c:forEach>

						<c:if test="${endPage < pageCount}">
							<c:if test="${search1 != 1 }">
								<a href="MemberManage?pageNum=${startPage + 10}">[다음]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a href="MemberManage?pageNum=${startPage + 10 }&search=${search}&string=${string}">[이후]</a>
							</c:if>
						</c:if>
					</c:if>
				</div><br />	
				</div>		
					
				
				
<!--  -->				
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">블랙리스트</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin" id="result_table2">
                  <thead>
                  <tr>
	<th>아이디</th>
	<th>이름</th>
	<th>전화번호</th>
	<th>별점</th>
	<th>권한 복귀</th>
                  </tr>
                  </thead>
                  <tbody>
   


<c:forEach items="${blackList}" var="black" >
<tr id="${black.id}">
	<td>
	<a class="user_btn" data-toggle="modal" data-target="#modal_user">${black.id}</a></td>	
	<td>${black.name}</td>
	<td>${black.phone}</td>
	<td>${black.eval}</td>
	<td>
		<form name="back">
		<input type="hidden" name="id" value="${black.id}" />
		<button type="button" onclick="authorityBack(this.form)" class="btn btn-default btn-flat btn-sm" >X</button>
		</form>
	</td>
</tr>
</c:forEach>         

                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <!-- /.box-footer -->
          </div>	
	
	</section>
		</div>
	</div>
    <c:import url="${cp}/resources/LSH/Modal/User.jsp"/> 

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />	
	
<script src="<%=request.getContextPath()%>/resources/LSH/JS/User.js"></script>
<script>  

	$(document).ready(initPage);
	
	function initPage() {
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
		    receiver: "",
		    pj_num: 0
		};
	
	$('#result_table').on('click','.user_btn', function() {
		console.log("8.[유저 프로필]"+$(this).parents("tr").attr('id'));
		remove_data();
		profile($(this).parents("tr").attr('id'));
	});
	$('#result_table2').on('click','.user_btn', function() {
		console.log("8.[유저 프로필]"+$(this).parents("tr").attr('id'));
		remove_data();
		profile($(this).parents("tr").attr('id'));
	});
</script>
<script>

function blacklistMember(formName) {
	var check = confirm("블랙리스트에 추가하시겠습니까?");
	if(check) {
		window.location.href = "./blacklistMember?id="+formName.id.value;
		alert("완료되었습니다.");
	}
}

function authorityBack(formName) {
	var check = confirm("블랙리스트에서 권한을 복귀합니다.");
	if(check){
       	// url="./authorityBack";
       	 //?t_id="+formName.teacher_id.value;
       	 window.location.href = "./authorityBack?id="+formName.id.value;
       	 alert("복귀되었습니다.");
       	// window.open(url, "post");       
	}	
}

</script>
</body>
</html>