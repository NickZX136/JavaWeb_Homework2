<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login page</title>
</head>
<body>
<script src="https://cdn.staticfile.net/jquery/3.6.0/jquery.min.js"></script>
<!-- 新 Bootstrap5 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.staticfile.net/twitter-bootstrap/5.1.1/css/bootstrap.min.css">

<!--  popper.min.js 用于弹窗、提示、下拉菜单 -->
<script src="https://cdn.staticfile.net/popper.js/2.9.3/umd/popper.min.js"></script>

<!-- 最新的 Bootstrap5 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.net/twitter-bootstrap/5.1.1/js/bootstrap.min.js"></script>
<div class="container">
    <h2>登录页面</h2>
<form action="login_check.jsp" method="post">
    <div class="row">
        <label class="col-sm-2 control-label">账号</label>
        <div class="col-sm-6">
    <input type="text" name="userid"/>
        </div>
    </div>
    <div class="row">
        <label class="col-sm-2 control-label">密码</label>
        <div class="col-sm-6">
    <input type="password" name="password">
        </div>
    </div>
    <input type="submit" class="btn btn-primary" value="提交">
</form>
</div>
</body>
<style>
    .container {
        width: 50%;
        margin: 0 auto;
        /* 或者使用其他居中方式 */
    }
</style>
</html>
