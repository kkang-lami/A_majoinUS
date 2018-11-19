<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 통계</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.load("current", {
		packages : [ "corechart" ]
	});

	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});

	google.charts.setOnLoadCallback(visitStatic);
	google.charts.setOnLoadCallback(payStatic);
	google.charts.setOnLoadCallback(matchStatic);
	google.charts.setOnLoadCallback(inquiryStatic);

	//방문
	function visitStatic() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '날짜');
		data.addColumn('number', '방문수');

		var list1 = new Array();
		var list2 = new Array();
		var i;

		<c:forEach items="${visit_stat}" var="visit">
		list1.push("${visit.visit_date}")
		list2.push("${visit.count}")
		</c:forEach>

		data
				.addRows([ [ list1[6], Number(list2[6]) ],
						[ list1[5], Number(list2[5]) ],
						[ list1[4], Number(list2[4]) ],
						[ list1[3], Number(list2[3]) ],
						[ list1[2], Number(list2[2]) ],
						[ list1[1], Number(list2[1]) ],
						[ list1[0], Number(list2[0]) ] ]);

		var options = {
			title : '방문자 통계',
			curveType : 'function',

			width : 1000,
			height : 300
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('visit_chart'));

		chart.draw(data, options);
	}

	//결제
	function payStatic() {
      var list1 = new Array();
      var list2 = new Array();
      var i;

       <c:forEach items="${pay_stat}" var="pay">
      list1.push("${pay.pay_date}");
      list2.push("${pay.pay_price}");
      i = i + 1;
      </c:forEach> 

      var data = google.visualization
            .arrayToDataTable([ [ '날짜', '결제금액' ],
               [ list1[5], Number(list2[5]) ],
               [ list1[4], Number(list2[4]) ],
               [ list1[3], Number(list2[3]) ],
               [ list1[2], Number(list2[2]) ],
               [ list1[1], Number(list2[1]) ],
               [ list1[0], Number(list2[0]) ] ]);

      var options = {
         //subtitle : '결제 통계'   ,
         title : '결제 통계',
         width : 600,
         height : 300
      };

      var chart = new google.charts.Bar(document.getElementById('pay_stat'));

      chart.draw(data, google.charts.Bar.convertOptions(options));
   }
	function inquiryStatic() {

		var inquiry = '${inquiry}';
	      var match = '${inquiry_match}';

	      var data = google.visualization.arrayToDataTable([
	            [ '답변 상태', 'Amount given' ], [ '답변완료', Number(match) ],
	            [ '미답변', Number(inquiry) ] ]);

	      var options = {
	         title : '1:1문의 답변율',
	         pieHole : 0.4,
	         pieSliceTextStyle : {
	            color : 'black',
	         },
	         //legend: 'none'
	         width : 500,
	         height : 400
	      };

	      var chart = new google.visualization.PieChart(document
	            .getElementById('inquiry_chart'));
	      chart.draw(data, options);
	   }

	//매칭
	function matchStatic() {

		var all = '${all_project}';
		var matching = '${match}';

		var data = google.visualization.arrayToDataTable([
				[ '매칭 비율', 'Amount given' ],
				[ '모집중', Number(all) - Number(matching) ],
				[ '매칭완료', Number(matching) ] ]);

		var options = {
			title : '프로젝트 매칭 성사율',
			pieHole : 0.4,
			pieSliceTextStyle : {
				color : 'black',
			},
			//legend: 'none'
			width : 500,
			height : 400
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('match_chart'));
		chart.draw(data, options);
	}
</script>
<style>
div#out_one {
	background-color: white;
}

div#out_in {
	text-align: center;
}

div#outside_layout {
	display: block
}

div#match_chart {
	display: inline-block;
}

div#inquiry_chart {
	display: inline-block;
}

div#pay_stat {
	display : inline-block;
}

div#visit_chart {
	display : inline-block;
}
</style>

</head>
<body>
	<tiles:insertDefinition name="header" />

	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<!-- 들어갈 내용 -->
				<h1>
						관리자 통계 <small>AUS의 통계를 확인할 수 있습니다.</small>
					</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Charts</a></li>
					<li class="active">Inline Charts</li>
				</ol>
				<br />
				<div id="out_one">
					



					<div id="out_in">
						<div id="outside_layout">
							<div id="visit_chart"></div>							
						</div>
					</div>
					<hr />
					<div id="out_in">
						<div id="outside_layout">
							<div id="pay_stat"></div>
						</div>	
					</div>
					<hr />
					<div id="out_in">
						<div id="outside_layout">	
							<div id="match_chart"></div>
							<div id="inquiry_chart"></div>
						</div> 
					</div>
				</div>


			</section>
		</div>

	</div>




	<tiles:insertDefinition name="left" />
	<tiles:insertDefinition name="footer" />
</body>
</html>