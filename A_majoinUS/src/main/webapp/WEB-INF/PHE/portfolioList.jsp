<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 포트폴리오</title>
</head>
<body>
	<tiles:insertDefinition name="header" />

	<!-- 전체영역 -->
	<div class="wrapper">
		<!-- 콘텐츠 헤더 -->
		<div class="content-wrapper">
			<section class="content-header">
				<h2>포트폴리오 리스트</h2>
			</section>

			<section class="content">
				<div class="box box-info">
					<div class="box-header with-border">
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
								<thead>
									<tr>


										<th>포트폴리오 제목</th>
										<th>프로젝트 기간</th>
										<th>수정</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${empty  portfolioList}">
									<tr><td>
										작성된 포트폴리오가 없습니다.
									</td></tr>
									</c:if>
								
									<c:forEach items="${portfolioList}" var="portfolioList">
										<tr>
											<td><a
												href="portfolioContent?port_num=${portfolioList.port_num}">${portfolioList.subject}</a></td>
											<td><fmt:parseDate value="${portfolioList.start_d}"
													var="start" pattern="yyyy-MM-dd HH:mm:ss.S" /> <fmt:formatDate
													value="${start}" pattern="yyyy/MM/dd" /> ~ <c:choose>
													<c:when test="${portfolioList.end_d > '2099-12-01'}">
													무기한
									    		</c:when>

													<c:otherwise>
														<fmt:parseDate value="${portfolioList.end_d}" var="end"
															pattern="yyyy-MM-dd HH:mm:ss.S" />
														<fmt:formatDate value="${end}" pattern="yyyy/MM/dd" />
													</c:otherwise>
												</c:choose></td>

											<td><input type="button" value="포트폴리오 수정"
												class="btn btn-info btn-flat btn-sm"
												onclick="document.location.href='portfolio/edit?port_num=${portfolioList.port_num}'" />
											</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /.box-body -->
					<!--  <div class="box-footer clearfix">
              <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>
              <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a>
            </div> -->
					<!-- /.box-footer -->
				</div>
			</section>
		</div>
	</div>

	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</body>
</html>
