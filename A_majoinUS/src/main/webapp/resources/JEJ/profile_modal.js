/*<script src="<%=request.getContextPath()%>/resources/LSH/profile_modal.js"></script>
 * 
 * <a href="#" id="${item.id}" class="user_btn" data-toggle='modal' data-target='#modal_user'></a>
 * 
 * <%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	%>
 * 
 * 
 * $('body').on('click','.user_btn', function() {
	console.log("[유저 프로필]");
	remove_data();
	profile($(this).attr('id'));		// 유저 아이디 입력;
	});
	
	function getContext(){
		var context = "<%=cp%>";
		return context;
	}

	function getSessionId(){
		var sessionid = '${sessionScope.userId}';
		return sessionid;
	}
*/	
function profile(userid){
	var url= getContext()+"/aus/LSH/profile";
	var login_id = getSessionId();
	$.ajax({
		type:"post",
		url:url,
		data:{	"id": userid,
				"login_id" : login_id
			},
		dataType:"json",
		success:function(args){
			
			load_head(args.x.profile,login_id);
			if(args.x.port.length>0){
				load_port(args.x.port);
			}
			if(args.x.review.length>0){
				load_review(args.x.review);
			}
		},
		error:function(e){
			alert(e.responseText);
		}
	});
}
  
function load_head(data,login_id){
	
	var url = getContext()+"/aus/userImg/"+data.u_img;
	
	$('.profile-user-img').attr('src',url);
	$('.profile-username').html(data.name+"<small>("+data.id+")</small>");
	$('.profile-star').html(data.eval+"점");
	
	if(data.job){
		$('.profile-job').html(data.job);
	}
	
	if(data.local){
		$('.profile-local').html(data.local);
	}
	
	if(login_id.indexOf(data.id) !== -1){
		$('#follow_btn').attr('class','btn btn-default btn-block disabled');
		$('#follow_btn').html('<span class="text-muted">자신을 추가할 수 없습니다</span>');
		$('#issue_btn').attr('class','btn btn-default btn-block disabled');
	}else if(data.isfriend === 1){
		$('#follow_btn').addClass('unfollow_btn btn-muted');
		$('#follow_btn').html('<b>Unfollow</b>');
	}else{
		$('#follow_btn').addClass('follow_btn');
		$('#follow_btn').html('<b>Follow</b>');
	}
	
	if(data.profile){
		$('.profile-text').html(data.profile);
	}
}

function load_port(data){
	
	var html = "<tr><th>프로젝트명</th><th>프로젝트기간</th></tr>",
		i = 0;
	for(;i<data.length;i+=1){
			html += "<tr><td>"
		
		if(data[i].p_private === "비공개"){
			html += "<i class='fa fa-fw fa-lock'></i>"+data[i].subject;					
		}else{
			html += "<a href='#'>"+data[i].subject+"</a>";					
		}
			html += "</td><td>"+data[i].start_d+"-"+data[i].end_d+"</td></tr>";					
	}
	$('.port_table tbody').html(html);
}

function load_review(data){
	
	var html = "",
		i = 0;
	for(;i<data.length;i+=1){
		html += "<tr><td>"+data[i]+"</td></tr>";
	}
	$('.review_table tbody').html(html);
}

function remove_data(){
	
	$('.profile-job').html('관심있는 직군이 없습니다');
	$('.profile-local').html('선호하는 지역이 없습니다');
	$('#follow_btn').attr('class','btn btn-primary btn-block');
	$('#issue_btn').attr('class','btn btn-danger btn-block');
	$('.profile-text').html('자기소개가 없습니다');
	$('.port_table tbody').html("<tr><th>프로젝트명</th><th>프로젝트기간</th></tr><tr><td colspan='2'>등록된 프로젝트가 없습니다</td></tr>");
	$('.review_table tbody').html("<tr><td>등록된 후기가 없습니다</td></tr>");
}

/////////////////////////////////////////////////친구추가///////////////////////////////////////////////////////

$('body').on('click','.follow_btn', function() {
	console.log("11.친구추가");
	follow("add");
});

$('body').on('click','.unfollow_btn', function() {
	console.log("12.친구제거");
	follow("del");
});

function follow(status){
	var url=getContext()+"/aus/LSH/follow";
	var id = $('.profile-username small').text().slice(1,-1);
	var params = "id="+id+"&login_id="+getSessionId()+"&status="+status;
	console.log(params);

		$.ajax({
		type:"post",
		url:url,
		data: params,
		success:function(args){
			console.log("[*]팔로우도착");
			if(status === "add"){
				$('#follow_btn').attr('class','btn btn-primary btn-block unfollow_btn');
				$('#follow_btn').html('<b>Unfollow</b>');
			}else{
				$('#follow_btn').attr('class','btn btn-primary btn-block follow_btn');
				$('#follow_btn').html('<b>Follow</b>');
			}
		},
		error:function(e){
			alert(e.responseText);
		}
	}); 
}
/////////////////////////////////////////////////////////////멤버신고버튼///////////////////////////////////////////////////////////

$('body').on('show.bs.modal','.modal', function (e) {
	$("[data-toggle=popover]").popover({
	    trigger : 'click',  
	    placement : 'bottom', 
	    html: 'true', 
	    content : '<textarea class="popover-textarea" rows="5" cols="30" placeholder="(10글자 이상)"></textarea>',
	    template: '<div class="popover">'+
	              '<h3 class="popover-title"></h3><div class="popover-content">'+
	              '</div><div class="popover-footer"><button type="button" class="btn btn-danger popover-submit">'+
	              '등록</button>&nbsp;'+
	              '<button type="button" class="btn btn-default popover-cancel">'+
	              '취소</button></div></div>' 
	});
})

$('body').on('hide.bs.modal','.modal', function (e) {
	$("[data-toggle=popover]").popover('hide');
})

$("body").on('click','.popover-cancel', function() {
	console.log("[신고 취소]");
	$("[data-toggle=popover]").popover('hide');
});

$("body").on('click','.popover-submit', function() {
	console.log("[신고 전송]");
	var text = $('.popover-textarea').val();
	if(text.trim().length < 10){
		alert("사유는 10글자 이상 입력해주세요");
	}else{
		issue(text);
	    $("[data-toggle=popover]").popover('hide');
	}
});

function issue(text){
	var url= getContext()+"/aus/LSH/issue";
	var id = $('.profile-username small').text().slice(1,-1);
	var params = "id="+id+"&login_id="+getSessionId()+"&is_content="+text;

  	$.ajax({
		type:"post",
		url:url,
		data: params,
		dataType:"json",
		success:function(args){
			console.log("[*]멤버신고도착"+args.x);
			if(args.x === -1){
				alert("신고횟수를 초과하였습니다");
			}else{
				alert("신고완료되었습니다");					
			}
		},
		error:function(e){
			alert(e.responseText);
		}
	});
}