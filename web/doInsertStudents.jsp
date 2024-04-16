<%@ page import="com.factory.DAOFactory" %>
<%@ page import="com.vo.Students" %>
<%@ page import="com.vo.Classes" %><%--
  Created by IntelliJ IDEA.
  User: Nick
  Date: 2024/3/27
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>进行新增学生信息</title>
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

<script>
    $(document).ready(function(){
        $('#myModal').modal('show');
    });
</script>

<%
    String studentId = request.getParameter("studentId");
    String studentName = request.getParameter("name");
    String studentPassword = request.getParameter("password");
    String studentGender = request.getParameter("sex");
    String studentClassIdString = request.getParameter("classId");
    int studentClassId = Integer.parseInt(studentClassIdString);

    Students stu = new Students(studentId, studentName, studentPassword,studentGender, studentClassId);

    //开始更新
    boolean flagInsertStudent=DAOFactory.getStudentsDAOInstance().insertStudents(stu);
%>

<%--<!--test-->--%>
<%--<h2><%=studentId%></h2>--%>
<%--<h2><%=studentName%></h2>--%>
<%--<h2><%=studentPassword%></h2>--%>
<%--<h2><%=studentGender%></h2>--%>
<%--<h2><%=studentClassId%></h2>--%>
<%--<h2><%=flagInsertStudent%></h2>--%>

<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">更新结果</h4>
            </div>
            <div class="modal-body">
                <%if(flagInsertStudent)
                {%>
                <h2>学生信息新增成功</h2>
                学生学号为 <h3><%=stu.getStudentId()%></h3>
                学生姓名为 <h3><%=stu.getStudentName()%></h3>
                学生密码为 <h3><%=stu.getStudentPwd()%></h3>
                学生性别为 <h3><%=stu.getSex()%></h3>
                学生班级为
                <%
                    Classes studentClass = DAOFactory.getClassesDAOInstance().findClassesById(stu.getClassId());
                %> <h3><%=studentClass.getClassName()%></h3>
                <%}%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='showStudents.jsp'">返回</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<%}%>
</body>
</html>
