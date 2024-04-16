package com.dao.impl;

import com.dao.IStudentsDAO;
import com.db.ConnectionManager;
import com.factory.DAOFactory;
import com.vo.Classes;
import com.vo.Students;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.factory.DAOFactory.getClassesDAOInstance;

public class StudentsDAOImpl implements IStudentsDAO {
    public boolean insertStudents(Students students) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try{con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "insert into students values(?,?,?,?,?)";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1,students.getStudentId());

            pstmt.setString(2,students.getStudentName());
            pstmt.setString(3,students.getStudentPwd());
            pstmt.setString(4,students.getSex());
            pstmt.setInt(5,students.getClassId());
            if(pstmt.executeUpdate() > 0){ //3.语句总管执行SQL语句
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return flag;
    }

    @Override
    public boolean deleteStudents(String studentId) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "delete from students where studentId=?";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1,studentId);
            if(pstmt.executeUpdate() > 0){ //3.语句总管执行SQL语句
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return flag;
    }

    @Override
    public boolean updateStudentsName(Students students) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "update students set studentName = ? where studentId = ?";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1,students.getStudentName());
            pstmt.setString(2,students.getStudentId());
            if(pstmt.executeUpdate() > 0){ //3.语句总管执行SQL语句
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return flag;
    }

    @Override
    public boolean updateStudentsPassword(Students students) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "update students set studentPwd = ? where studentId = ?";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1,students.getStudentPwd());
            pstmt.setString(2,students.getStudentId());
            if(pstmt.executeUpdate() > 0){ //3.语句总管执行SQL语句
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return flag;
    }

    @Override
    public boolean updateStudentsGender(Students students) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "update students set sex = ? where studentId = ?";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1,students.getSex());
            pstmt.setString(2,students.getStudentId());
            if(pstmt.executeUpdate() > 0){ //3.语句总管执行SQL语句
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return flag;
    }

    @Override
    public boolean updateStudentsClassName(Students students) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        Classes classes = DAOFactory.getClassesDAOInstance().findClassesById(students.getClassId());
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "update students set classId = ? where studentId = ?";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setInt(1,students.getClassId());
            pstmt.setString(2,students.getStudentId());
            if(pstmt.executeUpdate() > 0){ //3.语句总管执行SQL语句
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return flag;
    }

    @Override
    public List<Students> findAllStudents() throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Students> all = new ArrayList<Students>();
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "select * from students";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            rs = pstmt.executeQuery(); //3.语句总管执行SQL语句
            Students stu = null;
            while(rs.next()){ //4.处理结果集
                stu = new Students();
                stu.setStudentId(rs.getString("studentId"));
                stu.setStudentName(rs.getString("studentName"));
                stu.setStudentPwd(rs.getString(3));
                stu.setSex(rs.getString(4));
                stu.setClassId(rs.getInt("classId"));
                all.add(stu);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return all;
    }

    @Override
    public Students findStudentsById(String studentId) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Students stu = null;
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "select * from students where studentId=?";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1,studentId);
            rs = pstmt.executeQuery(); //3.语句总管执行SQL语句
            if(rs.next()){ //4.处理结果集
                stu = new Students();
                stu.setStudentId(rs.getString("studentId"));
                stu.setStudentName(rs.getString("studentName"));
                stu.setStudentPwd(rs.getString(3));
                stu.setSex(rs.getString(4));
                stu.setClassId(rs.getInt("classId"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(con);
        }
        return stu;
    }

    @Override
    public List<Students> findStudentsByFuzzyQuery(String findStudent) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Students> all = new ArrayList<Students>();
        try{
            con = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "SELECT * FROM students WHERE studentName LIKE ? OR studentId LIKE ?";
            pstmt = con.prepareStatement(strSql);  //2.创建预处理语句总管
            pstmt.setString(1, "%" + findStudent + "%");
            pstmt.setString(2, "%" + findStudent + "%");
            rs = pstmt.executeQuery(); //3.语句总管执行SQL语句
            Students stu = null;
            while(rs.next()){ //4.处理结果集
                stu = new Students();
                stu.setStudentId(rs.getString("studentId"));
                stu.setStudentName(rs.getString("studentName"));
                stu.setStudentPwd(rs.getString(3));
                stu.setSex(rs.getString(4));
                stu.setClassId(rs.getInt("classId"));
                all.add(stu);
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
