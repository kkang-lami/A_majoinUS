$('body').on('show.bs.modal','.modal', function (e) {
	$("[data-toggle=popover]").popover({
	    trigger : 'click',  
	    placement : 'bottom', 
	    html: 'true', 
	    content : '<textarea class="popover-textarea" rows="5" cols="30" placeholder="(10글자 이상)"></textarea>',
	    template: '<div class="popover">'+
	              '<h3 class="popover-title"></h3><div class="popover-content">'+
	              '</div><div class="popover-footer" align="center" style="padding-bottom: 10px;"><button type="button" class="btn btn-danger popover-submit">'+
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
	
	var content = $('.popover-textarea').val();
	
	if(content.trim().length < 10){
		alert("사유는 10글자 이상 입력해주세요");
	}else{
		var params = "id="+global.receiver+"&login_id="+getSessionId()+"&is_content="+content+"&pj_num="+global.pj_num;
		issue(params);
	    $("[data-toggle=popover]").popover('hide');
	}
});

function issue(params){
	var url= getContext()+"/aus/issue";
  	$.ajax({
		type:"post",
		url:url,
		data: params,
		dataType:"json",
		beforeSend: function(xmlHttpRequest){
			xmlHttpRequest.setRequestHeader("AJAX","true");	
		},
		success:function(args){
			if(args.x === -1){
				alert("신고횟수를 초과하였습니다");
			}else{
				alert("신고완료되었습니다");					
			}
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
