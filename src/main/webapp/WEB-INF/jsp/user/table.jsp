<%--
  Created by IntelliJ IDEA.
  User: DossS
  Date: 2018/4/27
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户Table BootStrap</title>

    <!-- 导入jquery -->
    <%--<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>--%>
    <script type="text/javascript" src="/js/jquery/jquery-3.2.0.min.js"></script>
    <!-- bootstrap -->
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.6/css/bootstrap.min.css">--%>
    <%--<script type="text/javascript" src="https://cdn.staticfile.org/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>--%>
    <link rel="stylesheet" href="/js/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/bootstrap/js/bootstrap.min.js"></script>
    <!-- 分页插件 -->
    <link rel="stylesheet" href="/js/bootstrap-table/bootstrap-table.min.css">
    <script type="text/javascript" src="/js/bootstrap-table/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap-table/bootstrap-table-locale-all.min.js"></script>
</head>
<body>
<div>
<%--BootStrap表格--%>
<div class="container" style="margin-top:100px">
    <div class="row">
        <!-- 搜索框 -->
        <div class="col-xs-6 pull-right">
            <div class="input-group">
                <input type="text" class=" form-control" name="id" placeholder="请输入ID">
                <input type="text" class="form-control" name="name" placeholder="请输入姓名">
                <span class="input-group-btn">
                            <button class="btn btn-default search" type="button">Go!</button>
                        </span>
            </div>
        </div>
        <!-- 表格 -->
        <div class="col-xs-12">
            <table id="tb" class="table table-striped table-bordered table-hover" ></table>
        </div>

    </div>
</div>
</body>
<script type="text/javascript" src="/js/table.js"></script>
</html>
