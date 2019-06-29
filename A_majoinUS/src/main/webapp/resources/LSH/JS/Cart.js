	$("body").on('click','.unstar', function() {
		console.log("13.카트 추가");
		var pj_num = $(this).parents("tr").attr('id');

		global.cart_list.push(pj_num);
		add_cart(pj_num);
		star(pj_num,"add");
	});
	
	$("body").on('click','.star', function() {
		console.log("14.카트 제거");
		var pj_num = $(this).parents("tr").attr('id');
		
		for(var i =0; i<global.cart_list.length;i+=1){
			if(global.cart_list[i] === pj_num){
				global.cart_list.splice(i,1);
			}
		}
		
		del_cart(pj_num);
		star(pj_num,"del");
	});
	
	function star(pj_num,status){
		var url=getContext()+"/aus/favorite";
		var params = "pj_num="+pj_num+"&login_id="+getSessionId()+"&status="+status;
		$.ajax({
			type:"post",
			url:url,
			data: params,
			beforeSend: function(xmlHttpRequest){
				xmlHttpRequest.setRequestHeader("AJAX","true");	
			},
			success:function(args){
				console.log("[*]"+status+"즐겨찾기도착");
				
				if(status === "add"){
					$('#result_table #'+pj_num+' #star_btn').attr('class','star');
					$('#result_table #'+pj_num+' #star_btn').html('<i class="fa fa-fw fa-star text-yellow"></i>');
				}else{
					$('#result_table #'+pj_num+' #star_btn').attr('class','unstar');
					$('#result_table #'+pj_num+' #star_btn').html('<i class="fa fa-fw fa-star-o text-yellow"></i>');
				}
			},
			error : function(xhr,textStatus,error) {
				warn(xhr.status);
			}
		}); 
		
	}
	
	function add_cart(pj_num){
		var html = "";
		var pj_name = $('#result_table tr[id="'+pj_num+'"] li:eq(0)').text();
		var date = $('#result_table tr[id="'+pj_num+'"] td:eq(3)').text();

		html += "<tr id='"+pj_num+"'>";
		html += "<td><a href='#' id='star_btn' class='star'><i class='fa fa-fw fa-star text-yellow'></i></a></td>";
		html += "<td><a href='#' class='Team_btn' data-toggle='modal' data-target='#modal_Team'>"+pj_name+"</a></td>";
		html += "<td>"+date+"</td></tr>";
		
 		if($('#cart_table td:first').attr('class') === "none"){
 			$('#cart_table tr:eq(1)').remove();
		}
 		var length = $('#cart_table tr').length;
 		
 		$('#cart_table').append(html);
 		$('#cart_len').text('('+length+')');
 		
	}
	
	function del_cart(pj_num){
		$('#cart_table tr[id="'+pj_num+'"]').remove();
		var length = Number($('#cart_table tr').length)-1;
 		if(length === 0){
			$('#cart_table').append('<tr><td colspan="7" class="none">스크랩한 프로젝트가 없습니다</td></tr>');
		}
		$('#cart_len').text('('+length+')');
	}
	
	function warn(e){
		if(e=="400"){
			alert('로그아웃 되었습니다');
		}
		location.href="/A_majoinUS/aus/main";
	}
	