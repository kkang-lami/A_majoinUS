function level1(){
	var url=getContext()+"/aus/first_List_LSH";

	$.ajax({
		type:"post",
		url:url,
		dataType:"json",
		success:function(args){
			var i = 0,
			    array = [],
				joblen = args.job_list.length,
				locallen = args.local_list.length;
			
			for(; i < joblen; i += 1){
			    array[i] = "<option value='"+args.job_list[i]+"'>"+args.job_list[i]+"</option>";
			}
			$("#job1").html(array.join(''));
			
			for(i=0; i < locallen; i += 1){
			    array[i] = "<option value='"+args.local_list[i]+"'>"+args.local_list[i]+"</option>";
			}
			$("#local1").html(array.join(''));
			
			init_level2("job1");
			init_level2("local1");
		},
		error:function(e){
			alert(e.responseText);
		}
	});
}

function init_level2(what) {
	var url=getContext()+"/aus/second_List_LSH";
	var params ="hint="+$("#"+what+" option:eq(0)").val();
	var id = what+"2"; 
	real_level2(url,params,id);
}

function level2(element) {
	var url=getContext()+"/aus/second_List_LSH";
	var params = "hint=" + $(element).val();
	var id = $(element).attr("id") + "2";

	real_level2(url,params,id);
}

function real_level2(url,params,id){
	$.ajax({
		type : "post",
		url : url,
		data : params,
		dataType : "json",
		success : function(args) {
			$("#" + id + " option").each(function() {
				$("#" + id + " option:eq(0)").remove();
			});

			for (var idx = 0; idx < args.list.length; idx++) {
				$("#" + id).append("<option value='"+args.list[idx]+"'>"+ args.list[idx] + "</option>");
			}
		},
		error : function(e) {
			alert(e.responseText);
		}
	});
}

function add(element) {
	var list = [],
		html1 = "",
		html2 = "",
		i = 0,
		what = $(element).attr("value"), str = $("#" + what + "1").val() + ">"+ $("#" + what + "12").val(),
		len = $("input[name=" + what+ "]").length;

		for (; i < len; i += 1) {
			list.push($("input[name='" + what + "']:eq(" + i + ")").val());
		}

		if (list.indexOf(str) > -1) {
			alert("이미 추가된 검색어 입니다.");
		} else if (len >= 3) {
			alert("3개 까지 지정가능합니다. (현재 입력수:" + len + ")");
		} else {
			html1 += "<span id="+global.i+">" + str + " ";
			html1 += "<span id="+global.i+" class='del_btn'><i class='fa fa-fw fa-times-circle'></i></span></span>";
			html2 += "<input type='hidden' id='"+global.i+"' name='"+what+"' value='"+str+"'>";

			$('#' + what + '_list').append(html1);
			$('#hidden').append(html2);
			global.i+=1;
		}
}

function del(elements) {
	var num = $(elements).attr("id");
	
	$("#" +num).remove();
	$("#" +num).remove();
}

$('.show-level2').on('change', function() {
	console.log("2.레벨2");
	level2(this);
});

$('.add_btn').on('click', function() {
	console.log("3.에드");
	add(this);
});

$('#result').on('click', '.del_btn', function() {
	console.log("4.삭제");
	del(this);
});

