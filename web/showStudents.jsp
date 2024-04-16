<%@ page import="com.vo.Students" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.factory.DAOFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示所有学生信息</title>

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
    String username = "";
    if(session.getAttribute("username")!=null){
        username = (String) session.getAttribute("username");
    }
%>
<div class="container">
    <h4>用户：<%=username%></h4>
    <button type="button" class="btn btn-danger" onclick="window.location.href='logout.jsp'">退出</button>
    <form method="post" class="form-horizontal" action="doSearchStudents.jsp" role="form">
        <div class="form-group">
            <input type="text" class="form-control" name="findStudent">
        </div>
        <input class="btn btn-primary" style="float: right" type="submit" value="提交">
    </form>
<table class="table table-striped">
    <caption class="text-center" style="caption-side: top">显示所有学生信息</caption>
    <tr><th>学号</th><th>姓名</th><th>密码</th><th>性别</th><th>班级号</th><th>    </th><th>    </th></tr>
    <%
        List<Students> all = null;
        try {
            all= DAOFactory.getStudentsDAOInstance().findAllStudents();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if(all.size()!=0){
            for(int i = 0;i < all.size();i++){
                Students stu = (Students)all.get(i);
    %>
    <tr>
        <td><%=stu.getStudentId() %></td>
        <td><%=stu.getStudentName() %></td>
        <td><%=stu.getStudentPwd() %></td>
        <td><%=stu.getSex() %></td>
        <td><%=stu.getClassId() %></td>
        <td><button type="button" class="btn btn-warning" onclick="window.location.href='updateStudents.jsp?studentId=<%=stu.getStudentId() %>'">修改</button></td>
        <td><button type="button" class="btn btn-danger" onclick="window.location.href='deleteStudents.jsp?studentId=<%=stu.getStudentId() %>'">删除</button></td>
    </tr>
    <%
            } //end for
        }//end if
    %>
</table>
    <button type="button" class="btn btn-primary" style="float: right" onclick="window.location.href='insertStudents.jsp'">新增</button>
</div>
<%}%>
</body>
</html>
