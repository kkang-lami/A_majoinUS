		$('.l_check_btn').on('click',function(){
		    var pj_num = $('#modal-check .send_btn').attr('id');
		    var str = $('#modal-leader option:selected').text();
		    var pjm_num = $('#modal-leader option:selected').val();
		    
		    if(str === ""){
		    	$('#modal-warn').modal('show');
		    }else if($('#modal-leader option:selected').attr('class') === "ban" && $(this).attr('id') === "transfer"){
		    	$('#modal-ban').modal('show');
		    }else{
		       var arr = str.split('(');
		       var id = arr[0];
		       var name = arr[1].split(')')[0];
		 
		       if($(this).attr('id') === "transfer"){
		          
		       $('#modal-check .modal-title').html('팀장 위임');
		       $('#modal-check .modal-body').html('<p>\''+name+'\' 님을 팀장으로 위임 하시겠습니까?</p>');
		       $('#modal-check .send_btn').attr('href',getContext()+"/aus/ProejctRoom/transfer?pj_Num="+pj_num+"&id="+id);
		       $('#modal-check').modal('show');
		          
		       }else{
		          
		       $('#modal-check .modal-title').html('멤버 추방');
		       $('#modal-check .modal-body').html('<p class="text-red">\''+name+'\' 님이 작성한 글은 <br/>복구할 수 없습니다</p><p>멤버를 추방 하시겠습니까?</p>');
		       $('#modal-check .send_btn').attr('href',getContext()+"/aus/ProejctRoom/kick?pj_Num="+pj_num+"&pjm_num="+pjm_num);
		       $('#modal-check').modal('show');
		          
		       }
		    }
		});