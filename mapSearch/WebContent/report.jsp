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

    
    function drawChart1() {
 
        // Create the data table.
        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'date');
        data1.addColumn('number', '매출');
        
        /*  ##############실제 데이터 받는 코드###################### */
        data1.addRows([
			  ['${sessionScope.area0.date}', ${sessionScope.area0.sales}],
        	  ['${sessionScope.area1.date}', ${sessionScope.area1.sales}],
        	  ['${sessionScope.area2.date}', ${sessionScope.area2.sales}],
        	  ['${sessionScope.area3.date}', ${sessionScope.area3.sales}],
        	  ['${sessionScope.area4.date}', ${sessionScope.area4.sales}],
        	  ['${sessionScope.area5.date}', ${sessionScope.area5.sales}],
        	  ['${sessionScope.area6.date}', ${sessionScope.area6.sales}],
        	  ['${sessionScope.area7.date}', ${sessionScope.area7.sales}],
        	  ['${sessionScope.area8.date}', ${sessionScope.area8.sales}],
        	  ['${sessionScope.area9.date}', ${sessionScope.area9.sales}],
        	  ['${sessionScope.area10.date}', ${sessionScope.area10.sales}],
        	  ['${sessionScope.area11.date}', ${sessionScope.area11.sales}],
        	  ['${sessionScope.area12.date}', ${sessionScope.area12.sales}],
        	  ['${sessionScope.area13.date}', ${sessionScope.area13.sales}]
        ]);   

        // Set chart options
        var options1 = {
                       'height':430};
        //'title':'매출 현황',
        
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
        data2.addRows([
		     [ '${sessionScope.area0.date}',  ${sessionScope.area0.totalPeople}, ${sessionScope.area0.totalLivingPeople}, ${sessionScope.area0.totalBizman}],
	      	 [ '${sessionScope.area1.date}',  ${sessionScope.area1.totalPeople}, ${sessionScope.area1.totalLivingPeople}, ${sessionScope.area1.totalBizman}],
	      	 [ '${sessionScope.area2.date}',  ${sessionScope.area2.totalPeople}, ${sessionScope.area2.totalLivingPeople}, ${sessionScope.area2.totalBizman}],
	      	 [ '${sessionScope.area3.date}',  ${sessionScope.area3.totalPeople}, ${sessionScope.area3.totalLivingPeople}, ${sessionScope.area3.totalBizman}],
	      	 [ '${sessionScope.area4.date}',  ${sessionScope.area4.totalPeople}, ${sessionScope.area4.totalLivingPeople}, ${sessionScope.area4.totalBizman}],
	      	 [ '${sessionScope.area5.date}',  ${sessionScope.area5.totalPeople}, ${sessionScope.area5.totalLivingPeople}, ${sessionScope.area5.totalBizman}],
	      	 [ '${sessionScope.area6.date}',  ${sessionScope.area6.totalPeople}, ${sessionScope.area6.totalLivingPeople}, ${sessionScope.area6.totalBizman}],
	      	 [ '${sessionScope.area7.date}',  ${sessionScope.area7.totalPeople}, ${sessionScope.area7.totalLivingPeople}, ${sessionScope.area7.totalBizman}],
	      	 [ '${sessionScope.area8.date}',  ${sessionScope.area8.totalPeople}, ${sessionScope.area8.totalLivingPeople}, ${sessionScope.area8.totalBizman}],
	      	 [ '${sessionScope.area9.date}',  ${sessionScope.area9.totalPeople}, ${sessionScope.area9.totalLivingPeople}, ${sessionScope.area9.totalBizman}],
	      	 [ '${sessionScope.area10.date}',  ${sessionScope.area10.totalPeople}, ${sessionScope.area10.totalLivingPeople}, ${sessionScope.area10.totalBizman}],
	      	 [ '${sessionScope.area11.date}',  ${sessionScope.area11.totalPeople}, ${sessionScope.area11.totalLivingPeople}, ${sessionScope.area11.totalBizman}],
	      	 [ '${sessionScope.area12.date}',  ${sessionScope.area12.totalPeople}, ${sessionScope.area12.totalLivingPeople}, ${sessionScope.area12.totalBizman}],
	       	 [ '${sessionScope.area13.date}',  ${sessionScope.area13.totalPeople}, ${sessionScope.area13.totalLivingPeople}, ${sessionScope.area13.totalBizman}]
        ]);
   
        // Set chart options
        var options2 = {
        		
        		bars: 'vertical',
        		'height': 430
        };

        //chart: {'title':'유동 인구, 상주 인구, 직장인 인구 현황'},
        
        // Instantiate and draw our chart, passing in some options.
        
        var chart2 = new google.charts.Bar(document.getElementById('chart_div2'));
        chart2.draw(data2, google.charts.Bar.convertOptions(options2));
    }
    function drawChart3() {
        
        // Create the data table.
        var data3 = new google.visualization.DataTable();
        data3.addColumn('string', 'date');
        data3.addColumn('number', '주요기관 수');
        
        
        /*  ##############실제 데이터 받는 코드###################### */
        data3.addRows([
          	  ['${sessionScope.area0.date}', ${sessionScope.area0.totalFacility}],
        	  ['${sessionScope.area1.date}', ${sessionScope.area1.totalFacility}],
        	  ['${sessionScope.area2.date}', ${sessionScope.area2.totalFacility}],
        	  ['${sessionScope.area3.date}', ${sessionScope.area3.totalFacility}],
        	  ['${sessionScope.area4.date}', ${sessionScope.area4.totalFacility}],
        	  ['${sessionScope.area5.date}', ${sessionScope.area5.totalFacility}],
        	  ['${sessionScope.area6.date}', ${sessionScope.area6.totalFacility}],
        	  ['${sessionScope.area7.date}', ${sessionScope.area7.totalFacility}],
        	  ['${sessionScope.area8.date}', ${sessionScope.area8.totalFacility}],
        	  ['${sessionScope.area9.date}', ${sessionScope.area9.totalFacility}],
        	  ['${sessionScope.area10.date}', ${sessionScope.area10.totalFacility}],
        	  ['${sessionScope.area11.date}', ${sessionScope.area11.totalFacility}],
        	  ['${sessionScope.area12.date}', ${sessionScope.area12.totalFacility}],
        	  ['${sessionScope.area13.date}', ${sessionScope.area13.totalFacility}]
        ]);
        
       
        // Set chart options
        var options3 = {
               'height': 430};
        /*
			chart:{	
        	'title':'상권 내 주요기관 현황',
			'subtitle': '주요기관: 대학, 병원, 기업, 공공기관 등'
			},
        */       
               
        // Instantiate and draw our chart, passing in some options.
        var chart3 = new google.charts.Line(document.getElementById('chart_div3'));
        chart3.draw(data3, google.charts.Line.convertOptions(options3));
    } 
    function drawChart4() {
        
        // Create the data table.
        var data4 = new google.visualization.DataTable();
        data4.addColumn('string', 'date');
        data4.addColumn('number', '점포 수');
        
        
        /*  ##############실제 데이터 받는 코드###################### */
        data4.addRows([
        	  ['${sessionScope.area0.date}', ${sessionScope.area0.stores}],
        	  ['${sessionScope.area1.date}', ${sessionScope.area1.stores}],
        	  ['${sessionScope.area2.date}', ${sessionScope.area2.stores}],
        	  ['${sessionScope.area3.date}', ${sessionScope.area3.stores}],
        	  ['${sessionScope.area4.date}', ${sessionScope.area4.stores}],
        	  ['${sessionScope.area5.date}', ${sessionScope.area5.stores}],
        	  ['${sessionScope.area6.date}', ${sessionScope.area6.stores}],
        	  ['${sessionScope.area7.date}', ${sessionScope.area7.stores}],
        	  ['${sessionScope.area8.date}', ${sessionScope.area8.stores}],
        	  ['${sessionScope.area9.date}', ${sessionScope.area9.stores}],
        	  ['${sessionScope.area10.date}', ${sessionScope.area10.stores}],
        	  ['${sessionScope.area11.date}', ${sessionScope.area11.stores}],
        	  ['${sessionScope.area12.date}', ${sessionScope.area12.stores}],
        	  ['${sessionScope.area13.date}', ${sessionScope.area13.stores}]
        ]);
        

       
        // Set chart options
        var options4 = {
        		chart:{
        			'title':'동종 상점 추이'
        			},
                       'height':450};
        
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
										<a href="mapService.jsp">상권분석 보고서 </a><font color="#2e70c2">: ${sessionScope.gu}</font> <font color="#2e70c2">${sessionScope.dong}</font>
									</h2>
									<ul class="nav nav-tabs depth-3" role="tablist">
			                            <li><a href="javascript:moveBtn('category1')">1. 매출액 추이</a></li>
			                            <li><a href="javascript:moveBtn('category2')">2. 유동, 상주, 직장인 인구 추이</a></li>
			                            <li><a href="javascript:moveBtn('category3')">3. 주요 기관 추이</a></li>
			                            <li><a href="javascript:moveBtn('category5')">4. 업종 생애주기</a></li>
			                        </ul>
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
													<!--  테두리 박스 -->
													<div id="areaJisu1ChartDiv"
														style="text-align: center; width: 863px; height: 450px;"
														class="img-responsive">
														<div class="rMateChartH5__Root" id="areaJisu1Chart"
															style="box-sizing: content-box; position: absolute; overflow: visible; width: 841px; height: 428px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); background-color: rgb(255, 255, 255); border-radius: 12px; border-style: none;">
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
													<div id="areaJisu1ChartDiv"
														style="text-align: center; width: 863px; height: 450px;"
														class="img-responsive">
														<div class="rMateChartH5__Root" id="areaJisu1Chart"
															style="box-sizing: content-box; position: absolute; overflow: visible; width: 841px; height: 428px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); background-color: rgb(255, 255, 255); border-radius: 12px; border-style: none;">
															<div id="chart_div2" style="border: 1px solid #ccc"></div>
														</div>
													</div>
													<p></p>
												</div>
												<p class="clearfix ng-scope"></p>

												<!-- 매장수 추이  -->
												<p class="clearfix ng-scope" id="category2"></p>
												<p class="fmenu-space ng-scope"></p>
												<h3 class="ng-scope">3. 동종 상점 추이</h3>

												<div class="boxwrap ng-scope">
													<p class="text-center"></p>
													<div id="areaJisu1ChartDiv"
														style="text-align: center; width: 863px; height: 450px;"
														class="img-responsive">
														<div class="rMateChartH5__Root" id="areaJisu1Chart"
															style="box-sizing: content-box; position: absolute; overflow: visible; width: 841px; height: 428px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); background-color: rgb(255, 255, 255); border-radius: 12px; border-style: none;">
															<div id="chart_div4" style="border: 1px solid #ccc"></div>
														</div>
													</div>
													<p></p>
												</div>
												<p class="clearfix ng-scope"></p>

												<!-- 주요 시설 추이 -->
												<p class="clearfix ng-scope" id="category2"></p>
												<p class="fmenu-space ng-scope"></p>
												<h3 class="ng-scope">4. 주요기관 추이</h3>

												<div class="boxwrap ng-scope">
													<p class="text-center"></p>
													<div id="areaJisu1ChartDiv"
														style="text-align: center; width: 863px; height: 450px;"
														class="img-responsive">
														<div class="rMateChartH5__Root" id="areaJisu1Chart"
															style="box-sizing: content-box; position: absolute; overflow: visible; width: 841px; height: 428px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); background-color: rgb(255, 255, 255); border-radius: 12px; border-style: none;">
															<div id="chart_div3" style="border: 1px solid #ccc"></div>
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
	
<style>
.scrollTopBtn {
 	display: none;
 	position: fixed;
 	bottom: 30px;
 	right: 20px;
 	z-index: 99;
 	border: 1px solid #0092cb;/* 버튼 테두리 색상을 바꿀 경우 #0092cb 를 다른 색상값으로 바꿔주세요. */
 	outline: none;
 	background-color: #00a1e0; /* 버튼 배경색을 바꿀 경우 #00a1e0 을 다른 색상값으로 바꿔주세요. */
 	font-size: 1em;/* 텍스트 크기를 바꾸려면 숫자를 바꿔주세요. 예로 들면 1.25em */
 	font-weight: bold;
 	cursor: pointer;
 	padding: 13px 17px;/* 텍스트 사방에 여백을 더 주려면 숫자를 바꿔주세요. 13px 은 상하, 17px 은 좌우 */
 	border-radius: 4px; /*사각형 모서리의 둥근 정도를 바꾸려면 숫자를 바꿔주세요. 0px 은 직사각형입니다. */
}
.scrollTopBtn:hover {
	border: 1px solid #303030; /* 버튼 테두리 색상을 바꿀 경우 #0092cb를 다른 색상값으로 바꿔주세요. */
 	background-color: #333333; /* 버튼 배경색을 바꿀 경우 #00a1e0을 다른 색상값으로 바꿔주세요. */
}
</style>

<a href="mapService.jsp;" class="scrollTopBtn" style="position:fixed; right:25px; bottom:25px; display:block; color:#ffffff; z-index:999" id="click">뒤로돌아가기</a>
<!-- /* 버튼의 위치를 변경하려면, right와 bottom의 픽셀(px) 값을 바꿔주세요. */
/* 텍스트 색상을 바꾸려면, color: #ffffff 의 색상값을 바꿔주세요. */
/* 텍스트를 바꾸려면, 한글로 써진 부분을 바꿔주세요. 예를 들면 [상단이동]을 [TOP]으로 바꿀 수 있습니다. */ -->
</body>
</html>