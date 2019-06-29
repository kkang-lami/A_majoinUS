	$('body').on('click','.plus_btn', function() {
		console.log("9.멤버초대");
		global.receiver = $(this).parents("tr").attr('id');
		
		if(global.receiver === getSessionId()){
			$(this).attr('data-target',"");
			global.receiver = "";
			alert("본인은 초대할 수 없습니다");
		}else{
			get_myPro();	
		}
	});
	
	$('body').on('click','.plus_btnF', function() {
		console.log("9.멤버초대F");
		global.receiver = $(this).attr('id');
		get_myPro();	
	});

	$('.send_btn').on('click', function() {
		console.log("10.초대전송");
		if($('#my_project').attr('disabled') !== 'disabled'){
			joinUs();	
		}
	});
	
	function get_myPro(){
		var url= getContext()+"/aus/show";
		
 		$.ajax({
			type:"post",
			url:url,
			data : { "id": getSessionId()},
			dataType:"json",
			beforeSend: function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX","true");	
			},
			success:function(args){
				show_myPro(args.mine);
			},
			error : function(xhr,textStatus,error) {
				warn(xhr.status);
			}
		});
	}
	
	function show_myPro(list){
		var html = "",
			i = 0,
			len = list.length;
		if(len === 0){
				$('#my_project').attr('disabled', 'disabled');
				html += "<option>개설한 프로젝트가 없습니다</option>"
		}else{
			for(;i<len;i+=1){
				html += "<option value='"+list[i]['PJ_NUM']+"'>"+list[i]['PJ_NAME']+"</option>";
			}
		}
		$("#my_project").html(html);
	}
	
	function joinUs(){
		
		var pj_num = $("#my_project").val();
		var url=getContext()+"/aus/insert_Message";
		var params = "receiver="+global.receiver+"&sender="+getSessionId()+"&pj_num="+pj_num+"&a_type=초대";
		console.log(params);
		
 		$.ajax({
			type:"post",
			url:url,
			data : params,
			beforeSend: function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX","true");	
			},
			success:function(args){
				console.log("[*]메서지전송성공");
			},
			error : function(xhr,textStatus,error) {
				warn(xhr.status);
			}
		});
	}
	
	function warn(e){
		if(e=="400"){
			alert('로그아웃 되었습니다');
		}
		location.href="/A_majoinUS/aus/main";
	}