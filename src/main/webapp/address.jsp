<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Where am I?</title>
    <script type="text/javascript" src="js/myLoc.js"></script>

</style>
</head>
<body>
    <div id="location" style="text-align:center">
        Your location will go here.
    </div><html>
<title>百度地图API实现地理定位</title>
    <head>
        <meta charset="utf-8">
        <script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&ak=Or6y0tN6t433fiP3ZCvwD3gGmzSORHhR"></script>
    </head>
    <body style="margin:10px 10px;">
        <div id="status" style="text-align: center"></div>
        <div style="width:1000px;height:600px;border:4px double red;margin:30px auto" id="container"></div>
    </body>
</html>

<script type="text/javascript">
    //默认地理位置设置为地址武汉市政府
    var x=113.889728,y=29.379662;
    window.onload = function() {
        if(navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
            document.getElementById("status").innerHTML = " Geolocation is supported in your browser.";

            // 百度地图API功能
            var map = new BMap.Map("container");
            var point = new BMap.Point(x,y);
            map.centerAndZoom(point,12);

            var geolocation = new BMap.Geolocation();
            geolocation.getCurrentPosition(function(r) {
                if(this.getStatus() == BMAP_STATUS_SUCCESS) {
                    var mk = new BMap.Marker(r.point);
                    map.addOverlay(mk);
                    map.panTo(r.point);
                    map.enableScrollWheelZoom();
                }
                else {
                    alert('failed'+this.getStatus());
                }
            }, {enableHighAccuracy: true})
            return;
        }
        alert("你的浏览器不支持获取地理位置！");
    };

    function showPosition(position){
        x=position.coords.latitude;
        y=position.coords.longitude;
    }
</script>
