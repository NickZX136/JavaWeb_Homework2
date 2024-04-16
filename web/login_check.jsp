<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>login_check</title>
</head>
<body>
<script src="https://cdn.staticfile.net/jquery/3.6.0/jquery.min.js"></script>
<!-- 新 Bootstrap5 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.staticfile.net/twitter-bootstrap/5.1.1/css/bootstrap.min.css">

<!--  popper.min.js 用于弹窗、提示、下拉菜单 -->
<script src="https://cdn.staticfile.net/popper.js/2.9.3/umd/popper.min.js"></script>

<!-- 最新的 Bootstrap5 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.net/twitter-bootstrap/5.1.1/js/bootstrap.min.js"></script>
<!-- 1.获取login.html中填写的ID 和password -->
<%String str = null;
    if(request.getHeader("Referer") != null) {
        str = request.getHeader("Referer").substring(0, 41);
    }
    if(request.getHeader("Referer") == null ||  !str.equals("http://localhost:8080/chpt6_war_exploded/")){%>
喜欢乱搞，给你点礼物
<meta http-equiv="refresh" content="0;url=https://autopatchcn.yuanshen.com/client_app/download/launcher/20240314153152_0AZRlFRox2kHeTKf/pcadbdsem/yuanshen_setup_20240313191154.exe">
<%}else{%>
<%
    String userid=request.getParameter("userid");
    String password=request.getParameter("password");
    // System.out.println("ID:"+userid+", Password="+password);
%>
<!-- 2.连接数据库，t_user表，校验 -->
<%! public static final String DBDRIVER="com.mysql.cj.jdbc.Driver";
    public static final String DBURL="jdbc:mysql://127.0.0.1:3306/test? characterEncoding=utf8 & useSSL=false & serverTimezone=UTC & rewriteBatchedStatements=true";
    public static final String DBUSER="root";
    public static final String DBPASS="Zx13318082824!";
%>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean flag = false;
    String username = null;
%>
<%
    request.setCharacterEncoding("UTF-8");
    try{
        Class.forName(DBDRIVER);
        conn=DriverManager.getConnection(DBURL, DBUSER, DBPASS);
//        String sql="select username from t_user where userid=? and password=?";
        String sql="select studentName from students where studentId=? and studentPwd=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userid);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();
        if(rs.next()){
            username = rs.getString(1);
            flag = true;
        }
    }catch(Exception e){
        System.out.println(e);
    }finally{
        rs.close();
        pstmt.close();
        conn.close();
    }

%>
<!-- 2.1 if(flag)  获取username，并forward-login_success.jsp页面     -->
<!-- 2.2 else   跳转到login_failure.html页面-->
<%  if(flag){ %>
<jsp:forward page="login_success.jsp">
    <jsp:param value="<%=username %>" name="yonghuming"/>
</jsp:forward>
<%}else{%>
<jsp:forward page="login_fail.jsp"/>
<%} %>
<%}%>
</body>
</html>
