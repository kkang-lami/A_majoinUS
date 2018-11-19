<%@ page contentType="text/html; charset=UTF-8"%>
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
<title>평가 관리</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
	<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
<h1>
        평가 관리
        <small>회원들이 남긴 평가를 조회합니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">MyPage</a></li>
        <li class="active">Review Lookup</li>
      </ol>
    </section>
<!-- content 시작! -->


<!-- Main content -->
    <section class="content">

				<!-- css테스트 -->

				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Review to Admin</h3>

					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="table-responsive">
							
						</div>
						<!-- /.table-responsive -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer clearfix">
<!-- 						<a href="javascript:void(0)"
							class="btn btn-sm btn-info btn-flat pull-left">Place New
							Order</a> <a href="javascript:void(0)"
							class="btn btn-sm btn-default btn-flat pull-right">View All
							Orders</a> -->
					<!-- </div> -->
					<!-- /.box-footer -->
					<!--  -->
					 <c:forEach items="${name}" var="pjName">
      <div class="box box-info collapsed-box">
                  <div class="box-header with-border">
                     <h3 class="box-title">
                     <%-- &nbsp;&nbsp;<a href="#" id="modalbutton" class="Team_btn" data-toggle="modal" data-target="#modal_Team">${pjName.pj_name}</a>< --%>
                     <i class="fa fa-fw fa-star"></i>&nbsp;&nbsp;${pjName.pj_name}    </h3>  
  
                     <div class="box-tools pull-right">   
                      <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
                </div>
                              <!-- /.box-tools -->
                </div>
                

                  <div class="box-body no-padding" style="display: none;">
                     <div class="row">
                        <div class="col-md-12 col-sm-8">
                           <div class="pad" style="margin:15px;" id="result_table">
                              <!-- Map will be created here -->
                              <c:forEach items="${reviewList}" var="reviewList">

                   <c:if test="${reviewList.pj_num eq pjName.pj_num == true}">
                         <font style="size:small;">
                        <%--  <tr id="${review.pj_num}">
                         <a href="#" id="${reviewList.id}" class="user_btn" data-toggle="modal" data-target="#modal_user"></a>
                         </tr> --%>
                         <a href="#" id="${reviewList.id}" class="user_btn" data-toggle="modal" data-target="#modal_user">
                         ${reviewList.id}
                         </a>  
                         </font>
                         <span style="float: right;" class="time"><i class="fa fa-clock-o"></i><c:set var="end_d1" value="${fn:substring(reviewList.end_d,0,10)}" /> ${end_d1}</span>
                             
                         <br />
                         <label name="score">  
                                    
                                    </label>
                         <br> ${reviewList.ra_content} <br>
                         <hr/>
                         
                         
                         
                         
                         </c:if>
                              </c:forEach>

                           </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-md-3 col-sm-4"></div>
                        <!-- /.col -->
                     </div>
                     <!-- /.row -->
                  </div>
                  <!-- /.box-body -->
               </div>

            </c:forEach>
					<%-- <div align="center">
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
								<a href="review_admin?pageNum=${startPage - 10 }">[이전]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a
									href="review_admin?pageNum=${startPage - 10 }&search=${search}&string=${string}">[이전]</a>
							</c:if>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${search1 != 1 }">
								<a href="review_admin?pageNum=${i}">[${i}]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a
									href="review_admin?pageNum=${i}&search=${search}&string=${string}">[${i}]</a>
							</c:if>
						</c:forEach>

						<c:if test="${endPage < pageCount}">
							<c:if test="${search1 != 1 }">
								<a href="review_admin?pageNum=${startPage + 10}">[다음]</a>
							</c:if>
							<c:if test="${search1 == 1 }">
								<a href="review_admin?pageNum=${startPage + 10 }&search=${search}&string=${string}">[이후]</a>
							</c:if>
						</c:if>
					</c:if>
				</div> --%>
					
					<!--  -->
					<!-- 이고 하나 추가 >> --></div>
				</div>
				<!-- /.box -->    
				<c:import url="${cp}/resources/LSH/Modal/Team.jsp"/>
			    <c:import url="${cp}/resources/LSH/Modal/User.jsp"/>   	
			</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
	
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Team.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/User.js"></script>
<script>
		$(document).ready(initPage);
		
		function initPage() {
			$('#modal_Team .modal-footer').remove();
			$('.profile_btn').remove(); 
		}
		
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
        		    
		$('#result_table').on('click','.user_btn', function() {
			console.log("8.멤버프로필");
			remove_data();
			profile($(this).attr('id'));
		});
    	</script>
	
</body>
</html>