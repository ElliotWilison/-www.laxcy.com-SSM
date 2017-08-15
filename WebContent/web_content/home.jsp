<%--
  Created by IntelliJ IDEA.
  User: 啸
  Date: 2017/5/23
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Laxy</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://apps.bdimg.com/libs/bootstrap-glyphicons/1.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/home.css"/>

</head>
<body onload="login_check()">

<div class="search_div">
    <section class="container">
        <form onsubmit="submitFn(this, event);">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input type="text" class="search-input" placeholder="Type to search" />
                    <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
                </div>
                <span class="close" onclick="searchToggle(this, event);"></span>
                <div class="result-container">
                </div>
            </div>
        </form>
    </section>

    <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
    <script type="text/javascript">
        function searchToggle(obj, evt){
            var container = $(obj).closest('.search-wrapper');

            if(!container.hasClass('active')){
                container.addClass('active');
                evt.preventDefault();
            }
            else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
                container.removeClass('active');
                // clear input
                container.find('.search-input').val('');
                // clear and hide result container when we press close
                container.find('.result-container').fadeOut(100, function(){$(this).empty();});
            }
        }

        function submitFn(obj, evt){
            value = $(obj).find('.search-input').val().trim();

            _html = "Yup yup! Your search text sounds like this: ";
            if(!value.length){
                _html = "Yup yup! Add some text friend :D";
            }
            else{
                _html += "<b>" + value + "</b>";
            }

            $(obj).find('.result-container').html('<span>' + _html + '</span>');
            $(obj).find('.result-container').fadeIn(100);

            evt.preventDefault();
        }
    </script>
</div>

    <div class="navi_body">
        <div class="navi_head">
            <div style="width:100%; margin-left:auto; ">
					<span>
						<p class="navi_title">Laxy</p>
					</span>


                <span>
						<p class="navi_title">Video</p>
						<p><a href="">Movie</a></p>
						<p><a href="">Country</a></p>
                        <p><a href="">Animal</a></p>
                        <p><a href="">More</a></p>
					</span>

                <span>
						<p class="navi_title">Business</p>
						<p><a href="">Movie</a></p>
						<p><a href="">Business</a></p>
                        <p><a href="">Business</a></p>
                        <p><a href="">Business</a></p>
                        <p><a href="">More</a></p>
					</span>

                <span>
                 	<p class="navi_title">Entertainment</p>
	                <p><a href="">Auther</a></p>
                    <p><a href="">Web Manager</a></p>
                    <p><a href="">Job Needed</a></p>
                    <p><a href="">More Info</a></p>
                </span>

                <span>
                 	<p class="navi_title">Education</p>
	                <p><a href="">Auther</a></p>
                    <p><a href="">Web Manager</a></p>
                    <p><a href="">Job Needed</a></p>
                    <p><a href="">More Info</a></p>
                </span>

                <span>
                 	<p class="navi_title">Culture</p>
	                <p><a href="">Auther</a></p>
                    <p><a href="">Web Manager</a></p>
                    <p><a href="">Job Needed</a></p>
                    <p><a href="">More Info</a></p>
                </span>

                <span >
						<p class="navi_title">About us</p>
						<p><a href="">Auther</a></p>
						<p><a href="">Web Manager</a></p>
                   <p><a href="">Job Needed</a></p>
                    <p><a href="">More Info</a></p>
					</span>


                <span id="user_view">
                    <a id="modal-382162" href="#modal-container-382162" role="button" class="btn" data-toggle="modal">
                        <p class="navi_title" ><li class="glyphicon glyphicon-user"></li></p>
                    </a>
                </span>
                <div class="row clearfix">

                    <div class="col-md-12 column">
                        <div class="modal fade" id="modal-container-382162" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog" style="width: 35%;">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel">
                                            <p style="color: black">Login your account</p>
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-md-12">
                                            <p style="font-size: 15px;"><b>username</b></p><br>
                                            <input id="l_name" type="text" class="form-control" name="uname"  placeholder="username" required="required">
                                            <br>
                                        </div>

                                        <div class="col-md-12">
                                            <p style="font-size: 15px;"><b>password</b></p><br>
                                            <input  id="l_pwd" type="password" class="form-control" name="password"   placeholder="password" required="required" /><br>
                                        </div>
                                        <button id="l_btn" style="padding: 10px;" class="btn btn-large btn-block btn-primary" type="button"  data-dismiss="modal" aria-hidden="true">Login</button>
                                        <br>
                                        <p style="text-align: center;font-size: 15px;"> <a href="/register" ><b>create a account?</b></a></p>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

<br>





<div class="jq22-container">

    <div class="flexslider">
        <ul class="slides">
            <li style="background:url(/resource/images/img1.png) 50% 0 no-repeat;"></li>
            <li style="background:url(/resource/images/img2.png) 50% 0 no-repeat;"></li>
            <li style="background:url(${pageContext.request.contextPath}/resource/images/img3.png) 50% 0 no-repeat;"></li>
            <li style="background:url(${pageContext.request.contextPath}/resource/images/img4.png) 50% 0 no-repeat;"></li>
            <li style="background:url(${pageContext.request.contextPath}/resource/images/img5.png) 50% 0 no-repeat;"></li>
        </ul>
    </div>

</div>

<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.js"></script>
<script type="text/javascript" src="/resource/js/jquery.flexslider-min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('.flexslider').flexslider({
            directionNav: true,
            pauseOnAction: false,
            slideshowSpeed: 5000
        });
    });
</script>

<br>





<div style="width:1272px;position:relative;left:50%;margin-left:-586px;">
    <div class="brand-list" id="brand-waterfall">
        <!-- 循环字母模块 item -->
        <div class="item">
            <div class="boxgrid caption">
                <img src="/resource/images/130.gif"/>
                <div class="cover boxcaption">
                    <h3>私人酒廊空间设计 </h3>
                    <p><a href="#">娱乐场所的装修成功与否，决定着对顾客的吸引力有多少</a></p>
                </div>
            </div>
        </div>

        <div class="item">
            <div class="boxgrid captiona boxgridq">
                <img src="/resource/images/131.gif"/>
                <div class="cover boxcaptiona">
                    <h3>私人酒廊空间设计 </h3>
                    <p><a href="#">娱乐场所的装修成功与否，决定着对顾客的吸引力有多少</a></p>
                </div>
            </div>
        </div>

        <div class="item">
            <div class="boxgrid caption">
                <img src="/resource/images/130.gif"/>
                <div class="cover boxcaption">
                    <h3>私人酒廊空间设计 </h3>
                    <p><a href="#">娱乐场所的装修成功与否，决定着对顾客的吸引力有多少</a></p>
                </div>
            </div>
        </div>

        <div class="item">
            <div class="boxgrid caption">
                <img src="/resource/images/130.gif"/>
                <div class="cover boxcaption">
                    <h3>私人酒廊空间设计 </h3>
                    <p><a href="#">娱乐场所的装修成功与否，决定着对顾客的吸引力有多少</a></p>
                </div>
            </div>
        </div>

        <div class="item">
            <div class="boxgrid captiona boxgridq">
                <img src="${pageContext.request.contextPath}/resource/images/131.gif"/>
                <div class="cover boxcaptiona">
                    <h3>私人酒廊空间设计 </h3>
                    <p><a href="#">娱乐场所的装修成功与否，决定着对顾客的吸引力有多少</a></p>
                </div>
            </div>
        </div>

        <div class="item">
            <div class="boxgrid captiona boxgridq">
                <img src="${pageContext.request.contextPath}/resource/images/131.gif"/>
                <div class="cover boxcaptiona">
                    <h3>私人酒廊空间设计 </h3>
                    <p><a href="#">娱乐场所的装修成功与否，决定着对顾客的吸引力有多少</a></p>
                </div>
            </div>
        </div>

        <div class="item">
            <div class="boxgrid caption">
                <img src="/resource/images/130.gif"/>
                <div class="cover boxcaption">
                    <h3>私人酒廊空间设计 </h3>
                    <p><a href="#">娱乐场所的装修成功与否，决定着对顾客的吸引力有多少</a></p>
                </div>
            </div>
        </div>

        <div class="item">
            <div class="boxgrid captiona boxgridq">
                <img src="/resource/images/131.gif"/>
                <div class="cover boxcaptiona">
                    <h3>私人酒廊空间设计 </h3>
                    <p><a href="#">娱乐场所的装修成功与否，决定着对顾客的吸引力有多少</a></p>
                </div>
            </div>
        </div>

        <div class="item">
            <div class="boxgrid caption">
                <img src="/resource/images/130.gif"/>
                <div class="cover boxcaption">
                    <h3>私人酒廊空间设计 </h3>
                    <p><a href="#">娱乐场所的装修成功与否，决定着对顾客的吸引力有多少</a></p>
                </div>
            </div>
        </div>

        <div class="item">
            <div class="boxgrid captiona boxgridq">
                <img src="/resource/images/131.gif"/>
                <div class="cover boxcaptiona">
                    <h3>私人酒廊空间设计 </h3>
                    <p><a href="#">娱乐场所的装修成功与否，决定着对顾客的吸引力有多少</a></p>
                </div>
            </div>
        </div>

    </div>
</div>

<%--<script type="text/javascript" src="js/jquery.min.js"></script>--%>
<script type="text/javascript">
    $(document).ready(function(){

        //Caption Sliding (Partially Hidden to Visible)
        $('.boxgrid.caption').hover(function(){
            $(".cover", this).stop().animate({top:'120px'},{queue:false,duration:160});
        }, function() {
            $(".cover", this).stop().animate({top:'165px'},{queue:false,duration:160});
        });
        $('.boxgrid.captiona').hover(function(){
            $(".cover", this).stop().animate({top:'378px'},{queue:false,duration:160});
        }, function() {
            $(".cover", this).stop().animate({top:'427px'},{queue:false,duration:160});
        });

    });
</script>

<script type="text/javascript">
    $(function(){
        $('#brand-waterfall').waterfall();
    });

    // 瀑布流插件
    // pannysp 2013.4.9
    ;(function ($) {
        $.fn.waterfall = function(options) {
            var df = {
                item: '.item',
                margin: 30,
                addfooter: true
            };
            options = $.extend(df, options);
            return this.each(function() {
                var $box = $(this), pos = [],
                    _box_width = $box.width(),
                    $items = $box.find(options.item),
                    _owidth = $items.eq(0).outerWidth() + options.margin,
                    _oheight = $items.eq(0).outerHeight() + options.margin,
                    _num = Math.floor(_box_width/_owidth);

                (function() {
                    var i = 0;
                    for (; i < _num; i++) {
                        pos.push([i*_owidth,0]);
                    }
                })();

                $items.each(function() {
                    var _this = $(this),
                        _temp = 0,
                        _height = _this.outerHeight() + options.margin;

                    _this.hover(function() {
                        _this.addClass('hover');
                    },function() {
                        _this.removeClass('hover');
                    });

                    for (var j = 0; j < _num; j++) {
                        if(pos[j][1] < pos[_temp][1]){
                            //暂存top值最小那列的index
                            _temp = j;
                        }
                    }
                    this.style.cssText = 'left:'+pos[_temp][0]+'px; top:'+pos[_temp][1]+'px;';
                    //插入后，更新下该列的top值
                    pos[_temp][1] = pos[_temp][1] + _height;
                });

                // 计算top值最大的赋给外围div
                (function() {
                    var i = 0, tops = [];
                    for (; i < _num; i++) {
                        tops.push(pos[i][1]);
                    }
                    tops.sort(function(a,b) {
                        return a-b;
                    });
                    $box.height(tops[_num-1]);

                    //增加尾部填充div
                    if(options.addfooter){
                        addfooter(tops[_num-1]);
                    }

                })();

                function addfooter(max) {
                    var addfooter = document.createElement('div');
                    addfooter.className = 'item additem';
                    for (var i = 0; i < _num; i++) {
                        if(max != pos[i][1]){
                            var clone = addfooter.cloneNode(),
                                _height = max - pos[i][1] - options.margin;
                            clone.style.cssText = 'left:'+pos[i][0]+'px; top:'+pos[i][1]+'px; height:'+_height+'px;';
                            $box[0].appendChild(clone);
                        }
                    }
                }

            });
        }
    })(jQuery);
</script>
</div>
<br>
<script type="text/javascript">
    $(document).ready(function() {
        $("#l_btn").click(function () {
            $.ajax({
                type: 'POST',
                url: '/user_login',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({
                    userName: $("#l_name").val(),
                    pwd: $("#l_pwd").val()
                }),
                success: function (data) {
                    if (data){
                        $("#user_view").html("<p class='navi_title'>"+"<img class='img-circle' style='width: 25px;height: 25px;' src='"+data.userImg+"'>&nbsp;"+data.userName+"</p>" +
                            "<p><a href='/my/info' target='_blank'>Personal Informaion</a></p>"+
                            "<p><a href='/my/msg' target='_blank'>My Message</a></p>"+
                            "<p><a href='/my/write' target='_blank'>Write Something</a></p>"+
                            "<p><a href='/user_loginout'>Login out</a></p>");
                    }
                    else {
                        alert("wrong");
                        return false;
                    }
                },
                error: function () {
                    alert("error");
                }
            });
        });
    });
    function login_check() {
        $.ajax({
            type: 'POST',
            url: '/login_check',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify({
            }),
            success: function (data) {
                if (data){
                    $("#user_view").html("<p class='navi_title'>"+"<img class='img-circle' style='width: 25px;height: 25px;' src='"+data.userImg+"'>&nbsp;"+data.userName+"</p>" +
                        "<p><a href='/my/info' target='_blank'>Personal Informaion</a></p>"+
                        "<p><a href='/my/msg' target='_blank'>My Message</a></p>"+
                        "<p><a href='/my/write' target='_blank'>Write Something</a></p>"+
                        "<p><a href='/user_loginout'>Login out</a></p>");
                }
                else {
                    alert("wrong");
                    return false;
                }
            }
        });

    }
</script>
</body>
</html>
