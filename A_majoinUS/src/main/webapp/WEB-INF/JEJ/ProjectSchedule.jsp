<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<title>프로젝트 스케줄</title>
<style>
#calendar {
	position: relative;
	/* border: black 1px solid; */
	left: 18%;
	width: 65%;
	padding-left: 20px;
	display: inline-block;
	/* background-color: white; */
}
</style>
</head>
<body>
<!-- <script src="jquery-2.1.4.js" type="text/javascript"></script> -->
	<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
				<h1>
        프로젝트 스케줄
        <small>프로젝트룸의 일정을 조회합니다.</small>
      </h1>
      <ol class="breadcrumb">    
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Projectroom</a></li>
        <li class="active">Project Schedule</li>
      </ol>
    </section>
<!-- content 시작! -->

<!-- Main content -->
    <section class="content">
<br /><br />
			
			<div id="calendar">
			
			<form name="calendarFrm" id="calendarFrm" action="" method="post">
				<DIV id="content" style="width: 712px;">
						<table width="98.3%" border="0" cellspacing="1" cellpadding="1">
						<tr>
							<!-- <td align="left"><button id="holiday" class="btn btn-success" onclick="add_schedule()">일정 추가</button></td> -->
							<%-- <td align="right"><input type="button" class="btn btn-warning" onclick="javascript:location.href='<c:url value='./ProjectSchedule' />'" value="오늘" /></td> --%>
							</tr>
						</table>
					<!--날짜 네비게이션  -->
				<table width="98.3%" border="0" cellspacing="1" cellpadding="1"
					id="KOO" bgcolor="#F3F9D7" style="border: 1px hidden #F9F9F9">
						<tr>
						<td height="60">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="10"></td>
								</tr>
									<tr>
									<!--  -->
									
									<td align="left">
									<c:if test="${sessionScope.Dday eq 'FALSE'}"> 
										<a class="btn btn-app" href="javascript:add_schedule()"><i class="fa fa-edit" onclick="add_schedule()"></i> Add Schedule</a>
									</c:if>
									<c:if test="${sessionScope.Dday eq 'TRUE'}">           
										<a class="btn btn-app" href="#" onclick='return false;' style='opacity: 0.5;'><i class="fa fa-edit" onclick="return false;"></i> Add Schedule</a>
									</c:if>	
              	<!-- 여기부터... -->
              	<a class="btn btn-app" href="ProjectSchedule?pj_num=${pj_num}">
                <i class="fa fa-repeat"></i> Today
              </a>       
									</td>
									
									<!--  -->


								<td align="center">
								<c:if test="${month > 0}">
								
								<div class="btn-group">
                    <a href="ProjectSchedule?pj_num=${pj_num}&year=${year }&amp;month=${month-1}" target="_self" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></a>
                    
                  </div>
								
								
									
									</c:if>
									<c:if test="${month <= 0}">
											
										</c:if> &nbsp;&nbsp; ${year }년 ${month+1 }월 &nbsp;&nbsp;
										<c:if test="${month < 11 }">
										
										<a href="ProjectSchedule?pj_num=${pj_num}&year=${year }&amp;month=${month+1}" target="_self" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></a>
										
									</c:if>
								 </td>
								 <td align="right">
									
									

									
									
									<!--  -->
									<a class="btn btn-app"  href="ProjectSchedule?pj_num=${pj_num}&year=${year-1 }&amp;month=${month}" target="_self"> <i class="fa fa-hand-o-left"></i><b>Prev Year</b> <!-- 이전해 -->
									</a>
									<a class="btn btn-app"  href="ProjectSchedule?pj_num=${pj_num}&year=${year+1 }&amp;month=${month}" target="_self"> <!-- 다음해 --> <i class="fa fa-hand-o-right"></i><b>Next Year</b>
									</a></td>
									</td>
									<!--  -->
							</tr>
							</table>
							</td>
			</tr>
				</table>
					<br>
		<table border="0" cellspacing="1" cellpadding="1" bgcolor="#EAEAEA">
						<THEAD>
						<TR bgcolor="#CECECE">
								<TD width='100px'>
									<DIV align="center">
									<font color="red">일</font>
									</DIV>
							</TD>
								<TD width='100px'>
								<DIV align="center">월</DIV>
							</TD>
								<TD width='100px'>
									<DIV align="center">화</DIV>
							</TD>
								<TD width='100px'>
									<DIV align="center">수</DIV>
								</TD>
							<TD width='100px'>
									<DIV align="center">목</DIV>
								</TD>
							<TD width='100px'>
									<DIV align="center">금</DIV>
								</TD>
							<TD width='100px'>
									<DIV align="center">
									<font color="#529dbc">토</font>
									</DIV>
								</TD>
						</TR>
						</THEAD>
					<TBODY>
							<TR>
								<c:forEach var="index" begin="1" end="${start-1 }">
									<td>&nbsp;</td>
								<c:set var="newLine" value="${newLine + 1}" />
								</c:forEach>
								<c:forEach var="index" begin="1" end="${endDay }">
									<c:set var="color" value="" />
									<c:choose>
										<c:when test="${newLine == 0 }">
											<c:set var="color" value="RED" />
									</c:when>
										<c:when test="${newLine == 6 }">
											<c:set var="color" value="BLUE" />
										</c:when>
										<c:otherwise>
											<c:set var="color" value="BLACK" />
									</c:otherwise>
									</c:choose>
										<c:set var="backColor" value="#E7E7E7" />
								<c:if
									test="${index == today_date && year == today_year && month == today_month }">
										<c:set var="backColor" value="YELLOW" />
									</c:if>
										<TD valign="top" align="left" height="92px"
										bgcolor="${backColor }" nowrap><font color="${color }">${index }</font>
									<br>
									 
								<c:forEach var="list" items="${list}">
                                    <c:set var="h_name" value="${list.h_name }" />
                                    <c:set var="date0" value="${list.s_date }" />
                                    <c:set var="year1" value="${fn:substring(date0, 0, 4) }" />
                                    <c:set var="month1" value="${fn:substring(date0, 5, 7) }" />
                                    <c:set var="date1" value="${fn:substring(date0, 8, 10) }" />

                                    <c:if
                                       test="${index == date1 && month == month1-1 && year == year1}">
                                       <font color="#00003F">${h_name }</font><br>
                                    </c:if>
                                 </c:forEach>


										<br></TD>
									<c:set var="newLine" value="${newLine+1 }" />
										<c:if test="${newLine == 7 }">
							</tr>
							<c:if test="${index <= endDay }">
							<tr>
							</c:if>
							<c:set var="newLine" value="0" />
							</c:if>
							</c:forEach>
							<c:forEach var="index" begin="1" end="6">
								<c:if test="${newLine > 0 && newLine <7}">
									<td>&nbsp;</td>
									<c:set var="newLine" value="${newLine+1 }" />
								</c:if>
							</c:forEach>
							</tr>
						</TBODY>
					</TABLE>
				</DIV>
			</form>
		</div>


    
			</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="aside"/>
	<tiles:insertDefinition name="footer" />
	    
	<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- ///////////////////////////////////////right side bar//////////////////////////////////////// -->
<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->

<%--  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><!-- <i class="fa fa-home"></i> --></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">My project menu</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="Main?pj_Num=${pj_num}">
            <i class="menu-icon fa fa-home bg-red"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Home</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="workboard?pj_num=${pj_num}">
            <i class="menu-icon fa fa-fw fa-newspaper-o bg-black"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Work Board</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="pr_fileboard?pj_num=${pj_num }">
            <i class="menu-icon fa fa-fw fa-database bg-yellow"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Data Room</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="chatting?pj_num=${pj_num}">
            <i class="menu-icon fa fa-fw fa-commenting bg-blue"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Chat Room</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="ProjectSchedule?pj_num=${pj_num}">
            <i class="menu-icon fa fa-fw fa-calendar-minus-o bg-purple"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Calendar</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="portfolio?pj_num=${pj_num }">
            <i class="menu-icon fa fa-fw fa-pencil-square bg-green"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Writing portfolio</h4>
              </div>
            </a>
          </li>
          
           <li>
            <a href="EnR?pj_num=${pj_num }">
            <i class="menu-icon fa fa-fw fa-thumbs-o-up bg-red"></i>
           <!--    <i class="menu-icon fa fa-birthday-cake bg-red"></i> -->
              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Evaluation and review</h4>
              </div>
            </a>
          </li>
        
        </ul>
        <!-- /.control-sidebar-menu -->
      </div>
      
      
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
<div class="control-sidebar-bg"></div>
 --%>
	    
	    
	<script>    

function add_schedule() {
	url = "./AddSchedule?pj_num="+${pj_num};
	window.open(    
				url,
				"post",
				"toolbar=no ,width=500 ,height=450,directories=no,status=yes,scrollbars=yes,menubar=no,left=750,top=280");
}
</script>
</body>
</html>