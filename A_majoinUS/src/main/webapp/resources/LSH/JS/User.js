function profile(userid){
	var url= getContext()+"/aus/UserProfile";
	var login_id = getSessionId();
	$.ajax({
		type:"post",
		url:url,
		data:{	"id": userid,
				"login_id" : login_id
			},
		dataType:"json",
		success:function(args){
			
			global.pj_num = 0;
			global.receiver = userid;
			
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
	
	var eval = parseFloat(data.eval).toFixed(1);
	
	$('.widget-user-username').html(data.name);
	$('.widget-user-desc').html(data.id);
	$('.profile-user-img').attr('src',getContext()+"/aus/userImg/"+data.u_img);
		
	$('.project-count').html(data.pj_count);
	$('.follower-count').html(data.follower);
	$('.star-count').html(eval);
	
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
				
		if(data[i].p_private === "off"){
			html += "<i class='fa fa-fw fa-lock'></i>"+data[i].subject;					
		}else{
			html += "<a href='"+getContext()+"/aus/portfolioContent?port_num="+data[i].port_num+"'>"+data[i].subject+"</a>";					
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
	global.pj_num = 0;
	global.receiver = "";
	$('.profile-job').html('관심있는 직군이 없습니다');
	$('.profile-local').html('선호하는 지역이 없습니다');
	$('#follow_btn').attr('class','btn btn-primary btn-block');
	$('#issue_btn').attr('class','btn btn-danger btn-block');
	$('.profile-text').html('자기소개가 없습니다');
	$('.port_table tbody').html("<tr><th>프로젝트명</th><th>프로젝트기간</th></tr><tr><td colspan='2'>등록된 포트폴리오가 없습니다</td></tr>");
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
	var url=getContext()+"/aus/follow";
	var id = $('.widget-user-desc').text();
	var count = Number($('.follower-count').text());
	var params = "id="+id+"&login_id="+getSessionId()+"&status="+status;

		$.ajax({
		type:"post",
		url:url,
		data: params,
		success:function(args){
			console.log("[*]팔로우도착");
			if(status === "add"){
				$('#follow_btn').attr('class','btn btn-primary btn-block unfollow_btn');
				$('#follow_btn').html('<b>Unfollow</b>');
				$('.follower-count').text(count+1);
			}else{
				$('#follow_btn').attr('class','btn btn-primary btn-block follow_btn');
				$('#follow_btn').html('<b>Follow</b>');
				$('.follower-count').text(count-1);
			}
		},
		error:function(e){
			alert(e.responseText);
		}
	}); 
}
