<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>Document</title>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<section id="todosBox" class="container center">
		<div class="thumbnail col-xs-6 col-xs-offset-3">
			<h1>TO DO LIST</h1>
			
			
			<!-- 리스트-->
			<div class="show-list">
				<ui id="todos" class="list-group clearfix"></ui>
			</div>


			<!-- 검색창 -->			
			<div class="todo-inputBox input-group">
				<input type="text" id="todo-input" class="form-control"	placeholder="할 일을 입력해주세요" maxlength="30" /> 
				<span class="input-group-addon" id="submit-button">입력</span>
			</div>
			
			
			<div class="text-right" style="margin-top: 5px;">
				<input type=button id="removeAllChecked" class="btn btn-warning" value="선택한 항목 삭제">
				<input type="button" id="removeAll" class="btn btn-danger" value="모두 삭제">
			</div>
		</div>
	</section>

</body>
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
    
    removeCheckedBtn.addEventListener("click", function() {
       
       var allTodos = document.querySelectorAll(".todo");
       for (var i = 0; i < allTodos.length; i++) {
           if (allTodos[i].classList.value.indexOf("checked") > -1) {
        	   
        	   
        	   
               allTodos[i].remove();
           }
       }
 		todoListData = new Map();
        var aliveTodos = document.querySelectorAll(".todo");
        for (var setData of aliveTodos) {
        	todoListData.set($(setData.childNodes).attr('id'),$(setData.childNodes).text());
        }
    });
    
    
  //디비삭제
    function deleteTodo(todo_num){
    	var url="<%=cp%>/aus/LSH/Mypage/deleteTodo";
    	var params = "id=${sessionScope.userId}&todo_num="+todo_num;
    	console.log("[params] "+params);
    	
    	$.ajax({
    		type : "post",
    		url : url,
    		data : params,
    		success : function(args) {
    			console.log("[*]성공");
    		},
    		error : function(e) {
    			alert(e.responseText);
    		}
    	});
    }

    removeAll.onclick = function() {
    	var allTodos = document.querySelectorAll(".todo");
        for (var i = 0; i < allTodos.length; i++) {
            allTodos[i].remove();
        }
        todoListData = new Map();
    }
    
    // 데이터 등록
    inputSumbitBtn.onclick = function() {
        if (inputValue == undefined || inputValue == "") {
            alert("데이터를 입력해 주세요");
        } else {
        	var num = getRandom();
/*         	insertTodo(num,inputValue); */
        	todoListData.set(num, inputValue);
        	
            checkInput.value = "";							
            inputValue = undefined;							
            
            makeList(todos, todoListData);
        }
    }
  
    function load(){
    	<c:forEach var="item" items="${todo}">
    		todoListData.set('${item.todo_num}', '${item.todo}');
    	</c:forEach>
    	makeList(todos, todoListData);
    }
    
    load();
};

function makeList(target, data) {
	var html = "";
	var targetChild = document.querySelectorAll('.todo');
    
	for (var child of targetChild) {
        target.removeChild(child);
    }
	for (var [key, value] of data) {
		template = '<li class="todo list-group-item col-xs-12">';
		template += '<input id="'+key+'" type="checkbox" class="checkbox-inline" style="margin:0;">'+value+'</li>';
		target.innerHTML += template;
	}
}

//디비등록
function insertTodo(todo_num,todo){
	var url="<%=cp%>/aus/LSH/Mypage/insertTodo";
	var params = "id=${sessionScope.userId}&todo_num="+todo_num+"&todo="+todo;
	console.log("[params] "+params);
	
	$.ajax({
		type : "post",
		url : url,
		data : params,
		success : function(args) {
			console.log("[*]성공");
		},
		error : function(e) {
			alert(e.responseText);
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
  		$(this).parents(".todo").removeClass("checked");
    } else {
  		console.log("체크추가");
  		$(this).parents(".todo").addClass("checked");
    }
});

</script>


<style>
.todo-inputBox {
	margin: 15px 0;
}

.form-group {
	padding-left: 0;
}

.show-list {
	padding: 0;
	margin-top: 15px;
	position: relative;
	max-height: 35vh;
	overflow-y: auto;
	overflow-x: hidden;
}

#submit-button {
	cursor: pointer;
}

#todosBox {
	position: relative;
	top: 50vh;
	margin-top: -30vh;
	color: #333;
}
</style>
</html>