	$('body').on('show.bs.modal', '.modal', function (event) {
		console.log("[모달 순서 정렬]");
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
		var url=getContext()+"/aus/insert_Message";
		var params = "receiver="+global.receiver+"&sender="+getSessionId()+"&pj_num="+global.pj_num+"&a_type=참가";
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