<%@ page import="com.factory.DAOFactory" %>
<%@ page import="com.vo.Students" %><%--
  Created by IntelliJ IDEA.
  User: Nick
  Date: 2024/3/29
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除学生</title>
</head>
<body>
<script src="https://cdn.staticfile.net/jquery/3.6.0/jquery.min.js"></script>
<!-- 新 Bootstrap5 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.staticfile.net/twitter-bootstrap/5.1.1/css/bootstrap.min.css">

<!--  popper.min.js 用于弹窗、提示、下拉菜单 -->
<script src="https://cdn.staticfile.net/popper.js/2.9.3/umd/popper.min.js"></script>

<!-- 最新的 Bootstrap5 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.net/twitter-bootstrap/5.1.1/js/bootstrap.min.js"></script>
<%
    String studentID = request.getParameter("studentId");
    Students stu = null;
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
    <%
        boolean flag;
        try {
           flag = DAOFactory.getStudentsDAOInstance().deleteStudents(studentID);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    %>
    <% if(flag){ %>
        <h3>删除成功，3秒后跳转</h3>
    <meta http-equiv="refresh" content="3;url='showStudents.jsp'">
      <% }else { %>
        <h3>删除失败，3秒后跳转</h3>
    <meta http-equiv="refresh" content="3;url='showStudents.jsp'">
        <%}%>
<%}%>
</body>
</html>
