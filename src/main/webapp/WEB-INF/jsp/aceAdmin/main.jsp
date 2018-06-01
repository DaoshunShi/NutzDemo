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
                <%--<li class="active">--%>
                    <%--<a href="#" class="dropdown-toggle">--%>
                        <%--<i class="icon-dashboard"></i>--%>
                        <%--<span class="menu-text"> 系统管理 </span>--%>

                        <%--<b class="arrow icon-angle-down"></b>--%>
                    <%--</a>--%>
                    <%--<ul class="submenu">--%>
                        <%--<li>--%>
                            <%--<a href="#" class="dropdown-toggle">--%>
                                <%--<i class="icon-double-angle-right"></i>--%>
                                <%--用户管理--%>
                                <%--<b class="arrow icon-angle-down"></b>--%>
                            <%--</a>--%>
                            <%--<ul class="submenu">--%>
                                <%--<li>--%>
                                    <%--<a href="#">--%>
                                        <%--<i class="icon-leaf"></i>--%>
                                        <%--部门管理--%>
                                    <%--</a>--%>
                                    <%--<a href="#">--%>
                                        <%--<i class="icon-adjust"></i>--%>
                                        <%--账号管理--%>
                                    <%--</a>--%>
                                    <%--<a href="#">--%>
                                        <%--<i class="icon-plane"></i>--%>
                                        <%--角色管理--%>
                                    <%--</a>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#" class="dropdown-toggle">--%>
                                <%--<i class="icon-double-angle-right"></i>--%>
                                <%--权限管理--%>
                                <%--<b class="arrow icon-angle-down"></b>--%>
                            <%--</a>--%>
                            <%--<ul class="submenu">--%>
                                <%--<li>--%>
                                    <%--<a href="#">--%>
                                        <%--<i class="icon-leaf"></i>--%>
                                        <%--菜单管理--%>
                                    <%--</a>--%>
                                    <%--<a href="#">--%>
                                        <%--<i class="icon-adjust"></i>--%>
                                        <%--权限管理--%>
                                    <%--</a>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#" class="dropdown-toggle">--%>
                                <%--<i class="icon-double-angle-right"></i>--%>
                                <%--基础配置--%>
                                <%--<b class="arrow icon-angle-down"></b>--%>
                            <%--</a>--%>
                            <%--<ul class="submenu">--%>
                                <%--<li>--%>
                                    <%--<a href="#">--%>
                                        <%--<i class="icon-leaf"></i>--%>
                                        <%--字典--%>
                                    <%--</a>--%>
                                    <%--<a href="#">--%>
                                        <%--<i class="icon-adjust"></i>--%>
                                        <%--系统参数--%>
                                    <%--</a>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</li>--%>
                    <%--</ul>--%>

                <%--</li>--%>
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

    var menus;
    var html;
    var rootId;

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

    <%--$(function() {--%>
        <%--$('#menu').innerHTML = "";--%>

        <%--$('#menu').append("\n" +--%>
            <%--"                &lt;%&ndash;手动menu开始&ndash;%&gt;\n" +--%>
            <%--"                <li class=\"active\">\n" +--%>
            <%--"                    <a href=\"#\" class=\"dropdown-toggle\">\n" +--%>
            <%--"                        <i class=\"icon-dashboard\"></i>\n" +--%>
            <%--"                        <span class=\"menu-text\"> 系统管理 </span>\n" +--%>
            <%--"\n" +--%>
            <%--"                        <b class=\"arrow icon-angle-down\"></b>\n" +--%>
            <%--"                    </a>\n" +--%>
            <%--"                    <ul class=\"submenu\">\n" +--%>
            <%--"                        <li>\n" +--%>
            <%--"                            <a href=\"#\" class=\"dropdown-toggle\">\n" +--%>
            <%--"                                <i class=\"icon-double-angle-right\"></i>\n" +--%>
            <%--"                                用户管理\n" +--%>
            <%--"                                <b class=\"arrow icon-angle-down\"></b>\n" +--%>
            <%--"                            </a>\n" +--%>
            <%--"                            <ul class=\"submenu\">\n" +--%>
            <%--"                                <li>\n" +--%>
            <%--"                                    <a href=\"#\">\n" +--%>
            <%--"                                        <i class=\"icon-leaf\"></i>\n" +--%>
            <%--"                                        部门管理\n" +--%>
            <%--"                                    </a>\n" +--%>
            <%--"                                    <a href=\"#\">\n" +--%>
            <%--"                                        <i class=\"icon-adjust\"></i>\n" +--%>
            <%--"                                        账号管理\n" +--%>
            <%--"                                    </a>\n" +--%>
            <%--"                                    <a href=\"#\">\n" +--%>
            <%--"                                        <i class=\"icon-plane\"></i>\n" +--%>
            <%--"                                        角色管理\n" +--%>
            <%--"                                    </a>\n" +--%>
            <%--"                                </li>\n" +--%>
            <%--"                            </ul>\n" +--%>
            <%--"                        </li>\n" +--%>
            <%--"                        <li>\n" +--%>
            <%--"                            <a href=\"#\" class=\"dropdown-toggle\">\n" +--%>
            <%--"                                <i class=\"icon-double-angle-right\"></i>\n" +--%>
            <%--"                                权限管理\n" +--%>
            <%--"                                <b class=\"arrow icon-angle-down\"></b>\n" +--%>
            <%--"                            </a>\n" +--%>
            <%--"                            <ul class=\"submenu\">\n" +--%>
            <%--"                                <li>\n" +--%>
            <%--"                                    <a href=\"#\">\n" +--%>
            <%--"                                        <i class=\"icon-leaf\"></i>\n" +--%>
            <%--"                                        菜单管理\n" +--%>
            <%--"                                    </a>\n" +--%>
            <%--"                                    <a href=\"#\">\n" +--%>
            <%--"                                        <i class=\"icon-adjust\"></i>\n" +--%>
            <%--"                                        权限管理\n" +--%>
            <%--"                                    </a>\n" +--%>
            <%--"                                </li>\n" +--%>
            <%--"                            </ul>\n" +--%>
            <%--"                        </li>\n" +--%>
            <%--"                        <li>\n" +--%>
            <%--"                            <a href=\"#\" class=\"dropdown-toggle\">\n" +--%>
            <%--"                                <i class=\"icon-double-angle-right\"></i>\n" +--%>
            <%--"                                基础配置\n" +--%>
            <%--"                                <b class=\"arrow icon-angle-down\"></b>\n" +--%>
            <%--"                            </a>\n" +--%>
            <%--"                            <ul class=\"submenu\">\n" +--%>
            <%--"                                <li>\n" +--%>
            <%--"                                    <a href=\"#\">\n" +--%>
            <%--"                                        <i class=\"icon-leaf\"></i>\n" +--%>
            <%--"                                        字典\n" +--%>
            <%--"                                    </a>\n" +--%>
            <%--"                                    <a href=\"#\">\n" +--%>
            <%--"                                        <i class=\"icon-adjust\"></i>\n" +--%>
            <%--"                                        系统参数\n" +--%>
            <%--"                                    </a>\n" +--%>
            <%--"                                </li>\n" +--%>
            <%--"                            </ul>\n" +--%>
            <%--"                        </li>\n" +--%>
            <%--"                    </ul>\n" +--%>
            <%--"\n" +--%>
            <%--"                </li>\n" +--%>
            <%--"                &lt;%&ndash;手动menu结束&ndash;%&gt;");--%>
    <%--});--%>

    $(function() {
        // $(loadMenu());
        $(loadMenu());
    });

    // var Ajax = function ()
    // {
    //     $.getJSON ("js/userinfo.txt", function (data)
    //     {
    //         $.each (data, function (i, item)
    //         {
    //             // $ ("#disp").append ("<h3>" + item.name + "</h3>");
    //             // $ ("#disp").append ("<p>" + item.sex + "</p>");
    //             // $ ("#disp").append ("<p>" + item.email + "</p>");
    //             console.log(item.name + " " + item.sex + " " + item.email);
    //         });
    //     });
    // };

    // function loadMenu() {
    //     $.ajax({
    //         type:"POST",
    //         dataType:"json",
    //         // url:"/WEB-INF/jsp/aceAdmin/menu.json",
    //         url:"menu.json",
    //         success: function (result) {
    //             var str = "";
    //             $.each(result, function(index, obj) {
    //                 str += "<a href='" + obj["url"] + "' target='_blank'><img src='" + obj["img"] + "' /></a>";
    //             });
    //             // $("#ok").append(str);
    //             alert(str);
    //         }
    //     })
    //
    // };

    function loadMenu() {
        var base = '<%=request.getAttribute("base")%>';
        $.ajax({
            url: base + "/user/querySidebar",
            success : function(data) {
                console.log(data.list);
                menus=data.list;
                console.log(menus.length);
                html=new treeMenu(menus).init(1);
                alert(html);
                // $('#menu').innerHTML= html;
                $('#menu').append(html);
            },

        });
    };

    //定义固定Menu的内容
    var zNodes=[
        {id:0,parentMenuId:-1,resourceName:"Aaaa"},
        {id:1,parentMenuId:0,resourceName:"A"},
        {id:11,parentMenuId:1,resourceName:"A1"},
        {id:12,parentMenuId:1,resourceName:"A2"},
        {id:13,parentMenuId:1,resourceName:"A3"},
        {id:2,parentMenuId:0,resourceName:"B"},
        {id:21,parentMenuId:2,resourceName:"B1"},
        {id:22,parentMenuId:2,resourceName:"B2"},
        {id:23,parentMenuId:2,resourceName:"B3"},
        {id:3,parentMenuId:0,resourceName:"C"},
        {id:31,parentMenuId:3,resourceName:"C1"},
        {id:32,parentMenuId:3,resourceName:"C2"},
        {id:33,parentMenuId:3,resourceName:"C3"},
        {id:34,parentMenuId:31,resourceName:"x"},
        {id:35,parentMenuId:31,resourceName:"y"},
        {id:36,parentMenuId:31,resourceName:"z"},
        {id:37,parentMenuId:36,resourceName:"z1123"} ,
        {id:38,parentMenuId:37,resourceName:"z123123123"}
    ];

    //将JSON格式的Menu转换为多叉树结构
    function treeMenu(a){
        this.tree=a||[];
        this.groups={};
    };
    treeMenu.prototype={
        init:function(parentMenuId){
            this.group();
            return this.getDom(this.groups[parentMenuId]);
        },
        group:function(){
            for(var i=0;i<this.tree.length;i++){
                if(this.groups[this.tree[i].parentMenuId]){
                    this.groups[this.tree[i].parentMenuId].push(this.tree[i]);
                }else{
                    this.groups[this.tree[i].parentMenuId]=[];
                    this.groups[this.tree[i].parentMenuId].push(this.tree[i]);
                }
            }
        },
        getDom:function(a){
            if(!a){return ''}
            // var html='\n<ul class="submenu">\n';
            var html = "";
            if (a[0].parentMenuId != 1) {
                html = '\n<ul class="submenu">\n';
            } else {
                // html = '\n<ul class=\"dropdown-toggle\">\n';
            }
            for(var i=0;i<a.length;i++){
                // html+='<li><a href="#">'+a[i].resourceName+'</a>';

                if (i==0 && a[0].parentMenuId==1) {
                    html+='<li class=\"active\"><a href="#" class="dropdown-toggle"><i class=\"icon-dashboard\"></i>'+a[i].resourceName+'\n <b class=\"arrow icon-angle-down\"></b></a>';
                } else if (a[i].linkPath == "") {
                    html+='<li><a href="#" class=\"dropdown-toggle\"><i class=\"icon-double-angle-right\"></i>'+a[i].resourceName+'<b class=\"arrow icon-angle-down\"></b></a>';
                } else {
                    html+='<li><a href="#"><i class=\"'+a[i].cls+'\"></i>'+a[i].resourceName+'</a>';
                }

                html+=this.getDom(this.groups[a[i].id]);
                html+='</li>\n';
            };
            if (a[0].parentMenuId != 1) {
                html+='</ul>\n';
            } else {
            }

            return html;
        }
    };

    // html=new treeMenu(zNodes).init(0);
    // alert(html);




</script>
</body>
</html>


