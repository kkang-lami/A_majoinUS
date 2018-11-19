<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<title>나에 대한 후기</title>
</head>
<body>
<tiles:insertDefinition name="header" />

   <div class="wrapper">
      <div class="content-wrapper">
         <section class="content-header">

<h2>나에 대한 후기</h2>

<table width="500">
	<tr>
		<td>프로젝트 이름</td>
		<td>후기 내용</td>
		<td>평점</td>
	</tr>
	<c:forEach items="${reviewListForMe}" var="reviewListForMe">
	
	<tr>
		<td>${reviewListForMe.pj_name}</td>
		<td>${reviewListForMe.review_content}</td>
		<td>${reviewListForMe.score}</td>
	</tr>
	</c:forEach>
</table>
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

<!DOCTYPE html>
<html>
<head>
<title>나에 대한 후기</title>
</head>
<body>
	<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<h1><i class="fa fa-fw fa-hand-o-left"></i>Review To Me</h1>
				<small> 나와 함께 프로젝트에 참여했던 팀원들이 나에 대해 남긴 후기를 확인합니다.</small>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">MyPage</a></li>
					<li class="active">review to me</li>
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
				<!--+++++++++  -->
				<!-- 프로젝트이름 출력하는 foreach -->
				<c:forEach items="${pjName}" var="pjName">

					<div class="box box-success collapsed-box">
						<div class="box-header with-border">
							<h3 class="box-title">&nbsp;&nbsp;${pjName.pj_name}</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-plus"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
    
						<!-- /.box-header -->
						<div class="box-body" style="display: none;  margin:15px;" >
							<c:forEach items="${reviewListForMe}" var="reviewListForMe">

								<c:if
									test="${reviewListForMe.pj_name eq pjName.pj_name == true}">
									<br><label>${reviewListForMe.score} 
												<!-- 별점 -->
									<c:if test="${reviewListForMe.score >=  5 }">
										<c:forEach var="i" begin="1" end="5">
											<i class="fa fa-fw fa-star" style="color: red;"></i>
										</c:forEach>
									</c:if>
									<c:if
										test="${reviewListForMe.score >= 4.3  && reviewListForMe.score <=  4.9 }">
										<c:forEach var="i" begin="1" end="4">
											<i class="fa fa-fw fa-star" style="color: red;"></i>
										</c:forEach>
										<i class="fa fa-fw fa-star-half-o" style="color: red;"></i>
									</c:if>

									<c:if
										test="${reviewListForMe.score >= 4.0  && reviewListForMe.score <= 4.2}">
										<c:forEach var="i" begin="1" end="4">
											<i class="fa fa-fw fa-star" style="color: red;"></i>
										</c:forEach>
									</c:if>
									<c:if
										test="${reviewListForMe.score >= 3.3  && reviewListForMe.score <= 3.9}">
										<c:forEach var="i" begin="1" end="3">
											<i class="fa fa-fw fa-star" style="color: red;"></i>
										</c:forEach>
										<i class="fa fa-fw fa-star-half-o" style="color: red;"></i>
									</c:if>

									<c:if
										test="${reviewListForMe.score >= 3.0  && reviewListForMe.score <=  3.2 }">
										<c:forEach var="i" begin="1" end="3">
											<i class="fa fa-fw fa-star" style="color: red;"></i>
										</c:forEach>
									</c:if>
									<c:if
										test="${reviewListForMe.score >= 2.3  && reviewListForMe.score <=  2.9}">
										<c:forEach var="i" begin="1" end="2">
											<i class="fa fa-fw fa-star" style="color: red;"></i>
										</c:forEach>
										<i class="fa fa-fw fa-star-half-o" style="color: red;"></i>
									</c:if>

									<c:if
										test="${reviewListForMe.score >= 2.0  && reviewListForMe.score <= 2.2 }">
										<c:forEach var="i" begin="1" end="2">
											<i class="fa fa-fw fa-star" style="color: red;"></i>
										</c:forEach>
									</c:if>
									<c:if
										test="${reviewListForMe.score >= 1.3  && reviewListForMe.score <= 1.9 }">
										<c:forEach var="i" begin="1" end="1">
											<i class="fa fa-fw fa-star" style="color: red;"></i>
										</c:forEach>
										<i class="fa fa-fw fa-star-half-o" style="color: red;"></i>
									</c:if>

									<c:if
										test="${reviewListForMe.score >= 1.0  && reviewListForMe.score <= 1.2 }">
										<c:forEach var="i" begin="1" end="1">
											<i class="fa fa-fw fa-star" style="color: red;"></i>
										</c:forEach>
									</c:if>
									<c:if
										test="${reviewListForMe.score >= 0.0  && reviewListForMe.score <= 0.9 }">
										<c:forEach var="i" begin="1" end="1">
											<i class="fa fa-fw fa-star-half-o" style="color: red;"></i>
										</c:forEach>
									</c:if>
									<!-- 별점 end -->
									</label>
									
									<br><br> ${reviewListForMe.review_content} <br>
									<hr>
								</c:if>
							</c:forEach>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</c:forEach>
			</section>
		</div>
		<!-- /.col -->



		<!--++++++++++++  -->

	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />

</body>
</html>
