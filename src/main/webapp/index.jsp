<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>NutzBook demo</title>
    <!-- 导入jquery -->
    <script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>

    <%--引入css--%>
    <link rel="stylesheet" href="/js/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">

    <!-- 把user id复制到一个js变量 -->
    <script type="text/javascript">
        var me = '<%=session.getAttribute("me") %>';
        var base = '${base}';
        $(function() {
            $("#login_button").click(function() {
                $.ajax({
                    url : base + "/user/login",
                    type: "POST",
                    data:$('#loginForm').serialize(),
                    error: function(request) {
                        alert("Connection error");
                    },
                    dataType:"json",
                    //原版
                    // success: function(data) {
                    //     alert(data);
                    //     if (data == true) {
                    //         alert("登陆成功");
                    //         // location.reload();   //  原版
                    //         window.location = base + "/user/"; //  修改
                    //     } else {
                    //         alert("登陆失败,请检查账号密码")
                    //     }
                    // }
                    //登陆验证码修改版
                    success: function(data) {
                        if (data && data.ok) {
                            alert("登陆成功");
                            window.location = base + "/user/";
                        } else {
                            alert(data.msg);
                        }
                    }
                });
                return false;
            });
            if (me != "null") {
                $("#login_div").hide();
                $("#userInfo").html("您的Id是" + me);
                $("#user_info_div").show();
            } else {
                $("#login_div").show();
                $("#user_info_div").hide();
            }
        });
    </script>
</head>
<body>
<%--原版页面--%>
<%--<div id="login_div">--%>
    <%--<form action="#" id="loginForm" method="post">--%>
        <%--用户名 <input name="username" type="text" value="admin">--%>
        <%--密码 <input name="password" type="password" value="123456">--%>
        <%--<button id="login_button">提交</button>--%>
    <%--</form>--%>
<%--</div>--%>
<%--<div id="user_info_div">--%>
    <%--<p id="userInfo"></p>--%>
    <%--<a href="${base}/user">user List</a><br>--%>
    <%--<a href="${base}/user/logout">登出</a>--%>
<%--</div>--%>

<%--BooStrap页面--%>
<div class="overlay"></div>
<div class="center-wrapper">
    <div class="center-content">
        <div class="row no-m">
            <div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
                <section class="panel bg-white no-b fadeIn animated"> <header class="panel-heading no-b text-center" style="font-size:30px;"> Nutz Web Demo </header> <!-- END Language list    -->
                    <div class="p15">
                        <form id="loginForm" action="#" data-parsley-validate="" novalidate="" role="form" method="post">
                            <div class="form-group">
                                <input type="text" id="username" name="username" value="admin" required class="form-control input-lg mb25" placeholder="用户名">
                            </div>
                            <div class="form-group">
                                <input type="password" id="password" name="password" value="123456" required class="form-control input-lg mb25" placeholder="密码">
                            </div>
                            <%--登陆验证码--%>
                            <div class="form-group">
                                <script type="text/javascript">
                                    function next_captcha() {
                                        $("#captcha_img").attr("src", "${base}/captcha/next?_=" + new Date().getTime());
                                    }
                                </script>
                                <input name="captcha" id="captcha" type="text" value="" required class="form-control input-lg mb25" placeholder="验证码"><br>
                                <img id="captcha_img" onclick="next_captcha();return false;" src="${base}/captcha/next"></img>
                            </div>
                            <p id="tip" class="bg-danger p15" style="display: none"></p>

                            <div class="show">
                                <button class="btn btn-primary btn-lg btn-block" type="submit" id="login_button" data-loading-text="登录...">登录</button>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.6/css/bootstrap.min.css">
<%--<script type="text/javascript" src="https://cdn.staticfile.org/jquery/1.11.3/jquery.min.js"></script>--%>
<script type="text/javascript" src="https://cdn.staticfile.org/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.staticfile.org/layer/2.3/layer.js"></script>

<%--写BootStrap表格--%>
<script type="text/javascript" src="js/table.js"></script>
</body>
</html>