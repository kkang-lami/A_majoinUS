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