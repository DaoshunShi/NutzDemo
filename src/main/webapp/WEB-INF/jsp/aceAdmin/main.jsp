<%--
  Created by IntelliJ IDEA.
  User: DossS
  Date: 2018/5/30
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>民政综合业务平台</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link rel="stylesheet" href="${ctx}/resources/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/resources/assets/css/font-awesome.min.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${ctx}/resources/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${ctx}/resources/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${ctx}/resources/assets/css/ace-skins.min.css" />

    <script src="${ctx}/resources/assets/js/ace-extra.min.js"></script>

    <style type="text/css">
        body {
            overflow: hidden;
        }
        .tab-content {
            border: none;
            padding: 10px 0px;
        }
        #menu_li_0 {
            display: none;
        }
    </style>
</head>

<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try{ace.settings.check('navbar' , 'fixed')}catch(e){}
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="icon-cogs"></i>
                    民政综合业务平台
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <%-- <li class="purple">
                    <a href="${ctx}/ace-demo/index.html" target="_blank">
                        <i class="icon-bell-alt icon-animated-bell"></i>
                        <span class="badge badge-important">8</span>
                    </a>
                </li>
                <li class="green">
                    <a href="${ctx}/mweb/home" target="_blank">
                        <i class="icon-envelope icon-animated-vertical"></i>
                        <span class="badge badge-success">5</span>
                    </a>
                </li> --%>

                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="${ctx}/skins/default/images/defaultuser.png" alt="Jason's Photo" />
                        <span class="user-info">
									<small>欢迎光临,</small>
									${sessionScope.sessionUser.displayName}
								</span>
                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <!-- <li>
                            <a href="#">
                                <i class="icon-cog"></i>
                                设置
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="icon-user"></i>
                                个人资料
                            </a>
                        </li>

                        <li class="divider"></li> -->

                        <li>
                            <a href="${ctx}/logout">
                                <i class="icon-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul><!-- /.ace-nav -->
        </div><!-- /.navbar-header -->
    </div><!-- /.container -->
</div>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
            </script>

            <ul class="nav nav-list" id="menu">

                <%--手动menu开始--%>
                <li class="active">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text"> 系统管理 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a href="#" class="dropdown-toggle">
                                <i class="icon-double-angle-right"></i>
                                用户管理
                                <b class="arrow icon-angle-down"></b>
                            </a>
                            <ul class="submenu">
                                <li>
                                    <a href="#">
                                        <i class="icon-leaf"></i>
                                        部门管理
                                    </a>
                                    <a href="#">
                                        <i class="icon-adjust"></i>
                                        账号管理
                                    </a>
                                    <a href="#">
                                        <i class="icon-plane"></i>
                                        角色管理
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="dropdown-toggle">
                                <i class="icon-double-angle-right"></i>
                                权限管理
                                <b class="arrow icon-angle-down"></b>
                            </a>
                            <ul class="submenu">
                                <li>
                                    <a href="#">
                                        <i class="icon-leaf"></i>
                                        菜单管理
                                    </a>
                                    <a href="#">
                                        <i class="icon-adjust"></i>
                                        权限管理
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="dropdown-toggle">
                                <i class="icon-double-angle-right"></i>
                                基础配置
                                <b class="arrow icon-angle-down"></b>
                            </a>
                            <ul class="submenu">
                                <li>
                                    <a href="#">
                                        <i class="icon-leaf"></i>
                                        字典
                                    </a>
                                    <a href="#">
                                        <i class="icon-adjust"></i>
                                        系统参数
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                </li>
                <%--手动menu结束--%>

            </ul><!-- /.nav-list -->


            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
            </div>

            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
            </script>
        </div>

        <div class="main-content">


            <div class="page-content">


                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <ul class="nav nav-tabs" role="tablist">
                            <!--<li class="active"><a href="#Index" role="tab" data-toggle="tab">首页</a></li>-->
                        </ul>
                        <div class="tab-content" style="background-color: #fff">
                            <!--<div role="tabpanel" class="tab-pane active" id="Index"></div>-->
                        </div>

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div><!-- /.main-content -->

        <!-- /#ace-settings-container -->
    </div><!-- /.main-container-inner -->
</div><!-- /.main-container -->

<!-- basic scripts -->

<script src='${ctx}/resources/assets/js/jquery-2.0.3.min.js'></script>

<!-- 自定义js -->
<script src="${ctx}/resources/assets/js/sidebar-menu.js"></script>
<script src="${ctx}/resources/assets/js/bootstrap-tab.js"></script>

<script src="${ctx}/resources/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/resources/assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->
<script src="${ctx}/resources/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="${ctx}/resources/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${ctx}/resources/assets/js/jquery.slimscroll.min.js"></script>
<script src="${ctx}/resources/assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="${ctx}/resources/assets/js/jquery.sparkline.min.js"></script>
<script src="${ctx}/resources/assets/js/flot/jquery.flot.min.js"></script>
<script src="${ctx}/resources/assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="${ctx}/resources/assets/js/flot/jquery.flot.resize.min.js"></script>

<!-- ace scripts -->

<script src="${ctx}/resources/assets/js/ace-elements.min.js"></script>
<script src="${ctx}/resources/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
    $(window).resize(function() {
        $("#sidebar").height($(window).height()-$("#navbar").height());
        $("div .tab-pane iframe").height($("#sidebar").height()-60);
    });

    $(function () {
        $("#sidebar").height($(window).height()-$("#navbar").height()-40);

        //--load menu from at
        $('#menu').sidebarMenu({ url: "${ctx}/menutree" });
        //alert('loaded');
    });

    function loadMenu() {

    };
    function loadUserInfo() {

    };
</script>
</body>
</html>


