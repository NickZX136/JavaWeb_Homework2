<%@ page import="com.factory.DAOFactory" %>
<%@ page import="com.vo.Students" %>
<%@ page import="static com.factory.DAOFactory.getClassesDAOInstance" %>
<%@ page import="com.vo.Classes" %><%--
  Created by IntelliJ IDEA.
  User: Nick
  Date: 2024/3/27
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>进行学生信息修改</title>

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
    String studentGender = request.getParameter("gender");
    String studentClassIdString = request.getParameter("classId");
    int studentClassId = Integer.parseInt(studentClassIdString);

    Students stu = new Students(studentId, studentName, studentPassword,studentGender, studentClassId);

    //开始更新
    boolean flagUpdateName=DAOFactory.getStudentsDAOInstance().updateStudentsName(stu);
    boolean flagUpdatePassword=DAOFactory.getStudentsDAOInstance().updateStudentsPassword(stu);
    boolean flagUpdateGender=DAOFactory.getStudentsDAOInstance().updateStudentsGender(stu);
    boolean flagUpdateClassName=DAOFactory.getStudentsDAOInstance().updateStudentsClassName(stu);
%>
<%//渲染更新信息%>
<%--<!--test-->--%>
<%--<h2><%=studentId%></h2>--%>
<%--<h2><%=studentName%></h2>--%>
<%--<h2><%=studentPassword%></h2>--%>
<%--<h2><%=studentGender%></h2>--%>
<%--<h2><%=studentClassId%></h2>--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">更新结果</h4>
            </div>
            <div class="modal-body">
                <%if(flagUpdateName){%> 学生姓名已更新为 <h3><%=stu.getStudentName()%></h3> <%}%>
                <%if(flagUpdatePassword){%> 学生密码已更新为 <h3><%=stu.getStudentPwd()%></h3> <%}%>
                <%if(flagUpdateGender){%> 学生性别已更新为 <h3><%=stu.getSex()%> <%}%></h3>
                <%if(flagUpdateClassName){%> 学生班级已更新为 <h3>
                <%
                    Classes studentClass = DAOFactory.getClassesDAOInstance().findClassesById(stu.getClassId());
                %> <%=studentClass.getClassName()%></h3>
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
