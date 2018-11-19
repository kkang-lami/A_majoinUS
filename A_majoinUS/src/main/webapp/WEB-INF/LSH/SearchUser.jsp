<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>멤버 찾기</title>
<style>
	.on{
		color:black;
		font-weight:bold;
	}
	.pagination>.active>a{
		background-color: #009450 !important;
	}
	
	.recomend_btn{ 
		background-color: #68ad5e !important;
		color: #fff !important;
		vertical-align: middle !important; 
	}

	.recomend_btn:hover{   
	    background-color: #a0c79b !important;    
	}
	
</style>
<style>
	.bg-light-blue:hover{
	    background-color: #43adea !important; 
	}
	.fa-times-circle{
		margin-right: 10px;
	}
	#SearchForm select{
		width: 15%;
		height: 23px;
		margin-top: 5px !important;
	}
	.date_btn{
		width: 123px;
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/LSH/CSS/freshslider.min.css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
<div class="wrapper">
		<tiles:insertDefinition name="header" />
		<tiles:insertDefinition name="left" />

	<!-- 전체영역 -->
	<div class="content-wrapper">

		<!-- 콘텐츠 헤더 -->
		<section class="content-header"><h1>멤버 찾기</h1></section>

		<!-- 콘텐츠 -->
		<section class="content">
			
			<!-- 검색창 -->
			<div class="box box-success">

				<div class="box-header with-border"><h3 class="box-title">팀원 상세검색</h3></div>
					
				<!-- 검색창 폼시작 -->
				<form id="SearchForm" method="post" class="form-horizontal">

					<!-- 셀렉터 바디 -->
					<div class="box-body">

						<!-- 관심직종 -->
						<div class="form-group">
							<label for="job1" class="col-sm-2 control-label">관심분야</label>
							<div class="col-sm-10">
								<select id="job1" class="show-level2"></select> <select id="job12"></select>
								<button type="button" value="job" class="add_btn btn btn-xs btn-default"><i class="fa fa-fw fa-plus"></i>추가</button>
							</div>
						</div>

						<!-- 선호지역 -->
						<div class="form-group">
							<label for="local1" class="col-sm-2 control-label">선호직역</label>
							<div class="col-sm-10">
								<select id="local1" class="show-level2"></select> <select id="local12"></select>
								<button type="button" value="local" class="add_btn btn btn-xs btn-default"><i class="fa fa-fw fa-plus"></i>추가</button>
							</div>
						</div>

						<!-- 평점 -->
						<div class="form-group row">
							<label for="eval" class="col-sm-2 control-label">평점</label>
							<div class="col-sm-3">
								<div id="unranged-value"></div>
								<input id="eval" name="eval" type="hidden" value="${command.eval}">
							</div>점 이상
						</div>

						<!-- 포함단어 -->
						<div class="form-group">
							<label for="keyword" class="col-sm-2 control-label">포함단어</label>
							<div class="col-sm-10">
								<input type="text" id="keyword" name="keyword" value="${command.keyword}" placeholder="검색어를 입력해주세요." style="width: 365px;">
							</div>
						</div>

						<!-- 정렬/ 검색어-->
						<input type="hidden" id="sort" name="sort" value="${command.sort}">
						<input type="hidden" id="sort_way" name="sort_way" value="${command.sort_way}">
						
						<div title="넘겨질 job과 local" id="hidden"></div>
						<hr>
						검색조건
						<div id="result" class="row"></div>
					</div>

					<!-- 셀렉터 푸터 -->
					<div class="box-footer">
						<input type='submit' class="btn btn-success" value="검색">
						<input type='button' class="btn btn-default pull-right clear_btn" value="초기화">
					</div>
				</form>
			</div>

			<!-- 추천 멤버 -->
			<c:if test="${fn:length(recomend) > 0}">
		    	<div class="box box-solid">
		            <div class="box-header with-border"><h4 class="box-title">추천 프로젝트</h4></div>
		        
		            <div class="box-body">
			        	<div class="row">
			                <c:forEach var="item" items="${recomend}">
			                <c:choose>
								<c:when test="${item.id eq null}">
				        		<div class="col-md-4">
						          <div class="box box-widget widget-user-2">
						            <div class="widget-user-header bg-gray disabled color-palette text-center text-green">
						              	<h3><b><i class="fa fa-fw fa-smile-o"></i></b></h3>
						              	<h4><b>해당하는 멤버가 없습니다</b></h4>
						              	<h5><b>관심직군과 선호지역을 추가해주세요!</b></h5>
						            </div>
						          </div>
						        </div>
							    </c:when>
 
							    <c:otherwise>
				        		<div class="col-md-4">
						          <div class="box box-widget widget-user-2"> 
									<div class="widget-user-header recomend_btn" id="${item.id}" data-toggle="modal" data-target="#modal_user" style="padding-left: 60px;"> 
						              <div class="widget-user-image">
						              	<img class="img-circle" src="<%=request.getContextPath()%>/aus/userImg/${item.u_img}" alt="회원 사진" onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.png';" style="width:80px; height:80px; margin-right:40px; overflow:hidden;">
						              </div>
						              	<ul class="list-unstyled">
											<li><b>${item.name}(${item.id})</b></li>
											<li>관심직종:${item.f_cate}</li>
											<li>선호지역:${item.f_loc}</li>
											<li>평점:${item.eval}</li>
										</ul> 
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
			
				<!-- 검색결과 헤더 (정렬순서) -->
				<div class="box-header">
				
					<!-- 전체:몇개 -->
					<h3 class="box-title">전체 <small>(${pdto.rowCount}건)</small></h3>
					
					<!-- 정렬순서 -->
					<div class="text-right" title="정렬순 선택">
						<a href="#" id="joindate_sort" class="sort-btn">가입일순<i class="fa-fw fas fa-sort"></i></a>
							<span class="line">|</span>
						<a href="#" id="eval_sort" class="sort-btn">평점순 <i class="fa-fw fas fa-sort"></i></a>
							<span class="line">|</span>
						<a href="#" id="mem_view_sort" class="sort-btn">인기순<i class="fa-fw fas fa-sort"></i></a> 
			        </div>
				</div>
				
				<!-- 검색결과 목록 -->
				<div class="box-body">
					<table id="result_table" class="table table-hover text-center">
						<tr id="first">
							<th colspan="3">회원정보</th>
							<th>가입일</th>
							<th>멤버초대</th>
						</tr>

						<c:if test="${fn:length(pdto.list) < 1}">
						<tr><td colspan="5"><strong>검색 결과가 없습니다.</strong></td></tr>
						</c:if>
					
						<c:forEach var="item" items="${pdto.list}">
						<tr id="${item.id}">
							<td style="width: 20%;">
								<img class="img-circle" src="<%=request.getContextPath()%>/aus/userImg/${item.u_img}" alt="회원 사진" onError="this.src='<%=request.getContextPath() %>/resources/dist/img/user1-128x128.png';" style="width:80px; height:80px; overflow:hidden;">
							</td>
							<td style="width: 30%; text-align: left;">
								<ul class="list-unstyled">
									<li><b>${item.name}(${item.id})</b></li>
									<li>관심직종:${item.f_cate}</li>
									<li>선호지역:${item.f_loc}</li>
									<li>평점:${item.eval}</li>
								</ul>
							</td>
							<td><button class="btn btn-default user_btn" data-toggle="modal" data-target="#modal_user">이동</button></td>
							<td>${item.joindate}</td>
							<td><button class="btn btn-success plus_btn" data-toggle="modal" data-target="#modal-join">멤버초대</button></td>
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

		<!-- 멤버초대 모달 -->
		<c:import url="${cp}/resources/LSH/Modal/Wanna_User.jsp"/>
       
       	<!-- 프로필 모달 -->
		<c:import url="${cp}/resources/LSH/Modal/User.jsp"/>
        	
	</div>
	<!-- /content-wrapper -->

	<tiles:insertDefinition name="footer" />
	
	
</div>

	<!-- script -->
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/User.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/category.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/Wanna_User.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/freshslider.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/JS/issue.js"></script>
 
	<!-- 기본 이벤트 -->
	<script>
	$(document).ready(initPage);
	
	function initPage() {
		level1();
		show_search_tag();
		show_sort();	
		$('.pagination #${pdto.pageNum}').addClass("active");
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
		    receiver: "",
		    pj_num: 0
		};
	</script>
	
	<!-- 검색창 이벤트 -->
	<script>
	
	$("#unranged-value").on('click', function() {
		$("#eval").val($(".fscaret").text());
	});
	
	$('.clear_btn').on('click', function() {
		console.log("5.초기화");
		clear();
	});

	function show_search_tag() {

		var html1 = "<div id='job_list'>",
			html2 = "";

		<c:forEach var="item" items="${command.job}">
			html1 += "<span id="+global.i+">${item}<span id="+global.i+" class='del_btn'><i class='fa fa-fw fa-times-circle'></i></span></span>";
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
		$("#eval").val('0.0');
		$("#unranged-value").freshslider({ step: 0.1,value:0.0 });
		$("#keyword").val('');
		$("#job_list").empty();
		$("#local_list").empty();
		$("#hidden").empty();
	}
	</script>

	<!-- 정렬이벤트 -->
	<script>
	$('.sort-btn').on('click', function() {
		console.log("6.정렬변경");
		sort_change(this);
		sort("pageNum="+getPageNum());
	});

	$('.pagination').on('click','.page_btn', function() {
		console.log("7.페이징");
		sort("pageNum="+$(this).attr("id"));
	});
	
	function show_sort(){											/* 지정된 정렬기준을 가져와 화면에 표시 */
		var what_sort = $('#sort').val()+'_sort';
		var sort_way = $('#sort_way').val();
				
		$('#'+what_sort).addClass("on");						/* css추가 */
		$('#'+what_sort+' i').removeClass("fa-sort");			/* 솔트정렬삭제 */
		
		(sort_way === 'DESC')? $('#'+what_sort+' i').addClass("fa-caret-down") : $('#'+what_sort+' i').addClass("fa-caret-up");
		
		console.log('[-]정렬 '+ $('.on').attr('id')+'-'+ $('#sort_way').val());
	}

	function sort_change(element){
		$('.on i').removeClass("fa-caret-down fa-caret-up");
		$('.on i').addClass("fa-sort");
		$('.on').removeClass("on");

		var sort = $(element).attr('id').replace("_sort", "");		//joindate
		
		if(sort === $("#sort").val()){				
			($('#sort_way').val() === 'DESC')? $("#sort_way").val('ASC') : $("#sort_way").val('DESC');
		}else{											
			$("#sort_way").val('DESC');
		}
		$("#sort").val(sort);									
	}
	
	function show_mem_list(list){
		var html = "";

		$("#result_table tr").each(function(){
			$("#result_table tr:eq(1)").remove();				
		});

		if(list.length === 0){
				html += "<tr><td colspan='7'><strong>검색 결과가 없습니다.</strong></td></tr>";
		}else{
			
			list.forEach(function(item) {
				html += "<tr id='"+item.id+"'><td style='width: 20%;'>"
				html += "<img class='img-circle' src='"+getContext()+"/aus/userImg/"+item.u_img+"' onerror='error(this)' alt='회원 사진' style='width:80px; height:80px; overflow:hidden;'></td>";
				html += "<td style='width: 30%; text-align: left;'><ul class='list-unstyled'><li><b>"+item.name+"("+item.id+")</b></li>";
				html += "<li>관심직종:"+item.f_cate+"</li>";
				html += "<li>선호지역:"+item.f_loc+"</li>";
				html += "<li>평점:"+item.eval+"</li></ul></td>";
				html += "<td><button class='btn btn-default user_btn' data-toggle='modal' data-target='#modal_user' >이동</button></td>";
				html += "<td>"+item.joindate+"</td>";
				html += "<td><button class='btn btn-success plus_btn' id='"+item.id+"' data-toggle='modal' data-target='#modal-join'>";
				html += "멤버초대</button></td></tr>";
			});
		}
		$("#result_table").append(html);
	}  
	
	function sort(paramStr) {
		var url="<%=cp%>/aus/UserSort";
		var params = $("#SearchForm").serialize()+"&"+paramStr;

 			$.ajax({
				type : "post",
				url : url,
				data : params,
				dataType: "json",
				success : function(args) {
					show_sort();
					show_mem_list(args.pdto.list);
					page_btn(args.pdto);
				},
				error : function(e) {
					alert(e.responseText);
				}
			});
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
		
		$('.pagination').empty();
		$('.pagination').append(html);
		$('.pagination #'+pdto.pageNum).addClass("active");
	}
	
	function getPageNum(){
		var pageNum = $('.pagination .active').attr('id');
		return (pageNum === undefined)? 1 : pageNum;
	}

	</script>
	
	<!-- 유저 모달  -->
	<script>
	$('body').on('click','.user_btn', function() {
		console.log("8.[유저 프로필]"+$(this).parents("tr").attr('id'));
		remove_data();
		profile($(this).parents("tr").attr('id'));
	});
	$('body').on('click','.recomend_btn', function() {
		console.log("8.[추천유저 프로필]"+$(this).attr('id'));
		remove_data();
		profile($(this).attr('id'));
	});
	
	$('body').on('error','img', function() {
		console.log("이미지에러");
	});
	
	</script>
	
	<!-- 레인지 -->
	<script>
	    $("#unranged-value").freshslider({
	        step: 0.1,
	        value:'${command.eval}' 
	    });

	    function error(element){
	    	console.log("야!");
	    	$(element).attr('src',getContext()+"/resources/dist/img/user1-128x128.png"); 
	    }
	    
	</script>
	
</body>
</html>