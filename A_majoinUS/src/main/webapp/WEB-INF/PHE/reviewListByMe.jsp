<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<% request.setCharacterEncoding("UTF-8");%>

<%
String id = request.getParameter("id");// request에서 id 파라미터를 가져온다
//String passwd = request.getParameter("passwd");// request에서 passwd 파라미터를 가져온다.

session.setAttribute("id", "aa"); // 세션에 "id" 이름으로 id 등록
session.setAttribute("target_id", "aa"); // 세션에 "id" 이름으로 id 등록
%>



<!DOCTYPE html>
<html>
<head>
<title>내가 쓴 후기</title>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">


==================================================
<h2>내가 쓴 후기</h2>
<center>
<table width="500">
	<tr>
		<td> 평가 대상 </td>
		<td>프로젝트 이름</td>
		<td>후기 내용</td>
		<td>평점</td>
	</tr>
	<c:forEach items="${reviewListByMe}" var="reviewListByMe">
	<tr>
		<td>${reviewListByMe.name}</td>
		<td>${reviewListByMe.pj_name}</td>
		<td>${reviewListByMe.review_content}</td>
		<td>${reviewListByMe.score}</td>
		
	</tr>
	</c:forEach>
</table>
</center>
</section>
      </div>
   </div>

   <tiles:insertDefinition name="left" />
   <tiles:insertDefinition name="footer" />
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%
	request.setCharacterEncoding("UTF-8");
%>




<!DOCTYPE html>
<html>
<head>
<title>내가 쓴 후기</title>
</head>
<body>
	<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
			<h1><i class="fa fa-fw fa-hand-o-right"></i>Review From Others</h1>
				<small> 회원님께서 참여했던 프로젝트의 팀원들에게 남긴 후기를 확인합니다.</small>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">MyPage</a></li>
					<li class="active">review from others</li>
				</ol>
			</section>
			
			<section class="content">
              
				<c:if test="${empty pjName}">
					<div class="box box-success">
						<div class="box-header with-border">
							<i class="fa fa-bell-slash-o bg-yellow"></i>
							<h3 class="box-title">후기 내역이 존재하지 않습니다.</h3>
						</div>
					</div>

				</c:if>
				<!-- 프로젝트이름 출력하는 foreach -->
 
				<c:forEach items="${pjName}" var="pjName">
		<div class="box box-success collapsed-box">    
						<div class="box-header with-border">
							<h3 class="box-title">&nbsp;&nbsp;${pjName.pj_name}</h3>
								

							<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>    
                </div>
                              <!-- /.box-tools -->
                </div>
                
                 <!-- /.box-header -->
								<!-- <button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div> -->
						<!-- /.box-header -->    
						<div class="box-body no-padding" style="display: none;">
							<div class="row">
								<div class="col-md-9 col-sm-8">
									<div class="pad" style="margin:15px;">
										<!-- Map will be created here -->
										<c:forEach items="${reviewListByMe}" var="reviewListByMe">

											<c:if
												test="${reviewListByMe.pj_name eq pjName.pj_name == true}">  
		                   <font style="size:small;">  ${reviewListByMe.name} </font><br>
		                   <label> ${reviewListByMe.score} 
												<!-- 별점 -->
												<c:if test="${reviewListByMe.score >=  5 }">
													<c:forEach var="i" begin="1" end="5">
														<i class="fa fa-fw fa-star" style="color: red;"></i>
													</c:forEach>
												</c:if>
												<c:if
													test="${reviewListByMe.score >= 4.3  && reviewListByMe.score <=  4.9 }">
													<c:forEach var="i" begin="1" end="4">
														<i class="fa fa-fw fa-star" style="color: red;"></i>
													</c:forEach>
													<i class="fa fa-fw fa-star-half-o" style="color: red;"></i>
												</c:if>

												<c:if
													test="${reviewListByMe.score >= 4.0  && reviewListByMe.score <= 4.2}">
													<c:forEach var="i" begin="1" end="4">
														<i class="fa fa-fw fa-star" style="color: red;"></i>
													</c:forEach>
												</c:if>
												<c:if
													test="${reviewListByMe.score >= 3.3  && reviewListByMe.score <= 3.9}">
													<c:forEach var="i" begin="1" end="3">
														<i class="fa fa-fw fa-star" style="color: red;"></i>
													</c:forEach>
													<i class="fa fa-fw fa-star-half-o" style="color: red;"></i>
												</c:if>

												<c:if
													test="${reviewListByMe.score >= 3.0  && reviewListByMe.score <=  3.2 }">
													<c:forEach var="i" begin="1" end="3">
														<i class="fa fa-fw fa-star" style="color: red;"></i>
													</c:forEach>
												</c:if>
												<c:if
													test="${reviewListByMe.score >= 2.3  && reviewListByMe.score <=  2.9}">
													<c:forEach var="i" begin="1" end="2">
														<i class="fa fa-fw fa-star" style="color: red;"></i>
													</c:forEach>
													<i class="fa fa-fw fa-star-half-o" style="color: red;"></i>
												</c:if>

												<c:if
													test="${reviewListByMe.score >= 2.0  && reviewListByMe.score <= 2.2 }">
													<c:forEach var="i" begin="1" end="2">
														<i class="fa fa-fw fa-star" style="color: red;"></i>
													</c:forEach>
												</c:if>
												<c:if
													test="${reviewListByMe.score >= 1.3  && reviewListByMe.score <= 1.9 }">
													<c:forEach var="i" begin="1" end="1">
														<i class="fa fa-fw fa-star" style="color: red;"></i>
													</c:forEach>
													<i class="fa fa-fw fa-star-half-o" style="color: red;"></i>
												</c:if>

												<c:if
													test="${reviewListByMe.score >= 1.0  && reviewListByMe.score <= 1.2 }">
													<c:forEach var="i" begin="1" end="1">
														<i class="fa fa-fw fa-star" style="color: red;"></i>
													</c:forEach>
												</c:if>
												<c:if
													test="${reviewListByMe.score >= 0.0  && reviewListByMe.score <= 0.9 }">
													<c:forEach var="i" begin="1" end="1">
														<i class="fa fa-fw fa-star-half-o" style="color: red;"></i>
													</c:forEach>
												</c:if>
												<!-- 별점 end -->
												</label>
		                   <br><br> ${reviewListByMe.review_content} <br>
		                   <hr >
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


				
			</section>
		</div>
	</div>
	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</body>
</html>


