<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style>
   body{
     background-image:url(photos/背景.jpg);
     background-repeat: no-repeat;
     background-size: cover;
   }
     table{
     border: 10px double green;
     }
        td{
                           width: 700px;
                           height: 50px;
                           text-align: center;
                           color:orange;
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
<body>
<h2 align="center">请假申请单</h2>
<form method="get" action="insert">
<table border="1" style="text-align: center " align="center" >
    <tr >
        <td>请假人:</td>
        <td><input name="empname" value=""></td>
    </tr>
    <tr>
        <td>请假开始时间:</td>
        <td><input name="startdate" value=""></td>
    </tr>
    <tr>
        <td>请假结束时间:</td>
        <td><input name="enddate" value=""></td>
    </tr>
    <tr>
        <td>请假天数:</td>
        <td><input name="days" value=""></td>
    </tr>
    <tr>
        <td>审批流程:</td>
        <td>
            <select name="fid">
                <option value="1">出差报销审批流程</option>
                <option value="2">办公用品采购流程</option>
                <option value="3">一天以内的事假流程</option>
                <option value="4">一天以上的事假流程</option>
                <option value="5">病假请假流程</option>
                <option value="6">调休请假流程</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>请假事由:</td>
        <td><textarea name="reason"></textarea></td>
    </tr>
</table>
<p></p>
<div align="center">
<button type="submit" style="color:lightpink; width: 40px; height: 40px; border-radius: 50%;border: none">请假</button>
<button type="reset" style="color:lightblue; width: 40px; height: 40px; border-radius: 50%;border: none">重置</button>
</div>
</form>
</body>
</html>
