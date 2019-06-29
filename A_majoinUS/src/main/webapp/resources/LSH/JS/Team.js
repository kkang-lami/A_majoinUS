	$('body').on('click','.Team_btn', function() {
		console.log("11-1.[프로젝트룸] "+getSessionId());
		global.pj_num = 0;
		global.receiver = "";
		remove_Teamdata();
		projectRoom($(this).parents("tr").attr('id'));
	});
	
	$('body').on('click','.recomend_btn, .review_btn', function() {
		console.log("11-2.[추천&리뷰 프로젝트룸] "+getSessionId());
		global.pj_num = 0; 
		global.receiver = "";
		remove_Teamdata();
		projectRoom($(this).attr('id'));
	});
	

	function projectRoom(pj_num){
		var url=getContext()+"/aus/ProjectProfile";
		$.ajax({
			type:"post",
			url:url,
			data:{"pj_num": pj_num},
			dataType:"json",
			beforeSend: function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX","true");	
			},
			success:function(args){
				load_projectRoom(args.x);
			},
			error : function(xhr,textStatus,error) {
				warn(xhr.status);
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
		
		if(getSessionId().indexOf(data.ID) !== -1){
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
	
	function warn(e){
		if(e=="400"){
			alert('로그아웃 되었습니다');
		}
		location.href="/A_majoinUS/aus/main";
	}