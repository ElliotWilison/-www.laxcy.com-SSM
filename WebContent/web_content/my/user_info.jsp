<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 啸
  Date: 2017/6/7
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Design your information as your wish</title>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://apps.bdimg.com/libs/bootstrap-glyphicons/1.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/info.css"/>

</head>
<body onload="check()">
<div class="info_container">


    <div class="left_div">

   <div class="user_view">
       <a id="modal-549605" href="#modal-container-549605" role="button" class="btn" data-toggle="modal">
       <img  id="user_img"  class="img-circle" src="${c_user.userImg}" alt="user"/>
       </a>
       <form method="post" action="/my/get_path" enctype="multipart/form-data">
       <div class="container">
           <div class="row clearfix">
               <div class="col-md-12 column">
                   <div class="modal fade" id="modal-container-549605" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                       <div class="modal-dialog">
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                   <h4 class="modal-title" id="myModalLabel">
                                       更改头像
                                   </h4>
                               </div>
                               <div class="modal-body">
                                  <div class="user_div">
                                      <img id="up_img" src="${c_user.userImg}" alt="用户头像" >

                                  </div>
                                   <input id="u_file" type="file" name="user_file">
                               </div>
                               <div class="modal-footer">
                                   <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

                                   <button  type="submit"  class="btn btn-primary">保存</button>
                               </div>
                           </div>

                       </div>

                   </div>

               </div>
           </div>
       </div>
       </form>

<br>
       <p id="user_names">${c_user.userName}</p>
       <hr>
       <div class="bottom_div">
<div class="demo_div"><a id="g_subs"  href="#"> <p>关注<span id="subs_n">${subs_c}</span></p></a></div>
           <div  class="demo_div"><a id="g_fans" href="#"> <p>粉丝<span id="fan_n">${fans_c}</span></p></a></div>
       </div>
   </div><br><br>

        <div class="lead_line">
            <ul>
                <li><a  id="u_info" href="#"> 用户基本信息</a></li>
                <li>密保手机</li>
                <li id="pho_bind" class="li_s">${c_user.bindPhone}<span  id="wa1"></span></li>
                <li>密保邮箱</li>
                <li id="mail_bind" class="li_s">${c_user.bindMail}<span id="wa2"></span></li>
                <li><a id="black_list" href="">黑名单</a></li>
            </ul>
        </div>
    </div>


    <div  class="user_content">
        <div id="user_view">
        <form action="/my/user_save" method="post">
    <div style="margin: auto;width: 500px;">
        <div class="form-group">

            <div class="col-md-10">
                <label>userSex</label><br>
                <input  type="text" class="form-control" value="${c_user.sex}" name="u_sex"   placeholder="female/male" required="required" /><br><br>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-10">
                <label>userBirth</label>

                <input type="text" class="form-control" value="${c_user.birth.toLocaleString().substring(0,10)}" name="u_bir"   placeholder="like 1996-02-26" required="required" /><br><br>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-10">
                <label>userPhone</label>
                <input type="text" class="form-control" value="${c_user.userPhone}" name="u_pho"   placeholder="like 15055555555" required="required" /><br><br>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-10">
                <label>userMail</label>
                <input type="text" class="form-control" value="${c_user.userMail}" name="u_mal"   placeholder="like 1370810889@qq.com" required="required" /><br><br>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-10">
                <label>userLocation</label>
                <input type="text" class="form-control" value="${c_user.location}" name="u_loc"   placeholder="like 1996-02-26" required="required" /><br><br>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-10">
                <label>userSignature</label>
                <textarea type="text" class="form-control"  name="u_sig"  placeholder="write your moment" cols="30"  >${c_user.signature}</textarea><br><br>

            </div>
        </div>

        <div class="form-group">
            <div class="col-md-10">
                <input type="submit"  style="margin: auto;display: block;" class="btn btn-info" value="save"/><br><br>
            </div>
        </div>
    </div>
        </form>
        </div>
        <div id="subs_view" class="subs_v"></div>
        <div id="fans_view"  class="subs_v"></div>
    </div>

</div>

</div>
<script type="text/javascript">

    function check() {

            $(document).ready(function() {
                $("#subs_view").hide();
                $("#fans_view").hide();
               if( $("#pho_bind").html().length==29){
                   $("#wa1").html("<a href='/my/phone_bind'>绑定</a>")
               }
               else
                   $("#wa1").html("<a href='/my/phone_change'>修改</a>");

               if($("#mail_bind").html().length==29)
                   $("#wa2").html("<a href='/my/mail_bind'>绑定</a>")
              else
                   $("#wa2").html("<a href='/my/mail_change'>修改</a>");




    })
    }

</script>
<script type="text/javascript">
    $(document).ready(function() {
        var obj = document.getElementById("u_file");

        $("#u_file").change(function () {
            $("#up_img").attr("src", getObjectURL(obj));
        })


        function getObjectURL(node) {
            var imgURL = "";
            try {
                var file = null;
                if (node.files && node.files[0]) {
                    file = node.files[0];
                } else if (node.files && node.files.item(0)) {
                    file = node.files.item(0);
                }
                //Firefox 因安全性问题已无法直接通过input[file].value 获取完整的文件路径
                try {
                    //Firefox7.0
                    imgURL = file.getAsDataURL();
                    //alert("//Firefox7.0"+imgRUL);
                } catch (e) {
                    //Firefox8.0以上
                    imgURL = window.URL.createObjectURL(file);
                    //alert("//Firefox8.0以上"+imgRUL);
                }
            } catch (e) {      //这里不知道怎么处理了，如果是遨游的话会报这个异常
                //支持html5的浏览器,比如高版本的firefox、chrome、ie10
                if (node.files && node.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        imgURL = e.target.result;
                    };
                    reader.readAsDataURL(node.files[0]);
                }
            }
            return imgURL;
        }
        })
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#g_subs").click(function () {
            $("#user_view").hide();
            $("#fans_view").hide();
            $("#subs_view").show();
            $("#subs_view").empty();
            $.ajax({
                type: 'POST',
                url: '/my/my_subs',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({
                    user_name: $("#user_names").html()
                }),
                success: function (list) {
                    for (var i = 0; i < list.length; i++) {
                        $("#subs_view").append("<div class='suber' id='subs_area'><p>"
                            + list[i].subscribe_name +
                            "</p></div>");
                    }
                }
            })
        })


            $("#u_info").click(function () {
                $("#user_view").show();
                $("#fans_view").hide();
                $("#subs_view").hide();
            })


            $("#g_fans").click(function () {
                $("#user_view").hide();
                $("#fans_view").show();
                $("#subs_view").hide();
                $("#fans_view").empty();
                $.ajax({
                    type:'POST',
                    url: '/my/my_fans',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: JSON.stringify({
                        user_name:$("#user_names").html()
                    }),
                    success:function (list) {
                        for(var i=0;i<list.length;i++)
                        {
                            $("#fans_view").append("<div class='suber' id='subs_area'><p>"
                                +list[i].fan_name+
                                "</p></div>");
                        }
                    }
                })
            })

        })

</script>

</body>
</html>
