<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
 <style>
  #txtDom{ padding: 50px; width:500px; margin: 0 auto;  line-height: 1.3em; text-indent: 2em;
       }
 body{
   background-image:url(photos/背景.jpg);
   background-repeat: no-repeat;
   background-size: cover;
 }
 table{
 border: 10px double green;
 }
    td{
                       width: 500px;
                       height: 100px;
                       text-align: center;
                       color:orange;
                   }
    </style>
</head>
<body>
    <div id="txtDom">
     要是没有错误和失败，你就不会学到东西；要是没有痛苦，你就不会长大。
     一旦你明白了这些，你就知道了一切事情都是为了某种目的而发生。
     所以不要紧张或者认为生活不公平，因为一切事情都有原因，只有时间能诉说教会了我们什么。
    </div>
    <script type="text/javascript">
      var txtAnim ={
        len: 0,
        txtDom: "",
        arrTxt: [],
        init: function(obj) {
          this.obj = obj;
          this.txtDom = obj.innerHTML.replace(/\s+/g, "");
          this.len = this.txtDom.length;
          obj.innerHTML = "";
          this.addDom();
        },
        addDom: function() {
          for (var i = 0; i < this.len; i++) {
            var spanDom = document.createElement("span");
            spanDom.innerHTML = this.txtDom.substring(i, i + 1);
            this.obj.appendChild(spanDom);
            this.arrTxt.push(spanDom);
          };
          for (var j = 0; j < this.len; j++) {
            this.arrTxt[j].style.position = "relative";
          };
          this.strat();
        },
        strat: function() {
          for (var i = 0; i < this.len; i++) {
            this.arrTxt[i].onmouseover = function() {
              this.stop = 0;
              this.speed = -1;
              var $this = this;
              this.timer = setInterval(function() {
                $this.stop += $this.speed; //0 += -1
                if ($this.stop <= -20) {
                  $this.speed = 1;
                }
                $this.style.top = $this.stop + "px";
                if ($this.stop >= 0) {
                  clearInterval($this.timer)
                  $this.style.top = 0 + "px";
                };
              },
              15);
            };
          }
        }
      }
      var txtDom = document.getElementById("txtDom");
      txtAnim.init(txtDom);
    </script>
<table align="center" border="1"style="width: 60%;height: 30%">
    <tr >
      <hr>  <h4 align="center">Empname：：${Jane.empname}的请假内容</h4></hr>
    </tr>
    <tr>
       <td><textarea name="reason" required="required"style="width: 70%;height: 100%;opacity:0.4" >
        请假单编号: ${Jane.leaveid}
        创建时间：${Jane.createdate}
        请假事由:   ${Jane.reason}
        请假开始时间：  ${Jane.startdate}
        请假结束时间：  ${Jane.enddate}
        请假天数: ${Jane.days}
        </textarea></td>
    </tr>
    </c:forEach>
</table>
 <table border="1" width="60%" style="text-align: center;opacity:0.6 " align="center" >
     <tr bgcolor="lightblue">
         <td >请假单编号:</td>
         <td>创建时间:</td>
         <td>请假事由:</td>
         <td>请假开始时间:</td>
         <td>请假结束时间:</td>
         <td>请假天数:</td>
     </tr>
     <c:forEach items="${Jane}" var="Jane">
         <tr >
             <td>${Jane.leaveid}</td>
             <td>${Jane.createdate}</td>
             <td>${Jane.reason}</td>
             <td>${Jane.startdate}</td>
             <td>${Jane.enddate}</td>
             <td>${Jane.days}</td>
         </tr>
     </c:forEach>
 </table>

</body>
</html>