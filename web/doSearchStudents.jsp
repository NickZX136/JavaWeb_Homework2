<%@ page import="com.factory.DAOFactory" %>
<%@ page import="com.vo.Students" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Nick
  Date: 2024/4/1
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查找学生信息</title>
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
        String findStudent = request.getParameter("findStudent");
    %>
    <button type="button" class="btn btn-primary" onclick="window.location.href='showStudents.jsp'">返回</button>
    <table class="table table-striped">
        <caption class="text-center" style="caption-side: top">显示所有学生信息</caption>
        <tr><th>学号</th><th>姓名</th><th>密码</th><th>性别</th><th>班级号</th><th>    </th><th>    </th></tr>
        <%
            List<Students> all = null;
            try {
                all= DAOFactory.getStudentsDAOInstance().findStudentsByFuzzyQuery(findStudent);
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
    <%}%>
</head>
<body>

</body>
</html>
