<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<script>
function confirmDelete(pj_num){
	var result = confirm("프로젝트를 삭제하시겠습니까? 삭제하면 다시 되돌릴 수 없습니다.")
	if(result){
		location.href="projectDelete?pj_num="+pj_num;
		alert("삭제되었습니다.");
	}
	else
		alert("취소되었습니다.");
	
		
}
</script>
<script>
$(function () {	
	tab('#tab',0);	
});

function tab(e, num){
    var num = num || 0;
    var menu = $(e).children();
    var con = $(e+'_con').children();
    var select = $(menu).eq(num);
    var i = num;

    select.addClass('on');
    con.eq(num).show();

    menu.click(function(){
        if(select!==null){
            select.removeClass("on");
            con.eq(i).hide();
        }

        select = $(this);	
        i = $(this).index();

        select.addClass('on');
        con.eq(i).show();
    });
}
</script>
<style>
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #eee;
	border-left: 1px solid #eee;
	width: 100%;
	font-family: "dotum";
	font-size: 12px;
}

ul.tabs li {
	float: left;
	text-align: center;
	cursor: pointer;
	width: 82px;
	height: 31px;
	line-height: 31px;
	border: 1px solid #eee;
	border-left: none;
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
}

ul.tabs li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
}

.tab_container {
	border: 1px solid #eee;
	border-top: none;
	clear: both;
	float: left;
	width: 248px;
	background: #FFFFFF;
}

.tab_content {
	padding: 5px;
	font-size: 12px;
	display: none;
}

.tab_container .tab_content ul {
	width: 100%;
	margin: 0px;
	padding: 0px;
}

.tab_container .tab_content ul li {
	padding: 5px;
	list-style: none
}

;
#container {
	width: 249px;
	margin: 0 auto;
}

* {
	margin: 0;
	padding: 0;
}

ul, li {
	list-style: none;
}

a {
	text-decoration: none;
	color: #000;
}

.tab {
	border: 1px solid #ddd;
	border-left: none;
	background: #fff;
	overflow: hidden;
}

.tab li {
	float: left;
	width: 33.3%;
	border-left: 1px solid #ddd;
	text-align: center;
	box-sizing: border-box;
}

.tab li {
	display: inline-block;
	padding: 20px;
	cursor: pointer;
}

.tab li.on {
	background-color: #eee;
	color: #f00;
}

.tab_con {
	clear: both;
	margin-top: 5px;
	border: 1px solid #ddd;
}

.tab_con div {
	display: none;
	height: 100px;
	background: #fff;
	line-height: 100px;
	text-align: center;
}
</style>
<body>
	<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">


				<ul class="tab" id="tab">
					<li>진행중인 프로젝트</li>
					<li>내가 신청한 프로젝트</li>
					<li>완료된 프로젝트</li>
				</ul>

				<div class="tab_con" id="tab_con">
					<div>
						1st Contents
						<h2>진행중인 프로젝트</h2>
						<table width="500" cellpadding="0" cellspacing="0" border="1">
							<tr>
								<td>프로젝트 이름</td>
								<td>프로젝트 시작</td>
								<td>프로젝트 완료예정</td>
							<tr>
								<c:forEach items="${ongoing_list}" var="ongoing_list">
									<tr>
										<td>${ongoing_list.pj_name}</td>
										<td><fmt:parseDate value="${ongoing_list.start_d}"
												var="start" pattern="yyyy-MM-dd HH:mm:ss.S" /> <fmt:formatDate
												value="${start}" pattern="yyyy/MM/dd" /></td>
										<td><c:choose>
												<c:when test="${ongoing_list.end_d > '2099-12-01'}">
				무기한
    		</c:when>

												<c:otherwise>
													<fmt:parseDate value="${ongoing_list.end_d}" var="end"
														pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${end}" pattern="yyyy/MM/dd" />
												</c:otherwise>
											</c:choose></td>
										<td><a    
											href="ProejctRoom/Main?pj_Num=${ongoing_list.pj_num}">		*************************
												${ongoing_list.pj_name} </a></td>
										<td>${ongoing_list.leaderId}: 팀장 //
											${sessionScope.userId} 세션아이디 <c:if
												test="${sessionScope.userId == ongoing_list.leaderId}">
												<input type="button" value="프로젝트 수정"
													onclick="document.location.href='modifyProject?pj_num=${ongoing_list.pj_num}'">
												<input type="button" value="프로젝트 삭제"
													onclick="confirmDelete(${ongoing_list.pj_num})">
											</c:if>
										</td>
									<tr>
								</c:forEach>
						</table>
						</ul>
					</div>
					<!-- #tab1 -->


					<div id="tab2" class="tab_content">
						<h2>내가 신청한 프로젝트</h2>
						<table width="500" cellpadding="0" cellspacing="0" border="1">
							<tr>
								<td>프로젝트 이름</td>
								<td>프로젝트 시작</td>
								<td>프로젝트 완료예정</td>
							<tr>
								<c:forEach items="${apply_list}" var="apply_list">
									<tr>
										<td>${apply_list.pj_name}</td>
										<td><fmt:parseDate value="${apply_list.start_d}"
												var="start" pattern="yyyy-MM-dd HH:mm:ss.S" /> <fmt:formatDate
												value="${start}" pattern="yyyy/MM/dd" /></td>
										<td><c:choose>
												<c:when test="${apply_list.end_d > '2099-12-01'}">
				무기한
    		</c:when>

												<c:otherwise>
													<fmt:parseDate value="${apply_list.end_d}" var="end"
														pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${end}" pattern="yyyy/MM/dd" />
												</c:otherwise>
											</c:choose></td>
										<td><a href="projectContent?pj_num=${apply_list.pj_num}">
												${apply_list.pj_name} </a></td>
									<tr>
								</c:forEach>
						</table>
					</div>
					<!-- #tab2 -->
					<div id="tab3" class="tab_content">
						<h2>완료된 프로젝트</h2>
						<table width="500" cellpadding="0" cellspacing="0" border="1">
							<tr>
								<td>프로젝트 이름</td>
								<td>프로젝트 시작</td>
								<td>프로젝트 완료예정</td>
							<tr>
								<c:forEach items="${finish_list}" var="finish_list">
									<tr>
										<td>${finish_list.pj_name}</td>
										<td><fmt:parseDate value="${finish_list.start_d}"
												var="start" pattern="yyyy-MM-dd HH:mm:ss.S" /> <fmt:formatDate
												value="${start}" pattern="yyyy/MM/dd" /></td>
										<td><c:choose>
												<c:when test="${ongoing_list.end_d > '2099-12-01'}">
				무기한
    		</c:when>

												<c:otherwise>
													<fmt:parseDate value="${finish_list.end_d}" var="end"
														pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${end}" pattern="yyyy/MM/dd" />
												</c:otherwise>
											</c:choose></td>
										<td><a href="projectContent?pj_num=${finish_list.pj_num}">
												${finish_list.pj_name} </a></td>
										<td>${finish_list.leaderId}: 팀장 // ${sessionScope.userId}
											세션아이디 <c:if
												test="${sessionScope.userId == finish_list.leaderId}">
												<input type="button" value="프로젝트 수정"
													onclick="document.location.href='modifyProject?pj_num=${finish_list.pj_num}'">
												<input type="button" value="프로젝트 삭제"
													onclick="confirmDelete(${finish_list.pj_num})">
											</c:if>
										</td>
									</tr>
								</c:forEach>
						</table>

					</div>
					<div>
						2nd Contents
						<h2>내가 신청한 프로젝트</h2>
						<table width="500" cellpadding="0" cellspacing="0" border="1">
							<tr>
								<td>프로젝트 이름</td>
								<td>프로젝트 시작</td>
								<td>프로젝트 완료예정</td>
							<tr>
								<c:forEach items="${apply_list}" var="apply_list">
									<tr>
										<td>${apply_list.pj_name}</td>
										<td><fmt:parseDate value="${apply_list.start_d}"
												var="start" pattern="yyyy-MM-dd HH:mm:ss.S" /> <fmt:formatDate
												value="${start}" pattern="yyyy/MM/dd" /></td>
										<td><c:choose>
												<c:when test="${apply_list.end_d > '2099-12-01'}">
													무기한
									    		</c:when>

												<c:otherwise>
													<fmt:parseDate value="${apply_list.end_d}" var="end"
														pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${end}" pattern="yyyy/MM/dd" />
												</c:otherwise>
											</c:choose></td>
										<td><a href="projectContent?pj_num=${apply_list.pj_num}">
												${apply_list.pj_name} </a></td>
									<tr>
								</c:forEach>
						</table>

					</div>
					<div>
						3rd Contents
						<h2>완료된 프로젝트</h2>
						<table width="500" cellpadding="0" cellspacing="0" border="1">
							<tr>
								<td>프로젝트 이름</td>
								<td>프로젝트 시작</td>
								<td>프로젝트 완료예정</td>
							<tr>
								<c:forEach items="${finish_list}" var="finish_list">
									<tr>
										<td>${finish_list.pj_name}</td>
										<td><fmt:parseDate value="${finish_list.start_d}"
												var="start" pattern="yyyy-MM-dd HH:mm:ss.S" /> <fmt:formatDate
												value="${start}" pattern="yyyy/MM/dd" /></td>
										<td><c:choose>
												<c:when test="${ongoing_list.end_d > '2099-12-01'}">
													무기한
    											</c:when>

												<c:otherwise>
													<fmt:parseDate value="${finish_list.end_d}" var="end"
														pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${end}" pattern="yyyy/MM/dd" />
												</c:otherwise>
											</c:choose></td>
										<td><a href="projectContent?pj_num=${finish_list.pj_num}">
												${finish_list.pj_name} </a></td>
										<td>${finish_list.leaderId}: 팀장 // ${sessionScope.userId}
											세션아이디 <c:if
												test="${sessionScope.userId == finish_list.leaderId}">
												<input type="button" value="프로젝트 수정"
													onclick="document.location.href='modifyProject?pj_num=${finish_list.pj_num}'">
												<input type="button" value="프로젝트 삭제"
													onclick="confirmDelete(${finish_list.pj_num})">
											</c:if>
										</td>
									</tr>
								</c:forEach>
						</table>

					</div>
				</div>
			</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />

</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>Project List</title>
<style>
#hr_style{
	border-top: 1px solid #d2d6de !important;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>


<script>
	function confirmDelete(pj_num) {
		var result = confirm("프로젝트를 삭제하시겠습니까? 삭제하면 다시 되돌릴 수 없습니다.")
		if (result) {
			location.href = "projectDelete?pj_num=" + pj_num;
			alert("삭제되었습니다.");
		} else
			alert("취소되었습니다.");

	}
</script>
<script>
	$(function() {
		tab('#tab', 0);
	});

	function tab(e, num) {
		var num = num || 0;
		var menu = $(e).children();
		var con = $(e + '_con').children();
		var select = $(menu).eq(num);
		var i = num;

		select.addClass('on');
		con.eq(num).show();

		menu.click(function() {
			if (select !== null) {
				select.removeClass("on");
				con.eq(i).hide();
			}

			select = $(this);
			i = $(this).index();

			select.addClass('on');
			con.eq(i).show();
		});
	}
</script>
<style>
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #eee;
	border-left: 1px solid #eee;
	width: 100%;
	font-family: "dotum";
	font-size: 12px;
}

ul.tabs li {
	float: left;
	text-align: center;
	cursor: pointer;
	width: 82px;
	height: 31px;
	line-height: 31px;
	border: 1px solid #eee;
	border-left: none;
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
}

ul.tabs li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
}

.tab_container {
	border: 1px solid #eee;
	border-top: none;
	clear: both;
	float: left;
	width: 248px;
	background: #FFFFFF;
}

.tab_content {
	padding: 5px;
	font-size: 12px;
	display: none;
}

.tab_container .tab_content ul {
	width: 100%;
	margin: 0px;
	padding: 0px;
}

.tab_container .tab_content ul li {
	padding: 5px;
	list-style: none
}

;
#container {
	width: 249px;
	margin: 0 auto;
}

* {
	margin: 0;
	padding: 0;
}

ul, li {
	list-style: none;
}

a {
	text-decoration: none;
	color: #000;
}

.tab {
	border: 1px solid #ddd;
	border-left: none;
	background: #fff;
	overflow: hidden;
}

.tab li {
	float: left;
	width: 33.3%;
	border-left: 1px solid #ddd;
	text-align: center;
	box-sizing: border-box;
}

.tab li {
	display: inline-block;
	padding: 20px;
	cursor: pointer;
}

.tab li.on {
	background-color: #eee;
	color: #F38703;
	font-weight:bold;
}

.tab_con {
	clear: both;
	margin-top: 5px;
	border: 1px solid #ddd;
}

.tab_con div {
	display: none;
	height: 100px;
	background: #fff;
	line-height: 100px;
	/* text-align: center; */
}

#gogo {
	height : auto;
	padding-bottom: 10px;
}
</style>
<body>
	<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->

				<h1>
					My Projectroom <small>프로젝트 목록을 확인할 수 있습니다.</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">MyPage</a></li>
					<li class="active">Project 관리</li>
				</ol>
				<hr id="hr_style">  
				<div style="text-align: right;">
           			<button class="btn btn-danger" onclick="location.href='createProjectForm'" ><i class="fa fa-plus-square"></i>프로젝트 생성하기</button>
           		</div>
			</section>
			<!-- content 시작! -->
			<section class="content">
			<!--  -->
			
			<ul class="tab" id="tab">
					<li>진행중인 프로젝트</li>
					<li>내가 신청한 프로젝트</li>
					<li>완료된 프로젝트</li>
				</ul>

				<div class="tab_con" id="tab_con">
					<div id="gogo">
<h3 style="margin-top: 0;text-align: center;padding-top: 10px">진행중인 프로젝트</h3>
<table class="table table-hover">
   <tr>
      <th style="text-align: center;">프로젝트 이름&nbsp;&nbsp;<span class="label label-primary">진행중</span></th>  
      <th style="text-align: center;">프로젝트 시작</th>
      <th style="text-align: center;">프로젝트 완료예정</th>
      <th colspan="2" style="text-align: center;">프로젝트 관리</th>
</tr>
 
 <tr>
  		<td>   	 <c:if test="${empty ongoing_list}" > 진행중 프로젝트가 없습니다. </c:if>
  		</td>
  	</tr>
   <tr>
   <c:forEach items="${ongoing_list}" var="ongoing_list">
   <tr>
      <td style="text-align: center;"><a href="ProejctRoom/Main?pj_Num=${ongoing_list.pj_num}">${ongoing_list.pj_name}</a></td>
      <td style="text-align: center;">
      <c:set var="reg" value="${fn:substring(ongoing_list.start_d,0,10)}" />
		 ${reg}
      </td>
      <td style="text-align: center;">
      <c:set var="reg12" value="${fn:substring(ongoing_list.end_d,0,10)}" />
      <c:if test="${reg12 == '2099-12-31'}"> 무기한 </c:if>
      <c:if test="${reg12 != '2099-12-31'}"> ${reg12} </c:if>
      
      </td>

      <%-- <td>${ongoing_list.leaderId} : 팀장  // ${sessionScope.userId} 세션아이디 --%>
	      <c:if test="${sessionScope.id == ongoing_list.leaderId}" >   
		      	<td>      
			      <button type="button" class="btn btn-block btn-default"      
			       onclick="document.location.href='modifyProject?pj_num=${ongoing_list.pj_num}'">프로젝트 수정</button>
			      </td>
		      <td>
			      <button type="button" class="btn btn-block btn-default" 
			      onclick="confirmDelete(${ongoing_list.pj_num})">프로젝트 삭제</button>       
		       </td>   
	      </c:if>
	       <c:if test="${sessionScope.id != ongoing_list.leaderId}" > 
        	<td colspan='2' align="center">방장이 아닌 프로젝트룸은 수정/삭제 권한이 없습니다.</td>
        	
        </c:if>
	      <%-- <c:if test="${sessionScope.userId != ongoing_list.leaderId}" >   
	      	<td colspan="2"> 프로젝트 수정/삭제 권한이 없습니다 </td>
	      </c:if>
       --%>
      
   <tr>
   </tr>
     
     </c:forEach>
</table>
</ul>
</div>

<div id="gogo">
<h3 style="margin-top: 0;text-align: center;padding-top: 10px">내가 신청한 프로젝트</h3>

<table class="table table-hover">
   <tr>
      <th style="text-align: center;">프로젝트 이름&nbsp;&nbsp;<span class="label label-warning">대기중</span></th>
      <th style="text-align: center;">프로젝트 시작</th>
      <th style="text-align: center;">프로젝트 완료예정</th>
     </tr>
    <tr>
  		<td>   	 <c:if test="${empty apply_list}" > 신청 프로젝트가 없습니다. </c:if>
  		</td>
  	</tr>
      
      
      
      
   <tr>
   <c:forEach items="${apply_list}" var="apply_list">
   <tr id="${apply_list.pj_num}">
      <td style="text-align: center;"><a href="#" id="modalbutton" class="Team_btn" data-toggle="modal" data-target="#modal_Team">${apply_list.pj_name}</a></td>
   <td style="text-align: center;">
      <c:set var="sday" value="${fn:substring(apply_list.start_d,0,10)}" />
		 ${sday}
    </td>
    <td style="text-align: center;">
      <c:set var="eDay" value="${fn:substring(apply_list.end_d,0,10)}" />
      <c:if test="${eDay == '2099-12-31'}"> 무기한 </c:if>
      <c:if test="${eDay != '2099-12-31'}"> ${eDay} </c:if>
      
      </td>
   </tr>
   </c:forEach>
</table>
</div>
	<!-- </div> -->
 
<div id="gogo"> 
<h3 style="margin-top: 0;text-align: center;padding-top: 10px">완료된 프로젝트</h3>  
<table class="table table-hover">
   <tr>
      <th style="text-align: center;">프로젝트 이름&nbsp;&nbsp;<span class="label label-success">완료</span></th>
      <th style="text-align: center;">프로젝트 시작</th>
      <th style="text-align: center;">프로젝트 완료예정</th>
	  <th colspan="2" style="text-align: center;">프로젝트 관리</th>
  </tr>
  <tr>
  	<td>   	 <c:if test="${empty finish_list}" > 완료된 프로젝트가 없습니다. </c:if>
  	</td>
  </tr>

      
   <tr>
   <c:forEach items="${finish_list}" var="finish_list">
   <tr>
      <td style="text-align: center;"><a href="ProejctRoom/Main?pj_Num=${finish_list.pj_num}">${finish_list.pj_name}</a></td>
      <td style="text-align: center;">
      <c:set var="sday" value="${fn:substring(finish_list.start_d,0,10)}" />
		 ${sday}
      </td>
      <td style="text-align: center;">
      <c:set var="eDay" value="${fn:substring(finish_list.end_d,0,10)}" />
      <c:if test="${eDay == '2099-12-31'}"> 무기한 </c:if>
      <c:if test="${eDay != '2099-12-31'}"> ${eDay} </c:if>
      
      </td>

     <%-- <td> ${finish_list.leaderId} : 팀장 // ${sessionScope.userId} 세션아이디 </td> --%> 
         
         <c:if test="${sessionScope.id == finish_list.leaderId}" > 
            <td><button type="button" class="btn btn-block btn-default" onclick="document.location.href='modifyProject?pj_num=${finish_list.pj_num}'">프로젝트 수정</button></td>
            <td><button type="button" class="btn btn-block btn-default" onclick="confirmDelete(${finish_list.pj_num})">프로젝트 삭제</button></td>
        </c:if>
        <c:if test="${sessionScope.id != finish_list.leaderId}" > 
        	<td colspan='2' align="center">방장이 아닌 프로젝트룸은 수정/삭제 권한이 없습니다.</td>
        	
        </c:if>
       
      </tr>
   </c:forEach>
</table>
</div> </div>
<!-- </div> -->

<!--  -->
</section>
	<c:import url="${cp}/resources/LSH/Modal/Team.jsp"/>
	
	<!-- 프로젝트 참가 모달 -->
	<c:import url="${cp}/resources/LSH/Modal/join.jsp"/>

       
		</div>
	</div>
</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />	
	
	
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
    
		function getSessionId(){    
			var sessionid = '${sessionScope.id}';
			return sessionid;
		}         
		
    	</script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Team.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/User.js"></script>			
</body>
</html>
