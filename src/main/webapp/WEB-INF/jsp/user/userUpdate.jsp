<%--
  Created by IntelliJ IDEA.
  User: DossS
  Date: 2018/4/26
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>--%>
    <script type="text/javascript" src="/rs/js/jquery-3.3.1.min.js"></script>
    <title>Title</title>
</head>
<body>
<div>
    <p>-------------------------------------------</p>
    <h1>UpserUpdate页面</h1>
    <table id="user_table"></table>
</div>
<div>
    <p>--------------------------------------------</p>
    ID<input type="text" id="id" readonly>  <br>
    姓名<input type="text" id="name"> <br>
    密码<input type="text" id="password" > <br>
    附加密码<input type="text" id="salt" > <br>
    创建时间<input type="text" id="createTime" readonly> <br>
    修改时间<input type="text" id="updateTime" readonly> <br>
    <button id="update_btn" onclick="user_update()">更新</button>
</div>


</body>
<script type="text/javascript">
    var base = '<%=request.getAttribute("base")%>';
    $(function () {
        var query = location.search.substring(1);
        var pos = query.indexOf('=');
        var id;
        if (pos != -1) {
            var paramname = query.substring(0,pos);
            id=query.substring(pos+1);
        }
        alert(paramname + " = " + id);

        user_reload(id);

        //多数据输入方法
        // var query = location.search.substring(1);
        // var values= query.split("&");
        //
        // //************my***********
        // var value = new Array(values.length);
        // //************************
        // for(var i = 0; i < values.length; i++) {
        //     var pos = values[i].indexOf('=');
        //     if (pos == -1) continue;
        //     var paramname = values[i].substring(0,pos);
        //     //var value = values[i].substring(pos+1);
        //     value[i]=values[i].substring(pos+1);
        //     //alert(paramname +","+value[i] );
        //
        // }
    });

    function user_reload(id) {
        $.ajax({
            url : base + "/user/queryNew",
            data : {"id": id},
            dataType : "json",
            success : function(data) {
                console.log(data);

                //写table
                // var table_html = "<tr><th>" + "ID" + "</th><th>" + "姓名" + "</th></th>" + "年龄" + "</th><th>" + "创建时间" + "</th><th>" + "修改时间" + "</th><th>" + "操作" + "</th></tr>";
                // console.log(data.list);
                // for (var i=0;i<data.list.length;i++) {
                //     var user=data.list[i];
                //     console.log(user);
                //     var temp = "<tr><td>" + user.id + "</td><td>" + user.name + "</td><td>" + user.createTime + "</td><td>" + user.updateTime + "</td><td>" + "<a href='javascript:void(0);' onclick='user_update_new("+ user.id +")'>修改</a> <a href='javascript:void(0);' onclick='user_delete("+ user.id +")'>删除</a>" + "</td></tr>"
                //     table_html += temp;
                // }
                // $("#user_table").html(table_html);

                var user = data.list[0];
                document.getElementById("id").value = user.id;
                document.getElementById("name").value = user.name;
                // document.getElementById("password").value = user.password;
                // document.getElementById("salt").value = user.salt;
                document.getElementById("createTime").value = user.createTime;
                document.getElementById("updateTime").value = user.updateTime;
            }
        });
    };

    function user_update() {
        var id = document.getElementById("id").value;
        var name = document.getElementById("name").value;
        var password = document.getElementById("password").value;
        var salt = document.getElementById("salt").value;
        $.ajax({
            url : base + "/user/update",
            data : {"id": id, "name":name, "password":password, "salt":salt},
            dataType : "json",
            success : function(data) {
                if (data.ok) {
                    user_reload();
                    alert("修改成功");
                } else {
                    alert(data.msg);
                }
            }
        });
    };
</script>
</html>
