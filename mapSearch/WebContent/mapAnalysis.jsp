<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Small Business - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/small-business.css" rel="stylesheet">

  </head>

 <body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">골목상권 분석</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>


    <!-- Page Content -->
    <div class="container">

      <!-- Heading Row -->
      <div class="row my-4">
        <div class="col-lg-8">
          <div class="img-fluid rounded" id="map" style="width:900px;height:400px;"></div>
        </div>
        <!-- /.col-lg-8 -->
        <div class="col-lg-4">
          <h1>OOO 해당 상권 <br>종합 분석</h1>
          <p>해당상권은<br>
          OO업종<br>
          전국 외식업 골목상권 기준 상위 OO%<br>
          상권 안전도 : 좋음 / 보통 / 나쁨
          
          </p>
          <a class="btn btn-primary btn-lg" href="#">상권 통계 분석 더보기</a>
        </div>
        <!-- /.col-md-4 -->
      </div>
      <!-- /.row -->

      <!-- Call to Action Well -->
      <div class="card text-white bg-secondary my-4 text-center">
        <div class="card-body">
          <p class="text-white m-0"> 종합분석 외에도 지표별 다양한 상세분석을 볼 수 있습니다</p>
        </div>
      </div>

      <!-- Content Row -->
      <div class="row">
        <div class="col-md-4 mb-4">
          <div class="card h-100">
            <div class="card-body">
              <h2 class="card-title">예상 매출</h2>
              <p class="card-text">제1선택영역의 업소수는 0건으로 전월 대비 0.00% 동일하였습니다.<br>
강남구(한식)의 업소수는 2,375건으로 전월 대비 2.15% 증가하였습니다.<br>
서울(한식)의 업소수는 24,316건으로 전월 대비 3.29% 증가하였습니다.<br>
전국(한식)의 업소수는 202,306건으로 전월 대비 2.23% 증가하였습니다.<br>
              </p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">정보 더 보기</a>
            </div>
          </div>
        </div>
        <!-- /.col-md-4 -->
        <div class="col-md-4 mb-4">
          <div class="card h-100">
            <div class="card-body">
              <h2 class="card-title">예상 등급</h2>
              <p class="card-text">제1선택영역의 업소수는 0건으로 전월 대비 0.00% 동일하였습니다.<br>
강남구(한식)의 업소수는 2,375건으로 전월 대비 2.15% 증가하였습니다.<br>
서울(한식)의 업소수는 24,316건으로 전월 대비 3.29% 증가하였습니다.<br>
전국(한식)의 업소수는 202,306건으로 전월 대비 2.23% 증가하였습니다.<br></p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">정보 더 보기</a>
            </div>
          </div>
        </div>
        <!-- /.col-md-4 -->
        <div class="col-md-4 mb-4">
          <div class="card h-100">
            <div class="card-body">
              <h2 class="card-title">종합 평가</h2>
              <p class="card-text">제1선택영역의 업소수는 0건으로 전월 대비 0.00% 동일하였습니다.<br>
강남구(한식)의 업소수는 2,375건으로 전월 대비 2.15% 증가하였습니다.<br>
서울(한식)의 업소수는 24,316건으로 전월 대비 3.29% 증가하였습니다.<br>
전국(한식)의 업소수는 202,306건으로 전월 대비 2.23% 증가하였습니다.<br></p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">정보 더 보기</a>
            </div>
          </div>
        </div>
        <!-- /.col-md-4 -->

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55d81c6e682f667cceb61a2a681598bf&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(37.555280, 127.043614), // 지도의 중심좌표
    draggable: false, //지도 이동, 확대 막음
    level: 6 // 지도의 확대 레벨
};

//지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption),
customOverlay = new daum.maps.CustomOverlay({}),
infowindow = new daum.maps.InfoWindow({removable: true});

//=============================================================================================================
//=============================================================================================================
	

//마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(37.555280, 127.043614);

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

//=============================================================================================================
//=============================================================================================================


function getData(){
    var arrayDong=[];
    $.getJSON('alley.json', function(data) {
       $.each(data, function(i, area) {
          arrayDong.push(area);
       });  
       var areas=getPath(arrayDong)
       for (var i = 0, len = areas.length; i < len; i++) {
            displayArea(areas[i]);
        }     
    }); 

 }


 function getPath(data){
    var area=[]
    for(var i=0; i<data.length; i++){
       var dong={}
       name=data[i]["name"];
       path=data[i]["path"];
       var posList=[]
       for(var j=0; j<path.length; j++){        
          pos=new daum.maps.LatLng(path[j][1], path[j][0])
          posList.push(pos)
       }
       dong["name"]=name
       dong["path"]=posList
       area.push(dong)   
    }

    return area
 }
 
getData();

//다각형을 생상하고 이벤트를 등록하는 함수입니다!
function displayArea(area) {

// 지도에 표시할 다각형을 생성합니다
var polygon = new daum.maps.Polygon({
	map: map,
    path: area.path, // 그려질 다각형의 좌표 배열입니다
    strokeWeight: 2, // 선의 두께입니다
    strokeColor: '#ffae23', // 선의 색깔입니다
    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid', // 선의 스타일입니다
   /*  fillColor: '#EFFFED', // 채우기 색깔입니다
    fillOpacity: 0.3 // 채우기 불투명도 입니다 */
});


//#A2FF99
// 다각형에 마우스오버 이벤트가 발생했을 때 변경할 채우기 옵션입니다
var mouseoverOption = { 
    fillColor: '#e5da10', // 채우기 색깔입니다
    fillOpacity: 0.5 // 채우기 불투명도 입니다        
};

// 다각형에 마우스아웃 이벤트가 발생했을 때 변경할 채우기 옵션입니다
var mouseoutOption = {
    fillColor: '#EFFFED', // 채우기 색깔입니다 
    fillOpacity: 0.3 // 채우기 불투명도 입니다        
};

// 다각형에 마우스오버 이벤트를 등록합니다
daum.maps.event.addListener(polygon, 'mouseover', function() { 

    // 다각형의 채우기 옵션을 변경합니다
    polygon.setOptions(mouseoverOption);

});   

daum.maps.event.addListener(polygon, 'mouseout', function() { 

    // 다각형의 채우기 옵션을 변경합니다
    polygon.setOptions(mouseoutOption);
    
}); 

//다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
daum.maps.event.addListener(polygon, 'click', function(mouseEvent) {
    var content = '<div class="info">' + 
    '   <div class="title">' + '<strong>상권 명 :</strong> ???' + '</div>' +
    '   <div class="size"><strong>상권 경쟁 지수 :</strong> ?????' +
    '</div>';

    infowindow.setContent(content); 
    infowindow.setPosition(mouseEvent.latLng); 
    infowindow.setMap(map);
});
}

//=============================================================================================================
//=============================================================================================================
mapSearch()

function mapSearch() {
	var gg = '${sessionScope.g}'
	var dd = '${sessionScope.d}'
	console.log(gg);
	console.log(dd);
	var myAddress = gg + " " + dd
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
		geocoder.addressSearch(myAddress, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">여기요 여기</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	
}
	
	
</script>


  </body>

</html>
