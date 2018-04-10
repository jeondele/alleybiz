<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
  <head>
	<!--Load the AJAX API-->  
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>    
	<script type="text/javascript">
   
	 // Load Charts and the corechart and barchart packages.
    google.charts.load('current', {'packages':['corechart']});
    google.charts.load('current', {'packages':['bar']});
	 // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart1);
    google.charts.setOnLoadCallback(drawChart2);
    google.charts.setOnLoadCallback(drawChart3);   
    google.charts.setOnLoadCallback(drawChart4);
 //   google.charts.setOnLoadCallback(drawChart5);   
    
    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.   
    
    
    //세션에 저장된 ArrayList 사용 코드
    //var chartData = '${sessionScope.area}';
    
    //test용으로 적용한 임시 코드
    var charData = [[]];

    //alert(charData);
    
    function drawChart1() {
    
        // Create the data table.
        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'date');
        data1.addColumn('number', 'totalsale');
        
        data1.addRows([
          for (var i=1; i < chart.length; i++){
        	  [chartData[i].setDate, chartData[i].setSales]
          }
        ]);
       
     //   data1.addRows([
      //  	['남자', 20],
      //  	['여자', 30]
      //  ]);
        
        // Set chart options
        var options1 = {'title':'매출 현황',
                       'width':400,
                       'height':300};
        
        // Instantiate and draw our chart, passing in some options.
        var chart1 = new google.visualization.PieChart(document.getElementById('chart_div1'));
        chart1.draw(data1, options1);
    } 
                
    function drawChart2() {
    
        // Create the data table.
        var data2 = new google.visualization.DataTable();
        data2.addColumn('string', 'date');
        data2.addColumn('number', '유동 인구');
        data2.addColumn('number', '상주 인구');
        data2.addColumn('number', '직장인 인구');
       
        data2.addRows([
        	for (var i=1; i < chart.length; i++){
          	  [chartData[i].setDate, chartData[i].setTotalPeople, chartData[i].setTotalLivingPeople, chartData[i].setTotalBizman]
            }
        ]);
        
   //     data2.addRows([
   //     	['남자', 20, 30, 40],
   //     	['여자', 30, 20, 10]
   //     ]);
        
        // Set chart options
        var options2 = {
        		chart: {'title':'유동 인구, 상주 인구, 직장인 인구 현황'},
        		bars: 'vertical',
        		height:300
        };
        /*var options2 = {'title':'유동 인구, 상주 인구, 직장인 인구 현황',
                       'width':400,
                       'height':300,
                       'pieHole': 0.4,};*/
        
        // Instantiate and draw our chart, passing in some options.
        
        var chart2 = new google.charts.Bar(document.getElementById('chart_div2'));
        chart2.draw(data2, options2);
    }
    function drawChart3() {
        
        // Create the data table.
        var data3 = new google.visualization.DataTable();
        data3.addColumn('string', 'date');
        data3.addColumn('number', '매장수');
        
        data3.addRows([
          for (var i=1; i < chart.length; i++){
        	  [chartData[i].setDate, chartData[i].setTotalStore]
          }
        ]);
        
//        data3.addRows([
//        	['남자', 20],
//        	['여자', 30]
//        ]);
       
        // Set chart options
        var options3 = {'title':'매장 현황',
                       'width':400,
                       'height':300};
        
        // Instantiate and draw our chart, passing in some options.
        var chart3 = new google.visualization.PieChart(document.getElementById('chart_div3'));
        chart3.draw(data3, options3);
    } 
    function drawChart4() {
        
        // Create the data table.
        var data4 = new google.visualization.DataTable();
        data4.addColumn('string', 'date');
        data4.addColumn('number', '주요기관 수');
        
        data4.addRows([
          for (var i=1; i < chart.length; i++){
        	  [chartData[i].setDate, chartData[i].setTotalFacility]
          }
        ]);
        
//        data4.addRows([
//        	['남자', 20],
//        	['여자', 30]
//        ]);
       
        // Set chart options
        var options4 = {
        		chart:{
        			'title':'상권 내 주요기관 현황',
        			'subtitle': '주요기관: 대학, 병원, 기업, 공공기관 등'
        			},
        				'width':400,
                       'height':300};
        
        // Instantiate and draw our chart, passing in some options.
        var chart4 = new google.visualization.PieChart(document.getElementById('chart_div4'));
        chart4.draw(data4, options4);
    } 
                       
</script>

<body>
    <!--Table and divs that hold the pie charts-->
    <table class="columns">
      <tr>
        <td><div id="chart_div1" style="border: 1px solid #ccc"></div></td> <!-- style="width: 900px; height: 500px; -->
        <td><div id="chart_div2" style="border: 1px solid #ccc"></div></td>
        <td><div id="chart_div3" style="border: 1px solid #ccc"></div></td>
        <td><div id="chart_div4" style="border: 1px solid #ccc"></div></td>
      </tr>
    </table>
  </body>
</html>