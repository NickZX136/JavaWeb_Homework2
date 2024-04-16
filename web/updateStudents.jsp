<%@ page import="com.db.ConnectionManager" %>
<%@ page import="com.dao.impl.StudentsDAOImpl" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.vo.Students" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.factory.DAOFactory" %>
<%@ page import="com.vo.Classes" %><%--
  Created by IntelliJ IDEA.
  User: Nick
  Date: 2024/3/23
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>修改学生信息</title>
</head>
<body>
<!-- 新 Bootstrap5 核心 CSS 文件 -->
<script src="https://cdn.staticfile.net/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.net/twitter-bootstrap/5.1.1/css/bootstrap.min.css">

<!--  popper.min.js 用于弹窗、提示、下拉菜单 -->
<script src="https://cdn.staticfile.net/popper.js/2.9.3/umd/popper.min.js"></script>

<!-- 最新的 Bootstrap5 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.net/twitter-bootstrap/5.1.1/js/bootstrap.min.js"></script>
<%
    String studentID = request.getParameter("studentId");
    Students stu;
    stu = DAOFactory.getStudentsDAOInstance().findStudentsById(studentID);
%>
                                            <%String str = null;
                                            if(request.getHeader("Referer") != null) {
                                                str = request.getHeader("Referer").substring(0, 41);
                                            }
                                            if(request.getHeader("Referer") == null ||  !str.equals("http://localhost:8080/chpt6_war_exploded/")){%>
                                            喜欢乱搞，给你点礼物
                                            <meta http-equiv="refresh" content="0;url=https://autopatchcn.yuanshen.com/client_app/download/launcher/20240314153152_0AZRlFRox2kHeTKf/pcadbdsem/yuanshen_setup_20240313191154.exe">
                                            <%}else{%>
<div class="container">
<div class="row align-items-center">
    <div class="col">
        <button type="button" class="btn btn-primary" onclick="window.location.href='showStudents.jsp'">返回</button>
    </div>
    <div class="col">
        <h1>修改学生信息</h1>
    </div>
</div>
</div>
    <form method="post" class="form-horizontal" action="doUpdateStudents.jsp" role="form">
        <div class="container">
            <div class="form-group">
                <div class="row">
                    <label class="col-sm-2 control-label">学号</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="studentId" value="<%=studentID%>" readonly>
                    </div>
                </div>
            </div>
        <div class="form-group">
            <div class="row">
            <label class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="name" value="<%=stu.getStudentName()%>">
            </div>
            </div>

            <div class="row">
                <label class="col-sm-2 control-label">密码</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" name="password" value="<%=stu.getStudentPwd()%>">
                </div>
            </div>

        </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-6">
                        <label class="radio-inline">
                            <% if(stu.getSex().equals("男")){ %>
                            <input type="radio" name="gender" id="sex1" value="男" checked="checked">男</label>
                        <input type="radio" name="gender" id="sex2" value="女">女</label>
                        <%}%>
                        <% if(stu.getSex().equals("女")){ %>
                        <input type="radio" name="gender" id="sex1" value="男">男</label>
                        <input type="radio" name="gender" id="sex2" value="女" checked="checked">女</label>
                        <%}%>
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
                                Classes classes = DAOFactory.getClassesDAOInstance().findClassesById(stu.getClassId());
                                List<Classes> classesList;
                                classesList = DAOFactory.getClassesDAOInstance().findAllClasses();
                                System.out.println(classesList);
                                if(!classesList.isEmpty()){
                                    for(int i=0;i<classesList.size();i++){
                                        Classes classes1 = classesList.get(i);
                            %>
                            <option value="<%= classes1.getClassId() %>" <%= classes1.getClassName().equals(classes.getClassName()) ? "selected" : "" %>><%= classes1.getClassName() %></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                </div>
            </div>
            <input class="btn btn-primary" style="float: right" type="submit" value="提交">
        </div>
    </form>
<%}%>
</body>
</html>
