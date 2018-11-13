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
			<a href="#modal_cart" class="btn btn-danger btn-sm" data-toggle='modal' ><i class="fa fa-fw fa-shopping-cart"></i> 프로젝트 스크랩</a>
		</section>

		<!-- 콘텐츠 -->
		<section class="content">
					
			<!-- 셀럭터 -->
			<div class="box box-primary">

				<!-- 셀럭터 헤더 -->
				<div class="box-header with-border">
					<h3 class="box-title">프로젝트 상세검색</h3>
				</div>
							
				<!-- 폼시작 -->
				<form id="SearchForm" method="post" class="form-horizontal">

					<!-- 셀렉터 바디 -->
					<div class="box-body">
	
						<!-- 관심직종 -->
						<div class="form-group">
							<label for="job1" class="col-sm-2 control-label">관심분야</label>
							<div class="col-sm-10">
								<select id="job1" class="show-level2"></select> <select id="job12"></select>
								<button type="button" value="job" class="add_btn">추가</button>
							</div>
						</div>
	
						<!-- 선호지역 -->
						<div class="form-group">
							<label for="local1" class="col-sm-2 control-label">선호직역</label>
							<div class="col-sm-10">
								<select id="local1" class="show-level2"></select> <select id="local12"></select>
								<button type="button" value="local" class="add_btn">추가</button>
							</div>
						</div>
	
						<!-- 프로젝트 기간 -->
						<div class="form-group">
							<label for="start_d" class="col-sm-2 control-label">프로젝트 기간</label>
							<div class="col-sm-10">
								<input type="date" id="start_d" name="start_d" class="date_btn" value="${command.start_d}"> - 
								<input type="date" id="end_d" name="end_d" class="date_btn" value="${command.end_d}">
							</div>
						</div>
	
						<!-- 포함단어 -->
						<div class="form-group">
							<label for="keyword" class="col-sm-2 control-label">포함단어</label>
							<div class="col-sm-10">
								<input type="text" id="keyword" name="keyword" value="${command.keyword}" placeholder="검색어를 입력해주세요.">
							</div>
						</div>
	
						<!-- 정렬/ 검색어-->
						<input type="hidden" id="sort" name="sort" value="${command.sort}">
						<input type="hidden" id="sort_way" name="sort_way" value="${command.sort_way}">
						<input type="hidden" id="checking" name="checking" value="${command.checking}">
						
						<div title="넘겨질 job과 local" id="hidden"></div>
	
						<hr>
						검색조건
						<div id="result"></div>
							
					</div>
					<!-- 바디 종료 -->
	
					<!-- 셀렉터 푸터 -->
					<div class="box-footer">
						<input type='submit' class="btn btn-primary" value="검색">
						<input type='button' class="btn btn-default pull-right clear_btn" value="초기화">
					</div>
				
				</form>

			</div>
			<!-- /셀렉터 -->	
			
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
								
				<!-- 검색결과 content -->
				<div class="box-body">

					<table id="result_table" class="table table-hover text-center">
						<tr>
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
							<c:if test="${item.favs eq 'YES'}">
							<td><a href="#" id="star_btn" class="star"><i class="fa fa-fw fa-star text-yellow"></i></a></td>
							</c:if>
							<c:if test="${item.favs ne 'YES'}">
							<td><a href="#" id="star_btn" class="unstar"><i class="fa fa-fw fa-star-o text-yellow"></i></a></td>
							</c:if>
							<td>
								<ul>
									<li>${item.pj_name}</li>
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
				<div class="box-footer">
					<c:if test="${pdto.rowCount > 0}">
					<div class="col-sm-5">멘트 추가예정..</div>
					<div class="col-sm-7">
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
					</div>
					</c:if>
				</div>
					
			</div>
			</c:if>
			<!-- /검색결과 -->
			
		</section>
		
		<!-- 모달창 -->
			<!-- 멤버초대 모달 -->
			<div class="modal fade" id="modal-join">
		    <div class="modal-dialog modal-sm">
		    	<div class="modal-content">
		            
		        	<div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title">프로젝트 신청</h4>
		    		</div>
		              
		        	<div class="modal-body text-center">
		                <p>프로젝트 참가 신청하시겠습니까?</p>
		           	</div>
		              
		           	<div class="modal-footer">
						<button type="button" class="send_btn btn btn-primary pull-left" data-dismiss="modal">OK</button>
		                <button type="button" class="btn btn-default" data-dismiss="modal">CANCLE</button>
		      		</div>
		            
	            </div>
		    </div>
	        </div>
		        
        	<!-- 프로젝트룸 모달 -->
        	<div class="modal fade" id="modal_Team">
	          <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	            
	            	<!-- 멤버상세 헤더 -->
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                  <span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title">프로젝트 상세정보</h4>
		            </div>
		        	
		        	<!-- 멤버상세 내용 -->
		           	<div class="modal-body">

						<!-- Profile Image -->
						
						<div class="box box-body box-primary">
							<h3 class="team-name"></h3>
							
						<div class="modal-body">
							<ul class="list-group">
								 <li class="list-group-item">
					               <b><i class="fa fa-book margin-r-5"></i>프로젝트 기간</b> 
					               <p class="team-date text-muted"></p>
					             </li>
					             <li class="list-group-item">
					               <b><i class="fa fa-book margin-r-5"></i>관심직군</b> 
					               <p class="team-job text-muted"></p>
					             </li>
					             <li class="list-group-item">
					               <b><i class="fa fa-map-marker margin-r-5"></i>선호지역</b>
					               <p class="team-local text-muted"></p>
					             </li>
					             <li class="list-group-item">
					               <b><i class="fa fa-map-marker margin-r-5"></i>모집인원</b>
					               <p class="team-memnum text-muted"></p>
					             </li>
					             <li class="list-group-item">
					               <b><i class="fa fa-map-marker margin-r-5"></i>프로젝트 소개</b>
					               <p class="team-text text-muted"></p>
					             </li>
				          	</ul>
				        </div>

						<div class="modal-footer">
							<div class="col-md-8 ">
								<a id="join_btn" data-toggle="modal" href="#modal-join"><b>프로젝트 신청</b></a>
							</div>
							<div class="col-md-4">
								<a href="#" id="Teamissue_btn" data-toggle="popover" title="신고사유"><b>신고</b></a>
							</div>
			      		</div>
			        </div>
	            
	            </div>
	          </div>
	        </div>
        	
        <!-- /모달창 -->
		
	</div>
		
			<!-- 프로필 모달 -->
			<div id="getModal"></div>
			
			<!-- 장바구니 모달 -->
			<div class="modal fade" id="modal_cart">
	          <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	            
	            	<!-- 멤버상세 헤더 -->
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                  <span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title">프로젝트 스크랩</h4>
		            </div>
		        	
		        	<!-- 멤버상세 내용 -->
		           	<div class="modal-body">

	


			        </div>
	            
	            </div>
	          </div>
	        </div>
			
	</div>
	<!-- /content-wrapper -->
	
	<tiles:insertDefinition name="footer" />
</div>

	<!-- 기본 이벤트  -->
	<script>
		$(document).ready(initPage);
		
		function initPage() {
			$("#getModal").load(getContext()+"/resources/LSH/modal_profile.html");
			level1();
			show_search_tag();
			show_sort();	
			$('.pagination #${pdto.pageNum}').addClass("active");
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
			var sessionid = '${sessionScope.userId}';
			return sessionid;
		}
	</script>

	<!-- 셀렉터 이벤트 -->
	<script>
	var global = {
		    i : 0,
		    origin_d : "",
		    receiver : "",
		    pj_num: 0
	};
	
 	function level1(){
		var url="<%=cp%>/aus/LSH/first_List";
 	
		$.ajax({
			type:"post",
			url:url,
			dataType:"json",
			success:function(args){
				var i = 0,
				    array = [],
					joblen = args.job_list.length,
					locallen = args.local_list.length;
				
				for(; i < joblen; i += 1){
				    array[i] = "<option value='"+args.job_list[i]+"'>"+args.job_list[i]+"</option>";
				}
				$("#job1").html(array.join(''));
				
				for(i=0; i < joblen; i += 1){
				    array[i] = "<option value='"+args.local_list[i]+"'>"+args.local_list[i]+"</option>";
				}
				$("#local1").html(array.join(''));
				
				init_level2("job1");
				init_level2("local1");
			},
			error:function(e){
				alert(e.responseText);
			}
		});
 	}
	
	function init_level2(what) {
		var params ="hint="+$("#"+what+" option:eq(0)").val();
		var id = what+"2"; 
		real_level2(params,id);
	}
 	
	function level2(element) {
		var params = "hint=" + $(element).val();
		var id = $(element).attr("id") + "2";
		real_level2(params,id);
	}
	
	function real_level2(params,id){
		var url="<%=cp%>/aus/LSH/second_List";
		$.ajax({
			type : "post",
			url : url,
			data : params,
			dataType : "json",
			success : function(args) {
				$("#" + id + " option").each(function() {
					$("#" + id + " option:eq(0)").remove();
				});

				for (var idx = 0; idx < args.list.length; idx++) {
					$("#" + id).append("<option value='"+args.list[idx]+"'>"+ args.list[idx] + "</option>");
				}
			},
			error : function(e) {
				alert(e.responseText);
			}
		});
	}

	function show_search_tag() {

		var html1 = "<div id='job_list' class='inline'>",
			html2 = "";

		<c:forEach var="item" items="${command.job}">
			html1 += "<div id="+global.i+">${item}<button id="+global.i+" class='del_btn'>x</button></div>";
			html2 += "<input type='hidden' id='"+global.i+"' name='job' value='${item}'>"
			global.i++;
		</c:forEach>

			html1 += "</div><br><div id='local_list' class='inline'>";

		<c:forEach var="item" items="${command.local}" >
			html1 += "<div id="+global.i+">${item}<button 'button' id="+global.i+" class='del_btn'>x</button></div>";
			html2 += "<input type='hidden' id='"+global.i+"' name='local' value='${item}'>"
			global.i++;
		</c:forEach>

			html1 += "</div>";

			$('#result').append(html1);
			$('#hidden').append(html2);
	}

	function add(element) {
		var list = [],
			html1 = "",
			html2 = "",
			i = 0,
			what = $(element).attr("value"), str = $("#" + what + "1").val() + ">"+ $("#" + what + "12").val(),
			len = $("input[name=" + what+ "]").length;

			for (; i < len; i += 1) {
				list.push($("input[name='" + what + "']:eq(" + i + ")").val());
			}

			if (list.indexOf(str) > -1) {
				alert("이미 추가된 검색어 입니다.");
			} else if (len >= 3) {
				alert("3개 까지 지정가능합니다. (현재 입력수:" + len + ")");
			} else {
				html1 += "<div id="+global.i+">" + str + " ";
				html1 += "<button type='button' id="+global.i+" class='del_btn'>x</button></div>";
				html2 += "<input type='hidden' id='"+global.i+"' name='"+what+"' value='"+str+"'>";

				$('#' + what + '_list').append(html1);
				$('#hidden').append(html2);
				global.i++;
			}
		}

	function del(elements) {
		var num = $(elements).attr("id");
		
		$("#result #" +num).remove();
		$("#hidden #" +num).remove();
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
		var url="<%=cp%>/aus/LSH/Team/sort";
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
	
	// 클릭시 정렬버튼효과 추가.//  - 정렬버튼 on 클래스 추가. 기본정렬 아이콘제거. 기존 방향과 다른 방향 아이콘 지정.  
	function show_sort(){											
		var what_sort = $('#sort').val()+'_sort';
		var sort_way = $('#sort_way').val();
				
		$('#'+what_sort).addClass("on");						
		$('#'+what_sort+' i').removeClass("fa-sort");			
		
		(sort_way === 'DESC')? $('#'+what_sort+' i').addClass("fa-caret-down") : $('#'+what_sort+' i').addClass("fa-caret-up");
		
		console.log('[-]정렬 '+ $('.on').attr('id')+'-'+ $('#sort_way').val());
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

				if(item.favs === "YES"){
				html +=	"<td><a href='#' id='star_btn' class='star'><i class='fa fa-fw fa-star text-yellow'></i></td>";
				}else{
				html +=	"<td><a href='#' id='star_btn' class='unstar'><i class='fa fa-fw fa-star-o text-yellow'></i></td>";
				}
				
				html += "<td><ul><li>"+item.pj_name+"</li>";
				html += "<li>관심직종:"+item.pj_cate+"</li>";
				html += "<li>선호지역:"+item.pj_loc+"</li></ul></td>";
				html += "<td><button class='btn btn-default Team_btn' data-toggle='modal' data-target='#modal_Team'>이동</button></td>";
				html += "<td>"+item.start_d+"~"+item.end_d+"</td>";
				html += "<td><a href='#' id='"+item.id+"' class='user_btn' data-toggle='modal' data-target='#modal_user' >"+item.name+"</a></td>";
				html += "<td>"+item.regdate+"</td></tr>";
			});			
		}
		$("#result_table").append(html);
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
	
	<!-- 자동 이벤트  -->
	<script>
	$('.show-level2').on('change', function() {
		console.log("2.레벨2");
		level2(this);
	});

	$('.add_btn').on('click', function() {
		console.log("3.에드");
		add(this);
	});

	$('#result').on('click', '.del_btn', function() {
		console.log("4.삭제");
		del(this);
	});

	$('.clear_btn').on('click', function() {
		console.log("5.초기화");
		clear();
	});
	
	$(".date_btn").on('change', function() {
		console.log("6.날짜검사");
		check_date();
	});
	
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
	
	$('#result_table').on('click','.Team_btn', function() {
		console.log("11.프로젝트 상세보기 - ${sessionScope.userId}");
		global.pj_num = 0;
		global.receiver = "";
		remove_Teamdata();
		projectRoom($(this).parents("tr").attr('id'));
	});
	
	$('#result_table').on('click','.user_btn', function() {
		console.log("12.[유저 프로필]");
		remove_data();
		profile($(this).attr('id'));
	});
	
	///////////////////////////////////////////////////////////////////////////////////////////
	$("body").on('click','.unstar', function() {
		console.log("13.즐겨찾기 추가");
		star(this,"add");
	});

	$("body").on('click','.star', function() {
		console.log("14.즐겨찾기 제거");
		star(this,"del");
	});
	
	
	function star(element,status){
		var url=getContext()+"/aus/LSH/Team/favorite";
		var pj_num = $(element).parents("tr").attr('id');
		var params = "pj_num="+pj_num+"&login_id="+getSessionId()+"&status="+status;

		$.ajax({
			type:"post",
			url:url,
			data: params,
			success:function(args){
				console.log("[*]즐겨찾기도착");
				if(status === "add"){
					$('#'+pj_num+' #star_btn').attr('class','star');
					$('#'+pj_num+' #star_btn').html('<i class="fa fa-fw fa-star text-yellow"></i>');
				}else{
					$('#'+pj_num+' #star_btn').attr('class','unstar');
					$('#'+pj_num+' #star_btn').html('<i class="fa fa-fw fa-star-o text-yellow"></i>');
				}
			},
			error:function(e){
				alert(e.responseText);
			}
		}); 
		
	}
	</script>
	
	<!-- 플젝초대 모달 -->
	<script>
	$(document).on('show.bs.modal', '.modal', function (event) {
	    var zIndex = 1040 + (10 * $('.modal:visible').length);
	    $(this).css('z-index', zIndex);
	    setTimeout(function() {
	        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
	    }, 0);
	});
	
	$('.send_btn').on('click', function() {
		console.log("10.신청전송");
		joinUs();	
	});
	
	function joinUs(){
		var url="<%=cp%>/aus/LSH/insert_Message";
		var params = "receiver="+global.receiver+"&sender=${sessionScope.userId}"+"&pj_num="+global.pj_num+"&a_type=신청";
  		$.ajax({
			type:"post",
			url:url,
			data : params,
			success:function(args){
				console.log("[*]메서지전송성공");
			},
			error:function(e){
				alert(e.responseText);
			}
		});
	}
	</script>

	<!-- 프로젝트룸 모달 -->
	<script>
	function projectRoom(pj_num){
		var url="<%=cp%>/aus/LSH/Team/profile";
		$.ajax({
			type:"post",
			url:url,
			data:{"pj_num": pj_num},
			dataType:"json",
			success:function(args){
				load_projectRoom(args.x);
			},
			error:function(e){
				alert(e.responseText);
			}
		});
	}
		
	function load_projectRoom(data){
		global.receiver = data.ID;
		global.pj_num = data.PJ_NUM;
		
		$('.team-name').html("&ensp;"+data.PJ_NAME);
		$('.team-date').html(data.START_D+" ~ "+data.END_D);
		$('.team-memnum').html(data.MEM_LIMIT+"명");

		if(data.JOB){
			$('.team-job').html(data.JOB);
		}
		
		if(data.LOCAL){
			$('.team-local').html(data.LOCAL);
		}
		
		if(data.PJ_INFO){
			$('.team-text').html(data.PJ_INFO);
		}
		
		if('${sessionScope.userId}'.indexOf(data.ID) !== -1){
			$('#join_btn').attr('class','btn btn-default btn-block disabled');
			$('#join_btn').html('<span class="text-muted">본인이 개설한 프로젝트는 신청할 수 없습니다</span>');
			$('#Teamissue_btn').attr('class','btn btn-default btn-block disabled');
		}else{
			$('#join_btn').html('<b>프로젝트 참가</b>');
		}
	}
		
	function remove_Teamdata(){
		global.pj_num = 0;
		global.receiver = "";
		$('.team-job').html('관심있는 직군이 없습니다');
		$('.team-local').html('선호하는 지역이 없습니다');
		$('.team-text').html('프로젝트의 소개가 없습니다');
		$('#join_btn').attr('class','btn btn-primary btn-block');
		$('#Teamissue_btn').attr('class','btn btn-danger btn-block');
	}
	
	$('#modal_Team').on('hide.bs.modal', function (e) {
		console.log("팝오버제거");
		$("[data-toggle=popover]").popover('hide');
	})
	</script>

	<!-- 장바구니 -->
	<script>
	function cart(){
		var url="<%=cp%>/aus/LSH/Team/cart";
		$.ajax({
			type:"post",
			url:url,
			dataType:"json",
			success:function(args){
				console.log("도착"+args.x);
			},
			error:function(e){
				alert(e.responseText);
			}
		});
	}
	</script>

	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/LSH/profile_modal.js"></script>
	
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