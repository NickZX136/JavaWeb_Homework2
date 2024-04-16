package com.dao.impl;

import com.dao.IClassesDAO;
import com.dao.IClassesDAO;
import com.db.ConnectionManager;
import com.vo.Classes;
import com.vo.Students;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassesDAOImpl implements IClassesDAO {
    @Override
    public Classes findClassesById(int ClassId) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Classes classes = null;
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "select * from classes where classId=?";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setInt(1,ClassId);
            rs = pstmt.executeQuery(); //3.语句总管执行SQL语句
            if(rs.next()){ //4.处理结果集
                classes = new Classes();
                classes.setClassId(rs.getInt("classId"));
                classes.setClassName(rs.getString("className"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return classes;
    }

    @Override
    public List<Classes> findAllClasses() throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Classes> all = new ArrayList<Classes>();
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "select * from classes";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            rs = pstmt.executeQuery(); //3.语句总管执行SQL语句
            Classes classes = null;
            while(rs.next()){ //4.处理结果集
                classes = new Classes();
                classes.setClassId(rs.getInt("classId"));
                classes.setClassName(rs.getString("className"));
                all.add(classes);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return all;
    }
}
