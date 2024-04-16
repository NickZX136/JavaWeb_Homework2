package com.db;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentsDB1 {
    public static void main(String[] args) {
        Connection con=null;
        Statement statement=null;
        try {
            con = ConnectionManager.getConnection();//1.创建连接
            String strSql = "insert into Students values('2018880123','康熙','1234','男',10201841)";
            statement = con.createStatement();//2.创建语句总管
            statement.execute(strSql);//3.语句总管执行SQL语句
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            ConnectionManager.closeStatement(statement);//4.关闭语句总管、连接
            ConnectionManager.closeConnection(con);
        }
    }
}
