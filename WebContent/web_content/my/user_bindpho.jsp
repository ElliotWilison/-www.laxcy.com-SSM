<%--
  Created by IntelliJ IDEA.
  User: 啸
  Date: 2017/6/11
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://apps.bdimg.com/libs/bootstrap-glyphicons/1.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/bind.css"/>

</head>
<body>

<div class="top_div">

</div>

<div class="center_div">
    <form  method="post"  action="/my/phone_binded">
            <div class="col-md-10">
                <input type="text" id="pho_num" class="form-control" name="pho"  placeholder="phone number" required="required">
            </div>
            <br><br><br><br>
        <input id="send_check" type="button" class="btn btn-info" value="发送验证吗"/>
            <div class="col-md-6">
                <input type="password" class="form-control" name="check" placeholder="验证码" required="required" />
                </div><br><br><br>
        <div  class="col-md-11" style="text-align: center;padding: 20px;">
        <input type="submit" class="btn btn-info" value="确定">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" class="btn btn-info" value="重置">
        </div>

    </form>


</div>

</body>
<script type="text/javascript">

        $(document).ready(function() {

 $("#send_check").click(function () {

     if($("#pho_num").val().length==11)
     {

         $("#send_check").val("已发送");
         $("#send_check").attr('disabled',true);
         $.ajax({
             type: 'POST',
             url: '/my/get_phone',
             contentType: 'application/json;charset=utf-8',
             dataType: 'json',
             data: JSON.stringify({
                 userPhone: $("#pho_num").val()
             }),
             success: function (data) {
                 if(data=="success")
                 alert("success");

             }
         })

     }
     else
     {
         alert("check your phone number");
         return false;
     }
     })


            })
</script>
</html>
