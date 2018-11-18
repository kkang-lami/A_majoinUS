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
<style>
#select_box_12 {
   height : 22px;
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
               </select> <input type="text" name="search" id="select_box_12" />
               <input type="submit" class="btn btn-info btn-flat btn-xs" value="검색하기" />
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
                        <tr id="${project.pj_num}">
                           <td>
                           <%-- <a href="content.do?num=${project.pj_num}&pageNum=${currentPage}"> </a>--%>
                           <%-- <a href="#" id="${item.id}" class="user_btn" data-toggle='modal' data-target='#modal_user'>${item.name}</a> --%>
                           <a href ="#" id="modalbutton" class="Team_btn" data-toggle="modal" data-target="#modal_Team">${project.pj_name}</a>
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
         <c:import url="${cp}/resources/LSH/Modal/Team.jsp"/>
         
         </section>
      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />

	
	<%-- <script>
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
		
    	</script> --%>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Team.js"></script>
    <script>
    
		$(document).ready(initPage);
		
		function initPage() {
			$('#modal_Team .modal-footer').remove();
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
	</script>	
    	
    	
	
	
</body>
</html>