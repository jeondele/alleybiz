<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="./images/favicon.ico">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>상권이으리</title>
	
	<!-- CSS includes -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway"
		rel="stylesheet">
	<link href="fonts/font-awesome/css/font-awesome.min.css"
		rel="stylesheet">
	<link id="themecss" rel="stylesheet" type="text/css"
		href="https://www.shieldui.com/shared/components/latest/css/light-glow/all.min.css" />
	<link href="css/services.css" rel="stylesheet">
	<link href="css/layout.css" rel="stylesheet">
	
	<!--Load the AJAX API-->  
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>    
	<script type="text/javascript">
   
	 // Load Charts and the corechart and barchart packages.
    google.charts.load('current', {'packages':['corechart']});
    google.charts.load('current', {'packages':['line']});
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
    
     /*  ##############세션에 저장된 ArrayList 사용 코드###################### */
    //var chartData = '${sessionScope.area}';

     /*  ##############세션에 저장된 ArrayList 확인 ###################### */
    //alert(charData);
    
    function drawChart1() {
    
        // Create the data table.
        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'date');
        data1.addColumn('number', '매출');
        
        /*  ##############실제 데이터 받는 코드###################### */
//        data1.addRows([
//          for (var i=1; i < chart.length; i++){
//        	  [chartData[i].setDate, chartData[i].setSales]
//          }
//        ]);
       
       /*  ##############test data####################### */
        data1.addRows([
        	['2016', 20],
        	['2017', 30]
        ]);
        
        // Set chart options
        var options1 = {'title':'매출 현황',
                       'height':300};
        
        // Instantiate and draw our chart, passing in some options.
        var chart1 = new google.charts.Line(document.getElementById('chart_div1'));
        chart1.draw(data1, google.charts.Line.convertOptions(options1));
    } 
                
    function drawChart2() {
    
        // Create the data table.
        var data2 = new google.visualization.DataTable();
        data2.addColumn('string', 'date');
        data2.addColumn('number', '유동 인구');
        data2.addColumn('number', '상주 인구');
        data2.addColumn('number', '직장인 인구');
       
        
        /*  ##############실제 데이터 받는 코드###################### */
//        data2.addRows([
//        	for (var i=1; i < chart.length; i++){
//          	  [chartData[i].setDate, chartData[i].setTotalPeople, chartData[i].setTotalLivingPeople, chartData[i].setTotalBizman]
//            }
//        ]);
        
        data2.addRows([
        	['2016', 20, 30, 40],
        	['2017', 30, 20, 10]
        ]);
        
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
        chart2.draw(data2, google.charts.Bar.convertOptions(options2));
    }
    function drawChart3() {
        
        // Create the data table.
        var data3 = new google.visualization.DataTable();
        data3.addColumn('string', 'date');
        data3.addColumn('number', '매장수');
        
        
        /*  ##############실제 데이터 받는 코드###################### */
//        data3.addRows([
//          for (var i=1; i < chart.length; i++){
//        	  [chartData[i].setDate, chartData[i].setTotalStore]
//          }
//        ]);
        
        data3.addRows([
        	['2016', 5],
        	['2016', 30]
        ]);
       
        // Set chart options
        var options3 = {'title':'매장 수 현황',
                       'height':300};
        
        // Instantiate and draw our chart, passing in some options.
        var chart3 = new google.charts.Line(document.getElementById('chart_div3'));
        chart3.draw(data3, google.charts.Line.convertOptions(options3));
    } 
    function drawChart4() {
        
        // Create the data table.
        var data4 = new google.visualization.DataTable();
        data4.addColumn('string', 'date');
        data4.addColumn('number', '주요기관 수');
        
        
        /*  ##############실제 데이터 받는 코드###################### */
//        data4.addRows([
//          for (var i=1; i < chart.length; i++){
//        	  [chartData[i].setDate, chartData[i].setTotalFacility]
//          }
//        ]);
        
        data4.addRows([
        	['2016', 40],
        	['2017', 20]
        ]);
       
        // Set chart options
        var options4 = {
        		chart:{
        			'title':'상권 내 주요기관 현황',
        			'subtitle': '주요기관: 대학, 병원, 기업, 공공기관 등'
        			},
                       'height':300};
        
        // Instantiate and draw our chart, passing in some options.
        var chart4 = new google.charts.Line(document.getElementById('chart_div4'));
        chart4.draw(data4, google.charts.Line.convertOptions(options4));
    } 
                       
</script>
</head>

<body>
	<div id="body" data-animated-view="" style="display: block;">
		<div id="resultAnalysisForm"
			style="width: 100%; height: 100%; opacity: 1;" data-ng-init="init()"
			class="ng-scope">
			<div data-ng-init="analyDate='20180409';memId='2001164';"
				class="ng-scope">

				<div class="tab-content mheight" id="result">
					<div class="tab-pane active">
						<!-- 탭(2차) -->
						<div class="famenu">
							<div class="container">
								<!-- 업종분석 이동 탭 -->
								<div class="tabs-line" id="famenu_upjong" style="">
									<h2 class="famenu-title">
										<a href="javascript:goTop();">상권분석 보고서 </a>
									</h2>

									<span class="report-btn"> <a href="javascript:void(0)"
										data-ng-click="print('D')" class="btn btn-report"
										title="출력 버튼"> <i class="fa fa-print" aria-hidden="true"></i>
											<span>출력</span>
									</a> <a href="http://data.seoul.go.kr/" class="btn btn-report">
											<i class="fa fa-database" aria-hidden="true"></i>&nbsp;기준데이터
									</a>
									</span>
								</div>
							</div>
						</div>
						<!-- /탭(2차) -->

						<div class="container">
							<div class="tab-content mheight">
								<div role="tabpanel" class="tab-pane active">
									<div class="report">
										<div id="analysisResultupjong" style="">
											<div id="resultUpjong" ng-include="analysisResultInfo.upjong">
												
												
												<!-- 매출액 추이  -->
												<p class="clearfix ng-scope" id="category1"></p>
												<p class="fmenu-space ng-scope"></p>
												<h3 class="ng-scope">1. 매출액 추이</h3>
												
												<div class="boxwrap ng-scope">
													<p class="text-center"></p>
													<div id="areaJisu1ChartDiv" style="text-align: center; width: 863px; height: 450px;" class="img-responsive">
														<div class="rMateChartH5__Root" id="areaJisu1Chart" style="box-sizing: content-box; position: absolute; overflow: visible; width: 841px; height: 428px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); background-color: rgb(255, 255, 255); border-radius: 12px; border-style: none;">
															<div id="chart_div1" style="border: 1px solid #ccc"></div>
														</div>
													</div>
													<p></p>
												</div>
												<p class="clearfix ng-scope"></p>


												<!-- 유동, 상주, 직장인 인구 추이  -->
												<p class="clearfix ng-scope" id="category2"></p>
												<p class="fmenu-space ng-scope"></p>
												<h3 class="ng-scope">2. 유동, 상주, 직장인 인구 추이</h3>

												<div class="boxwrap ng-scope">
													<p class="text-center"></p>
													<div id="areaJisu1ChartDiv" style="text-align: center; width: 863px; height: 450px;"
														class="img-responsive">
														<div class="rMateChartH5__Root" id="areaJisu1Chart" style="box-sizing: content-box; position: absolute; overflow: visible; width: 841px; height: 428px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); background-color: rgb(255, 255, 255); border-radius: 12px; border-style: none;">
															<div id="chart_div2" style="border: 1px solid #ccc"></div>
														</div>
													</div>
													<p></p>
												</div>
												<p class="clearfix ng-scope"></p>


												<!-- 매장수 추이  -->
												<p class="clearfix ng-scope" id="category2"></p>
												<p class="fmenu-space ng-scope"></p>
												<h3 class="ng-scope">3. 매장수 추이</h3>

												<div class="boxwrap ng-scope">
													<p class="text-center"></p>
													<div id="areaJisu1ChartDiv" style="text-align: center; width: 863px; height: 450px;" class="img-responsive">
														<div class="rMateChartH5__Root" id="areaJisu1Chart" style="box-sizing: content-box; position: absolute; overflow: visible; width: 841px; height: 428px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); background-color: rgb(255, 255, 255); border-radius: 12px; border-style: none;">
															<div id="chart_div3" style="border: 1px solid #ccc"></div>
														</div>
													</div>
													<p></p>
												</div>
												<p class="clearfix ng-scope"></p>

												<!-- 주요 시설 추이 -->
												<p class="clearfix ng-scope" id="category2"></p>
												<p class="fmenu-space ng-scope"></p>
												<h3 class="ng-scope">4. 주요시설 추이</h3>

												<div class="boxwrap ng-scope">
													<p class="text-center"></p>
													<div id="areaJisu1ChartDiv" style="text-align: center; width: 863px; height: 450px;" class="img-responsive">
														<div class="rMateChartH5__Root" id="areaJisu1Chart" style="box-sizing: content-box; position: absolute; overflow: visible; width: 841px; height: 428px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); background-color: rgb(255, 255, 255); border-radius: 12px; border-style: none;">
															<div id="chart_div4" style="border: 1px solid #ccc"></div>
														</div>
													</div>
													<p></p>
												</div>
												<p class="clearfix ng-scope"></p>

											</div>
										</div>

										<div id="analysisResultsales" style="display: none;">
											<div id="resultSales" ng-include="analysisResultInfo.sales"></div>
										</div>

										<div id="analysisResultpop" style="display: none;">
											<div id="resultPop" ng-include="analysisResultInfo.pop"></div>
										</div>

										<div id="analysisResultincome" style="display: none;">
											<div id="resultIncome" ng-include="analysisResultInfo.income"></div>
										</div>

										<div id="analysisResultarea" style="display: none;">
											<div id="resultArea" ng-include="analysisResultInfo.area"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="map" style="display: none;">
					<div class="container">
						<div class="map-full-area">
							<div id="analysisTabMap" class="conarea"
								style="height: 100%; display: none;">
								<div id="analyMap" style="height: 770px; width: 100%;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="upjSisuList" style="display: none;">
					<div class="container">
						<div id="analysisTabList" class="conarea" style="display: none"></div>
					</div>
				</div>
			</div>


			<script type="text/javascript" class="ng-scope">
function ViewLayerPopPrint(){ 
    document.getElementById("LayerPopPrint").style.display='inline' 
} 
function CloseLayerPopPrint(){ 
    document.getElementById("LayerPopPrint").style.display='none'; 
}
function ViewLayerPopDataSourceOverview(){ 
    document.getElementById("LayerPopDataSourceOverview").style.display='inline' 
} 
function CloseLayerPopDataSourceOverview(){ 
    document.getElementById("LayerPopDataSourceOverview").style.display='none'; 
}
function ViewLayerPopDataSource(){ 
    document.getElementById("LayerPopDataSource").style.display='inline' 
} 
function CloseLayerPopDataSource(){ 
    document.getElementById("LayerPopDataSource").style.display='none'; 
}
function ViewLayerPopDataSourceSales(){ 
    document.getElementById("LayerPopDataSourceSales").style.display='inline' 
} 
function CloseLayerPopDataSourceSales(){ 
    document.getElementById("LayerPopDataSourceSales").style.display='none'; 
}
function ViewLayerPopDataSourcePopulation(){ 
    document.getElementById("LayerPopDataSourcePopulation").style.display='inline' 
} 
function CloseLayerPopDataSourcePopulation(){ 
    document.getElementById("LayerPopDataSourcePopulation").style.display='none'; 
}
function ViewLayerPopDataSourceIncome(){ 
    document.getElementById("LayerPopDataSourceIncome").style.display='inline' 
} 
function CloseLayerPopDataSourceIncome(){ 
    document.getElementById("LayerPopDataSourceIncome").style.display='none'; 
}           
function ViewLayerPopDataSourceArea(){ 
    document.getElementById("LayerPopDataSourceArea").style.display='inline' 
} 
function CloseLayerPopDataSourceArea(){ 
    document.getElementById("LayerPopDataSourceArea").style.display='none'; 
}
</script>
		</div>
	</div>
</body>
</html>