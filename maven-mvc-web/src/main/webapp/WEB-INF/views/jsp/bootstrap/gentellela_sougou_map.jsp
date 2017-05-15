<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="base/gentellela_base.jsp" flush="true" />
<html>  
<head>  
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title>Hello, World</title>  
<style type="text/css">  
html{height:100%}  
body{height:100%;margin:0px;padding:0px}  
</style>  
<script type="text/javascript" src="http://api.go2map.com/maps/js/api_v2.5.1.js"></script>
</head>  
 
<body>
<input type="button" onclick="getMyPositionMap()" value="获取我的周边地图" />
<div id="map_canvas" style="height: 100%;"></div> 
<script type="text/javascript"> 
var map = new sogou.maps.Map(document.getElementById("map_canvas"),{});

/**
  * 简单的定位示例
  */
  //获取我的周边地图
  function getMyPositionMap() {
    var map,myLatlng,marker,mapDiv = document.getElementById("map_canvas");
    //获取浏览器是否支持和用户是否授权的状态码
    sogou.maps.geoLocation.getAvailableCode(function(code){
        console.log(code);
        switch(code){
            //浏览器支持定位且用户允许
            case 0:
                //尝试开始定位
                sogou.maps.geoLocation.getLocation(function(geoInfo){
                    //若获取成功
                    if(geoInfo.states === 0){
                        //利用获取得到的location值生成地图中心点坐标的LatLng对象
                        myLatlng = new sogou.maps.LatLng(geoInfo.location.point.x,geoInfo.location.point.y);
                        //设置地图高度，在网页上留出地图的位置
                        mapDiv.style.height = '300px'
                        //绘制地图
                        map = new sogou.maps.Map(mapDiv,{
                            zoom: 12,
                            center:myLatlng,
                            mapTypeId: sogou.maps.MapTypeId.ROADMAP
                        });
                        //标记"当前位置"
                        marker = new sogou.maps.Marker({
                            position: myLatlng,
                            map: map,
                            title:"当前位置"
                        });
                    }
                });
                break;
            //浏览器支持定位且单用户不允许
            case 1:
                console.log('您的浏览器支持定位功能，请允许浏览器获取您的位置，然后重试本功能。');
                break;
            //浏览器不支持定位
            case 10:
                console.log('很遗憾，您的浏览器暂不支持定位功能。');
                break;
        }
    })
  }


</script>  
</body>  
</html>