<%@ page import="com.vo.Students" %>
<%@ page import="com.factory.DAOFactory" %><%--
  Created by IntelliJ IDEA.
  User: Nick
  Date: 2024/3/27
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除学生信息</title>
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
<div class="container">
    <div class="row align-items-center">
        <div class="col">
            <button type="button" class="btn btn-primary" onclick="window.location.href='showStudents.jsp'">返回</button>
        </div>
        <div class="col">
            <h1>删除学生信息</h1>
        </div>
    </div>
    <h2>请核对学生信息</h2>
    <div class="row align-items-center">
        <h4 class="text-center">学号：<%=stu.getStudentId()%></h4>
    </div>
    <div class="row align-items-center">
        <h4 class="text-center">姓名：<%=stu.getStudentName()%></h4>
    </div>
    <div class="row align-items-center">
        <h4 class="text-center">性别：<%=stu.getSex()%></h4>
    </div>
    <button class="btn btn-danger" style="float: right" onclick="window.location.href='doDeleteStudents.jsp?studentId=<%=stu.getStudentId() %>'">删除</button>
</div>


<%--<script>--%>
<%--    $(document).ready(function(){--%>
<%--        $('#myModal').modal('show');--%>
<%--    });--%>
<%--</script>--%>

<%--&lt;%&ndash;<h2><%=stu.getStudentId()%></h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;<h2><%=stu.getStudentName()%></h2>&ndash;%&gt;--%>
<%--    <!-- 模态框（Modal） -->--%>
<%--    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
<%--        <div class="modal-dialog">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <h4 class="modal-title" id="myModalLabel">删除警告</h4>--%>
<%--                </div>--%>
<%--                <div class="modal-body">确定要删除 学号：<%=stu.getStudentId()%> 姓名：<%=stu.getStudentName()%></div>--%>
<%--                <div class="modal-footer">--%>
<%--&lt;%&ndash;                    <button type="button" id="cancel" class="btn btn-default" data-dismiss="modal" onclick="cancelDelete()">取消</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <button type="button" id="delete" class="btn btn-primary" onclick="confirmDelete()">确认删除</button>&ndash;%&gt;--%>
<%--    <button type="button" id="cancel" class="btn btn-default" data-dismiss="modal" onclick="setFlag(0)">取消</button>--%>
<%--    <button type="button" id="delete" class="btn btn-primary" onclick="setFlag(1)">确认删除</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--<script>--%>
<%--    function cancelDelete() {--%>
<%--        $('#myModal').modal('hide'); // 关闭模态框--%>
<%--        window.location.href='showStudents.jsp';--%>
<%--    }--%>
<%--    function confirmDelete() {--%>
<%--        // 这里可以添加确认删除前的逻辑，比如确认提示框等--%>
<%--        <%--%>
<%--        try {--%>
<%--DAOFactory.getStudentsDAOInstance().deleteStudents(stu.getStudentId());} catch (Exception e) {--%>
<%--    throw new RuntimeException(e);--%>
<%--}--%>
<%--        %>--%>
<%--        window.location = "showStudents.jsp";--%>
<%--    }--%>

<%--</script>--%>
    <%}%>
</body>
</html>
