package com.test;

import com.dao.impl.StudentsDAOImpl;
import com.vo.Students;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class StudentsDAOTest {
    @Test
    public void testInsertStudents() throws Exception {
        Students students = new Students();
        students.setStudentId("2018110105");
        students.setStudentName("米雪");
        students.setStudentPwd("2017");
        students.setSex("女");
        students.setClassId(10201841);
        new StudentsDAOImpl().insertStudents(students);
    }

    @Test
    public void testDeleteStudents() throws Exception{
        String studentId = "2018110106";
        new StudentsDAOImpl().deleteStudents(studentId);
    }

    @Test
    public void testUpdateStudents() throws Exception{
        Students students = new Students();
        students.setStudentId("2018880123");
        students.setStudentName("玄烨");
        new StudentsDAOImpl().updateStudentsName(students);
    }

    @Test
    public void testFindStuById() throws Exception{
        String studentId = "2018110116";
        Students stu = new StudentsDAOImpl().findStudentsById(studentId);
        System.out.println(stu.toString());
    }

    @Test
    public void testFindAll() throws Exception{
        List<Students> all = new ArrayList<Students>();
        all = new StudentsDAOImpl().findAllStudents();
        for(Students stu:all){
            System.out.println(stu.toString());
        }
    }

    @Test
    public void testSearch()throws Exception{
        List<Students> all = new ArrayList<Students>();
        all = new StudentsDAOImpl().findStudentsByFuzzyQuery("谢");
        for(Students stu:all){
            System.out.println(stu.toString());
        }
    }
}
