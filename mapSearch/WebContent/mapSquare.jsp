<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>

<style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:900px;height:600px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
</style>

</head>
<body>

<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <ul id="category">
        <li id="BK9" data-order="0"> 
            <span class="category_bg bank"></span>
            은행
        </li>       
        <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            마트
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            약국
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            주유소
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            카페
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            편의점
        </li>      
    </ul>
</div>





<div id="map"></div>

<input type="text" id="input" placeholder="주소, 상권명을 입력하시오" style="width:500px; height:35px;">
 			<button onclick="mapSearch()">위치 검색</button>
 			<hr color="black" style="width:500px" align="left">
 			
 			<select id="select1" onchange="cityChange()" style="width:250px; height:35px">
 				<option label="자치구 를 선택하여 주십시오"></option>
				<option>강남구</option>
				<option>강동구</option>
				<option>강북구</option>
				<option>강서구</option>
				<option>관악구</option>
				<option>광진구</option>
				<option>구로구</option>
				<option>금천구</option>
				<option>노원구</option>
				<option>도봉구</option>
				<option>동대문구</option>
				<option>동작구</option>
				<option>마포구</option>
				<option>서대문구</option>
				<option>서초구</option>
				<option>성동구</option>
				<option>성북구</option>
				<option>송파구</option>
				<option>양천구</option>
				<option>영등포구</option>
				<option>용산구</option>
				<option>은평구</option>
				<option>종로구</option>
				<option>중구</option>
				<option>중랑구</option>
			</select>
				 
			<select id="select2" style="width:250px; height:35px">
			</select>

 			<hr color="black" style="width:500px" align="left">
 			
 			
             <select id="select3" onchange="foodChange()" style="width:250px; height:35px">
 				<option label="업종 을 선택하여 주십시오"></option>
				<option>한 식</option>
				<option>중 식</option>
				<option>일 식</option>
			</select>
				 
			<select id="select4" style="width:250px; height:35px">
			</select>
             <hr color="black" style="width:500px" align="left">             
             
             <input type="text" placeholder="동일 업종" style="width:500px; height:35px">
             
             
             

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55d81c6e682f667cceb61a2a681598bf&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(37.557319, 126.924471), // 지도의 중심좌표
    level: 6, // 지도의 확대 레벨
};

//지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption),
customOverlay = new daum.maps.CustomOverlay({}),
infowindow = new daum.maps.InfoWindow({removable: true});

//=============================================================================================================
//=============================================================================================================
	

//마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(37.557319, 126.924471);

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

//=============================================================================================================
//=============================================================================================================

    
function mapSearch() {
	
	var myAddress = document.getElementById("input").value;
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

//=============================================================================================================
//=============================================================================================================

// 지도에 폴리곤으로 표시할 영역데이터 배열입니다 
var areas = [
    {
        name : '용산구',
        path : [new daum.maps.LatLng(37.5548768201904, 126.96966524449994),
            new daum.maps.LatLng(37.55308718044556, 126.97642899633566),
            new daum.maps.LatLng(37.55522076659584, 126.97654602427454),
            new daum.maps.LatLng(37.55320655210504, 126.97874667968763),
            new daum.maps.LatLng(37.55368689494708, 126.98541456064552),
            new daum.maps.LatLng(37.54722934282707, 126.995229135048),
            new daum.maps.LatLng(37.549694559809545, 126.99832516302801),
            new daum.maps.LatLng(37.550159406110104, 127.00436818301327),
            new daum.maps.LatLng(37.54820235864802, 127.0061334023129),
            new daum.maps.LatLng(37.546169758665414, 127.00499711608721),
            new daum.maps.LatLng(37.54385947805103, 127.00727818360471),
            new daum.maps.LatLng(37.54413326436179, 127.00898460651953),
            new daum.maps.LatLng(37.539639030116945, 127.00959054834321),
            new daum.maps.LatLng(37.537681185520256, 127.01726163044557),
            new daum.maps.LatLng(37.53378887274516, 127.01719284893274),
            new daum.maps.LatLng(37.52290225898471, 127.00614038053493),
            new daum.maps.LatLng(37.51309192794448, 126.99070240960813),
            new daum.maps.LatLng(37.50654651085339, 126.98553683648308),
            new daum.maps.LatLng(37.50702053393398, 126.97524914998174),
            new daum.maps.LatLng(37.51751820477105, 126.94988506562748),
            new daum.maps.LatLng(37.52702918583156, 126.94987870367682),
            new daum.maps.LatLng(37.534519656862926, 126.94481851935942),
            new daum.maps.LatLng(37.537500243531994, 126.95335659960566),
            new daum.maps.LatLng(37.54231338779177, 126.95817394011969),
            new daum.maps.LatLng(37.54546318600178, 126.95790512689311),
            new daum.maps.LatLng(37.548791603525764, 126.96371984820232),
            new daum.maps.LatLng(37.55155543391863, 126.96233786542686),
            new daum.maps.LatLng(37.5541513366375, 126.9657135934734),
            new daum.maps.LatLng(37.55566236579088, 126.9691850696746),
            new daum.maps.LatLng(37.5548768201904, 126.96966524449994)
        ]},
     {
        	name : '종로구',
            path : [new daum.maps.LatLng(37.544062989758594, 127.00854659142894),
                new daum.maps.LatLng(37.54385947805103, 127.00727818360471),
                new daum.maps.LatLng(37.546169758665414, 127.00499711608721),
                new daum.maps.LatLng(37.54820235864802, 127.0061334023129),
                new daum.maps.LatLng(37.550159406110104, 127.00436818301327),
                new daum.maps.LatLng(37.549694559809545, 126.99832516302801),
                new daum.maps.LatLng(37.54722934282707, 126.995229135048),
                new daum.maps.LatLng(37.55368689494708, 126.98541456064552),
                new daum.maps.LatLng(37.55320655210504, 126.97874667968763),
                new daum.maps.LatLng(37.55522076659584, 126.97654602427454),
                new daum.maps.LatLng(37.55308718044556, 126.97642899633566),
                new daum.maps.LatLng(37.55487749311664, 126.97240854546743),
                new daum.maps.LatLng(37.5548766923893, 126.9691718124876),
                new daum.maps.LatLng(37.55566236579088, 126.9691850696746),
                new daum.maps.LatLng(37.55155543391863, 126.96233786542686),
                new daum.maps.LatLng(37.55498984534305, 126.96173858545431),
                new daum.maps.LatLng(37.55695455613004, 126.96343068837372),
                new daum.maps.LatLng(37.5590262922649, 126.9616731414449),
                new daum.maps.LatLng(37.56197662569172, 126.96946316364357),
                new daum.maps.LatLng(37.56582132960869, 126.96669525397355),
                new daum.maps.LatLng(37.56824746386509, 126.96909838710842),
                new daum.maps.LatLng(37.569485309984174, 126.97637402412326),
                new daum.maps.LatLng(37.56810323716611, 126.98905202099309),
                new daum.maps.LatLng(37.56961739576364, 127.00225936812329),
                new daum.maps.LatLng(37.56966688588187, 127.0152677241078),
                new daum.maps.LatLng(37.572022763755164, 127.0223363152772),
                new daum.maps.LatLng(37.57190723475508, 127.02337770475695),
                new daum.maps.LatLng(37.56973041414113, 127.0234585247501),
                new daum.maps.LatLng(37.565200182350495, 127.02358387477513),
                new daum.maps.LatLng(37.56505173515675, 127.02678930885806),
                new daum.maps.LatLng(37.563390358462826, 127.02652159646888),
                new daum.maps.LatLng(37.5607276739534, 127.02339232029838),
                new daum.maps.LatLng(37.55779412537163, 127.0228934248264),
                new daum.maps.LatLng(37.556850715898484, 127.01807638779917),
                new daum.maps.LatLng(37.55264513061776, 127.01620129137214),
                new daum.maps.LatLng(37.547466935106435, 127.00931996404753),
                new daum.maps.LatLng(37.54502351209897, 127.00815187343248),
                new daum.maps.LatLng(37.544062989758594, 127.00854659142894)
            ]},
            {
                name : '종로구',
                path : [
                    new daum.maps.LatLng(37.631840777111364, 126.9749313865046),
                    new daum.maps.LatLng(37.632194205253654, 126.97609588529602),
                    new daum.maps.LatLng(37.629026103322374, 126.97496405167149),
                    new daum.maps.LatLng(37.6285585388996, 126.97992605309885),
                    new daum.maps.LatLng(37.626378096236195, 126.97960492198952),
                    new daum.maps.LatLng(37.6211493968146, 126.98365245774505),
                    new daum.maps.LatLng(37.6177725051378, 126.9837302191854),
                    new daum.maps.LatLng(37.613985109550605, 126.98658977758268),
                    new daum.maps.LatLng(37.611364924201304, 126.98565700183143),
                    new daum.maps.LatLng(37.60401657024552, 126.98665951539246),
                    new daum.maps.LatLng(37.60099164566844, 126.97852019816328),
                    new daum.maps.LatLng(37.59790270809407, 126.97672287261275),
                    new daum.maps.LatLng(37.59447673441787, 126.98544283754865),
                    new daum.maps.LatLng(37.59126960661375, 126.98919808879788),
                    new daum.maps.LatLng(37.592300831997434, 127.0009511248032),
                    new daum.maps.LatLng(37.58922302426079, 127.00228260552726),
                    new daum.maps.LatLng(37.586091007146834, 127.00667090686603),
                    new daum.maps.LatLng(37.58235007703611, 127.00677925856456),
                    new daum.maps.LatLng(37.58047228501006, 127.00863575242668),
                    new daum.maps.LatLng(37.58025588757531, 127.01058748333907),
                    new daum.maps.LatLng(37.582338528091164, 127.01483104096094),
                    new daum.maps.LatLng(37.581693162424465, 127.01673289259993),
                    new daum.maps.LatLng(37.57758802896556, 127.01812215416163),
                    new daum.maps.LatLng(37.5788668917658, 127.02140099081309),
                    new daum.maps.LatLng(37.578034045208426, 127.02313962015988),
                    new daum.maps.LatLng(37.57190723475508, 127.02337770475695),
                    new daum.maps.LatLng(37.56966688588187, 127.0152677241078),
                    new daum.maps.LatLng(37.56961739576364, 127.00225936812329),
                    new daum.maps.LatLng(37.5681357695346, 126.99014772014593),
                    new daum.maps.LatLng(37.569315246023024, 126.9732046364419),
                    new daum.maps.LatLng(37.56824746386509, 126.96909838710842),
                    new daum.maps.LatLng(37.56582132960869, 126.96669525397355),
                    new daum.maps.LatLng(37.57874076105342, 126.95354824618335),
                    new daum.maps.LatLng(37.581020184166476, 126.95812059678624),
                    new daum.maps.LatLng(37.59354736740056, 126.95750665936443),
                    new daum.maps.LatLng(37.595061575856455, 126.9590412421402),
                    new daum.maps.LatLng(37.59833350100327, 126.9576941779143),
                    new daum.maps.LatLng(37.59875701675023, 126.95306020161668),
                    new daum.maps.LatLng(37.602476031211225, 126.95237386792348),
                    new daum.maps.LatLng(37.60507154496655, 126.95404376087069),
                    new daum.maps.LatLng(37.60912809443569, 126.95032198271032),
                    new daum.maps.LatLng(37.615539700280216, 126.95072546923387),
                    new daum.maps.LatLng(37.62433621196653, 126.94900237336302),
                    new daum.maps.LatLng(37.62642708817027, 126.95037844036497),
                    new daum.maps.LatLng(37.629590994617104, 126.95881385457929),
                    new daum.maps.LatLng(37.629794440379136, 126.96376660599225),
                    new daum.maps.LatLng(37.632373740990175, 126.97302793692637),
                    new daum.maps.LatLng(37.631840777111364, 126.9749313865046)
                ]
            }, {
                name : '서대문구',
                path : [
                    new daum.maps.LatLng(37.59851932019209, 126.95347706883003),
                    new daum.maps.LatLng(37.5992407011344, 126.95499403097206),
                    new daum.maps.LatLng(37.59833350100327, 126.9576941779143),
                    new daum.maps.LatLng(37.595061575856455, 126.9590412421402),
                    new daum.maps.LatLng(37.59354736740056, 126.95750665936443),
                    new daum.maps.LatLng(37.581020184166476, 126.95812059678624),
                    new daum.maps.LatLng(37.57874076105342, 126.95354824618335),
                    new daum.maps.LatLng(37.56197662569172, 126.96946316364357),
                    new daum.maps.LatLng(37.5575156365052, 126.95991288916548),
                    new daum.maps.LatLng(37.55654562007193, 126.9413708153468),
                    new daum.maps.LatLng(37.555098093384, 126.93685861757348),
                    new daum.maps.LatLng(37.55884751347576, 126.92659242918415),
                    new daum.maps.LatLng(37.5633319104926, 126.92828128083327),
                    new daum.maps.LatLng(37.56510367293256, 126.92601582346325),
                    new daum.maps.LatLng(37.57082994377989, 126.9098094620638),
                    new daum.maps.LatLng(37.57599550420081, 126.902091747923),
                    new daum.maps.LatLng(37.587223103650295, 126.91284666446226),
                    new daum.maps.LatLng(37.58541570520177, 126.91531241017965),
                    new daum.maps.LatLng(37.585870567159255, 126.91638068573187),
                    new daum.maps.LatLng(37.583095195853055, 126.9159399866114),
                    new daum.maps.LatLng(37.583459593417196, 126.92175886498167),
                    new daum.maps.LatLng(37.587104600730505, 126.92388813813815),
                    new daum.maps.LatLng(37.588386594820484, 126.92800815682232),
                    new daum.maps.LatLng(37.59157595859555, 126.92776504133688),
                    new daum.maps.LatLng(37.59455434247408, 126.93027139545339),
                    new daum.maps.LatLng(37.59869748704149, 126.94088480070904),
                    new daum.maps.LatLng(37.60065830191363, 126.9414041615336),
                    new daum.maps.LatLng(37.60305781086164, 126.93995273804141),
                    new daum.maps.LatLng(37.610598531321436, 126.95037536795142),
                    new daum.maps.LatLng(37.6083605525023, 126.95056259057313),
                    new daum.maps.LatLng(37.60507154496655, 126.95404376087069),
                    new daum.maps.LatLng(37.602476031211225, 126.95237386792348),
                    new daum.maps.LatLng(37.59851932019209, 126.95347706883003)
                ]
            }, {
                name : '동대문구',
                path : [
                    new daum.maps.LatLng(37.607062869017085, 127.07111288773496),
                    new daum.maps.LatLng(37.60107201319839, 127.07287376670605),
                    new daum.maps.LatLng(37.59724304056685, 127.06949105186925),
                    new daum.maps.LatLng(37.58953367466315, 127.07030363208528),
                    new daum.maps.LatLng(37.58651213184981, 127.07264218709383),
                    new daum.maps.LatLng(37.5849555116177, 127.07216063016078),
                    new daum.maps.LatLng(37.58026781100598, 127.07619547037923),
                    new daum.maps.LatLng(37.571869232268774, 127.0782018408153),
                    new daum.maps.LatLng(37.559961773835425, 127.07239004251258),
                    new daum.maps.LatLng(37.56231553903832, 127.05876047165025),
                    new daum.maps.LatLng(37.57038253579033, 127.04794980454399),
                    new daum.maps.LatLng(37.572878529071055, 127.04263554582458),
                    new daum.maps.LatLng(37.57302061077518, 127.0381755492195),
                    new daum.maps.LatLng(37.56978273516453, 127.03099733100001),
                    new daum.maps.LatLng(37.57190723475508, 127.02337770475695),
                    new daum.maps.LatLng(37.57838361223621, 127.0232348231103),
                    new daum.maps.LatLng(37.58268174514337, 127.02953994610249),
                    new daum.maps.LatLng(37.58894739851823, 127.03553876830637),
                    new daum.maps.LatLng(37.5911852565689, 127.03621919708065),
                    new daum.maps.LatLng(37.59126734230753, 127.03875553445558),
                    new daum.maps.LatLng(37.5956815721534, 127.04062845365279),
                    new daum.maps.LatLng(37.5969637344377, 127.04302522879048),
                    new daum.maps.LatLng(37.59617641777492, 127.04734129391157),
                    new daum.maps.LatLng(37.60117358544485, 127.05101351973708),
                    new daum.maps.LatLng(37.600149587503246, 127.05209540476308),
                    new daum.maps.LatLng(37.60132672748398, 127.05508130598699),
                    new daum.maps.LatLng(37.6010580545608, 127.05917142337097),
                    new daum.maps.LatLng(37.605121767227374, 127.06219611364686),
                    new daum.maps.LatLng(37.607062869017085, 127.07111288773496)
                ]
            }, {
                name : '성북구',
                path : [
                    new daum.maps.LatLng(37.63654916557213, 126.98446028560235),
                    new daum.maps.LatLng(37.631446839436855, 126.99372381657889),
                    new daum.maps.LatLng(37.626192451322005, 126.99927047335905),
                    new daum.maps.LatLng(37.62382095469671, 127.00488450145781),
                    new daum.maps.LatLng(37.624026217174986, 127.00788862747375),
                    new daum.maps.LatLng(37.6205124078061, 127.00724034082933),
                    new daum.maps.LatLng(37.61679651952433, 127.01014412786792),
                    new daum.maps.LatLng(37.61472018601129, 127.01451127202589),
                    new daum.maps.LatLng(37.614629670135216, 127.01757841621624),
                    new daum.maps.LatLng(37.61137091590441, 127.02219857751122),
                    new daum.maps.LatLng(37.612692696824915, 127.02642583551054),
                    new daum.maps.LatLng(37.612367438936786, 127.03018593770908),
                    new daum.maps.LatLng(37.60896889076571, 127.0302525167858),
                    new daum.maps.LatLng(37.61279787695882, 127.03730791358603),
                    new daum.maps.LatLng(37.62426467261789, 127.04973339977498),
                    new daum.maps.LatLng(37.61449950127667, 127.06174181124696),
                    new daum.maps.LatLng(37.61561580859776, 127.06985247014711),
                    new daum.maps.LatLng(37.61351359068103, 127.07170798866412),
                    new daum.maps.LatLng(37.60762512162974, 127.07105453180604),
                    new daum.maps.LatLng(37.605121767227374, 127.06219611364686),
                    new daum.maps.LatLng(37.6010580545608, 127.05917142337097),
                    new daum.maps.LatLng(37.60132672748398, 127.05508130598699),
                    new daum.maps.LatLng(37.600149587503246, 127.05209540476308),
                    new daum.maps.LatLng(37.60117358544485, 127.05101351973708),
                    new daum.maps.LatLng(37.59617641777492, 127.04734129391157),
                    new daum.maps.LatLng(37.59644879095525, 127.04184728392097),
                    new daum.maps.LatLng(37.59126734230753, 127.03875553445558),
                    new daum.maps.LatLng(37.5911852565689, 127.03621919708065),
                    new daum.maps.LatLng(37.58894739851823, 127.03553876830637),
                    new daum.maps.LatLng(37.58268174514337, 127.02953994610249),
                    new daum.maps.LatLng(37.57782865303167, 127.02296295333255),
                    new daum.maps.LatLng(37.57889204835333, 127.02179043639809),
                    new daum.maps.LatLng(37.57758802896556, 127.01812215416163),
                    new daum.maps.LatLng(37.581693162424465, 127.01673289259993),
                    new daum.maps.LatLng(37.582338528091164, 127.01483104096094),
                    new daum.maps.LatLng(37.58025588757531, 127.01058748333907),
                    new daum.maps.LatLng(37.58047228501006, 127.00863575242668),
                    new daum.maps.LatLng(37.58235007703611, 127.00677925856456),
                    new daum.maps.LatLng(37.586091007146834, 127.00667090686603),
                    new daum.maps.LatLng(37.58922302426079, 127.00228260552726),
                    new daum.maps.LatLng(37.592300831997434, 127.0009511248032),
                    new daum.maps.LatLng(37.59126960661375, 126.98919808879788),
                    new daum.maps.LatLng(37.59447673441787, 126.98544283754865),
                    new daum.maps.LatLng(37.59790270809407, 126.97672287261275),
                    new daum.maps.LatLng(37.60099164566844, 126.97852019816328),
                    new daum.maps.LatLng(37.60451393107786, 126.98678626394351),
                    new daum.maps.LatLng(37.611364924201304, 126.98565700183143),
                    new daum.maps.LatLng(37.613985109550605, 126.98658977758268),
                    new daum.maps.LatLng(37.6177725051378, 126.9837302191854),
                    new daum.maps.LatLng(37.6211493968146, 126.98365245774505),
                    new daum.maps.LatLng(37.626378096236195, 126.97960492198952),
                    new daum.maps.LatLng(37.6285585388996, 126.97992605309885),
                    new daum.maps.LatLng(37.62980449548538, 126.97468284124939),
                    new daum.maps.LatLng(37.633657663246694, 126.97740053878216),
                    new daum.maps.LatLng(37.63476479485093, 126.98154674721893),
                    new daum.maps.LatLng(37.63780700422825, 126.9849494717052),
                    new daum.maps.LatLng(37.63654916557213, 126.98446028560235)
                ]
            }, {
                name : '성동구',
                path : [
                    new daum.maps.LatLng(37.57275246810175, 127.04241813085706),
                    new daum.maps.LatLng(37.57038253579033, 127.04794980454399),
                    new daum.maps.LatLng(37.56231553903832, 127.05876047165025),
                    new daum.maps.LatLng(37.5594131360664, 127.07373408220053),
                    new daum.maps.LatLng(37.52832388381049, 127.05621773388143),
                    new daum.maps.LatLng(37.53423885672233, 127.04604398310076),
                    new daum.maps.LatLng(37.53582328355087, 127.03979942567628),
                    new daum.maps.LatLng(37.53581367627865, 127.0211714455564),
                    new daum.maps.LatLng(37.53378887274516, 127.01719284893274),
                    new daum.maps.LatLng(37.537681185520256, 127.01726163044557),
                    new daum.maps.LatLng(37.53938672166098, 127.00993448922989),
                    new daum.maps.LatLng(37.54157804358092, 127.00879872996808),
                    new daum.maps.LatLng(37.54502351209897, 127.00815187343248),
                    new daum.maps.LatLng(37.547466935106435, 127.00931996404753),
                    new daum.maps.LatLng(37.55264513061776, 127.01620129137214),
                    new daum.maps.LatLng(37.556850715898484, 127.01807638779917),
                    new daum.maps.LatLng(37.55779412537163, 127.0228934248264),
                    new daum.maps.LatLng(37.5607276739534, 127.02339232029838),
                    new daum.maps.LatLng(37.563390358462826, 127.02652159646888),
                    new daum.maps.LatLng(37.56505173515675, 127.02678930885806),
                    new daum.maps.LatLng(37.565200182350495, 127.02358387477513),
                    new daum.maps.LatLng(37.57190723475508, 127.02337770475695),
                    new daum.maps.LatLng(37.56978273516453, 127.03099733100001),
                    new daum.maps.LatLng(37.57302061077518, 127.0381755492195),
                    new daum.maps.LatLng(37.57275246810175, 127.04241813085706)
                ]
            }, {
                name : '마포구',
                path : [
                    new daum.maps.LatLng(37.584651324803644, 126.88883849288884),
                    new daum.maps.LatLng(37.57082994377989, 126.9098094620638),
                    new daum.maps.LatLng(37.56510367293256, 126.92601582346325),
                    new daum.maps.LatLng(37.5633319104926, 126.92828128083327),
                    new daum.maps.LatLng(37.55884751347576, 126.92659242918415),
                    new daum.maps.LatLng(37.55675317809392, 126.93190919632814),
                    new daum.maps.LatLng(37.555098093384, 126.93685861757348),
                    new daum.maps.LatLng(37.55654562007193, 126.9413708153468),
                    new daum.maps.LatLng(37.557241466445234, 126.95913438471307),
                    new daum.maps.LatLng(37.55908394430372, 126.96163689468189),
                    new daum.maps.LatLng(37.55820141918588, 126.96305432966605),
                    new daum.maps.LatLng(37.554784413504734, 126.9617251098019),
                    new daum.maps.LatLng(37.548791603525764, 126.96371984820232),
                    new daum.maps.LatLng(37.54546318600178, 126.95790512689311),
                    new daum.maps.LatLng(37.54231338779177, 126.95817394011969),
                    new daum.maps.LatLng(37.539468942052544, 126.955731506394),
                    new daum.maps.LatLng(37.536292068277106, 126.95128907260018),
                    new daum.maps.LatLng(37.53569162926515, 126.94627494388307),
                    new daum.maps.LatLng(37.53377712226906, 126.94458373402794),
                    new daum.maps.LatLng(37.54135238063506, 126.93031191951576),
                    new daum.maps.LatLng(37.539036674424615, 126.9271006565075),
                    new daum.maps.LatLng(37.54143034750605, 126.9224138272872),
                    new daum.maps.LatLng(37.54141748538761, 126.90483000187002),
                    new daum.maps.LatLng(37.548015078285694, 126.89890097452322),
                    new daum.maps.LatLng(37.56300401736817, 126.86623824787709),
                    new daum.maps.LatLng(37.57178997971358, 126.85363039091744),
                    new daum.maps.LatLng(37.57379738998644, 126.85362646212587),
                    new daum.maps.LatLng(37.57747251471329, 126.864939928088),
                    new daum.maps.LatLng(37.5781913017327, 126.87625939970273),
                    new daum.maps.LatLng(37.57977132158497, 126.87767870371688),
                    new daum.maps.LatLng(37.584440882833654, 126.87653889183002),
                    new daum.maps.LatLng(37.59079311146897, 126.88205386700724),
                    new daum.maps.LatLng(37.584651324803644, 126.88883849288884)
                ]
            }

     	]
	
	
	

//다각형을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 다각형을 표시합니다 
/* var polygonPath = [
        new daum.maps.LatLng(37.560690, 126.982077),
        new daum.maps.LatLng(37.561927, 126.981374),
        new daum.maps.LatLng(37.564380, 126.982454),
        new daum.maps.LatLng(37.564439, 126.984285),
        new daum.maps.LatLng(37.563690, 126.984439),
        new daum.maps.LatLng(37.564549, 126.987458),
        new daum.maps.LatLng(37.562907, 126.988504),
        new daum.maps.LatLng(37.561272, 126.988762)
]; */

//지도에 영역데이터를 폴리곤으로 표시합니다 
for (var i = 0, len = areas.length; i < len; i++) {
    displayArea(areas[i]);
}


//다각형을 생상하고 이벤트를 등록하는 함수입니다
function displayArea(area) {

// 지도에 표시할 다각형을 생성합니다
var polygon = new daum.maps.Polygon({
	map: map,
    path: area.path, // 그려질 다각형의 좌표 배열입니다
    strokeWeight: 3, // 선의 두께입니다
    strokeColor: '#ef0404', // 선의 색깔입니다
    strokeOpacity: 0.5, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid', // 선의 스타일입니다
    fillColor: '#EFFFED', // 채우기 색깔입니다
    fillOpacity: 0.3 // 채우기 불투명도 입니다
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

//=============================================================================================================
//=============================================================================================================


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

	
	
//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(map); 

//지도에 idle 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === daum.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                daum.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 

//=============================================================================================================
//=============================================================================================================



function cityChange(){
	 
	var 강남 = ["압구정동","삼성동","청담동"];
	var 강동 = ["상일동","명일동","천호동"];
	var 강북 = ["수유동","우이동","삼양동"];
	 
	var selectCity = $("#select1").val();
	 
	var changeCity;
	  
	if(selectCity == "강남구"){
	  changeCity = 강남;
	}
	else if(selectCity == "강동구"){
	  changeCity = 강동;
	}
	else if(selectCity == "강북구"){
	  changeCity =  강북;
	}
	 
	$('#select2').empty();
	 
	
	for (var count = 0; count < changeCity.length; count++) {
		var option = $("<option>" + changeCity[count] + "</option>");
		$('#select2').append(option);
	}

}

function foodChange(){
	 
	var korea = ["분식","백반","국수"];
	var china = ["짜장면","딤섬","양꼬치"];
	var japan = ["스시","라멘","돈부리"];
	 
	var selectFood = $("#select3").val();
	 
	var changeFood;
	  
	if(selectFood == "한 식"){
	  changeFood = korea;
	}
	else if(selectFood == "중 식"){
	  changeFood = china;
	}
	else if(selectFood == "일 식"){
	  changeFood = japan;
	}
	 
	$('#select4').empty();
	 
	
	for (var count = 0; count < changeFood.length; count++) {
		var option = $("<option>" + changeFood[count] + "</option>");
		$('#select4').append(option);
	}

}

</script>
</body>
</html>