<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">



<title>관리자 회원관리</title>
<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/dashboard.css" rel="stylesheet">

<script type="text/javascript"
   src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

   google.charts.load('current', {
      'packages' : [ 'line' ]
   });
   google.charts.load('current', {
      'packages' : [ 'corechart' ]
   });
   google.charts.load('current', {'packages':['bar']});
   google.charts.setOnLoadCallback(VisitorChart);
   google.charts.setOnLoadCallback(ArticleChart);
   google.charts.setOnLoadCallback(SeccessChart);
   google.charts.setOnLoadCallback(TradeChart);
   google.charts.setOnLoadCallback(PointChart);
   function VisitorChart() {
	      var data = new google.visualization.DataTable();
	      data.addColumn('string', 'Day');
	      data.addColumn('number', 'visitor');
	      
	      var list1 = new Array();
		  var list2 = new Array();
		  var i;
		  
		  <c:forEach items="${visitstat}" var="item1">
	      	 list1.push("${item1.v_date}");
	    	 list2.push("${item1.v_count}");
	    	 i=i+1;
	      </c:forEach>

	      data.addRows([ [ list1[10], Number(list2[10]) ], [ list1[9], Number(list2[9])],
	      			    [ list1[8], Number(list2[8]) ], [ list1[7], Number(list2[7])],
	        		    [ list1[6], Number(list2[6])], [ list1[5], Number(list2[5])],
	            		[ list1[4], Number(list2[4])], [ list1[3], Number(list2[3])],
	            		[ list1[2], Number(list2[2])], [ list1[1], Number(list2[1])],
	            		[ list1[0], Number(list2[0])] ]);

	      var options = {
	         chart : {
	            subtitle : '-방문자통계'
	         },
	         width : 800,
	         height : 300

	      };

	      var chart = new google.charts.Line(document
	            .getElementById('visitor_stat'));

	      chart.draw(data, google.charts.Line.convertOptions(options));
   }

   function ArticleChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Day');
      data.addColumn('number', 'articleUpload');

      var list1 = new Array();
	  var list2 = new Array();
	  var i;
	  
	  <c:forEach items="${articlestat}" var="item2">
	  	 list1.push("${item2.v_date}");
    	 list2.push("${item2.v_count}");
    	 i=i+1;
      </c:forEach>

      data.addRows([ [ list1[10], Number(list2[10]) ], [ list1[9], Number(list2[9])],
      			    [ list1[8], Number(list2[8]) ], [ list1[7], Number(list2[7])],
        		    [ list1[6], Number(list2[6])], [ list1[5], Number(list2[5])],
            		[ list1[4], Number(list2[4])], [ list1[3], Number(list2[3])],
            		[ list1[2], Number(list2[2])], [ list1[1], Number(list2[1])],
            		[ list1[0], Number(list2[0])] ]);

      var options = {
         chart : {
            subtitle : '-게시글통계'
         },
         width : 400,
         height : 300

      };

      var chart = new google.charts.Line(document
            .getElementById('article_stat'));

      chart.draw(data, google.charts.Line.convertOptions(options));
   }

   function SeccessChart() {

      // Create the data table.
      var data = new google.visualization.DataTable();
      data.addColumn('string', '전체거래성사율');
      data.addColumn('number', 'aaaaa');
      
      var suc = '${succeed}';
      var req = '${requests}';
      data.addRows([ [ '거래성사율', Number(suc)], [ '거래대기율', Number(req)]]);

      // Set chart options
      var options = {'title':'전체거래성사율',
                       'width':400,
                       'height':300};

      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.PieChart(document.getElementById('seccess_state'));
      chart.draw(data, options);
   }
   
   function TradeChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Day');
      data.addColumn('number', '하루평균거래');
      var list1 = new Array();
	  var list2 = new Array();

	 	var i;
	  
	  <c:forEach items="${tradeavgstat}" var="item4">
	  	 list1.push("${item4.v_date}");
    	 list2.push("${item4.v_count}");

    	 i=i+1;
      </c:forEach>
      
      data.addRows([ [ list1[0], Number(list2[0]) ], [ list1[1], Number(list2[1]) ],
            [ list1[2], Number(list2[2]) ], [ list1[3], Number(list2[3]) ]
            ]);

      var options = {
         chart : {
            subtitle : '-하루 평균 거래'
         },
         width : 400,
         height : 300

      };

      var chart = new google.charts.Line(document
            .getElementById('trade_state'));

      chart.draw(data, google.charts.Line.convertOptions(options));
   }
   function PointChart() {
        var list1 = new Array();
 	 	var list2 = new Array();
  	 	var list3 = new Array();
 	 	var i;
  	  
  	  <c:forEach items="${paymentstat}" var="item3">
  	  	 list1.push("${item3.p_date}");
      	 list2.push("${item3.chprice}");
      	 list3.push("${item3.exprice}");
      	 i=i+1;
        </c:forEach>
        
        
        var data = google.visualization.arrayToDataTable([
            ['Day', '결제금액', '환전금액'],
            [ list1[0], Number(list2[0]), Number(list3[0]) ],
            [ list1[1], Number(list2[1]), Number(list3[1]) ],
            [ list1[2], Number(list2[2]), Number(list3[2]) ]
          ]);
        
        var options = {
          chart: {
            subtitle: '-포인트 결제',
          },
          width : 400,
          height : 300
        };

        var chart = new google.charts.Bar(document.getElementById('point_state'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
</script>

<style type="text/css">
div#article_stat {
   display: inline-block;
}
div#seccess_state {
    display: inline-block;
}
div#trade_state {
    display: inline-block;
}
div#point_state {
    display: inline-block;
}
div#layout{
   display:block
}
</style>
</head>
<body>
  <tiles:insertDefinition name="adminheader" />
  	
	<tiles:insertDefinition name="adminaside" />


   <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
      <h1 class="page-header">
         <i>통계 관리</i>
      </h1>
      <div id="visitor_stat"></div>
      <div id="layout">
      <div id="article_stat"></div>
      <div id="seccess_state"></div>
      </div>
      <div id="layout">
      <div id="trade_state"></div>
      <div id="point_state"></div>
      </div>

   </div>
</body>
</html>