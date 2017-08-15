<%--
  Created by IntelliJ IDEA.
  User: 啸
  Date: 2017/6/12
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Write something as you want</title>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://apps.bdimg.com/libs/bootstrap-glyphicons/1.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/resource/css/ssi-uploader.css"/>
    <link rel="stylesheet" type="text/css" href="/resource/css/write.css"/>

</head>
<body onload="check()">
<div class="container">

<div class="user_banner">

<img src="/resource/images/user_1.png" class="img-circle" alt="用户头像"/>
    <h2>${user.userName}</h2>
    <h4>${user.signature}</h4>
</div>
    <hr>

    <form method="post" action="">
    <div class="user_design">
        <div class="design_area">
            <div class="inline_box">
            <textarea rows="5" cols="81" name="comment" maxlength="350"></textarea>
            <div class="pick_category">
                <%--<input name="get_pic" id="get_pic" style="display: none;" type="file" multiple="true"/>--%>
                <%--<span class="dropdown">--%>
                <%--<div data-toggle="dropdown" class="dropdown-toggle">--%>
                    <li id="up_pic" class="glyphicon glyphicon-camera" style="padding: 20px;font-size: 50px;"></li>
                <%--</div>--%>
<%--<ul class="dropdown-menu">--%>
                        <%--<li>--%>
                            <%--<a href="#" id="local_pic">本地图片</a>--%>


						<%--</li>--%>
    <%--<hr>--%>
						<%--<li>--%>
                            <%--<a href="#" id="net_pic">网络图片</a>--%>
						<%--</li>--%>
<%--</ul>--%>
<%--</span>--%>
            </div>

            <div class="pick_category">
                <%--<input name="get_vid" id="get_vid" style="display: none;" type="file"/>--%>
                  <%--<span class="dropdown">--%>
                <%--<div data-toggle="dropdown" class="dropdown-toggle">--%>
                        <li id="up_vid"  class="glyphicon glyphicon-film" style="padding: 20px;font-size: 50px;"></li>
                <%--</div>--%>
<%--<ul class="dropdown-menu">--%>
                        <%--<li>--%>
                            <%--<a href="#" id="local_media">本地视频</a>--%>
						<%--</li>--%>
    <%--<hr>--%>
						<%--<li>--%>
                            <%--<a href="#" id="net_media">--%>
                            <%--网络视频--%>
                            <%--</a>--%>
						<%--</li>--%>
<%--</ul>--%>
<%--</span>--%>
            </div>
            </div>
            <div class="send_msg">
                <p><b>☺</b></p>
                <p><b>@</b></p>
                <p><b>#</b></p>
             <p style="padding-left: 550px;"></p>
                <input type="submit" class="btn btn-primary"  value="Send Message"/>
            </div>
    </div>
        <div id="up_div">
        <input type="file" name="get_pic" multiple id="ssi-upload3" hidden="true"/>
        </div>
        <script src="/resource/js/ssi-uploader.js"></script>
        <script type="text/javascript">
                    $('#ssi-upload3').ssi_uploader({
                        url: '#', dropZone: false, allowed: ['jpg', 'gif', 'txt', 'png', 'pdf']
                    });
        </script>
    </div>
    </form>
    <hr>
</div>
</body>
<script type="text/javascript">
    function check() {
        $("#up_div").hide();
    }
    $(document).ready(function () {
        $("#up_pic").click(function () {
//            $("#ssi-upload3").toggle().click();
            $("#ssi-upload3").click();
            $("#up_div").show();

        })
    });
</script>

</html>
