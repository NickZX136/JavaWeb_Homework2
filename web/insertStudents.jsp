<%@ page import="com.vo.Classes" %>
<%@ page import="java.util.List" %>
<%@ page import="com.factory.DAOFactory" %>
<%@ page import="com.vo.Students" %><%--
  Created by IntelliJ IDEA.
  User: Nick
  Date: 2024/3/27
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增学生信息</title>
</head>
<body>
<script src="https://cdn.staticfile.net/jquery/3.6.0/jquery.min.js"></script>
<!-- 新 Bootstrap5 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.staticfile.net/twitter-bootstrap/5.1.1/css/bootstrap.min.css">

<!--  popper.min.js 用于弹窗、提示、下拉菜单 -->
<script src="https://cdn.staticfile.net/popper.js/2.9.3/umd/popper.min.js"></script>

<!-- 最新的 Bootstrap5 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.net/twitter-bootstrap/5.1.1/js/bootstrap.min.js"></script>
<%String str = null;
    if(request.getHeader("Referer") != null) {
        str = request.getHeader("Referer").substring(0, 41);
    }
    if(request.getHeader("Referer") == null ||  !str.equals("http://localhost:8080/chpt6_war_exploded/")){%>
喜欢乱搞，给你点礼物
<meta http-equiv="refresh" content="0;url=https://autopatchcn.yuanshen.com/client_app/download/launcher/20240314153152_0AZRlFRox2kHeTKf/pcadbdsem/yuanshen_setup_20240313191154.exe">
<%}else{%>
<%
    String studentId = null;
    String studentName = null;
    String studentPwd = null;
    Integer studentClass = null;
%>
<div class="container">
    <div class="row align-items-center">
        <div class="col">
            <button type="button" class="btn btn-primary" onclick="window.location.href='showStudents.jsp'">返回</button>
        </div>
        <div class="col">
            <h1>新增学生信息</h1>
        </div>
    </div>
</div>
<form method="post" class="form-horizontal" action="doInsertStudents.jsp" role="form">
    <div class="container">
        <div class="form-group">
            <div class="row">
                <label class="col-sm-2 control-label">学号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="studentId" value="">
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <label class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="name" value="">
                </div>
            </div>

            <div class="row">
                <label class="col-sm-2 control-label">密码</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" name="password" value="">
                </div>
            </div>

        </div>
        <div class="form-group">
            <div class="row">
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-6">
                    <label class="radio-inline">
                        <input type="radio" name="sex" id="sex1" value="男" checked="checked">男</label>
                        <input type="radio" name="sex" id="sex2" value="女">女</label>
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <label class="col-sm-2 control-label">班级</label>
                <div class="col-sm-6">
                    <select class="form-control" name="classId">
                        <%
                            List<Classes> classesList=null;
                            classesList = DAOFactory.getClassesDAOInstance().findAllClasses();
                            if(!classesList.isEmpty()){
                                for(int i=0;i<classesList.size();i++){
                                    Classes classes1 = classesList.get(i);
                        %>
                        <option value="<%= classes1.getClassId() %>" <%= classes1.equals(classesList.get(0)) ? "selected" : "" %>><%= classes1.getClassName() %></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
            </div>
        </div>
        <input type="submit" class="btn btn-primary" style="float: right" value="提交">
    </div>
</form>
<%}%>
</body>
</html>
