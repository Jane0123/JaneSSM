<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>错误提示</title>
    <style>
       .a{
                font-size: 80px;
                text-align: center;
                font-family: "微软雅黑";
                font-weight: bold;
                margin-top: 50px;
                animation: fireDiv 1s infinite;
            }
            @keyframes fireDiv {
            0% {
              text-shadow: 0 0 4px white, 0 -5px 4px #ff3, 2px -10px 6px #fd3,
                -2px -15px 11px #f80, 2px -25px 18px #f20;
            }
            25% {
              text-shadow: 0 0 4px white, 2px -7px 6px #ff3, 2px -12px 8px #fd3,
                -3px -20px 11px #f80, 4px -30px 22px #f20;
            }
            50% {
              text-shadow: 0 0 4px white, 2px -10px 8px #ff3, 2px -14px 10px #fd3,
                -4px -25px 11px #f80, 4px -35px 25px #f20;
            }
            75% {
              text-shadow: 0 0 4px white, 2px -7px 6px #ff3, 2px -12px 8px #fd3,
                -3px -20px 11px #f80, 4px -30px 22px #f20;
            }
            100% {
              text-shadow: 0 0 4px white, 0 -5px 4px #ff3, 2px -10px 6px #fd3,
                -2px -15px 11px #f80, 2px -25px 18px #f20;
            }
          }

        html,body{margin:0;padding:0;height:100%;overflow:hidden;background-color:black;}
      </style>
</head>
<body>
<div class="a">
   <p style="color:white;font-size:30px;text-align:center">𝓙𝓪𝓷𝓮^-^ۣۖิღ出现错误【报错】</p>
</div>
  <canvas></canvas>
   <!-- 钻石 -->
   <script>
   // 钻石
   //<![CDATA[
   "use strict";
 var run=window.requestAnimationFrame||window.webkitRequestAnimationFrame||function(cb){return setTimeout(cb,16.6)},
    W=window.innerWidth,
    H=window.innerHeight;

   function diamond(cx,cy,radius,cvs)
   {
       var Vector3d=typeof Float32Array==="function"?Float32Array:Array,
        len=8,len1=32,total=len*3*3+len1*3*2+3,
        fl=radius*2.5,
        g=cvs.getContext("2d"),
        idx=0,
        arr=new Vector3d(total),
        move=new Vector3d(total),
        i=0,radius1,startAngle,angle,
        angleX=0,angleY=0.005;

        cvs.width=W;
        cvs.height=H;
        g.strokeStyle="skyblue";

    for(radius1=radius*0.58,angle=Math.PI*2/len;i<len;i++)
    {
      arr[idx++]=Math.cos(angle*i)*radius1;
      arr[idx++]=Math.sin(angle*i)*radius1;
      arr[idx++]=-radius*0.175;
    }

    for(i=0,radius1=radius*0.8,angle=Math.PI*2/len,startAngle=angle/2;i<len;i++)
    {
      arr[idx++]=Math.cos(angle*i+startAngle)*radius1;
      arr[idx++]=Math.sin(angle*i+startAngle)*radius1;
      arr[idx++]=-radius*0.08;
    }


    for(i=0,angle=Math.PI*2/len1;i<len1;i++)
    {
      arr[idx++]=Math.cos(angle*i)*radius;
      arr[idx++]=Math.sin(angle*i)*radius;
      arr[idx++]=radius*(0.162+(i&1)*0.025);
    }

    for(i=0,angle=Math.PI*2/len1;i<len1;i++)
    {
      arr[idx++]=Math.cos(angle*i)*radius;
      arr[idx++]=Math.sin(angle*i)*radius;
      arr[idx++]=radius*(0.187-(i&1)*0.025);
    }

    for(i=0,radius1=radius*0.25,angle=Math.PI*2/len;i<len;i++)
    {
      arr[idx++]=Math.cos(angle*i)*radius1;
      arr[idx++]=Math.sin(angle*i)*radius1;
      arr[idx++]=radius*0.8;
    }
    arr[idx++]=0;
    arr[idx++]=0;
    arr[idx++]=radius;

    function rotate(angleX,angleY)
   {
      var cX=Math.cos(angleX),
          sX=Math.sin(angleX),
          cY=Math.cos(angleY),
          sY=Math.sin(angleY),
          x1,y1,z1,
          i=0,len=arr.length;
      for(;i<len;i+=3)
      {
          x1=cY*arr[i]-sY*arr[i+2],
          z1=cY*arr[i+2]+sY*arr[i],
          y1=cX*arr[i+1]-sX*z1;
          z1=cX*z1+sX*arr[i+1];

          arr[i]=x1;
          arr[i+1]=y1;
          arr[i+2]=z1;
      }
   }

   function setPerspective(){
     for(var i=0,scale,len=arr.length;i<len;i+=3)
     {
       scale=fl/(fl+arr[i+2]);
       move[i]=arr[i]*scale;
       move[i+1]=arr[i+1]*scale;
     }
   }

   function draw(arr){
      var idx=0,st=len*3*2+len1*3*2;
      g.clearRect(0,0,W,H);
      g.save();
      g.translate(cx,cy);
      g.beginPath();
      g.moveTo(arr[idx++],arr[idx++]);
      idx++;
      for(i=1;i<len;i++)
      {
        g.lineTo(arr[idx++],arr[idx++]);
        idx++;
      }
      g.closePath();
      g.stroke();

      g.beginPath();
      g.moveTo(arr[0],arr[1]);
      for(i=0;i<len-1;i++)
      {
        g.lineTo(arr[idx++],arr[idx++]);
        g.lineTo(arr[idx-len*3+1],arr[idx-len*3+2]);
        idx++;
      }
      g.lineTo(arr[idx++],arr[idx++]);
      idx++;
      g.closePath();
      g.stroke();

      g.beginPath();
      g.moveTo(arr[idx++],arr[idx++]);
      idx++;
      for(i=1;i<len1;i++)
      {
        g.lineTo(arr[idx++],arr[idx++]);
        idx++;
      }
      g.closePath();
      g.stroke();

      idx-=len1*3;
      g.beginPath();
      g.moveTo(arr[idx-3],arr[idx-2]);
      g.lineTo(arr[idx],arr[idx+1]);
      for(i=0;i<len1;i++)
      {
        if(i&1)
        {
          idx+=3;
        }
        else
        {
          if(i%4)
          {
            g.moveTo(arr[idx++],arr[idx++]);
          }
          else
          {
            g.moveTo(arr[len*3+((i-1)/4|0)*3],arr[len*3+((i-1)/4|0)*3+1]);
            g.lineTo(arr[idx++],arr[idx++]);
          }
          g.lineTo(arr[len*3+(i/4|0)*3],arr[len*3+(i/4|0)*3+1]);
          idx++;
       }
      }
      g.stroke();

      g.beginPath();
      g.moveTo(arr[idx++],arr[idx++]);
      idx++;
      for(i=1;i<len1;i++)
      {
        g.lineTo(arr[idx++],arr[idx++]);
        idx++;
      }
      g.closePath();
      g.stroke();

      idx-=len1*3;
      g.beginPath();
      g.moveTo(arr[st-6],arr[st-5]);
      g.lineTo(arr[st],arr[st+1]);
      for(i=0;i<len1;i++)
      {
        if(i&1)
        {
          idx+=3;
        }
        else
        {

          if(i%4)
          {
            g.moveTo(arr[st++],arr[st++]);
            g.lineTo(arr[idx++],arr[idx++]);
            st===total-4||g.lineTo(arr[++st],arr[st+1]);
          }
          else
          {
            g.moveTo(arr[idx++],arr[idx++]);
            g.lineTo(arr[total-3],arr[total-2]);
          }
          idx++;
        }
      }
      g.stroke();

      g.restore();
   }

   cvs.addEventListener(typeof cvs.onmousemove==="undefined"?"touchstart":"mousemove",function(e){
 	var crd=document.body.getBoundingClientRect();
 	e.type=="touchstart"&&(e=e.touches[0]);
 	angleY=e.clientX-crd.left-cx>0?0.005:-0.005;
 	angleX=e.clientY-crd.top-cy>0?0.005:-0.005;
   },false);

    rotate(-1.62,angleY);
   (function drawFrame(){
     rotate(angleX,angleY);
     setPerspective();
     draw(move);
     run(drawFrame);
   })();
 }
 diamond(W/2,H/2,Math.max(120,Math.min(W,H)/4),document.querySelector("canvas"));
 //]]>
   </script>
</body>

</html>
