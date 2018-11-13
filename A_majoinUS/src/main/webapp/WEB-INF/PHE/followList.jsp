<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구목록</title>
</head>
<body>
	<tiles:insertDefinition name="header" />
	<!-- 전체영역 -->
	<div class="wrapper">
		<!-- 콘텐츠 헤더 -->
		<div class="content-wrapper">
			<section class="content-header">
				<h2>Follow List</h2>
			</section>

			<section class="content">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="box box-info">

							<!-- 멤버목록 헤더 -->
							<div class="box-header with-border">
							


								<span class="info-box-icon bg-aqua"><i
									class="ion-ios-chatbubble-outline"></i></span>
								<div class="info-box-content">

									<h2>Follow List</h2>
									<table width="500">
										<table width="500">
											<c:forEach items="${followList}" var="followList">

												<tr>
													<td><img
														src="<%=request.getContextPath() %>/aus/userImg/"+${followList.u_img}">
														<br> ${followList.name}<br />
														${followList.friend_id}</td>
													<td></td>

													<td><button>프로젝트 초대하기</button></td>
												</tr>
											</c:forEach>
										</table>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

			</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</body>
</html>