<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>

	<title>JaneSSM3D立体照片</title>
	<style>
		*{margin: 0;padding: 0;}
		html,body{height: 100%;}
		body{

			display: flex;

			perspective: 1000px;
			transform-style: preserve-3d;
			background-image: url(photos/star.jpg);
			height:100%;
			width: 100%;
		}
		#box{
			position: relative;
			display: flex;
			width: 500px;
			height: 200px;
			margin: auto;
			transform-style: preserve-3d;
			transform: rotateX(-10deg);
		}
		#box > div{
			transform-style: preserve-3d;
			position: absolute;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			line-height: 200px;
			font-size: 50px;
			text-align: center;
			box-shadow:0 0 30px pink;
			-webkit-box-reflect:below 10px -webkit-linear-gradient(top,rgba(0,0,0,0) 40%,rgba(0,0,0,.8) 100%);
		}
		/*  #box > div:nth-child(1){
					background: skyblue;
					transform: translate3d(0,0,300px) rotateY(45deg);
				}
				#box > div:nth-child(2){
					background: pink;
					transform: rotateY(0deg);
				}
				#box > div:nth-child(3){
					background: purple;
					transform: translate3d(0,0,300px) rotateY(-45deg);
				}
		*/
		#box p{
			position: absolute;
			left: 0;
			top: 0;
			bottom: 0;
			right: 0;
			margin: auto;
			width: 1200px;
			height: 1200px;
			background: -webkit-radial-gradient(center center,600px 600px,rgba(50,50,50,1),rgba(0,0,0,0));
			border-radius: 50%;
			transform: rotateX(90deg) translate3d(-600px,0,-105px);
		}
	</style>
</head>
<body>
<div id="box">
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<p></p>
</div>
<script>
setTimeout(init,100);
function init(){
	var obox = document.getElementById('box'),
		aDiv = obox.getElementsByTagName('div');

		for (var i = 0; i < aDiv.length; i++) {
			aDiv[i].style.background = "url(photos/"+(i+1)+".jpg) center/cover";
			aDiv[i].style.transform = "rotateY("+(i*36)+"deg) translate3d(0,0,350px)";
			aDiv[i].style.transition = "transform 1s "+(aDiv.length-i)*0.2+"s";
		}
	var sX,
		sY,
		nX,
		nY,
		desX = 0,
		desY = 0,
		tX = 0,
		tY = 10,
		index = 0;//滚轮初始值
	document.onmousedown = function(e){
		clearInterval(obox.timer);
		e = e || window.event;
		var sX = e.clientX,
			sY = e.clientY;
			this.onmousemove = function(e){
				e = e || window.event;
				var nX = e.clientX,
					nY = e.clientY;
					 // 当前点的坐标和前一点的坐标差值
					desX = nX - sX;
					desY = nY - sY;
                    tX += desX*0.1;
                    tY += desY*0.1;

					obox.style.transform = "rotateX("+(-tY)+"deg) rotateY("+tX+"deg)";
					sX = nX;
					sY = nY;
			}
			this.onmouseup = function(){
				this.onmousemove = this.onmouseup = null;
				obox.timer = setInterval(function(){
					desX *= 0.95;
					desY *= 0.95;
					tX += desX*0.1;
					tY += desY*0.1;
					obox.style.transform = "rotateX("+(-tY)+"deg) rotateY("+tX+"deg)";
					if (Math.abs(desX)<0.5 && Math.abs(desY)<0.5) {
						clearInterval(obox.timer);
					}
				},13);
			}
		return false;
	}
	//滚轮放大缩小
	mousewheel(document,function(e){
		e = e || window.event;
		var d = e.wheelDelta/120 || -e.detail/3;
			if (d>0) {
				index-=20;
			}else{
				index+=30;
			}
			(index<(-1050)&&(index=(-1050)));
		document.body.style.perspective = 1000 + index + "px";
	})
	function mousewheel(obj,fn){
		document.onmousewheel===null?obj.onmousewheel=fn:addEvent(obj,"DOMMouseScroll",fn)
	}
	function addEvent(obj,eName,fn){
		obj.attachEvent?obj.attachEvent("on"+eName,fn):obj.addEventListener(eName,fn);
	}
}
</script>
<audio autoplay="autoplay" loop="true"><source src="source/Stay With Me.mp3"></audio>
</body>
</html>
