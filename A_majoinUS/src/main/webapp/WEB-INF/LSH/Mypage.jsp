<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>Document</title>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
.m:hover {
    background: #00a65a !important;
    color: #fff !important;
}
.pp:hover {
    background: #168ed4 !important;
    color: #fff !important;
}
.bg-light-blue-activeblue { 
    background-color: #1b99e2 !important;
}
.box.box-primary {
    border-top-color: #46bbff   !important; 
}
.box.box-danger {
    border-top-color: #42c187 !important;
}
.btn-app {
	background-color: #ffffff !important;
}
</style>
</head>
<body>

<div class="wrapper">
	<tiles:insertDefinition name="header" />
	

	<!-- 전체영역 -->
	<div class="content-wrapper">

		<!-- 콘텐츠 헤더 -->
		<section class="content-header">
			<h1>
        My page    
        <small>${sessionScope.name} 님의 마이페이지 입니다.</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">MyPage</a></li>
  </ol>
<hr id="hr_style"/>
		<!-- 콘텐츠 -->
		<section class="content">
			<!-- 은주 코딩 -->
<div class="row" style="margin-bottom: 10px;">
	<div class="col-md-6">
		<a class="btn btn-app btn-block m" onclick = "location.href='SearchUserForm'" style="margin-bottom: 0px;margin-left: 0px;padding-bottom: 50px;"><i class="fa fa-user"></i> 팀원 검색</a>
	</div>
	<div class="col-md-6" >
		<a class="btn btn-app btn-block pp" onclick = "location.href='SearchTeamForm'" style="margin-bottom: 0px;margin-left: 0px;padding-bottom: 50px;"><i class="fa fa-users"></i> 프로젝트 검색</a>
	</div>
	<br><br>
</div>
<div class="out">
<div class="row">
        <div class="col-xs-12">              
          <div class="box box-warning">
            <div class="box-header">
              <h3 class="box-title" style="text-align: left !important;"><i class="fa fa-fw fa-bell text-yellow"></i> 최근 알림</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
          <!-- <input type="text" name="table_search" class="form-control pull-right" placeholder="Search"> -->

          <div class="input-group-btn">
            <!-- <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button> -->
          </div>
        </div>
      </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body table-responsive no-padding">
      <table class="table table-hover">
        <tr>                  
          <th>알림내용</th>
          <th>보낸이</th>
          <th>수신일</th>                  
        </tr>
        <c:if test="${projectApplyAlarm_size > 0 }">
        <c:forEach items="${projectApplyAlarm}" var="alarm">
        <tr>                                  
          <td>"${alarm.pj_name}" 프로젝트 <small class="badge bg-light-blue-activeblue">${alarm.a_type}신청</small></td>
          <td>${alarm.sender }</td>
          <td>
	<c:set var="reg" value="${fn:substring(alarm.a_date,0,10)}" />${reg}</td>                  
        </tr>
        </c:forEach>
        </c:if>
        <c:if test="${projectApplyAlarm_size == 0 }">
        <tr>
        	<td colspan=3> 참가 알림 내역이 존재하지 않습니다.</td>
        </tr>
        </c:if>
        <c:if test="${projectProposalAlarm_size >0 }">
         <c:forEach items="${projectProposalAlarm}" var="projectProposalAlarm">
        <tr>
        <td>${projectProposalAlarm.name} 프로젝트  <small class="badge bg-green">${projectProposalAlarm.a_type}신청</small>
		</td>
		<td>
			${projectProposalAlarm.sender}
		</td>
		<td>
		<c:set var="dayday" value="${fn:substring(projectProposalAlarm.a_date,0,10)}" />
				${dayday}
		</td>
        </tr>
        </c:forEach>
        </c:if>
        <c:if test="${projectProposalAlarm_size == 0 }">
        	 <tr>
        	<td colspan=3> 초대 알림 내역이 존재하지 않습니다.</td>
        </tr>
        </c:if>
        
      </table>
    </div>
    <!-- /.box-body -->
  </div>
  <!-- /.box -->
        </div>
      </div>

<div class="out">
<div class="row">    
        <div class="col-xs-12">    
          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title" style="text-align: left !important;"><i class="fa fa-fw fa-rocket" style="color: #289bde;"></i>진행 중인 프로젝트</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
          <!-- <input type="text" name="table_search" class="form-control pull-right" placeholder="Search"> -->

          <div class="input-group-btn">
            <!-- <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button> -->
          </div>
        </div>
      </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body table-responsive no-padding">
      <table class="table table-hover">
        <tr>                  
          <th>프로젝트명</th>
          <th>프로젝트 기간</th>
        </tr>
        <c:forEach items="${ongoing_list}" var="ongoing_list">
   <tr>
      <td>${ongoing_list.pj_name}</td>
      <td>
      <c:set var="start" value="${fn:substring(ongoing_list.start_d,0,10)}" />
      <c:set var="end" value="${fn:substring(ongoing_list.end_d,0,10)}" />
         ${start} ~ ${end}        
      </td> 
      <td>
        </c:forEach>
      </table>
    </div>
    <!-- /.box-body -->
  </div>
  <!-- /.box -->
        </div>
      </div>
</div>
</div>
			
			
			
			<!-- 성희 코딩 -->
			<div class="box box-danger todo_box">
			
	            <div class="box-header ui-sortable-handle" style="cursor: move;padding-left: 15px;">
	               <i class="ion ion-clipboard"></i>
	              <h3 class="box-title">To Do List</h3>
	            </div>
	            <!-- /.box-header -->
            
	            <div class="box-body">
		            <div class="scrollBlind">
						<ui id="todos" class="clearfix todo-list ui-sortable"></ui>
					</div>
					<br>
					
					<!-- 검색창 -->			
					<div class="todo-inputBox input-group">
						<input type="text" id="todo-input" class="form-control"	placeholder="할 일을 입력해주세요" maxlength="30" /> 
						<span class="input-group-addon" id="submit-button">입력</span>
					</div>
					
	            </div>
	            
	            <div class="box-footer clearfix no-border">
	              	<button type="button" id="removeAll" class="btn btn-danger pull-right btn-sm">모두 삭제</button> 
	              	<button type=button id="removeAllChecked" class="btn btn-warning pull-right btn-sm">선택한 항목 삭제</button>
	            </div>
            
          </div>
		</section>
			
	</div>
	<!-- /content-wrapper -->
	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</div>

</body>
<style>
	.todo_box{
		position: relative; left: 0px; top: 0px;
	}
	.done{
		color: #999; text-decoration: line-through;
	}
	.scrollBlind{
	    height:20%; overflow-y:scroll;
	}
	.todo-list>li{
	    background: #ffffff; margin-right: 8px; margin-bottom: 3px;
	}
	.todo_box .btn-warning {
		margin-right: 5px;
	}
</style>
<script>
window.onload = () => {      
    //이벤트를 적용할 엘리먼트 선택
	var checkInput = document.querySelector('#todo-input');
	var inputSumbitBtn = document.querySelector('#submit-button');
	var todos = document.querySelector('#todos');
	var removeCheckedBtn = document.querySelector("#removeAllChecked");
	var removeAll = document.querySelector("#removeAll");
	
	// todo관련 데이터 저장 변수 설정
    var inputValue;
    var todoListData = new Map();
    var todo = [];
    var todo_nums = [];
    function getRandom(){
    	return (new Date().getTime()).toString(36);
    }
    
    // 엔터키+클릭만 이벤트 지정.
    checkInput.addEventListener("keyup", function(event) {
        if (event.code == "Enter") {
            inputSumbitBtn.onclick();
        } else {
            inputValue = this.value;
        }
    });
    
    //제거버튼 이벤트 추가
    removeCheckedBtn.addEventListener("click", function() {
       	var allTodos = document.querySelectorAll(".todo");
       	for (var i = 0; i < allTodos.length; i++) {
           	if (allTodos[i].classList.value.indexOf("checked") > -1) {
        	   todo_nums.push($(allTodos[i].childNodes).attr('id'));
               allTodos[i].remove();
           	}
       	}
       
       	if(todo_nums.length > 0){
    	   deleteTodo(todo_nums);
       	}
       	todo_nums = [];
		todoListData = new Map();
		var aliveTodos = document.querySelectorAll(".todo");
		for (var setData of aliveTodos) {
			todoListData.set($(setData.childNodes).attr('id'),$(setData.childNodes).text());
		}
    });
    
    //모두제거버튼 이벤트 추가
    removeAll.onclick = function() {
    	var allTodos = document.querySelectorAll(".todo");
        for (var i = 0; i < allTodos.length; i++) {
        	todo_nums.push($(allTodos[i].childNodes).attr('id'));
            allTodos[i].remove();
        }
        
        if(todo_nums.length > 0){
       		deleteTodo(todo_nums);
        }
        todo_nums = [];
        todoListData = new Map();
    }
    
    // 등록버튼 이벤트 추가
    inputSumbitBtn.onclick = function() {
        if (inputValue == undefined || inputValue == "") {
            alert("데이터를 입력해 주세요");
        } else {
        	var num = getRandom();
        	insertTodo(num,inputValue);
        	todoListData.set(num, inputValue);
        	
            checkInput.value = "";							
            inputValue = undefined;							
            
            makeList(todos, todoListData);
        }
    }
  
    // response로 받아온 리스트값 -> todoListData에 저장.
    function load(){
    	<c:forEach var="item" items="${todo}">
    		todoListData.set('${item.todo_num}', '${item.todo}');
    	</c:forEach>
    	makeList(todos, todoListData);
    }
    
    load();
};

	// 리스트 생성
	function makeList(target, data) {
		var targetChild = document.querySelectorAll('.todo');
		var template = "";
	    
		for (var child of targetChild) {
	        target.removeChild(child);
	    }
		
		for (var [key, value] of data) {
	
			if(value.indexOf("[$완]") >= 0){
				template = '<li class="todo list-group-item checked done">';
				template += '<input id="'+key+'" type="checkbox" class="checkbox-inline" checked="">';
				template += '<span class="text">'+value.split('[$완]')[1]+'</span></li>';
			}else{
				template = '<li class="todo list-group-item">';
				template += '<input id="'+key+'" type="checkbox" class="checkbox-inline">';
				template += '<span class="text">'+value+'</span></li>';
			}
			
			target.innerHTML += template;
		}
	}
	
	// 디비등록
	function insertTodo(todo_num,todo){
		console.log("등록실행");
		
		var url="<%=cp%>/aus/insertTodo";
		var params = "id=${sessionScope.id}&todo_num="+todo_num+"&todo="+todo;
		
		$.ajax({
			type : "post",
			url : url,
			data : params,
			beforeSend: function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX","true");	
			},
			success : function(args) {
				console.log("[*]등록성공");
			},
			error : function(xhr,textStatus,error) {
				warn(xhr.status);
			}
		});
	}

	function warn(e){
		if(e=="400"){
			alert('로그아웃 되었습니다');
			location.href="/A_majoinUS/aus/main";
		}else if(e=="401"){
			alert('정상적으로 처리되지 않았습니다');
		}
	}


	//디비 업데이트
	function updateTodo(todo_num,status){
		var url="<%=cp%>/aus/Fin";
		
		$.ajax({
			type : "post",
			url : url,
			data : { 
				"todo_num": todo_num,
				"status": status
			},
			beforeSend: function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX","true");	
			},
			success : function(args) {
				console.log("[*]성공");
			},
			error : function(xhr,textStatus,error) {
				warn(xhr.status);
			}
		});
	}
	
	//디비삭제
	function deleteTodo(todo_nums){
		var url="<%=cp%>/aus/deleteTodo";
		
		$.ajax({
			type : "post",
			url : url,
			data : { 
				"id": '${sessionScope.id}',
				"todo_nums": todo_nums 
			},
			beforeSend: function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX","true");	
			},
			success : function(args) {
				console.log("[*]성공");
			},
			error : function(xhr,textStatus,error) {
				warn(xhr.status);
			}
		});
	}

</script>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>

$('body').on('click','.checkbox-inline',function(){
	
	console.log("[체크박스 클릭]");
    if ($(this).parents(".todo").attr('class').indexOf("checked") >= 0) {
  		
    	console.log("체크제거");
  		$(this).parents(".todo").removeClass("checked done");
  		updateTodo($(this).attr('id'),"제거")
  		
    } else {
  		console.log("체크추가");
  		$(this).parents(".todo").addClass("checked done");
  		updateTodo($(this).attr('id'),"추가")
    }
});
</script>
</html>