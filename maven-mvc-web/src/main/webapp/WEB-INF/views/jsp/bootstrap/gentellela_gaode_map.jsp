<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>  
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>定位后规划线路</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/plugin/gaode/style.css">
    <script type="text/javascript" src='https://webapi.amap.com/maps?v=1.3&plugin=AMap.Geolocation,AMap.ToolBar,AMap.Geocoder,AMap.PlaceSearch,AMap.Autocomplete,AMap.Driving&key=608d75903d29ad471362f8c58c550daf'></script>
  </head>
 
<body onload='startLocate()'>
    <div  style="width:100%;height:100%;position:absolute;overflow:hidden">
      <div class='wrap'  style="width:200%;height:100%;position:absolute">
          <div class='left'>
          <header class ='title top'>定位用户位置后规划驾车线路</header>
          <div class = 'info top' >
          </div>
          <div id="container" class="map" tabindex="0"></div>
          <div class='bottom start'  >
            <img src="../static/plugin/gaode/images/hotNew.png" />
            <div class='bottomright' >
              <div id='origin' >你的位置</div>
            </div>
          </div>
          <div class='bottom end'  >
             <img src="../static/plugin/gaode/images/hotNewRed.png" />
             <div class='bottomright' >
                <div id='destination' >你要去哪儿</div>
             </div>
          </div>
          <!-- <button id='driving'>开车去</button> -->
        </div>
        <div class='right'>
          <header class ='title top'>
          <a href='javascript:void(0)' id='back'>返回</a>
          <div>地点搜索</div>
          </header>
          <div class='top' style='height:40px;' >
             <div style='margin-top:2px'>
                <input id='search' value=''/>
             </div>
             <img id='searchButton' src="../static/plugin/gaode/images/search.gif"/>
          </div>
          <div id="searchResult"></div>
        </div>
        <div id='locating' style='display:none'>
          <img src='../static/plugin/gaode/images/loading.gif'/><div>定位中,请稍候...</div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
            // 创建地图
            var map = new AMap.Map('container', {
              zoom:17
            });
            
            // 給地图添加缩放工具条,默认显示在右下角
            var toolBar = new AMap.ToolBar({});
            map.addControl(toolBar);

            //起点（用户位置）的marker标记
           var startMarker = new AMap.Marker({
              content:"<img style='width:19px;height:32px' src='../static/plugin/gaode/images/starts.png'/>",
              offset:new AMap.Pixel(-10,-32)
            })
            //目的地的marker标记
            var endMarker = new AMap.Marker({
              content:"<img style='width:19px;height:32px' src='../static/plugin/gaode/images/ends.png'/>",
              offset:new AMap.Pixel(-10,-32)
            })
            //创建驾车路线规划组件
            var driving = new AMap.Driving({
              map:map,
              hideMarkers:true
            });

            var  wrap= document.getElementsByClassName('wrap')[0];
            //显示控制，执行后显示地图页面
            var showLeftView = function(){
                AMap.event.removeListener(placeSearch.listElementClickHandler);
                AMap.event.removeListener(autoComplete.selectHandler);
                placeSearch.clear();
                wrap.className = 'wrap';
            }
            //显示控制，执行后显示搜索页面
            var showRightView = function(onShowed){
              wrap.className = 'wrap rightShow';
            }
            //点击返回，页面由搜索页面返回显示页面
            AMap.event.addDomListener(document.getElementById('back'),'click',showLeftView);

      </script>
      <script type="text/javascript" src='${pageContext.request.contextPath}/static/plugin/gaode/js/locate.js'></script>  
      <script type="text/javascript" src='${pageContext.request.contextPath}/static/plugin/gaode/js/search.js'></script>         
  </body> 
</html>