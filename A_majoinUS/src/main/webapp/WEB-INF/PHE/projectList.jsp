<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
											href="projectContent?pj_num=${ongoing_list.pj_num}">
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
</html>