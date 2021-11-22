 <%@page import="java.util.Date"%>
 <%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script language="javascript">
		function changeColor(){
			var color="red|pink|white|black|orange|gold|yellow|green|blue|gray";
			color=color.split("|");
			document.getElementById("blink").style.color=color[parseInt(Math.random() * color.length)];
		}
		setInterval("changeColor()",90);
		</script>
<style>
p1{
color:salmon;
}
p{
 color:lightgreen;
 font-size:20px;
 text-align:center;
 transition:all 0.1s;
 text-shadow:3px 3px 3px black;
 }
 /* 鼠标滑过时字体颜色发光 */
 p:hover{
 text-shadow:6px 6px 6px yellow;
 }
h1{
    color:lightblue;
}
body{
  background-image:url(photos/背景.jpg);
  background-repeat: no-repeat;
  background-size: cover;
}
div{
text-align: center;
color:white;
font-size:15px;
}
 table{
 border: 10px double green;
 }
    td{
                       width: 700px;
                       height: 50px;
                       text-align: center;

                   }
                   input{
                                                     width: 150px;
                                                     height: 40px;
                                         }
                                         select{
                                                     width: 150px;
                                                     height: 40px;
                                         }
    </style>
</head>
<body >
<h2>页面每隔70秒刷新一次</h2>
	<p1>
		Now:
		<%
		Date d = new Date();
		out.print("" +d+"的"+d.getSeconds());
		response.setHeader("refresh", "70");
		%>
		秒开始
	</p1>
<marquee onMouseOut="this.start()" onMouseOver="this.stop()">
<marquee  width="900" height="80" direction=right ><h1>欢迎进入<h1></marquee>
<form action="query" method="get">
<table align="center">

        <td>请假人:<input name="empname" value="" ></td>
        <td>请假时间:<input name="createdate" value="" ></td>
        <td>单据状态:
            <select name="status">
                <option>全部</option>
                <option value="N">未提交</option>
                <option value="P">审批中</option>
                <option value="D">审批通过</option>
                <option value="C">审批未通过</option>
            </select>
            <button >查询</button>
        </td>
<td><a href="add.jsp" style="text-decoration: none ">^请假^ </a></td>
    </tr>
</table>
</form>

</form>
<p></p>
<table border="1" width="100%" style="text-align: center " align="center" >
    <tr >
        <td bgcolor="red">请假单编号:</td>
        <td bgcolor="orange">审批流程名称:</td>
        <td bgcolor="yellow"><div id="blink">请假人:    </div></td>
        <td bgcolor="green">创建时间:</td>
        <td bgcolor="cyan">请假事由:</td>
        <td bgcolor="blue">请假开始时间:</td>
        <td bgcolor="purple">请假结束时间:</td>
        <td bgcolor="pink">请假天数:</td>
        <td bgcolor="coffee"><p>状态:</p></td>
    </tr>
    <c:forEach items="${Jane}" var="Jane">
        <tr >
            <td >${Jane.leaveid}</td>
            <td >${Jane.flow.name}</td>

             <td><a href="queryID?leaveid=${Jane.leaveid}"  class="alert-link" style="text-decoration:none">${Jane.empname}</a></td>
            <td >${Jane.createdate}</td>
            <td >${Jane.reason}</td>
            <td >${Jane.startdate}</td>
            <td >${Jane.enddate}</td>
            <td  >${Jane.days}</td>
            <c:if test="${Jane.status == 'N'}">
                <td>未提交 <a href="update?leaveid=${Jane.leaveid}"
                style="text-decoration: none">【提交】
                </td>
            </c:if>
            <c:if test="${Jane.status == 'P'}">
                <td>审批中<a href="delete?leaveid=${Jane.leaveid}" style="text-decoration: none">-删除-</a></td>
            </c:if>
            <c:if test="${Jane.status == 'C'}">
                <td>审批未通过<a href="delete?leaveid=${Jane.leaveid}" style="text-decoration: none">~删除~</a></td>
            </c:if>
            <c:if test="${Jane.status == 'D'}">
                <td>审批通过</td>
            </c:if>
        </tr>
    </c:forEach>
</table>
<audio autoplay="autoplay" loop="true"><source src="source/原谅.mp3"></audio>
<script type="text/javascript">// 获取时间
function display(clock){
    var now=new Date();   //创建Date对象
    var year=now.getFullYear(); //获取年份
    var month=now.getMonth(); //获取月份
    var date=now.getDate();  //获取日期
    var day=now.getDay();  //获取星期
    var hour=now.getHours(); //获取小时
    var minu=now.getMinutes(); //获取分钟
    var sec=now.getSeconds(); //获取秒钟
    month=month+1;
    var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
    var week=arr_week[day];  //获取中文的星期
    var time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec; //组合系统时间
    clock.innerHTML="北京时间："+time; //显示系统时间
}
window.onload=function(){
    window.setInterval("display(clock)", 1000);
}
</script>
<div id="clock" ></div>
</body>
</html>