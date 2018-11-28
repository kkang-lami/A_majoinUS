<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="today" class="java.util.Date"/>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>프로젝트 찾기</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
	.bg-light-blue:hover{
	    background-color: #43adea !important; 
	}
	.fa-times-circle{
		margin-right: 10px;
	}
	select{
		width: 15%; 
		height: 23px;
		margin-top: 5px !important;
	}
	.date_btn{
		width: 15%; 
	}
	#result {
    	margin-left: 20px;
    	margin-top: 10px;
	}
	#result_table #first{
		background-color: #f7f7f7;
	}
	td{ 
		vertical-align: middle !important;
	}
</style>
</head>
<body>
<div class="wrapper">
	<tiles:insertDefinition name="header" />
	<tiles:insertDefinition name="left" />

	<!-- 전체영역 -->
	<div class="content-wrapper">
		<!-- 콘텐츠 헤더 -->
		<section class="content-header">
			<h1>프로젝트 찾기</h1>
			<div style="text-align: right;">
			<a href="#modal_cart" class="btn btn-danger btn-sm" data-toggle='modal' ><i class="fa fa-fw fa-shopping-cart"></i> 프로젝트 스크랩</a>
           	</div>
		</section>

		<!-- 콘텐츠 -->
		<section class="content">
					
			<!-- 검색창 -->
			<div class="box box-primary">

				<div class="box-header with-border"><h3 class="box-title">프로젝트 검색</h3></div>
							
				<!-- 검색창 폼시작 -->
				<form id="SearchForm" method="post" class="form-horizontal">

					<!-- 셀렉터 바디 -->
					<div class="box-body">
	
						<!-- 관심직종 -->
						<div class="form-group row">
							<label for="job1" class="col-sm-2 control-label">관심직종</label>
							<div class="col-sm-10">
								<select id="job1" class="show-level2"></select>&ensp;<select id="job12"></select>
								<button type="button" value="job" class="add_btn btn btn-xs btn-default"><i class="fa fa-fw fa-plus"></i>추가</button>
							</div>
						</div>
	
						<!-- 선호지역 -->
						<div class="form-group row">
							<label for="local1" class="col-sm-2 control-label">선호지역</label>
							<div class="col-sm-10">
								<select id="local1" class="show-level2"></select>&ensp;<select id="local12"></select>
								<button type="button" value="local" class="add_btn btn btn-xs btn-default"><i class="fa fa-fw fa-plus"></i>추가</button>
							</div>
						</div>
	
						<!-- 프로젝트 기간 -->
						<div class="form-group row">
							<label for="start_d" class="col-sm-2 control-label">프로젝트 기간</label>
							<div class="col-sm-10">
								<input type="date" id="start_d" name="start_d" class="date_btn" value="${command.start_d}"> - 
								<input type="date" id="end_d" name="end_d" class="date_btn" value="${command.end_d}">
							</div>
						</div>
	
						<!-- 포함단어 -->
						<div class="form-group row">
							<label for="keyword" class="col-sm-2 control-label">포함단어</label>  
							<div class="col-sm-10">
								<input type="text" id="keyword" name="keyword" value="${command.keyword}" placeholder="검색어를 입력해주세요." style="width: 31%;">
							</div>
						</div>
	
						<!-- 정렬/ 검색어-->
						<input type="hidden" id="sort" name="sort" value="${command.sort}">
						<input type="hidden" id="sort_way" name="sort_way" value="${command.sort_way}">
						<input type="hidden" id="checking" name="checking" value="${command.checking}">
						
						<div title="넘겨질 job과 local" id="hidden"></div>
	
						<hr>
						검색조건<br>
						<div id="result"></div>
							
					</div>
	
					<!-- 셀렉터 푸터 -->
					<div class="box-footer">
						<input type='submit' class="btn btn-primary" value="검색">
						<input type='button' class="btn btn-default pull-right clear_btn" value="초기화">
					</div>
				
				</form>

			</div>
			 
			<!-- 추천 프로젝트 -->
			<c:if test="${fn:length(recomend) > 0}">
		    	<div class="box box-solid">
		            <div class="box-header with-border"><h4 class="box-title">추천 프로젝트</h4></div>
		        
		            <div class="box-body">
			        	<div class="row">
			                <c:forEach var="item" items="${recomend}">
			                <c:choose>
								<c:when test="${item.pj_num < 1}">
				        		<div class="col-md-4">
						          <div class="box box-widget widget-user-2">
						            <div class="widget-user-header bg-gray disabled color-palette text-center text-light-blue">
						              	<h3><b><i class="fa fa-fw fa-smile-o"></i></b></h3>
						              	<h4><b>해당하는 프로젝트가 없습니다</b></h4>
						              	<h5><b>관심직군과 선호지역을 추가해주세요!</b></h5>
						            </div>
						          </div>
						        </div>
							    </c:when>
		
							    <c:otherwise>
				        		<div class="col-md-4">
						          <div class="box box-widget widget-user-2">
						            <div class="widget-user-header bg-light-blue recomend_btn" id="${item.pj_num}" data-toggle="modal" data-target="#modal_Team">
						              	<h4><b>${item.pj_name}</b></h4>
						              	<h6>프로젝트 기간: ${item.start_d}~${item.end_d}</h6>
						              	<h6>관심직군: ${item.pj_cate}</h6>
						              	<h6>선호지역: ${item.pj_loc}</h6>
						            </div>
						          </div>
						        </div>
							    </c:otherwise>
							    
							</c:choose>
							</c:forEach>
						</div>
	            	</div>
				</div>
			</c:if>
			
			<!-- 검색결과 -->
			<c:if test="${pdto.rowCount > -1}">
			
			<div class="box">
			
				<!-- 검색결과 헤더 (정렬순서)-->
				<div class="box-header">
					<h3 class="box-title total_count">전체 <small>(${pdto.rowCount}건)</small></h3>
					
					<div class="text-right" title="정렬순 선택">
	                  	<input type="checkbox" id="checkbox" class="minimal"> 진행중인 프로젝트 제외 &emsp; 
						<a href="#" id="regdate_sort" class="sort-btn">등록일순<i class="fa-fw fas fa-sort"></i></a><span class="line">|</span>
						<a href="#" id="pj_view_sort" class="sort-btn">인기순<i class="fa-fw fas fa-sort"></i></a> 
			        </div>
				</div>

				<!-- 검색결과 목록 -->
				<div class="box-body">

					<table id="result_table" class="table table-hover text-center">
						<tr id="first">
							<th colspan="3">모집정보</th>
							<th>프로젝트 기간</th>
							<th>팀장</th>
							<th>등록일</th>
						</tr>
						
						<c:if test="${fn:length(pdto.list) < 1}">
						<tr><td colspan="7"><strong>검색 결과가 없습니다.</strong></td></tr>
						</c:if>
						
						<c:forEach var="item" items="${pdto.list}">
						<tr id="${item.pj_num}">
							<td style="width: 15%;"><a href="#" id="star_btn" class="unstar"><i class="fa fa-fw fa-star-o text-yellow"></i></a></td>
							<td style="width: 30%; text-align: left;">
								<ul class="list-unstyled">  
									<li><b>${item.pj_name}</b></li>
									<li>관심직종:${item.pj_cate}</li>
									<li>선호지역:${item.pj_loc}</li>
								</ul>
							</td>
							<td><button class="btn btn-default Team_btn" data-toggle="modal" data-target="#modal_Team">이동</button></td>
							<td>${item.start_d} ~ ${item.end_d}</td>
							<td><a href="#" id="${item.id}" class="user_btn" data-toggle='modal' data-target='#modal_user'>${item.name}</a></td>
							<td>${item.regdate}</td>
						</tr>
						</c:forEach>
					</table>
				</div>
								
				<!-- 페이징 -->
				<div class="box-footer text-center">
					<c:if test="${pdto.rowCount > 0}">
						<ul class="pagination">

							   <c:if test="${pdto.startPage > pdto.pageBlock}">
							   		<li id="${pdto.startPage - pdto.pageBlock}"class="page_btn"><a href="#">이전</a></li>
							   </c:if>
							   
							   <c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}">
							   		<li id="${i}" class="page_btn"><a href="#">${i}</a></li>
							   </c:forEach>
							
							   <c:if test="${pdto.endPage < pdto.pageCount}">
							   		<li id="${pdto.startPage+pdto.pageBlock}" class="page_btn"><a href="#">다음</a></li>
							   </c:if>
						</ul>
					</c:if>
				</div>
					
			</div>
			</c:if>
			
		</section>
		
		<!-- 프로젝트 초대 모달 -->
		<c:import url="${cp}/resources/LSH/Modal/Wanna_Project.jsp"/>
	        
       	<!-- 프로젝트룸 모달 -->
       	<c:import url="${cp}/resources/LSH/Modal/Team.jsp"/>

		<!-- 프로필 모달 -->
		<c:import url="${cp}/resources/LSH/Modal/User.jsp"/>

		<!-- 장바구니 모달 -->
		<c:import url="${cp}/resources/LSH/Modal/Cart.jsp"/>
		</div>
	<!-- /content-wrapper -->
	<tiles:insertDefinition name="footer" />
</div>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/category.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Cart.js"></script>
	
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/User.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Team.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Wanna_Project.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/issue.js"></script>
	   
	<!-- 기본 이벤트  -->
	<script>
		$(document).ready(initPage);
		
		function initPage() {
			level1();
			show_search_tag();
			show_sort();
			$('.pagination #${pdto.pageNum}').addClass("active");
			getCartList();
			add_star();
		}
		
		function getPageNum(){
			var pageNum = $('.pagination .active').attr('id');
			return (pageNum === undefined)? 1 : pageNum;
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
			    pj_num: 0,
			    cart_list: []
		};
		
		function getCartList(){
			<c:forEach var="item" items="${cart}">
				global.cart_list.push('${item.pj_num}');
			</c:forEach>
		}
		
 		function add_star(){
 			
 			var len = $("#result_table tr").length;
 			var len2 = global.cart_list.length;
 			
 			for(var j=1;j<len;j+=1){
 				for(var i=0;i<len2;i+=1){
					if($("#result_table tr:eq("+j+")").attr('id') === global.cart_list[i]){
 						console.log("일치함");
 						$("#result_table tr:eq("+j+") td:eq(0)").html('<a href="#" id="star_btn" class="star"><i class="fa fa-fw fa-star text-yellow"></i></a>');
 					}
 				}
 			}
		} 

	</script>

	<!-- 검색창 이벤트 -->
	<script>
	$('.clear_btn').on('click', function() {
		console.log("5.초기화");
		clear();
	});
	
	$(".date_btn").on('change', function() {
		console.log("6.날짜검사");
		check_date();
	});
	
	function show_search_tag() {
		
		var html1 = "<div id='job_list'>",
			html2 = "";

		<c:forEach var="item" items="${command.job}">
			html1 += "<span id="+global.i+">${item}<span id="+global.i+" class='del_btn' ><i class='fa fa-fw fa-times-circle'></i></span></span>";
			html2 += "<input type='hidden' id='"+global.i+"' name='job' value='${item}'>"
			global.i++;
		</c:forEach>

			html1 += "</div><br><div id='local_list'>";

		<c:forEach var="item" items="${command.local}" >
			html1 += "<span id="+global.i+">${item}<span id="+global.i+" class='del_btn'><i class='fa fa-fw fa-times-circle'></i></span></span>"; 
			html2 += "<input type='hidden' id='"+global.i+"' name='local' value='${item}'>"
			global.i++;
		</c:forEach>

			html1 += "</div>";

			$('#result').append(html1);
			$('#hidden').append(html2);
	}

	function clear() {
		$(".date_btn").val('');
		$("#keyword").val('');
		$("#job_list").empty();
		$("#local_list").empty();
		$("#hidden").empty();
	}
	
	function check_date(){
		var start_d = $('#start_d').val();
		var end_d = $('#end_d').val();
		
		if(end_d && end_d < start_d){
			alert("종료일보다 빠를 수 없습니다.")
			$("#end_d").val('');
		}	
	}
	</script>
	
	<!-- 정렬이벤트 -->
	<script>
	
	$('.sort-btn').on('click', function() {
		console.log("7.정렬변경");
		sort_change(this);
 		sort("pageNum="+getPageNum());
	});

	$('.pagination').on('click','.page_btn', function() {
		console.log("8.페이징");
		sort("pageNum="+$(this).attr("id"));
	});
	
	$('#checkbox').on('click', function() {
		var params = "pageNum="+getPageNum();
		
		if($("#checkbox").is(":checked")){
			console.log("9.체크 박스");
			$('#checking').val('y');
			sort(params);
		}else{
        	console.log("10.언체크 박스");
        	$('#checking').val('');
        	sort(params);
        }
	});
	
	// 클릭시 정렬버튼효과 추가.//  - 정렬버튼 on 클래스 추가. 기본정렬 아이콘제거. 기존 방향과 다른 방향 아이콘 지정.  
	function show_sort(){											
		var what_sort = $('#sort').val()+'_sort';
		var sort_way = $('#sort_way').val();
				
		$('#'+what_sort).addClass("on");						
		$('#'+what_sort+' i').removeClass("fa-sort");			
		
		(sort_way === 'DESC')? $('#'+what_sort+' i').addClass("fa-caret-down") : $('#'+what_sort+' i').addClass("fa-caret-up");
		
		console.log('[-]정렬 '+ $('.on').attr('id')+'-'+ $('#sort_way').val());
	}
	
	// 클릭시 버튼효과제거. 정렬값 수정 //  - 기존 위아래 정렬 제거. 기본정렬 추가. 클릭한 정렬값으로 정렬변경. 기존 방향과 다른 방향값 지정.  
	function sort_change(element){
		$('.on i').removeClass("fa-caret-down fa-caret-up");
		$('.on i').addClass("fa-sort");
		$('.on').removeClass("on");

		var sort = $(element).attr('id').replace("_sort", "");		
		
		if(sort === $("#sort").val()){				
			($('#sort_way').val() === 'DESC')? $("#sort_way").val('ASC') : $("#sort_way").val('DESC');
		}else{											
			$("#sort_way").val('DESC');
		}
		
		$("#sort").val(sort);
	}
	
	function sort(paramStr) {
		var url="<%=cp%>/aus/TeamSort";
		var params = $("#SearchForm").serialize()+"&"+paramStr;

		console.log(params);
		
 			$.ajax({
				type : "post",
				url : url,
				data : params,
				dataType: "json",
				success : function(args) {
					show_sort();
					show_mem_list(args.pdto.list);
					page_btn(args.pdto);
					count_total(args.pdto.rowCount)
				},
				error : function(e) {
					alert(e.responseText);
				}
			});
	}
	
	// 기존 tr 검색결과 제거. 검색결과 append
	function show_mem_list(list){
		
		var html = "";

		$("#result_table tr").each(function(){
			$("#result_table tr:eq(1)").remove();				
		});

		if(list.length === 0){
				html += "<tr><td colspan='7'><strong>검색 결과가 없습니다.</strong></td></tr>";
		}else{
			list.forEach(function(item) {
				html += "<tr id='"+item.pj_num+"'>";
				html +=	"<td style='width: 15%;'><a href='#' id='star_btn' class='unstar'><i class='fa fa-fw fa-star-o text-yellow'></i></td>";
				html += "<td style='width: 30%; text-align: left;'><ul class='list-unstyled'><li><b>"+item.pj_name+"</b></li>";
				html += "<li>관심직종:"+item.pj_cate+"</li>";
				html += "<li>선호지역:"+item.pj_loc+"</li></ul></td>";
				html += "<td><button class='btn btn-default Team_btn' data-toggle='modal' data-target='#modal_Team'>이동</button></td>";
				html += "<td>"+item.start_d+"~"+item.end_d+"</td>";
				html += "<td><a href='#' id='"+item.id+"' class='user_btn' data-toggle='modal' data-target='#modal_user' >"+item.name+"</a></td>";
				html += "<td>"+item.regdate+"</td></tr>";
			});			
		}
		$("#result_table").append(html);
		add_star();
	}
	
	function page_btn(pdto){
		var html ="",
			i = pdto.startPage;
		
		if(pdto.startPage > pdto.pageBlock){
			html += '<li id="'+(pdto.startPage - pdto.pageBlock)+'"class="page_btn"><a href="#">이전</a></li>';
		}
		
		for(; i <= pdto.endPage; i +=1){
			html += '<li id="'+i+'" class="page_btn"><a href="#">'+i+'</a></li>';
		}
		
		if(pdto.endPage < pdto.pageCount){
			html += '<li id="'+(pdto.startPage + pdto.pageBlock)+'"class="page_btn previous"><a href="#">다음</a></li>';
		}
		
		$('.pagination').html(html);
		$('.pagination #'+pdto.pageNum).addClass("active");
	}
	
	function count_total(element){
		var html = "전체 <small>("+element+"건)</small>";
		$('.total_count').html(html);
	}
	
	</script>
	
	<!-- 유저 프로필  -->
	<script>
	$('body').on('click','.user_btn', function() {
		console.log("12.[유저 프로필]");
		remove_data();
		profile($(this).attr('id'));
	});
	</script>
	
</body>
	<style>
		.sort_area {
			float: left;
		}
		.on{
			color:black;
			font-weight:bold;
		}
		
		.content-header a{
			margin-top: 15px;
	   		top: 0;
	   		float: none;
	   		position: absolute;
	   		right: 13px;
	   		border-radius: 2px;
	   		padding: 8px 15px;
	   		margin-bottom: 20px;
		}
	</style>
</html>