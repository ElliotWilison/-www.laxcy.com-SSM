<%--
  Created by IntelliJ IDEA.
  User: 啸
  Date: 2017/6/2
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>new user-register</title>
    <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
    <meta name="author" content="Vincent Garreau" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://apps.bdimg.com/libs/bootstrap-glyphicons/1.0/css/bootstrap-glyphicons.css" rel="stylesheet">

    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resource/css/style.css">
</head>
<body>

<!-- particles.js container -->
<div id="particles-js">


    </div>

<div style="position:absolute;padding:30px;top:25%;left:35%;width: 30%;height: 52%;background-color: white;margin: auto;border:1px solid darkgrey;border-radius: 2%;">

<div>

<form  method="post" action="/register_success">
    <div class="form-group">
    <div class="col-md-11">
        <input id="u_name" type="text" class="form-control" name="uname"  placeholder="username/unique" required="required"/>
        <br><br>
    </div>

    <p id="warn" style="font-size: 20px;"></p><br><br>
</div>

    <div class="form-group">
    <div class="col-md-11">
        <input id="p1" type="password" class="form-control" name="password"   placeholder="password/at least 6 bit" required="required" /><br><br>
    </div>
    <p id="p1_warn" style="font-size: 20px;"></p><br><br>
    </div>


    <div class="form-group">
    <div class="col-md-11">
        <input id="p2" type="password" class="form-control" name="re_pass"   placeholder="re_password/must same with password" required="required" /><br><br>
    </div>
    <p id="p2_warn" style="font-size: 20px;"></p><br>
    </div>

    <div class="form-group">
        <div class="col-md-11">
            <p style="font-size: 15px;"><b><input type="checkbox" id="u_check" />accept the user manual</b></p><br><br>
        </div>
    </div>


    <button id="u_create" style="padding: 10px;" class="btn btn-large btn-block btn-primary" type="submit">Create</button>
        <%--<a href="login" id="button2" class="btn btn-primary">返回</a>--%>
    <br>
    <p style="text-align: center;font-size: 15px;"> <a href="/" ><b>already have a account?</b></a></p>



</form>
</div>
</div>
<script type="text/javascript">

    $(document).ready(function() {
        $("#u_create").click(function () {
            if($("#p1").val()!=$("#p2").val()||$("#p1").val().length<6){
                alert("you must missed some thing");
                return false;
            }

                });
$("#p1").blur(function () {
    if($("#p1").val().length<6) {
        $("#p1_warn").html("<b style='color: red;'>×</b>");

    }
    else{
        $("#p1_warn").html("<b style='color: lightgreen;'>√</b>");

    }
});

$("#p2").blur(function () {
    if($("#p1").val()!=$("#p2").val()){
        $("#p2_warn").html("<b style='color: red;'>×</b>");

    }
    else{
        $("#p2_warn").html("<b style='color: lightgreen;'>√</b>");

    }

});
        $("#u_name").blur(function () {
            var name = $('#u_name').val();
//            alert(name);
            $.ajax({
                type:'POST',
                url: '/name_check',
                contentType: 'application/json;charset=utf-8',
                dataType: 'text',
                data: JSON.stringify({
                    userName:name
                }),
                success: function (data) {
                    if(data=="success"){
                        $("#warn").html("<b style='color: red;'>×</b>");
                        $("#u_create").attr('disabled',true);
                    }
                    else{
                        $("#warn").html("<b style='color: lightgreen;'>√</b>");
                        $("#u_create").attr('disabled',false);
                    }

//                    alert(data);

                },
                error:function() {
                    $("#warn").html("<p>error</p>")

                }
            });
        });
    });

</script>



<!-- scripts -->
<script src="/resource/js/particles.min.js"></script>
<script src="/resource/js/app.js"></script>

<!-- stats.js -->
<script src="/resource/js/stats.js"></script>
<script>
    var count_particles, stats, update;
    stats = new Stats;
    stats.setMode(0);
    stats.domElement.style.position = 'absolute';
    stats.domElement.style.left = '0px';
    stats.domElement.style.top = '0px';
    document.body.appendChild(stats.domElement);
    count_particles = document.querySelector('.js-count-particles');
    update = function() {
        stats.begin();
        stats.end();
        if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {
            count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
        }
        requestAnimationFrame(update);
    };
    requestAnimationFrame(update);
</script>
</body>
</html>
