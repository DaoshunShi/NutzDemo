<%--
  Created by IntelliJ IDEA.
  User: DossS
  Date: 2018/4/25
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户列表</title>
    <script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>
    <script type="text/javascript">
        var me = '<%=session.getAttribute("me") %>';
        var pageNumber = 1;
        var pageSize = 10;
        var pageCount = 0;
        var recordCount = 0;
        var base = '<%=request.getAttribute("base")%>';
        function user_reload() {
            judge_pageNumber(); //规范当前页面页数
            $.ajax({
                url : base + "/user/query",
                data : $("#user_query_form").serialize(),
                dataType : "json",
                success : function(data) {
                    console.log(data);
                    recordCount = data.pager.recordCount;   //  记录用户list人数
                    // pageCount = data.pager.pageCount;   //  记录总页面数
                    calc_pageCount();   //  计算总页面数
                    $("#user_count").html("共"+data.pager.recordCount+"个用户, 总计"+data.pager.pageCount+"页");
                    var list_html = "";
                    console.log(data.list);
                    for (var i=0;i<data.list.length;i++) {
                        var user = data.list[i];
                        console.log(user);
                        var tmp = "\n<p>" + user.id + " " + user.name
                            + " <button onclick='user_update(" + user.id +");'>修改</button> "
                            + " <button onclick='user_delete(" + user.id +");'>删除</button> "
                            + "</p>";
                        list_html += tmp;
                    }
                    $("#user_list").html(list_html);

                    var table_html = "<tr><th>" + "ID" + "</th><th>" + "姓名" + "</th></th>" + "年龄" + "</th><th>" + "创建时间" + "</th><th>" + "修改时间" + "</th><th>" + "操作" + "</th></tr>";
                    console.log(data.list);
                    for (var i=0;i<data.list.length;i++) {
                        var user=data.list[i];
                        console.log(user);
                        var temp = "<tr><td>" + user.id + "</td><td>" + user.name + "</td><td>" + user.createTime + "</td><td>" + user.updateTime + "</td><td>" + "<a href='javascript:void(0);' onclick='user_update_new("+ user.id +")'>修改</a> <a href='javascript:void(0);' onclick='user_delete("+ user.id +")'>删除</a>" + "</td></tr>"
                        table_html += temp;
                    }
                    $("#user_table").html(table_html);
                }
            });
        }
        $(function() {
            user_reload();
            $("#user_query_btn").click(function() {
                user_reload();
            });
            $("#user_add_btn").click(function() {
                $.ajax({
                    url : base + "/user/add",
                    data : $("#user_add_form").serialize(),
                    dataType : "json",
                    success : function(data) {
                        if (data.ok) {
                            user_reload();
                            alert("添加成功");
                        } else {
                            alert(data.msg);
                        }
                    }
                });
            });
            $("#next_page").click(function () {
                if (pageNumber >= pageCount) {
                    pageNumber = pageCount;
                    document.getElementById("pageNumber").value = pageCount;
                    alert("已经是尾页了");
                } else {
                    pageNumber = pageNumber + 1;
                    document.getElementById("pageNumber").value = parseInt(document.getElementById("pageNumber").value) + 1;
                }
                user_reload();
            });
            $("#font_page").click(function () {
                if (pageNumber <= 1) {
                    pageNumber = 1;
                    document.getElementById("pageNumber").value = 1;
                    alert("已经是首页了");
                } else {
                    pageNumber = pageNumber - 1;
                    document.getElementById("pageNumber").value = parseInt(document.getElementById("pageNumber").value) - 1;
                }
                user_reload();
            });
        });
        function calc_pageCount() {
            pageSize = parseInt(document.getElementById("pageSize").value);
            if (recordCount % pageSize == 0) {
                pageCount = parseInt(recordCount / pageSize);
            } else {
                pageCount = parseInt(recordCount / pageSize) + 1;
            }
        };
        function judge_pageNumber() {
            calc_pageCount();
            if (parseInt(document.getElementById("pageNumber").value) > parseInt(pageCount) && parseInt(pageCount) != 0) {
                pageNumber = pageCount;
                document.getElementById("pageNumber").value = pageCount;
            }
            if (parseInt(document.getElementById("pageNumber").value) < 1 || parseInt(pageCount) == 0) {
                pageNumber = 1;
                document.getElementById("pageNumber").value = 1;
            }
        };
        function user_update(userId) {
            var passwd = prompt("请输入新的密码");
            if (passwd) {
                $.ajax({
                    url : base + "/user/update",
                    data : {"id":userId,"password":passwd},
                    dataType : "json",
                    success : function (data) {
                        if (data.ok) {
                            user_reload();
                            alert("修改成功");
                        } else {
                            alert(data.msg);
                        }
                    }
                });
            }
        };
        function user_update_new(userId) {
            window.open(base + "/user/userUpdate?id="+userId,"displayWindow","toolbar=no,width=700,height=400,directories=no,status=no,scrollbars=yes,resize=no,menubar=no")
        };
        function create_window() {
            window.open(base + "/user/userUpdate","displayWindow","toolbar=no,width=350,height=400,directories=no,status=no,scrollbars=yes,resize=no,menubar=no")
        //     window.open("/user/query","displayWindow","toolbar=no,width=350,height=400,directories=no,status=no,scrollbars=yes,resize=no,menubar=no")
        };
        function user_delete(userId) {
            var s = prompt("请输入y确认删除");
            if (s == "y") {
                $.ajax({
                    url : base + "/user/delete",
                    data : {"id":userId},
                    dataType : "json",
                    success : function (data) {
                        if (data.ok) {
                            user_reload();
                            alert("删除成功");
                        } else {
                            alert(data.msg);
                        }
                    }
                });
            }
        };
    </script>
</head>
<body>
<div>
    <div>
        <a href="${base}/user/logout">登出</a>
        <a href="${base}/user/profile/">用户详情</a>
        <a href="${base}/user/userTable">BootStrap Table</a>
        <p>---------------------------------------------------------</p>
    </div>
    <form action="#" id="user_query_form">
        条件<input type="text" id="name" name="name">
        页数<input type="text" id="pageNumber" name="pageNumber" value="1">
        每页<input type="text" id="pageSize" name="pageSize" value="10">
    </form>
    <button id="user_query_btn">查询</button>
    <button id="next_page">下一页</button>
    <button id="font_page">上一页</button>
    <p>---------------------------------------------------------------</p>
    <p id="user_count"></p>
    <table id="user_table" border="2">

    </table>
    <p>---------------------------------------------------------------</p>

    <div id="user_list">

    </div>
</div>
<div>
    <p>---------------------------------------------------------------</p>
</div>
<div id="user_add">
    <form action="#" id="user_add_form">
        用户名<input name="name">
        密码<input name="password">
    </form>
    <button id="user_add_btn">新增</button>
</div>
<div>
    <p>---------------------------------------------------------------</p>
</div>
<div>
    <button id="new_window" onclick="create_window()">打开userUpdate.jsp</button>
</div>
</body>
</html>