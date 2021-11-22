 <%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8">
<title>JaneSSM流星雨</title>
<style>
html,body{height:100%;margin:0;padding:0}
ul,li{text-indent:0;text-decoration:none;margin:0;padding:0}
img{border:0}
body{background-color:#000;color:#999;font:100%/18px helvetica, arial, sans-serif}
canvas{cursor:crosshair;display:block;left:0;position:absolute;top:0;z-index:20}
</style>
<script>

	var context;

	var arr = new Array();
	var starCount = 800;

	var rains = new Array();
	var rainCount =20;

	//初始化画布及context
	function init(){
		//获取canvas
		var stars = document.getElementById("stars");
		windowWidth = window.innerWidth; //当前的窗口的高度
		stars.width=windowWidth;
		stars.height=window.innerHeight;
		//获取context
		context = stars.getContext("2d");
	}

	//创建一个星星对象
	var Star = function (){
		this.x = windowWidth * Math.random();//横坐标
		this.y = 5000 * Math.random();//纵坐标
		this.text="☆";//文本
		this.color = "white";//颜色

		//产生随机颜色
		this.getColor=function(){

			var _r = Math.random();

			if(_r<0.5){
				this.color = "#333";
			}else{
				this.color = "pink";
			}

		}

		//初始化
		this.init=function(){
			this.getColor();
		}
		//绘制
		this.draw=function(){
			context.fillStyle=this.color;
			context.fillText(this.text,this.x,this.y);
		}

	}

	 //画月亮
	function drawMoon(){
		 var moon = new Image();
			 moon.src = "./photos/moon.jpg"
			 context.drawImage(moon,-5,-10);
	}



	//页面加载的时候
	window.onload = function() {

		init();
		//画星星
		for (var i=0;i<starCount;i++) {
			var star = new Star();
			star.init();
			star.draw();
			arr.push(star);
		}

		//画流星
		for (var i=0;i<rainCount;i++) {
			var rain = new MeteorRain();
			rain.init();
			rain.draw();
			rains.push(rain);
		}

		drawMoon();//绘制月亮
		playStars();//绘制闪动的星星
		playRains();//绘制流星

	}

	 //星星闪起来
	function playStars(){
		for (var n = 0; n < starCount; n++){
			arr[n].getColor();
			arr[n].draw();
		}

		setTimeout("playStars()",100);
	}


/*流星雨开始*/

  var MeteorRain = function(){
		    this.x = -1;
		    this.y = -1;
		    this.length = -1;//长度
		    this.angle = 30; //倾斜角度
		    this.width = -1;//宽度
		    this.height = -1;//高度
		    this.speed = 1;//速度
		    this.offset_x = -1;//横轴移动偏移量
		    this.offset_y = -1;//纵轴移动偏移量
		    this.alpha = 1; //透明度
		    this.color1 = "";//流星的色彩
		    this.color2 = "";  //流星的色彩
    /****************初始化函数********************/
    this.init = function () //初始化
    {
        this.getPos();
        this.alpha = 1;//透明度
        this.getRandomColor();
        //最小长度，最大长度
        var x = Math.random() * 80 + 150;
        this.length = Math.ceil(x);
//                  x = Math.random()*10+30;
        this.angle = 30; //流星倾斜角
        x = Math.random()+0.5;
        this.speed = Math.ceil(x); //流星的速度
        var cos = Math.cos(this.angle*3.14/180);
        var sin = Math.sin(this.angle*3.14/180) ;
        this.width = this.length*cos ;  //流星所占宽度
        this.height = this.length*sin ;//流星所占高度
        this.offset_x = this.speed*cos ;
        this.offset_y = this.speed*sin;
    }

    /**************获取随机颜色函数*****************/
    this.getRandomColor = function (){
        var a = Math.ceil(255-240* Math.random());
        //中段颜色
        this.color1 = "rgba("+a+","+a+","+a+",1)";
        //结束颜色
        this.color2 = "black";
    }


     /***************重新计算流星坐标的函数******************/
    this.countPos = function ()//
    {
        //往左下移动,x减少，y增加
        this.x = this.x - this.offset_x;
        this.y = this.y + this.offset_y;
    }

    /*****************获取随机坐标的函数*****************/
    this.getPos = function () //
    {
        //横坐标200--1200

        this.x = Math.random() * window.innerWidth; //窗口高度
        //纵坐标小于600
        this.y = Math.random() * window.innerHeight;  //窗口宽度
    }
     /****绘制流星***************************/
    this.draw = function () //绘制一个流星的函数
    {
        context.save();
        context.beginPath();
        context.lineWidth = 1; //宽度
        context.globalAlpha = this.alpha; //设置透明度
        //创建横向渐变颜色,起点坐标至终点坐标
        var line = context.createLinearGradient(this.x, this.y,
            this.x + this.width,
            this.y - this.height);



        //分段设置颜色
        line.addColorStop(0, "pink");
        line.addColorStop(0.3, this.color1);
        line.addColorStop(0.6, this.color2);
        context.strokeStyle = line;
        //起点
        context.moveTo(this.x, this.y);
        //终点
        context.lineTo(this.x + this.width, this.y - this.height);
        context.closePath();
        context.stroke();
        context.restore();
    }
    this.move = function(){
        //清空流星像素
        var x = this.x+this.width-this.offset_x;
        var y = this.y-this.height;
        context.clearRect(x-3,y-3,this.offset_x+5,this.offset_y+5);
//                  context.strokeStyle="red";
//                  context.strokeRect(x,y-1,this.offset_x+1,this.offset_y+1);
        //重新计算位置，往左下移动
        this.countPos();
        //透明度增加
        this.alpha -= 0.002;
        //重绘
        this.draw();
    }

}

//绘制流星
function playRains(){

    for (var n = 0; n < rainCount; n++){
        var rain = rains[n];
        rain.move();//移动
        if(rain.y>window.innerHeight){//超出界限后重来
            context.clearRect(rain.x,rain.y-rain.height,rain.width,rain.height);
            rains[n] = new MeteorRain();
            rains[n].init();
        }
    }
    setTimeout("playRains()",2);
}


  /*流星雨结束*/
</script>
<style type="text/css">
	body{
		background-color: black;
	}
	body,html{width:100%;height:100%;overflow:hidden;}
</style>
</head>
<body>
<%
		Date d = new Date();
		response.setHeader("refresh", "20");
		%>
<canvas id="stars"></canvas>

<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<script type="text/javascript">
$(function(){
var Fireworks = function(){
var self = this;
var rand = function(rMi, rMa){return ~~((Math.random()*(rMa-rMi+1))+rMi);}
var hitTest = function(x1, y1, w1, h1, x2, y2, w2, h2){return !(x1 + w1 < x2 || x2 + w2 < x1 || y1 + h1 < y2 || y2 + h2 < y1);};
window.requestAnimFrame=function(){return window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||function(a){window.setTimeout(a,1E3/60)}}();

self.init = function(){
self.canvas = document.createElement('canvas');
self.canvas.width = self.cw = $(window).innerWidth();
self.canvas.height = self.ch = $(window).innerHeight();
self.particles = [];
self.partCount = 150;
self.fireworks = [];
self.mx = self.cw/2;
self.my = self.ch/2;
self.currentHue = 30;
self.partSpeed = 5;
self.partSpeedVariance = 10;
self.partWind = 50;
self.partFriction = 5;
self.partGravity = 1;
self.hueMin = 0;
self.hueMax = 360;
self.fworkSpeed = 4;
self.fworkAccel = 10;
self.hueVariance = 30;
self.flickerDensity = 25;
self.showShockwave = true;
self.showTarget = false;
self.clearAlpha = 25;

$(document.body).append(self.canvas);
self.ctx = self.canvas.getContext('2d');
self.ctx.lineCap = 'round';
self.ctx.lineJoin = 'round';
self.lineWidth = 1;
self.bindEvents();
self.canvasLoop();

self.canvas.onselectstart = function() {
return false;
};
};

self.createParticles = function(x,y, hue){
var countdown = self.partCount;
while(countdown--){
var newParticle = {
    x: x,
    y: y,
    coordLast: [
        {x: x, y: y},
        {x: x, y: y},
        {x: x, y: y}
    ],
    angle: rand(0, 360),
    speed: rand(((self.partSpeed - self.partSpeedVariance) <= 0) ? 1 : self.partSpeed - self.partSpeedVariance, (self.partSpeed + self.partSpeedVariance)),
    friction: 1 - self.partFriction/100,
    gravity: self.partGravity/2,
    hue: rand(hue-self.hueVariance, hue+self.hueVariance),
    brightness: rand(50, 80),
    alpha: rand(40,100)/100,
    decay: rand(10, 50)/1000,
    wind: (rand(0, self.partWind) - (self.partWind/2))/25,
    lineWidth: self.lineWidth
};
self.particles.push(newParticle);
}
};


self.updateParticles = function(){
var i = self.particles.length;
while(i--){
var p = self.particles[i];
var radians = p.angle * Math.PI / 180;
var vx = Math.cos(radians) * p.speed;
var vy = Math.sin(radians) * p.speed;
p.speed *= p.friction;

p.coordLast[2].x = p.coordLast[1].x;
p.coordLast[2].y = p.coordLast[1].y;
p.coordLast[1].x = p.coordLast[0].x;
p.coordLast[1].y = p.coordLast[0].y;
p.coordLast[0].x = p.x;
p.coordLast[0].y = p.y;

p.x += vx;
p.y += vy;
p.y += p.gravity;

p.angle += p.wind;
p.alpha -= p.decay;

if(!hitTest(0,0,self.cw,self.ch,p.x-p.radius, p.y-p.radius, p.radius*2, p.radius*2) || p.alpha < .05){
    self.particles.splice(i, 1);
}
};
};

self.drawParticles = function(){
var i = self.particles.length;
while(i--){
var p = self.particles[i];

var coordRand = (rand(1,3)-1);
self.ctx.beginPath();
self.ctx.moveTo(Math.round(p.coordLast[coordRand].x), Math.round(p.coordLast[coordRand].y));
self.ctx.lineTo(Math.round(p.x), Math.round(p.y));
self.ctx.closePath();
self.ctx.strokeStyle = 'hsla('+p.hue+', 100%, '+p.brightness+'%, '+p.alpha+')';
self.ctx.stroke();

if(self.flickerDensity > 0){
    var inverseDensity = 50 - self.flickerDensity;
    if(rand(0, inverseDensity) === inverseDensity){
        self.ctx.beginPath();
        self.ctx.arc(Math.round(p.x), Math.round(p.y), rand(p.lineWidth,p.lineWidth+3)/2, 0, Math.PI*2, false)
        self.ctx.closePath();
        var randAlpha = rand(50,100)/100;
        self.ctx.fillStyle = 'hsla('+p.hue+', 100%, '+p.brightness+'%, '+randAlpha+')';
        self.ctx.fill();
    }
}
};
};


self.createFireworks = function(startX, startY, targetX, targetY){
var newFirework = {
x: startX,
y: startY,
startX: startX,
startY: startY,
hitX: false,
hitY: false,
coordLast: [
    {x: startX, y: startY},
    {x: startX, y: startY},
    {x: startX, y: startY}
],
targetX: targetX,
targetY: targetY,
speed: self.fworkSpeed,
angle: Math.atan2(targetY - startY, targetX - startX),
shockwaveAngle: Math.atan2(targetY - startY, targetX - startX)+(90*(Math.PI/180)),
acceleration: self.fworkAccel/100,
hue: self.currentHue,
brightness: rand(50, 80),
alpha: rand(50,100)/100,
lineWidth: self.lineWidth
};
self.fireworks.push(newFirework);

};


self.updateFireworks = function(){
var i = self.fireworks.length;

while(i--){
var f = self.fireworks[i];
self.ctx.lineWidth = f.lineWidth;

vx = Math.cos(f.angle) * f.speed,
vy = Math.sin(f.angle) * f.speed;
f.speed *= 1 + f.acceleration;
f.coordLast[2].x = f.coordLast[1].x;
f.coordLast[2].y = f.coordLast[1].y;
f.coordLast[1].x = f.coordLast[0].x;
f.coordLast[1].y = f.coordLast[0].y;
f.coordLast[0].x = f.x;
f.coordLast[0].y = f.y;

if(f.startX >= f.targetX){
    if(f.x + vx <= f.targetX){
        f.x = f.targetX;
        f.hitX = true;
    } else {
        f.x += vx;
    }
} else {
    if(f.x + vx >= f.targetX){
        f.x = f.targetX;
        f.hitX = true;
    } else {
        f.x += vx;
    }
}

if(f.startY >= f.targetY){
    if(f.y + vy <= f.targetY){
        f.y = f.targetY;
        f.hitY = true;
    } else {
        f.y += vy;
    }
} else {
    if(f.y + vy >= f.targetY){
        f.y = f.targetY;
        f.hitY = true;
    } else {
        f.y += vy;
    }
}

if(f.hitX && f.hitY){
    self.createParticles(f.targetX, f.targetY, f.hue);
    self.fireworks.splice(i, 1);

}
};
};

self.drawFireworks = function(){
var i = self.fireworks.length;
self.ctx.globalCompositeOperation = 'lighter';
while(i--){
var f = self.fireworks[i];
self.ctx.lineWidth = f.lineWidth;

var coordRand = (rand(1,3)-1);
self.ctx.beginPath();
self.ctx.moveTo(Math.round(f.coordLast[coordRand].x), Math.round(f.coordLast[coordRand].y));
self.ctx.lineTo(Math.round(f.x), Math.round(f.y));
self.ctx.closePath();
self.ctx.strokeStyle = 'hsla('+f.hue+', 100%, '+f.brightness+'%, '+f.alpha+')';
self.ctx.stroke();

if(self.showTarget){
    self.ctx.save();
    self.ctx.beginPath();
    self.ctx.arc(Math.round(f.targetX), Math.round(f.targetY), rand(1,8), 0, Math.PI*2, false)
    self.ctx.closePath();
    self.ctx.lineWidth = 1;
    self.ctx.stroke();
    self.ctx.restore();
}

if(self.showShockwave){
    self.ctx.save();
    self.ctx.translate(Math.round(f.x), Math.round(f.y));
    self.ctx.rotate(f.shockwaveAngle);
    self.ctx.beginPath();
    self.ctx.arc(0, 0, 1*(f.speed/5), 0, Math.PI, true);
    self.ctx.strokeStyle = 'hsla('+f.hue+', 100%, '+f.brightness+'%, '+rand(25, 60)/100+')';
    self.ctx.lineWidth = f.lineWidth;
    self.ctx.stroke();
    self.ctx.restore();
}
};
};

self.bindEvents = function(){
$(window).on('resize', function(){
clearTimeout(self.timeout);
self.timeout = setTimeout(function() {
    self.canvas.width = self.cw = $(window).innerWidth();
    self.canvas.height = self.ch = $(window).innerHeight();
    self.ctx.lineCap = 'round';
    self.ctx.lineJoin = 'round';
}, 100);
});

$(self.canvas).on('mousedown', function(e){
self.mx = e.pageX - self.canvas.offsetLeft;
self.my = e.pageY - self.canvas.offsetTop;
self.currentHue = rand(self.hueMin, self.hueMax);
self.createFireworks(self.cw/2, self.ch, self.mx, self.my);

$(self.canvas).on('mousemove.fireworks', function(e){
    self.mx = e.pageX - self.canvas.offsetLeft;
    self.my = e.pageY - self.canvas.offsetTop;
    self.currentHue = rand(self.hueMin, self.hueMax);
    self.createFireworks(self.cw/2, self.ch, self.mx, self.my);
});
});

$(self.canvas).on('mouseup', function(e){
$(self.canvas).off('mousemove.fireworks');
});

}

self.clear = function(){
self.particles = [];
self.fireworks = [];
self.ctx.clearRect(0, 0, self.cw, self.ch);
};


self.canvasLoop = function(){
requestAnimFrame(self.canvasLoop, self.canvas);
self.ctx.globalCompositeOperation = 'destination-out';
self.ctx.fillStyle = 'rgba(0,0,0,'+self.clearAlpha/100+')';
self.ctx.fillRect(0,0,self.cw,self.ch);
self.updateFireworks();
self.updateParticles();
self.drawFireworks();
self.drawParticles();

};

self.init();

}
var fworks = new Fireworks();

});
console.log("\u002f\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u000d\u000a\u0020\u002a\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u0009\u0009\u000d\u000a\u0020\u002a\u0020\u0009\u0009\u0009\u0009\u0009\u0009\u0020\u0020\u0020\u0020\u0020\u0020\u4ee3\u7801\u5e93\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u000d\u000a\u0020\u002a\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0077\u0077\u0077\u002e\u0064\u006d\u0061\u006b\u0075\u002e\u0063\u006f\u006d\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u000d\u000a\u0020\u002a\u0020\u0020\u0020\u0020\u0020\u0020\u0020\u0009\u0009\u0020\u0020\u52aa\u529b\u521b\u5efa\u5b8c\u5584\u3001\u6301\u7eed\u66f4\u65b0\u63d2\u4ef6\u4ee5\u53ca\u6a21\u677f\u0009\u0009\u0009\u002a\u000d\u000a\u0020\u002a\u0020\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u0009\u002a\u000d\u000a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002a\u002f");
</script>
<div style='height:20px;text-align:center;font-size:18px;margin-top:10px;'><b></b></div>
</body>
</html>