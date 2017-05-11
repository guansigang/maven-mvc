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
#container{height:100%}  
</style>  
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=xlrZY72uR1wlEmyLWjIsfNToaYn208G8">
//v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
//v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
</script>
</head>  
 
<body>  
<div id="container"></div> 
<script type="text/javascript"> 
var map = new BMap.Map("container");          // 创建地图实例  
var point = new BMap.Point(116.404, 39.915);  // 创建点坐标  
map.centerAndZoom(point, 15); 
map.addControl(new BMap.NavigationControl());
map.addControl(new BMap.NavigationControl());    
map.addControl(new BMap.ScaleControl());    
map.addControl(new BMap.OverviewMapControl());    
map.addControl(new BMap.MapTypeControl());    
map.setCurrentCity("北京"); // 仅当设置城市信息时，MapTypeControl的切换功能才能可用 

var marker = new BMap.Marker(point);  
marker.addEventListener("click", function(){    
 alert("您点击了标注");    
});
      // 创建标注    
// map.addOverlay(marker);




function addMarker(point, index){  // 创建图标对象   
var myIcon = new BMap.Icon("../static/image/markers48.png", new BMap.Size(830, 850), {    
// 指定定位位置。   
// 当标注显示在地图上时，其所指向的地理位置距离图标左上    
// 角各偏移10像素和25像素。您可以看到在本例中该位置即是   
   // 图标中央下端的尖角位置。    
   offset: new BMap.Size(10, 25),    
   // 设置图片偏移。   
   // 当您需要从一幅较大的图片中截取某部分作为标注图标时，您   
   // 需要指定大图的偏移位置，此做法与css sprites技术类似。    
//    imageOffset: new BMap.Size(0, 0 - index * 25)   // 设置图片偏移    
 });      
// 创建标注对象并添加到地图   
 var marker = new BMap.Marker(point, {icon: myIcon});  
 marker.addEventListener("click", function(){    
 console.log("您点击了标注");    
});
 
   
 map.addOverlay(marker);    
}    
// 随机向地图添加10个标注    
var bounds = map.getBounds();    
var lngSpan = bounds.maxX - bounds.minX;    
var latSpan = bounds.maxY - bounds.minY;    
// for (var i = 0; i < 10; i ++) {    
//  var point = new BMap.Point(bounds.minX + lngSpan * (Math.random() * 0.7 + 0.15),bounds.minY + latSpan * (Math.random() * 0.7 + 0.15));   
 
 var point = new BMap.Point(116.404, 39.915);
  
 console.log(point);
 console.log("asad");
 addMarker(point, 1);    
// }
// for (var i = 0; i < 10; i ++) {    
//  var point = new BMap.Point(bounds.minX + lngSpan * (Math.random() * 0.7 + 0.15),bounds.minY + latSpan * (Math.random() * 0.7 + 0.15));    
//  console.log("asad");
//  addMarker(point, i);    
// }

window.setTimeout(function(){  
    map.panTo(new BMap.Point(116.409, 39.918));    
}, 2000);               // 初始化地图，设置中心点坐标和地图级别  
</script>  
</body>  
</html>